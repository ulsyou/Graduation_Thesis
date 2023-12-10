const mongoose = require('mongoose');

const ActivitySchema = new mongoose.Schema({
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
  activitiesName: {
    type: String,
    ref: 'Activities',
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
  time_do: {
    type: Number,
    default: 0
  }
});

module.exports = mongoose.model('Activity', ActivitySchema);