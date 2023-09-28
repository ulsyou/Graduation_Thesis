const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const RiceStrain = require('../models/rice');

router.post("/create/riceStrain", async (req, res) => {
  try {
    const newStrain = new RiceStrain(req.body);

    const savedStrain = await newStrain.save();
    res.status(201).json(savedStrain);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.get("/riceStrain", async (req, res) => {
  try {
    const strains = await RiceStrain.find();
    res.status(200).json(strains);
  } catch (error) {
    res.status(500).json({ error: "Error retrieving rice strains" });
  }
});

router.get("/riceStrain/:id", async (req, res) => {
  try {
    const strain = await RiceStrain.findById(req.params.id);
    if (!strain) {
      return res.status(404).json({ error: "Rice strain not found" });
    }
    res.status(200).json(strain);
  } catch (error) {
    res.status(500).json({ error: "Error retrieving rice strain" });
  }
});

router.patch("/update/riceStrain/:id", async (req, res) => {
  try {
    const updatedStrain = await RiceStrain.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    if (!updatedStrain) {
      return res.status(404).json({ error: "Rice strain not found" });
    }
    res.status(200).json(updatedStrain);
  } catch (error) {
    res.status(500).json({ error: "Error updating rice strain" });
  }
});

router.delete("/delete/riceStrain/:id", async (req, res) => {
  try {
    const deletedStrain = await RiceStrain.findByIdAndRemove(req.params.id);
    if (!deletedStrain) {
      return res.status(404).json({ error: "Rice strain not found" });
    }
    return res.status(200).json({ message: "Rice strain deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Error deleting rice strain" });
  }
});

module.exports = router;