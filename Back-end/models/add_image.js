const mongoose = require('mongoose');

const ImageSchema = new mongoose.Schema({
  img: String,
  cropSeasonCode: {
    type: String,
    ref: 'CropSeason',
    required: true
  }
});

module.exports = mongoose.model('Image', ImageSchema);
