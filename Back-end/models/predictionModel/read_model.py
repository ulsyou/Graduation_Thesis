import pickle

# Đường dẫn đến tệp mô hình đã lưu
model_path1 = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/ModelTrained/DecisionTreeRegressor.sav'
model_path2 = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/GradientBoostingRegressor.sav'
model_path3 = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/predictionByLinearRegression1.sav'
model_path4 = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/predictionByRandomForestRegression1.sav'

# Tải mô hình
loaded_model1 = pickle.load(open(model_path1, 'rb'))
loaded_model2 = pickle.load(open(model_path2, 'rb'))
loaded_model3 = pickle.load(open(model_path3, 'rb'))
loaded_model4 = pickle.load(open(model_path4, 'rb'))

# In thông tin về mô hình
print("Thông tin về mô hình 1:")
print(loaded_model1)
print("Thông tin về mô hình 2:")
print(loaded_model2)
print("Thông tin về mô hình 3:")
print(loaded_model3)
print("Thông tin về mô hình 4:")
print(loaded_model4)
