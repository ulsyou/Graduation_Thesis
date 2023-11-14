const express = require("express");
const router = express.Router();
const FieldSample = require('../models/field-sample');
const multer = require("multer");

// Set up multer for file uploads
const upload = multer({ 
    dest: './uploads/',
    limits: { 
        fileSize: 50 * 1024 * 1024,
        fieldSize: 50 * 1024 * 1024 
    }, 
});

router.post("/create/fieldSample", async (req, res) => {
  try {
    const newFieldSample = new FieldSample(req.body);

    const savedFieldSample = await newFieldSample.save();
    res.status(201).json(savedFieldSample);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.get("/fieldSample", async (req, res) => {
  try {
    const fieldSamples = await FieldSample.find();
    res.status(200).json(fieldSamples);
  } catch (error) {
    res.status(500).json({ error: "Error retrieving field samples" });
  }
});

router.get("/fieldSample/:id", async (req, res) => {
    try {
        const fieldSample = await FieldSample.findById(req.params.id);
        res.status(200).json(fieldSample);
    } catch (error) {
        res.status(500).json({ error: "Error retrieving field sample" });
    }
});

router.patch("/update/fieldSample/:id", async (req, res) => {
    try {
        const updatedFieldSample = await FieldSample.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );
        return res.status(200).json({ message: "Fields update successfully" });
    } catch (error) {
        res.status(500).json({ error: "Error updating field sample" });
    }
});

router.delete("/delete/fieldSample/:id", async (req, res) => {
    try {
        const deletedFieldSample = await FieldSample.findByIdAndDelete(req.params.id);
        return res.status(200).json({ message: "Fields deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: "Error deleting field sample" });
    }
});

module.exports = router;
