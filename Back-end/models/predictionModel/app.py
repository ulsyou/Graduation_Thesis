from flask import Flask, request, jsonify
import pickle
import subprocess
import os
import shutil

app = Flask(__name__)

# Load models
filename_DTR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/DecisionTreeRegressor.sav"
model_DTR = pickle.load(open(filename_DTR, 'rb'))

filename_LR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/predictionByLinearRegression1.sav"
model_LR = pickle.load(open(filename_LR, 'rb'))

filename_RFR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/predictionByRandomForestRegression1.sav"
model_RFR = pickle.load(open(filename_RFR, 'rb'))

filename_GBR = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/GradientBoostingRegressor.sav"
model_GBR = pickle.load(open(filename_GBR, 'rb'))

@app.route('/predict', methods=['POST'])
def predict():
    # Parse input
    data = request.get_json()
    temp = data['temp']
    model_type = data['model_type']

    # Predict with each model
    if model_type == '1':
        yield_pr_DTR = model_DTR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
        yield_pr_LR = model_LR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
        yield_pr_RFR = model_RFR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
        yield_pr_GBR = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
    elif model_type == '2':
        yield_pr_DTR = model_DTR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
        yield_pr_LR = model_LR.predict([[ 0,1,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
        yield_pr_RFR = model_RFR.predict([[ 0,1,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
        yield_pr_GBR = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
    else:
        yield_pr_DTR = model_DTR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
        yield_pr_LR = model_LR.predict([[ 0,0,1, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
        yield_pr_RFR = model_RFR.predict([[ 0,0,1, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
        yield_pr_GBR = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])

    # Return results
    return jsonify({
        'yield_pr_DTR': yield_pr_DTR.tolist(),
        'yield_pr_LR': yield_pr_LR.tolist(),
        'yield_pr_RFR': yield_pr_RFR.tolist(),
        'yield_pr_GBR': yield_pr_GBR.tolist()
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