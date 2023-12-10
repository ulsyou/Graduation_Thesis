const express = require('express');
const router = express.Router();
const UseFertilizer = require('../models/use_fertilizer');

// Create
router.post('/UseFertilizer', async (req, res) => {
  const { fertilizers, ...rest } = req.body;

  if (!fertilizers) {
    return res.status(400).send({ error: 'Fertilizers are required' });
  }

  const lastUseFertilizer = await UseFertilizer.findOne({ cropSeasonCode: rest.cropSeasonCode }).sort({ _id: -1 });
  const times_do = lastUseFertilizer ? lastUseFertilizer.times_do + 1 : 1;

  if (!Array.isArray(fertilizers)) {
    return res.status(400).send({ error: 'Fertilizers must be an array' });
  }
  
  const useFertilizers = await Promise.all(fertilizers.map(async (fertilizer) => {
    const useFertilizer = new UseFertilizer({
      ...rest,
      times_do,
      fertilizers: [fertilizer]
    });
    await useFertilizer.save();
    return useFertilizer;
  }));

  res.status(201).send(useFertilizers);
});

// Read
router.get('/UseFertilizer', async (req, res) => {
  const useFertilizers = await UseFertilizer.find();
  res.send(useFertilizers);
});

router.get('/UseFertilizer/:id', async (req, res) => {
  const useFertilizer = await UseFertilizer.findById(req.params.id);
  res.send(useFertilizer);
});

// Update
router.put('/UseFertilizer/:id', async (req, res) => {
  const useFertilizer = await UseFertilizer.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.send(useFertilizer);
});

// Delete
router.delete('/UseFertilizer/:id', async (req, res) => {
    await UseFertilizer.findByIdAndDelete(req.params.id);
    res.status(204).send();
  });
  
  module.exports = router;