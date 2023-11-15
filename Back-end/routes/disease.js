const express = require("express");
const router = express.Router();
const Disease = require('../models/disease');
const upload = require('../config/upload');

// Middleware for handling errors
function handleErrors(res, err) {
    console.error(err);
    res.status(500).json({ message: "An error occurred" });
}

// Get all diseases
router.get("/disease", async (req, res) => {
    try {
        let diseases = await Disease.find();
        diseases = diseases.map(disease => {
            disease = disease.toObject();
            if (disease.image) {
                disease.image = `${req.protocol}://${req.get('host')}/uploads/${disease.image}`;
            }
            return disease;
        });
        res.json(diseases);
    } catch (err) {
        handleErrors(res, err);
    }
});

// Create a new disease
router.post("/create/disease", upload.single('image'), async (req, res) => {
    try {
      const diseaseData = req.body;
      if (req.file) {
        diseaseData.image = req.file.filename; 
      }
      const disease = new Disease(diseaseData);
      const newDisease = await disease.save();
      res.status(201).json(newDisease);
    } catch (err) {
      handleErrors(res, err);
    }
});

// Get a specific disease
router.get("/disease/:id", getDisease, (req, res) => {
    if (res.disease.image) {
            res.disease.image = `${req.protocol}://${req.get('host')}/uploads/${res.disease.image}`;
        }
        res.json(res.disease);
    });

    // Update a disease
router.patch("/update/disease/:id", getDisease, async (req, res) => {
    if (req.body.diseaseName != null) {
        res.disease.diseaseName = req.body.diseaseName;
    }
    if (req.body.harm != null) {
        res.disease.harm = req.body.harm;
    }
    if (req.body.environment != null) {
        res.disease.environment = req.body.environment;
    }
    if (req.body.classification != null) {
        res.disease.classification = req.body.classification;
    }
    if (req.file) {
        res.disease.image = req.file.filename;
    }

    try {
        const updatedDisease = await res.disease.save();
        res.json(updatedDisease);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

// Delete a disease
router.delete("/delete/disease/:id", getDisease, async (req, res) => {
    try {
        await Disease.findByIdAndRemove(req.params.id);
        res.json({ message: "Deleted disease" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

async function getDisease(req, res, next) {
    try {
        const disease = await Disease.findById(req.params.id);
        if (disease == null) {
            return res.status(404).json({ message: "Disease not found" });
        }
        res.disease = disease;
        next();
    } catch (err) {
        return res.status(500).json({ message: err.message });
    }
}

module.exports = router;