const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const CropSeason = require("../models/crop-season");
const FieldSample = require("../models/field-sample");
const Strain = require("../models/rice");
const upload = require('../config/upload');

// Middleware for handling errors
function handleErrors(res, err) {
    console.error(err);
    res.status(500).json({ message: "An error occurred" });
}

// Get all crop seasons
router.get("/crop-season", async (req, res) => {
    try {
        let cropSeasons = await CropSeason.find();
        cropSeasons = cropSeasons.map(cropSeason => {
            cropSeason = cropSeason.toObject();
            if (cropSeason.image) {
                cropSeason.image = `${req.protocol}://${req.get('host')}/${cropSeason.image}`;
            }
            return cropSeason;
        });
        res.json(cropSeasons);
    } catch (err) {
        handleErrors(res, err);
    }
});

// Create a new crop season
router.post("/create/crop-season", upload.single('image'), async (req, res) => {
    try {
      const cropSeasonData = req.body;
      if (req.file) {
        cropSeasonData.image = req.file.filename; 
      }
      const cropSeason = new CropSeason(cropSeasonData);
      const newCropSeason = await cropSeason.save();
      res.status(201).json(newCropSeason);
    } catch (err) {
      handleErrors(res, err);
    }
});

// Get a specific crop season
router.get("/crop-season/:id", getCropSeason, (req, res) => {
    if (res.cropSeason.image) {
        res.cropSeason.image = `${req.protocol}://${req.get('host')}/uploads/${res.cropSeason.image}`;
    }
    res.json(res.cropSeason);
});

// Update a crop season
router.patch("/update/crop-season/:id", upload.single('image'), getCropSeason, async (req, res) => {
    if (req.body.cropSeasonCode != null) {
        res.cropSeason.cropSeasonCode = req.body.cropSeasonCode;
    }
    if (req.body.cropSeasonName != null) {
        res.cropSeason.cropSeasonName = req.body.cropSeasonName;
    }

    if (req.file != null) {
        res.cropSeason.image = req.file.path;
    }

// Update strainName (strainName)
if (req.body.strainName != null) {
    try {
        const strainName = await Strain.findOne({ strainName: req.body.strainName });
        if (!strainName) {
            return res.status(400).json({ message: "Rice variety not found" });
        }
        res.cropSeason.strainName = req.body.strainName;
    } catch (err) {
        return res.status(500).json({ message: err.message });
    }
}

// Update fieldSample
if (req.body.fieldCode != null) {
    try {
        const fieldCode = await FieldSample.findOne({ fieldCode: req.body.fieldCode });
        if (!fieldCode) {
            return res.status(400).json({ message: "Field sample not found" });
        }
        res.cropSeason.fieldCode = req.body.fieldCode;
    } catch (err) {
        return res.status(500).json({ message: err.message });
    }
}

    // Update seasonType
    if (req.body.seasonType != null) {
        res.cropSeason.seasonType = req.body.seasonType;
    }

    // Update yield
    if (req.body.yield != null) {
        res.cropSeason.yield = req.body.yield;
    }

    // Update plantingDate
    if (req.body.plantingDate != null) {
        res.cropSeason.plantingDate = new Date(req.body.plantingDate);
    }

    // Update harvestDate
    if (req.body.harvestDate != null) {
        res.cropSeason.harvestDate = new Date(req.body.harvestDate);
    }

    try {
        const updatedCropSeason = await res.cropSeason.save();
        res.json(updatedCropSeason);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});


// Delete a crop season
router.delete("/delete/crop-season/:id", getCropSeason, async (req, res) => {
    try {
        await CropSeason.findByIdAndRemove(req.params.id);
        res.json({ message: "Deleted crop season" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

async function getCropSeason(req, res, next) {
    try {
        const cropSeason = await CropSeason.findById(req.params.id);
        if (cropSeason == null) {
            return res.status(404).json({ message: "Crop season not found" });
        }
        res.cropSeason = cropSeason;
        next();
    } catch (err) {
        return res.status(500).json({ message: err.message });
    }
}

module.exports = router;