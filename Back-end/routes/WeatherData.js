const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');

const WeatherData = mongoose.model('WeatherData', new mongoose.Schema({
  cityName: String,
  tempC: String,
  uv: String,
  humidity: String,
  condition: String,
  icon: String,
  precipMm: Number, 
  windKph: Number,
  date: { type: Date, default: Date.now }
}));

router.post('/weather', async (req, res) => {
  const now = new Date();
  const halfHourAgo = new Date(now.getTime() - 30 * 60 * 1000); // 30 minutes ago

  const existingData = await WeatherData.findOne({ date: { $gte: halfHourAgo } });
  if (existingData) {
    return res.status(200).send('Weather data for the current 30-minute interval already exists.');
  }

  const weatherData = new WeatherData(req.body);
  await weatherData.save();
  res.send(weatherData);
});

module.exports = router;