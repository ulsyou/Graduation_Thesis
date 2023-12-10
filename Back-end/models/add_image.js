const mongoose = require('mongoose');

const ImageSchema = new mongoose.Schema({
  img: String,
  cropSeasonCode: {
    type: String,
    required: true
  }
});

module.exports = mongoose.model('Image', ImageSchema);
