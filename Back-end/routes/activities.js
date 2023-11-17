const express = require("express");
const router = express.Router();
const Activities = require('../models/activities');
const upload = require('../config/upload');

// Middleware for handling errors
function handleErrors(res, err) {
  console.error(err);
  res.status(500).json({ message: "An error occurred" });
}

router.post("/create/activity", upload.single('image'), async (req, res) => {
  try {
    const activityData = req.body;
    if (req.file) {
      activityData.image = req.file.filename;
    }
    const activity = new Activities(activityData);
    const newActivity = await activity.save();
    res.status(201).json(newActivity);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.get("/activities", async (req, res) => {
  try {
    let activities = await Activities.find();
    activities = activities.map(activity => {
      activity = activity.toObject();
      if (activity.image) {
        activity.image = `${req.protocol}://${req.get('host')}/uploads/${activity.image}`;
      }
      return activity;
    });
    res.json(activities);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.get("/activity/:id", getActivity, (req, res) => {
  if (res.activity.image) {
    res.activity.image = `${req.protocol}://${req.get('host')}/uploads/${res.activity.image}`;
  }
  res.json(res.activity);
});

router.patch("/update/activity/:id", upload.single('image'), getActivity, async (req, res) => {
  if (req.body.activitiesCode != null) {
    res.activity.activitiesCode = req.body.activitiesCode;
  }
  if (req.body.activitiesName != null) {
    res.activity.activitiesName = req.body.activitiesName;
  }
  if (req.file) {
    res.activity.image = req.file.filename;
  }
  try {
    const updatedActivity = await res.activity.save();
    res.json(updatedActivity);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.delete("/delete/activity/:id", getActivity, async (req, res) => {
  try {
    await res.activity.remove();
    res.json({ message: "Activity deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Error deleting activity" });
  }
});

async function getActivity(req, res, next) {
  try {
    const activity = await Activities.findById(req.params.id);
    if (activity == null) {
      return res.status(404).json({ message: "Activity not found" });
    }
    res.activity = activity;
    next();
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
}

module.exports = router;