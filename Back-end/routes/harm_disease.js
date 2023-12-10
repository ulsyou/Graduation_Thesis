const express = require('express');
const router = express.Router();
const Harm = require('../models/harm_disease');

// Create
router.post('/Harm', async (req, res) => {
   // Tìm dich bệnh với cùng diseaseName
   const lastHarm = await Harm.findOne({ diseaseName: req.body.diseaseName }).sort({ _id: -1 });

   const time_have = lastHarm ? lastHarm.time_have + 1 : 1;

   const harm = new Harm({
     ...req.body,
     time_have,
   });
 
   await harm.save();
   res.status(201).send(harm);
 });

// Read
router.get('/Harm', async (req, res) => {
  const activities = await Harm.find();
  res.send(activities);
});

router.get('/Harm/:id', async (req, res) => {
  const Harm = await Harm.findById(req.params.id);
  res.send(Harm);
});

// Update
router.put('/Harm/:id', async (req, res) => {
  const Harm = await Harm.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.send(Harm);
});

// Delete
router.delete('/Harm/:id', async (req, res) => {
  await Harm.findByIdAndDelete(req.params.id);
  res.status(204).send();
});

module.exports = router;