const express = require('express');
const router = express.Router();
const UsePesticide = require('../models/use_pesticide');

// Create
router.post('/UsePesticide', async (req, res) => {
  const { pesticides, ...rest } = req.body;

  if (!pesticides) {
    return res.status(400).send({ error: 'Pesticides are required' });
  }

  const lastUsePesticide = await UsePesticide.findOne({ cropSeasonCode: req.body.cropSeasonCode }).sort({ _id: -1 });
  const times_do = lastUsePesticide ? lastUsePesticide.times_do + 1 : 1;

  if (!Array.isArray(pesticides)) {
    return res.status(400).send({ error: 'Pesticides must be an array' });
  }

  const usePesticides = await Promise.all(pesticides.map(async (pesticide) => {
      const usePesticide = new UsePesticide({
          ...rest,
          times_do,
          pesticides: [pesticide]
      });
      await usePesticide.save();
      return usePesticide;
  }));

  res.status(201).send(usePesticides);
});

// Read
router.get('/UsePesticide', async (req, res) => {
  const usePesticides = await UsePesticide.find();
  res.send(usePesticides);
});

router.get('/UsePesticide/:id', async (req, res) => {
  const usePesticide = await UsePesticide.findById(req.params.id);
  res.send(usePesticide);
});

// Update
router.put('/UsePesticide/:id', async (req, res) => {
  const usePesticide = await UsePesticide.findByIdAndUpdate(req.params.id, req.body, { new: true });
  res.send(usePesticide);
});

// Delete
router.delete('/UsePesticide/:id', async (req, res) => {
    await UsePesticide.findByIdAndDelete(req.params.id);
    res.status(204).send();
  });
  
  module.exports = router;