import pandas as pd

file_path = 'data5.csv'
data = pd.read_csv(file_path)

statistics = data.describe()

print(statistics)
