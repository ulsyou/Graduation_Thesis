const axios = require('axios');
const express = require('express');
const app = express();

// Assuming PredictionInput is a model from a database like MongoDB
const PredictionInput = require('./models/PredictionInput');

app.post('/sendToFlask', async (req, res) => {
  try {
    // Assuming the request body contains the data for the prediction input
    const predictionInput = new PredictionInput(req.body);

    await predictionInput.save();

    // Send data to Flask API
    const flaskApiResponse = await axios.post('http://localhost:3000/predict', predictionInput);

    // Handle Flask API response
    if (flaskApiResponse.data) {
      // Do something with the response data
      console.log(flaskApiResponse.data);
    } else {
      console.error('No data received from Flask API');
    }

    res.json(predictionInput);
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(3000, () => console.log('Server started on port 3000'));