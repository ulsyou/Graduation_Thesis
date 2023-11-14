const express = require("express");
const router = express.Router();
const Disease = require('../models/disease');
const multer = require("multer");

// Set up multer for file uploads
const upload = multer({ 
    dest: './uploads/',
    limits: { 
        fileSize: 50 * 1024 * 1024,
        fieldSize: 50 * 1024 * 1024 
    }, 
});

router.post("/create/disease", async (req, res) => {
  try {
    const newDisease = new Disease(req.body);

    const savedDisease = await newDisease.save();
    res.status(201).json(savedDisease);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.get("/disease", async (req, res) => {
  try {
    const diseases = await Disease.find();
    res.status(200).json(diseases);
  } catch (error) {
    res.status(500).json({ error: "Error retrieving diseases" });
  }
});

router.get("/disease/:id", async (req, res) => {
  try {
    const disease = await Disease.findById(req.params.id);
    if (!disease) {
      return res.status(404).json({ error: "Disease not found" });
    }
    res.status(200).json(disease);
  } catch (error) {
    res.status(500).json({ error: "Error retrieving disease" });
  }
});

router.patch("/update/disease/:id", async (req, res) => {
  try {
    const updatedDisease = await Disease.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    if (!updatedDisease) {
      return res.status(404).json({ error: "Disease not found" });
    }
    res.status(200).json(updatedDisease);
  } catch (error) {
    res.status(500).json({ error: "Error updating disease" });
  }
});

router.delete("/delete/disease/:id", async (req, res) => {
  try {
    const deletedDisease = await Disease.findByIdAndRemove(req.params.id);
    if (!deletedDisease) {
      return res.status(404).json({ error: "Disease not found" });
    }
    res.status(200).json({ message: "Disease deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Error deleting disease" });
  }
});

module.exports = router;