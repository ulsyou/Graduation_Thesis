# MAE: 202.80786176459608
# MSE: 62278.665312080884
# RMSE: 249.556938016319

# MAE: 209.1564280728398
# MSE: 66524.96285290127
# RMSE: 257.9243355189682

# MAE: 202.7939728757072 save this
# MSE: 63009.452374008404
# RMSE: 251.01683683372397


import pickle
import os
dr = os.getcwd()
filename = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/DecisionTreeRegressor.sav"
model_GBR = pickle.load(open(filename, 'rb'))

import sys
import json
temp = json.loads(sys.argv[1])
if sys.argv[1] == '1':
  yield_pr = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
  print(yield_pr)
elif sys.argv[1] == '2':
  yield_pr = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
  print(yield_pr)
else:
  yield_pr = model_GBR.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]) ]])
  print(yield_pr)

sys.stdout.flush()


# # -----------------------------Training Model----------------------------
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
# from sklearn.datasets import make_regression
# import os
# dr = os.getcwd()
# import json
#
# sys.stdout.flush()
# file = os.path.dirname(os.path.abspath(__file__))+"/data5.csv"
#
# dataset = pd.DataFrame(pd.read_csv(file))
# dataset.head()
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
# from sklearn.tree import DecisionTreeRegressor
# model_DTR = DecisionTreeRegressor(max_depth=5)
# model_DTR.fit(X_train, y_train)
# predictions = model_DTR.predict(X_test)
# print('MAE:', metrics.mean_absolute_error(y_test, predictions))
# print('MSE:', metrics.mean_squared_error(y_test, predictions))
# print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions)))
# data = pd.DataFrame({"ThucTe(kg)":y_test,  "DuDoan(kg)": predictions, "ThucTe - DuDoan" :(y_test- predictions)})
# print(data)
#
# import pickle
# # # save the model to disk
# filename = 'D:/Project/RiceGrowingProcessManagement1.0/backend/app/controllers/predictionModel/ModelTrained/DecisionTreeRegressor.sav'
# pickle.dump(model_DTR, open(filename, 'wb') )