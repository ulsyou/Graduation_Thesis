const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');

router.get('/statistics', async (req, res) => {
    try {
        // Connect to MongoDB
        await mongoose.connect('mongodb+srv://admin:admin@cluster0.pyqy143.mongodb.net/', {useNewUrlParser: true, useUnifiedTopology: true});

        // Fetch statistics from MongoDB
        const statistics = await mongoose.connection.db.collection('statistics').findOne();

        // Send statistics as a response
        res.json(statistics);
    } catch (err) {
        handleErrors(res, err);
    }
});