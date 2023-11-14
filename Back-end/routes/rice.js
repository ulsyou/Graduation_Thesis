const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const RiceStrain = require('../models/rice');
const upload = require('../config/upload');

// Middleware for handling errors
function handleErrors(res, err) {
  console.error(err);
  res.status(500).json({ message: "An error occurred" });
}

router.post("/create/riceStrain", upload.single('image'), async (req, res) => {
  try {
    const riceStrainData = req.body;
    if (req.file) {
      riceStrainData.image = req.file.filename;
    }
    const strain = new RiceStrain(riceStrainData);
    const newStrain = await strain.save();
    res.status(201).json(newStrain);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.get("/riceStrain", async (req, res) => {
  try {
    let strains = await RiceStrain.find();
    strains = strains.map(strain => {
      strain = strain.toObject();
      if (strain.image) {
        strain.image = `${req.protocol}://${req.get('host')}/uploads/${strain.image}`;
      }
      return strain;
    });
    res.json(strains);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.get("/riceStrain/:id", getRiceStrain, (req, res) => {
  if (res.strain.image) {
    res.strain.image = `${req.protocol}://${req.get('host')}/uploads/${res.strain.image}`;
  }
  res.json(res.strain);
});

router.patch("/update/riceStrain/:id", getRiceStrain, async (req, res) => {
  if (req.body.strainCode != null) {
    res.strain.strainCode = req.body.strainCode;
  }
  if (req.body.strainName != null) {
    res.strain.strainName = req.body.strainName;
  }
  if (req.body.description != null) {
    res.strain.description = req.body.description;
  }
  if (req.body.image != null) {
    res.strain.image = req.body.image;
  }
  try {
    const updatedStrain = await res.strain.save();
    res.json(updatedStrain);
  } catch (error) {
    handleErrors(res, error);
  }
});

router.delete("/delete/riceStrain/:id", getRiceStrain, async (req, res) => {
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

async function getRiceStrain(req, res, next) {
  try {
      const riceStrain = await RiceStrain.findById(req.params.id);
      if (riceStrain == null) {
          return res.status(404).json({ message: "Crop season not found" });
      }
      res.riceStrain = riceStrain;
      next();
  } catch (err) {
      return res.status(500).json({ message: err.message });
  }
}

module.exports = router;