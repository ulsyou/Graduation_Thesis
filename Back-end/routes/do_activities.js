const express = require('express');
const router = express.Router();
const Activity = require('../models/do_activities');

// Create
router.post('/Activity', async (req, res) => {
   // Tìm hoạt động với cùng activitiesName
   const existingActivity = await Activity.findOne({ activitiesName: req.body.activitiesName });

   // Nếu hoạt động tồn tại, tăng time_do và cập nhật các trường khác
   if (existingActivity) {
     existingActivity.time_do++;
     existingActivity.cropSeasonCode = req.body.cropSeasonCode;
     existingActivity.employeeCode = req.body.employeeCode;
     existingActivity.times = req.body.times;
     existingActivity.startDate = req.body.startDate;
     existingActivity.endDate = req.body.endDate;
     await existingActivity.save();
     return res.status(200).send(existingActivity);
   }
 
   // Nếu không, tạo hoạt động mới
   const activity = new Activity(req.body);
   await activity.save();
   res.status(201).send(activity);
});

// Read
router.get('/Activity', async (req, res) => {
  const activities = await Activity.find();
  res.send(activities);
});

router.get('/Activity/:id', async (req, res) => {
  const activity = await Activity.findById(req.params.id);
  res.send(activity);
});

// Update
router.put('/Activity/:id', async (req, res) => {
  const activity = await Activity.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.send(activity);
});

// Delete
router.delete('/Activity/:id', async (req, res) => {
  await Activity.findByIdAndDelete(req.params.id);
  res.status(204).send();
});

module.exports = router;