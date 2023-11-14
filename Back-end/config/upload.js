const multer = require('multer');
const path = require('path');
const express = require("express");
const router = express.Router();
const fs = require('fs');

// Set up multer storage
const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, './uploads');
  },
  filename: function(req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); 
  }
});

// Serve image
router.get('/image/:filename', (req, res) => {
  const filename = req.params.filename;
  const imagePath = path.join(__dirname, './uploads', filename);

  fs.access(imagePath, fs.constants.F_OK, (err) => {
    if (err) {
      console.log(err);
      return res.status(404).json({ error: 'Image not found' });
    }

    res.sendFile(imagePath);
  });
});

const upload = multer({ storage });

module.exports = upload;