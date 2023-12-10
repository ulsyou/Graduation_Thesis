const mongoose = require('mongoose');

const HarmSchema = new mongoose.Schema({
  cropSeasonCode: {
    type: String,
    ref: 'CropSeason',
    required: true
  },
  employeeCode: {
    type: String,
    ref: 'User',
    required: true
  },
  diseaseName: {
    type: String,
    ref: 'Disease',
    required: true
  },
  times: {
    type: String,
    enum: ['Trương hạt', 'Nảy mầm', 'Đẻ nhánh', 'Lóng thân', 'Trổ bông', 'Thụ tinh', 'Chín sữa', 'Chín sáp', 'Chín hoàn toàn'],
    required: true
  },
  startDate: {
    type: Date,
    required: true
  },
  endDate: {
    type: Date,
    required: true
  },
  time_have: {
    type: Number,
    default: 0
  }
});

module.exports = mongoose.model('Harm', HarmSchema);