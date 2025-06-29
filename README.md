# Sales Analysis Dashboard

A comprehensive sales analysis dashboard built with Python, Dash, and Plotly that provides interactive visualizations of sales data. This project helps businesses analyze their sales performance through various metrics and visualizations.

## Project Structure

```
sales-analysis-dashboard/
├── data/
│   ├── raw/              # Raw sales data
│   └── processed/        # Processed data for visualization
├── scripts/
│   ├── dashboard.py      # Main dashboard application
│   ├── generate_sample_data.py  # Sample data generation
│   └── process_data.py   # Data processing utilities
└── requirements.txt      # Project dependencies
```

## Features

- **Daily Sales Trends**: Track sales performance over time
- **Product Category Analysis**: Understand category-wise sales distribution
- **Payment Method Insights**: Analyze customer payment preferences
- **Top Products**: Identify best-selling products
- **Interactive Visualizations**: Dynamic and responsive charts
- **Real-time Updates**: Live data processing and visualization

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/sales-analysis-dashboard.git
cd sales-analysis-dashboard
```

2. Create a virtual environment (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

1. Generate sample data (if needed):
```bash
python scripts/generate_sample_data.py
```

2. Process the data:
```bash
python scripts/process_data.py
```

3. Run the dashboard:
```bash
python scripts/dashboard.py
```

4. Access the dashboard at: https://sales-analysis-dashboard-production.up.railway.app/

## Technical Details

- **Frontend**: Dash, Plotly
- **Data Processing**: Pandas, NumPy
- **Visualization**: Plotly Express
- **Data Storage**: CSV format
- **Development**: Python 3.x

## Customization

The dashboard can be customized by:
- Modifying the data processing logic in `process_data.py`
- Adding new visualizations in `dashboard.py`
- Adjusting the layout and styling
- Implementing additional data sources

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Contact

- **Name**: Sanket Desai
- **Email**: sanketdesai1971@gmail.com
- **LinkedIn**: https://www.linkedin.com/in/sanket-desai-/
- **GitHub**: https://github.com/sanketInTech

## License

This project is licensed under the MIT License - see the LICENSE file for details. 
