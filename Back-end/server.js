const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const connectDB = require("./config/db");
const { exec } = require("child_process");
const path = require("path");
const mongoose = require('mongoose');
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
const weatherRoute = require("./routes/WeatherData");
const statisticsRoute = express.Router();


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
app.use("/weather", weatherRoute);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(fileUpload());
app.use("/statistics", statisticsRoute);

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


statisticsRoute.get('/', async (req, res) => {
  try {
      // Fetch data from each collection
      const cropSeasonsStats = await mongoose.connection.db.collection('cropseasons').aggregate([
          { $group: { _id: "$seasonType", count: { $sum: 1 } } }
      ]).toArray();

      const diseasesStats = await mongoose.connection.db.collection('diseases').aggregate([
          { $group: { _id: "$classification", count: { $sum: 1 } } }
      ]).toArray();

      const fertilizersStats = await mongoose.connection.db.collection('fertilizers').aggregate([
          { $group: { _id: "$nutrients", count: { $sum: 1 } } }
      ]).toArray();

      const fieldSamplesStats = await mongoose.connection.db.collection('fieldsamples').aggregate([
          { $group: { _id: "$classification", count: { $sum: 1 } } }
      ]).toArray();

      const pesticidesStats = await mongoose.connection.db.collection('pesticides').aggregate([
          { $group: { _id: "$treatingDiseases", count: { $sum: 1 } } }
      ]).toArray();

      const riceStrainsStats = await mongoose.connection.db.collection('ricestrains').aggregate([
          { $group: { _id: "$strainName", count: { $sum: 1 } } }
      ]).toArray();

      // Combine the results into a single object
      const statistics = {
          cropSeasonsStats: cropSeasonsStats.map(item => ({name: item._id, value: item.count})),
          diseasesStats: diseasesStats.map(item => ({name: item._id, value: item.count})),
          fertilizersStats: fertilizersStats.map(item => ({name: item._id, value: item.count})),
          fieldSamplesStats: fieldSamplesStats.map(item => ({name: item._id, value: item.count})),
          pesticidesStats: pesticidesStats.map(item => ({name: item._id, value: item.count})),
          riceStrainsStats: riceStrainsStats.map(item => ({name: item._id, value: item.count}))
      };

      // Send the statistics as a response
      res.json(statistics);
  } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
});


const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port}`));
