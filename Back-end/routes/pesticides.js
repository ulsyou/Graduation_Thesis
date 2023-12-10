const express = require("express");
const router = express.Router();
const Pesticide = require('../models/pesticides');
const upload = require('../config/upload');

router.post("/create/pesticide", upload.single('image'), async (req, res) => {
    if (typeof req.body.treatingDiseases !== 'string') {
        return res.status(400).json({ error: 'treatingDiseases must be a string' });
    }
    let treatingDiseases = req.body.treatingDiseases.split(',');
    try {
        const newPesticide = new Pesticide({
            ...req.body,
            treatingDiseases: treatingDiseases,
            image: req.file ? req.file.filename : req.body.image,
        });

        const savedPesticide = await newPesticide.save();
        res.status(201).json(savedPesticide);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.get("/pesticide", async (req, res) => {
    try {
        const pesticides = await Pesticide.find();
        res.status(200).json(pesticides);
    } catch (error) {
        res.status(500).json({ error: "Error retrieving pesticides" });
    }
});

router.get("/pesticide/:id", async (req, res) => {
    try {
        const pesticide = await Pesticide.findById(req.params.id);
        res.status(200).json(pesticide);
    } catch (error) {
        res.status(500).json({ error: "Error retrieving pesticide" });
    }
});

router.patch("/update/pesticide/:id", upload.single('image'), async (req, res) => {
    let treatingDiseases = req.body.treatingDiseases.split(',');
    try {
        const updatedPesticide = await Pesticide.findByIdAndUpdate(
            req.params.id,
            {
              ...req.body,
              treatingDiseases: treatingDiseases,
              image: req.file ? req.file.filename : req.body.image,
            },
            { new: true }
        );
        return res.status(200).json({ message: "Pesticide updated successfully" });
    } catch (error) {
        res.status(500).json({ error: "Error updating pesticide" });
    }
});

router.delete("/delete/pesticide/:id", async (req, res) => {
    try {
        const deletedPesticide = await Pesticide.findByIdAndDelete(req.params.id);
        return res.status(200).json({ message: "Pesticide deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: "Error deleting pesticide" });
    }
});

module.exports = router;
