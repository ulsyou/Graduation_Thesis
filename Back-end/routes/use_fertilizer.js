const express = require('express');
const router = express.Router();
const UseFertilizer = require('../models/use_fertilizer');
const CropSeason = require('../models/crop-season');

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
    const cropSeason = await CropSeason.findOne({ code: rest.cropSeasonCode });
    if (!cropSeason) {
      await useFertilizer.delete();
      return null;
    }

    await useFertilizer.save();
    return useFertilizer;
  }));

  res.status(201).send(useFertilizers.filter(fertilizer => fertilizer !== null));
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
router.patch('/UseFertilizer/:id', async (req, res) => {
  try {
    const useFertilizer = await UseFertilizer.findByIdAndUpdate(req.params.id, req.body, { new: true });
    res.send(useFertilizer);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});


// Delete
router.delete('/UseFertilizer/:id', async (req, res) => {
    await UseFertilizer.findByIdAndDelete(req.params.id);
    res.status(204).send();
  });
  
  module.exports = router;