const express = require("express");
const router = express.Router();
const Fertilizer = require('../models/fertilizer');

router.post("/create/fertilizer", async (req, res) => {
    try {
        const newFertilizer = new Fertilizer(req.body);

        const savedFertilizer = await newFertilizer.save();
        res.status(201).json(savedFertilizer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.get("/fertilizer", async (req, res) => {
    try {
        const fertilizers = await Fertilizer.find();
        res.status(200).json(fertilizers);
    } catch (error) {
        res.status(500).json({ error: "Error retrieving fertilizers" });
    }
});

router.get("/fertilizer/:id", async (req, res) => {
    try {
        const fertilizer = await Fertilizer.findById(req.params.id);
        if (!fertilizer) {
            return res.status(404).json({ error: "Fertilizer not found" });
        }
        res.status(200).json(fertilizer);
    } catch (error) {
        res.status(500).json({ error: "Error retrieving fertilizer" });
    }
});

router.patch("/update/fertilizer/:id", async (req, res) => {
    try {
        const updatedFertilizer = await Fertilizer.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );
        if (!updatedFertilizer) {
            return res.status(404).json({ error: "Fertilizer not found" });
        }
        res.status(200).json(updatedFertilizer);
    } catch (error) {
        res.status(500).json({ error: "Error updating fertilizer" });
    }
});

router.delete("/delete/fertilizer/:id", async (req, res) => {
    try {
        const deletedFertilizer = await Fertilizer.findByIdAndRemove(req.params.id);
        if (!deletedFertilizer) {
            return res.status(404).json({ error: "Fertilizer not found" });
        }
        res.status(200).json({ message: "Fertilizer deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: "Error deleting fertilizer" });
    }
});

module.exports = router;
