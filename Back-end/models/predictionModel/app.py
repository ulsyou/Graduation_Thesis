from flask import Flask, request, jsonify
import pickle
import subprocess
import os
import shutil

app = Flask(__name__)

# Load models

filename_DTR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/model_6_split_6.sav"
model_DTR = pickle.load(open(filename_DTR, 'rb'))

filename_LR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/model_4_split_4.sav"
model_LR = pickle.load(open(filename_LR, 'rb'))

filename_RFR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/model_6_split_6.sav"
model_RFR = pickle.load(open(filename_RFR, 'rb'))

@app.route('/predict', methods=['POST'])
def predict():
    # Parse input
    data = request.get_json()
    temp = data['temp']
    model_type = data['model_type']

    # Prepare features
    features = [float(temp[field]) for field in ['precipitation', 'temperature', 'humitidity', 'windSpeed', 'solarRadiation', 'area', 'N', 'P', 'K']]

    # Adjust features based on model type
    if model_type == '1':
        features = [1, 0, 0] + features
    elif model_type == '2':
        features = [0, 1, 0] + features
    else:
        features = [0, 0, 1] + features

    # Predict with each model
    yield_pr_DTR = model_DTR.predict([features]) / 1000
    yield_pr_LR = model_LR.predict([features]) / 1000
    yield_pr_RFR = model_RFR.predict([features]) / 1000

    # Return predictions
    return jsonify({
        'Crop': temp['crop'],
        'Precipitation': temp['precipitation'],
        'Temperature': temp['temperature'],
        'Humidity': temp['humitidity'],
        'WindSpeed': temp['windSpeed'],
        'SolarRadiation': temp['solarRadiation'],
        'Area': temp['area'],
        'N': temp['N'],
        'P': temp['P'],
        'K': temp['K'],
        'Yield_DTR': yield_pr_DTR.tolist(),
        'Yield_LR': yield_pr_LR.tolist(),
        'Yield_RFR': yield_pr_RFR.tolist(),
    })

@app.route('/processImage', methods=['POST'])
def process_image():
    try:
        image = request.files['image']
        image_dir = 'D:\\Project\\graduation_thesis\\Back-end\\models\\predictionModel\\tempImg'
        if not os.path.exists(image_dir):
            os.makedirs(image_dir)
        image_path = os.path.join(image_dir, 'tempImage.jpg')
        image.save(image_path)

        # Specify the path to your Python script (estimate.py)
        python_script_path = 'D:\\Project\\graduation_thesis\\Back-end\\models\\predictionModel\\estimate.py'

        # Specify the path to the checkpoint file
        checkpoint_path = 'D:\\Project\\graduation_thesis\\Back-end\\models\\predictionModel\\checkpoints\\rice_yield_CNN.pth'

        # Command to execute the Python script
        command = f'python "{python_script_path}" --checkpoint_path="{checkpoint_path}" --image_path="{image_path}"'

        # Run the command and capture the output
        result = subprocess.check_output(command, shell=True, text=True)

        # Parse the result
        parts = result.strip().split(', ')
        if len(parts) == 2:
            image_name_yield, yield_tha = parts
            image_name, yield_gm2 = image_name_yield.split(': ')
            yield_gm2 = float(yield_gm2.split(' ')[0])
            yield_tha = float(yield_tha.split(' ')[0])
        else:
            image_name = parts[0]
            yield_gm2 = yield_tha = None

        # Clean up the image directory
        shutil.rmtree(image_dir)

        return jsonify({'image_name': image_name, 'yield_gm2': yield_gm2, 'yield_tha': yield_tha})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)