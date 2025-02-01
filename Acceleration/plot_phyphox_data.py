import pandas as pd
import matplotlib.pyplot as plt

file_path = "C:/Users/Kia/Documents/fysiikka/Raw_Data.csv"
data = pd.read_csv(file_path)

fig, axes = plt.subplots(3, 1, figsize=(10, 12), sharex=True)

axes[0].plot(data["Time (s)"], data["Linear Acceleration x (m/s^2)"], label="Linear Acceleration x")
axes[0].set_ylabel("Acceleration x (m/s^2)")
axes[0].set_title("Linear Acceleration x")
axes[0].grid()
axes[0].legend()

axes[1].plot(data["Time (s)"], data["Linear Acceleration y (m/s^2)"], label="Linear Acceleration y")
axes[1].set_ylabel("Acceleration y (m/s^2)")
axes[1].set_title("Linear Acceleration y")
axes[1].grid()
axes[1].legend()

axes[2].plot(data["Time (s)"], data["Linear Acceleration z (m/s^2)"], label="Linear Acceleration z")
axes[2].set_xlabel("Time (s)")
axes[2].set_ylabel("Acceleration z (m/s^2)")
axes[2].set_title("Linear Acceleration z")
axes[2].grid()
axes[2].legend()

plt.show()