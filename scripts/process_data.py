import pandas as pd
import os
from datetime import datetime

def process_data():
    # Create data/processed directory if it doesn't exist
    os.makedirs('data/processed', exist_ok=True)
    
    # Read the sales data
    df = pd.read_csv('data/raw/sales_data.csv')
    
    # Convert date column to datetime
    df['date'] = pd.to_datetime(df['date'])
    
    # Add time of day column
    df['time_of_day'] = pd.to_datetime(df['time']).dt.hour
    
    # Add month column
    df['month'] = df['date'].dt.month
    
    # Calculate total sales
    df['total_sales'] = df['quantity'] * df['price']
    
    # Save processed data
    df.to_csv('data/processed/sales_analysis.csv', index=False)
    print("Data processing completed successfully!")

if __name__ == "__main__":
    process_data() 