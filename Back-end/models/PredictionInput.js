const mongoose = require('mongoose');

const PredictionInputSchema = new mongoose.Schema({
  crop: String,
  precipitation: Number,
  temperature: Number,
  humidity: Number,
  windSpeed: Number,
  solarRadiation: Number,
  area: Number,
  N: Number,
  P: Number,
  K: Number
});

module.exports = mongoose.model('PredictionInput', PredictionInputSchema);