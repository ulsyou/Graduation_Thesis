import pandas as pd
import numpy as np

# Thiết lập hạt giống để có kết quả ngẫu nhiên nhất quán
np.random.seed(42)

# Số lượng dòng dữ liệu
num_rows = 2000

# Tạo dữ liệu ngẫu nhiên
data = {
    'Crop': np.random.choice([1, 2, 3], size=num_rows),
    'Precipitation': np.random.uniform(17,  2625, size=num_rows),
    'Temperature': np.random.uniform( 25, 35, size=num_rows),
    'Humidity': np.random.uniform( 62, 88, size=num_rows),
    'WindSpeed': np.random.uniform(11, 25, size=num_rows),
    'SolarRadiation': np.random.uniform(15, 24, size=num_rows),
    'Area': np.random.uniform(1, 10, size=num_rows),
    'N': np.random.uniform(32, 140, size=num_rows),
    'P': np.random.uniform(32, 140, size=num_rows),
    'K': np.random.uniform(10, 62, size=num_rows),
    'Yield': np.random.uniform(17095, 60740, size=num_rows)
}

# Tạo DataFrame từ dữ liệu
df = pd.DataFrame(data)

# Lưu DataFrame thành tệp CSV
df.to_csv('random_data.csv', index=False)

# Hiển thị một số dòng đầu của DataFrame
print(df.head())
