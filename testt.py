from flask import Flask, jsonify
from flask_cors import CORS
import pandas as pd
import time
import numpy as np

app = Flask(__name__)
CORS(app)

# Load data from Excel
df = pd.read_excel(r"C:\Users\gsarv\OneDrive\Desktop\data.xlsx")

@app.route('/data')
def send_data():
    rows = df.iterrows()
    data = []
    for index, row in rows:
        data.append({
            'heart_rate': int(row['heart_rate']),  # Convert to int
            'oxygen_level': int(row['oxygen_level'])  # Convert to int
        })
        
        time.sleep(0)  # Wait for 6 seconds before sending the next pair
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
