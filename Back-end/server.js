const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const connectDB = require("./config/db");
const { exec } = require("child_process");
const fs = require("fs");
const path = require("path");

const app = express();
const userRoute = require("./routes/user");
const riceStrainRoute = require("./routes/rice");
const fertilizerRoute = require("./routes/fertilizer");
const diseaseRoute = require("./routes/disease");
const fieldRoute = require("./routes/field-sample");
const pesticideRoute = require("./routes/pesticides");
const cropSeason = require("./routes/crop-season");
const activitiesRoute = require("./routes/activities");
const fileUpload = require('express-fileupload');
app.use(fileUpload());

// Connect Database
connectDB();

app.use(express.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

// Cấu hình tùy chọn cors
const corsOptions = {
  origin: "*", 
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
};

app.use(cors(corsOptions));

// Route API
app.use("/user", userRoute);
app.use("/rice-strain", riceStrainRoute);
app.use("/fertilizer", fertilizerRoute);
app.use("/disease", diseaseRoute);
app.use("/field", fieldRoute);
app.use("/pesticide", pesticideRoute);
app.use("/crops-season", cropSeason);
app.use("/activities", activitiesRoute);
app.use('/uploads', express.static('./uploads'));

// Route for processing images
app.post('/processImage', async (req, res) => {
  try {
    const { image } = req.files;

    // Save the uploaded image to a temporary file
    const imagePath = path.join(__dirname, 'tempImage.jpg');
    image.mv(imagePath, (err) => {
      if (err) {
        console.error('Error saving image:', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }

      // Call the Flask API using subprocess
      const pythonScriptPath = path.join(__dirname, 'estimate.py');
      const checkpointPath = path.join(__dirname, 'rice_yield_CNN.pth');
      const command = `python estimate.py --checkpoint_path ${checkpointPath} --image_dir ${imageDir} --csv`;

      console.log('Server directory:', __dirname);
      console.log('Python script path:', pythonScriptPath);
      console.log('Checkpoint path:', checkpointPath);

      exec(command, (error, stdout, stderr) => {
        console.log(stdout);
        if (error) {
          console.error(`Error: ${stderr}`);
          res.status(500).json({ error: stderr });
          return;
        }

        const result = stdout.trim();
        console.log(`Script output: ${result}`);
        res.json({ result });
      });
    });
  } catch (error) {
    console.error('Error processing image:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port}`));
