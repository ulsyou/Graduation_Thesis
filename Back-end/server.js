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
  origin: "http://10.0.2.2:5000", 
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
app.post("/processImage", async (req, res) => {
  try {
    const { image } = req.body;

    // Save the base64-encoded image to a temporary file
    const imagePath = path.join(__dirname, 'tempImage.jpg');
    fs.writeFileSync(imagePath, Buffer.from(image, 'base64'));

    // Call the Flask API using subprocess
    const pythonScriptPath = 'path/to/your/estimate.py';  // Update with the actual path
    const command = `python ${pythonScriptPath} --checkpoint_path=path/to/your/checkpoint.pth --image_dir=${imagePath} --csv`;

    exec(command, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${stderr}`);
        res.status(500).json({ error: stderr });
        return;
      }

      const result = stdout.trim();
      console.log(`Script output: ${result}`);
      res.json({ result });
    });
  } catch (error) {
    console.error('Error processing image:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port}`));
