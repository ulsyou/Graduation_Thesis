const express = require("express");
const router = express.Router();
const Pesticide = require('../models/pesticides');

router.post("/create/pesticide", async (req, res) => {
    try {
        const newPesticide = new Pesticide(req.body);

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

router.patch("/update/pesticide/:id", async (req, res) => {
    try {
        const updatedPesticide = await Pesticide.findByIdAndUpdate(
            req.params.id,
            req.body,
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
