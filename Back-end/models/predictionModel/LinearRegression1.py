# MAE: 147.80764980164687
# MSE: 32008.5385746027
# RMSE: 178.90930264970208


import sys
import pickle
import os
dr = os.getcwd()
filename = os.path.dirname(os.path.abspath(__file__))+"/ModelTrained/predictionByLinearRegression1.sav"

model_lm = pickle.load(open(filename, 'rb'))


import json
temp = json.loads(sys.argv[1])

if sys.argv[1] == '1':
  yield_pr = model_lm.predict([[ 1,0,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"]) ]])
  print(yield_pr)
elif sys.argv[1] == '2':
  yield_pr = model_lm.predict([[ 0,1,0, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
  print(yield_pr)
else:
  yield_pr = model_lm.predict([[ 0,0,1, float(temp["precipitation"]), float(temp["temperature"]), float(temp["humitidity"]), float(temp["windSpeed"]), float(temp["solarRadiation"]), float(temp["area"]), float(temp["N"]), float(temp["P"]), float(temp["K"])  ]])
  print(yield_pr)


sys.stdout.flush()

# ------------------------Training model----------------
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
# # ---------LinearRegression ****Ok MAE 562 RME 704
# model_RFR = LinearRegression()
# model_RFR.fit(X_train,y_train)
# predictions = model_RFR.predict(X_test)
# # yield_pr = model_RFR.predict([[1,0,0, 21.3, 26.45, 75.58,2]])
# print('MAE:', metrics.mean_absolute_error(y_test, predictions))
# print('MSE:', metrics.mean_squared_error(y_test, predictions))
# print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions)))
# data = pd.DataFrame({"ThucTe(kg)":y_test,  "DuDoan(kg)": predictions, "ThucTe - DuDoan" :(y_test- predictions)})
# print(data)
#
# import pickle
# # # save the model to disk
# filename = 'backend/app/controllers/predictionModel/ModelTrained/predictionByLinearRegression1.sav'
# pickle.dump(model_RFR, open(filename, 'wb'))

