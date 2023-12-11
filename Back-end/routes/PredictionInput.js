const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const PredictionInput = require('../models/PredictionInput');
const axios = require('axios'); 

router.post('/predict', async (req, res) => {
  try {
    const weatherData = await mongoose.connection.db.collection('weatherdatas').find().toArray();
    const fieldSample = await mongoose.connection.db.collection('fieldsamples').findOne();
    const fertilizer = await mongoose.connection.db.collection('fertilizers').findOne();

    const avg = (arr) => {
        const numbers = arr.map(value => parseFloat(value));
        const validNumbers = numbers.filter(value => !isNaN(value));
        return validNumbers.reduce((a, b) => a + b, 0) / validNumbers.length;
      };

      const predictionInputData = {
        temp: {
          crop: '1', 
          precipitation: avg(weatherData.map(data => data.precipMm)),
          temperature: avg(weatherData.map(data => data.tempC)),
          humitidity: avg(weatherData.map(data => data.humidity)),
          windSpeed: avg(weatherData.map(data => data.windKph)),
          solarRadiation: avg(weatherData.map(data => data.uv / 25)),
          area: fieldSample.area,
          N: fertilizer.nutrients.nitro,
          P: fertilizer.nutrients.phosphate,
          K: fertilizer.nutrients.kali
        },
        model_type: '1' 
      };
  
      const predictionInput = new PredictionInput(predictionInputData);
      await predictionInput.save();
  
      // Gửi dữ liệu đến Flask server
      const flaskRes = await axios.post('http://127.0.0.1:3000/predict', predictionInputData);
  
      // Lấy dữ liệu response từ Flask server
      const flaskData = flaskRes.data;

    // Gửi dữ liệu response từ Flask server về cho client
    res.json(flaskData);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;