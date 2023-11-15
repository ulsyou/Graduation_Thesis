const express = require("express");
const router = express.Router();
const Fertilizer = require('../models/fertilizer');
const upload = require('../config/upload');

// Middleware for handling errors
function handleErrors(res, err) {
    console.error(err);
    res.status(500).json({ message: "An error occurred" });
}

router.post("/create/fertilizer", upload.single('image'), async (req, res) => {
    try {
        const fertilizerData = {
            ...req.body,
            nutrients: {
                kali: req.body.nutrients.kali,
                nitro: req.body.nutrients.nitro,
                phosphate: req.body.nutrients.phosphate,
                others: req.body.nutrients.others,
            }
        };
        if (req.file) {
            fertilizerData.image = req.file.filename; 
        }
        const newFertilizer = new Fertilizer(fertilizerData);
        const savedFertilizer = await newFertilizer.save();
        res.status(201).json(savedFertilizer);
    } catch (error) {
        handleErrors(res, error);
    }
});

router.get("/fertilizer", async (req, res) => {
    try {
        let fertilizers = await Fertilizer.find();
        fertilizers = fertilizers.map(fertilizer => {
            fertilizer = fertilizer.toObject();
            if (fertilizer.image) {
                fertilizer.image = `${req.protocol}://${req.get('host')}/uploads/${fertilizer.image}`;
            }
            return fertilizer;
        });
        res.status(200).json(fertilizers);
    } catch (error) {
        handleErrors(res, error);
    }
});

router.get("/fertilizer/:id", async (req, res) => {
    try {
        const fertilizer = await Fertilizer.findById(req.params.id);
        if (!fertilizer) {
            return res.status(404).json({ error: "Fertilizer not found" });
        }
        if (fertilizer.image) {
            fertilizer.image = `${req.protocol}://${req.get('host')}/uploads/${fertilizer.image}`;
        }
        res.status(200).json(fertilizer);
    } catch (error) {
        handleErrors(res, error);
    }
});

router.patch("/update/fertilizer/:id", upload.single('image'), async (req, res) => {
    try {
        const updatedFertilizer = await Fertilizer.findByIdAndUpdate(
            req.params.id,
            {
              ...req.body,
              image: req.file ? req.file.filename : req.body.image,
            },
            { new: true }
        );
        if (!updatedFertilizer) {
            return res.status(404).json({ error: "Fertilizer not found" });
        }
        res.status(200).json(updatedFertilizer);
    } catch (error) {
        handleErrors(res, error);
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
        handleErrors(res, error);
    }
});

module.exports = router;