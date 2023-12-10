const express = require("express");
const router = express.Router();
const upload = require('../config/upload');
const Image = require('../models/add_image');

// Create a new image
router.post('/image', upload.single('image'), async (req, res) => {
  try {
    const { cropSeasonCode } = req.body;

    if (!cropSeasonCode) {
      return res.status(400).json({ error: 'cropSeasonCode is required' });
    }

    const img = new Image({
      img: req.file.filename,
      cropSeasonCode: cropSeasonCode
    });

    await img.save();

    res.json({ message: 'Image added successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Read all images for a given cropSeasonCode
router.get('/images/:cropSeasonCode', async (req, res) => {
  try {
    const cropSeasonCode = req.params.cropSeasonCode;
    const images = await Image.find({ cropSeasonCode });

    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Update an image by cropSeasonCode
router.put('/image/:cropSeasonCode', async (req, res) => {
  try {
    const cropSeasonCode = req.params.cropSeasonCode;
    const { img } = req.body;

    const updatedImage = await Image.findOneAndUpdate(
      { cropSeasonCode },
      { img },
      { new: true }
    );

    if (!updatedImage) {
      return res.status(404).json({ error: 'Image not found' });
    }

    res.json({ message: 'Image updated successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Delete an image by cropSeasonCode
router.delete('/image/:cropSeasonCode', async (req, res) => {
  try {
    const cropSeasonCode = req.params.cropSeasonCode;

    const deletedImage = await Image.findOneAndDelete({ cropSeasonCode });

    if (!deletedImage) {
      return res.status(404).json({ error: 'Image not found' });
    }

    res.json({ message: 'Image deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
