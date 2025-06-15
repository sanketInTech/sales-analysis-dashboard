import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

def generate_sample_data():
    # Set random seed for reproducibility
    np.random.seed(42)
    
    # Create date range for the last 6 months
    end_date = datetime.now()
    start_date = end_date - timedelta(days=180)
    dates = pd.date_range(start=start_date, end=end_date, freq='D')
    
    # Sample data parameters
    n_records = 10000
    
    # Generate sample data
    data = {
        'date': np.random.choice(dates, n_records),
        'time': [f"{random.randint(8, 20):02d}:{random.randint(0, 59):02d}" for _ in range(n_records)],
        'store_id': np.random.choice(['Store A', 'Store B', 'Store C', 'Store D'], n_records),
        'product_id': [f"P{random.randint(1000, 9999)}" for _ in range(n_records)],
        'product_name': np.random.choice([
            'Laptop', 'Smartphone', 'Headphones', 'Tablet', 'Smartwatch',
            'Camera', 'Printer', 'Monitor', 'Keyboard', 'Mouse',
            'Speaker', 'Router', 'External HDD', 'USB Drive', 'Power Bank'
        ], n_records),
        'category': np.random.choice([
            'Electronics', 'Computers', 'Accessories', 'Audio', 'Storage'
        ], n_records),
        'quantity': np.random.randint(1, 5, n_records),
        'price': np.random.uniform(10, 1000, n_records).round(2),
        'payment_method': np.random.choice([
            'Credit Card', 'Debit Card', 'Cash', 'Mobile Payment'
        ], n_records),
        'customer_segment': np.random.choice([
            'Regular', 'Premium', 'VIP', 'New'
        ], n_records)
    }
    
    # Create DataFrame
    df = pd.DataFrame(data)
    
    # Create data/raw directory if it doesn't exist
    import os
    os.makedirs('data/raw', exist_ok=True)
    
    # Save to CSV
    df.to_csv('data/raw/sales_data.csv', index=False)
    print("Sample data generated successfully!")

if __name__ == "__main__":
    generate_sample_data() 