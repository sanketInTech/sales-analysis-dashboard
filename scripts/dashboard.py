import dash
from dash import dcc, html
from dash.dependencies import Input, Output
import plotly.express as px
import plotly.graph_objects as go
import pandas as pd

# Initialize the Dash app
app = dash.Dash(__name__, title='Sales Analysis Dashboard')

# Load the data
df = pd.read_csv('data/processed/sales_analysis.csv')
df['date'] = pd.to_datetime(df['date'])

# Layout
app.layout = html.Div([
    html.H1('Sales Analysis Dashboard', style={'textAlign': 'center', 'color': '#2c3e50'}),
    
    # Daily Sales Trends
    html.Div([
        html.H2('Daily Sales Trends', style={'color': '#2c3e50'}),
        dcc.Graph(id='daily-sales-graph')
    ], style={'margin': '20px', 'padding': '20px', 'backgroundColor': '#f8f9fa', 'borderRadius': '10px'}),
    
    # Product Category Distribution
    html.Div([
        html.H2('Product Category Distribution', style={'color': '#2c3e50'}),
        dcc.Graph(id='category-distribution-graph')
    ], style={'margin': '20px', 'padding': '20px', 'backgroundColor': '#f8f9fa', 'borderRadius': '10px'}),
    
    # Sales by Payment Method
    html.Div([
        html.H2('Sales by Payment Method', style={'color': '#2c3e50'}),
        dcc.Graph(id='payment-method-graph')
    ], style={'margin': '20px', 'padding': '20px', 'backgroundColor': '#f8f9fa', 'borderRadius': '10px'}),
    
    # Top 10 Products
    html.Div([
        html.H2('Top 10 Products by Sales', style={'color': '#2c3e50'}),
        dcc.Graph(id='top-products-graph')
    ], style={'margin': '20px', 'padding': '20px', 'backgroundColor': '#f8f9fa', 'borderRadius': '10px'})
])

# Callback for Daily Sales
@app.callback(
    Output('daily-sales-graph', 'figure'),
    Input('daily-sales-graph', 'id')
)
def update_daily_sales(_):
    daily_sales = df.groupby('date')['total_sales'].sum().reset_index()
    fig = px.line(daily_sales, x='date', y='total_sales',
                  title='Daily Sales Trends',
                  labels={'date': 'Date', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    return fig

# Callback for Category Distribution
@app.callback(
    Output('category-distribution-graph', 'figure'),
    Input('category-distribution-graph', 'id')
)
def update_category_distribution(_):
    category_sales = df.groupby('category')['total_sales'].sum().reset_index()
    fig = px.pie(category_sales, values='total_sales', names='category',
                 title='Sales by Category',
                 color_discrete_sequence=px.colors.qualitative.Set3)
    fig.update_layout(template='plotly_white')
    return fig

# Callback for Payment Method
@app.callback(
    Output('payment-method-graph', 'figure'),
    Input('payment-method-graph', 'id')
)
def update_payment_method(_):
    payment_sales = df.groupby('payment_method')['total_sales'].sum().reset_index()
    fig = px.bar(payment_sales, x='payment_method', y='total_sales',
                 title='Sales by Payment Method',
                 labels={'payment_method': 'Payment Method', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    return fig

# Callback for Top Products
@app.callback(
    Output('top-products-graph', 'figure'),
    Input('top-products-graph', 'id')
)
def update_top_products(_):
    product_sales = df.groupby('product_name')['total_sales'].sum().reset_index()
    top_products = product_sales.nlargest(10, 'total_sales')
    fig = px.bar(top_products, x='product_name', y='total_sales',
                 title='Top 10 Products by Sales',
                 labels={'product_name': 'Product', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    return fig

if __name__ == '__main__':
    app.run(debug=True, port=8080) 