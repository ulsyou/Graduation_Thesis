# MAE: 163.0967741935484
# MSE: 41706.15919354839
# RMSE: 204.2208588600792

# MAE: 169.2024193548387
# MSE: 42199.65830645161
# RMSE: 205.4255541709736

#MAE: 174.14677419354837
# MSE: 44519.75580645162
# RMSE: 210.99705165345705

# MAE: 160.6596774193548
# MSE: 40455.38193548386
# RMSE: 201.1352329540597

# MAE: 164.7403225806452
# MSE: 40343.6970967742
# RMSE: 200.85740488409732

# MAE: 178.13709677419354
# MSE: 48214.46274193547
# RMSE: 219.57791952274135

# MAE: 162.26935483870966
# MSE: 39972.39983870968
# RMSE: 199.93098769002688

import numpy as np
import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.ensemble import RandomForestRegressor

import pickle
import os
dr = os.getcwd()
filename = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/predictionByRandomForestRegression1.sav"
model_RFR = pickle.load(open(filename, 'rb'))

import sys
import json
temp = json.loads(sys.argv[1])
if sys.argv[1] == '1':
  yield_pr = model_RFR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
  print(yield_pr)
elif sys.argv[1] == '2':
  yield_pr = model_RFR.predict([[ 0,1,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
  print(yield_pr)
else:
  yield_pr = model_RFR.predict([[ 0,0,1, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
  print(yield_pr)

sys.stdout.flush()


#
# # ------------------------------Training model-----------------------------
#
# import warnings
# warnings.filterwarnings('ignore')
# import numpy as np
# import pandas as pd
# import sys
# from sklearn.model_selection import train_test_split
# from sklearn.linear_model import LinearRegression
# from sklearn import metrics
#
# from sklearn.linear_model import OrthogonalMatchingPursuit
# from sklearn.ensemble import RandomForestRegressor
# from sklearn.datasets import make_regression
#
# import os
# dr = os.getcwd()
#
# sys.stdout.flush()
# file = os.path.dirname(os.path.abspath(__file__))+"/data5.csv"
#
# dataset = pd.DataFrame(pd.read_csv(file))
# # print(dataset.head())
#
# X= dataset.iloc[:, :-1].values
# y= dataset.iloc[:, -1].values
#
#
# from sklearn.preprocessing import LabelEncoder, OneHotEncoder
# from sklearn.compose import ColumnTransformer
# labelencoder_x= LabelEncoder()
# X[:, 0]= labelencoder_x.fit_transform(X[:, 0])
# columnTransformer = ColumnTransformer([('encoder', OneHotEncoder(), [0])],     remainder='passthrough')
# X=np.array(columnTransformer.fit_transform(X))
# # # X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=101)
#
# from sklearn.model_selection import KFold
# kf = KFold(n_splits=4, random_state=1, shuffle=True)
# for train_index, test_index in kf.split(X):
#   X_train, X_test = X[train_index], X[test_index]
#   y_train, y_test = y[train_index], y[test_index]
#
# model_RFR = RandomForestRegressor(n_estimators=10)
# model_RFR.fit(X_train, y_train)
# Y_pred2 = model_RFR.predict(X_test)
# print('MAE:', metrics.mean_absolute_error(y_test, Y_pred2))
# print('MSE:', metrics.mean_squared_error(y_test, Y_pred2))
# print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, Y_pred2)))
# data = pd.DataFrame({"ban đầu(kg)":y_test,  "  dự đoán(kg)": Y_pred2, "Chenh lech(thuc te-du doan)" :(y_test-Y_pred2)})
# print(data)
#
# import pickle
# # # save the model to disk
# filename = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/predictionByRandomForestRegression1.sav'
# pickle.dump(model_RFR, open(filename, 'wb'))
