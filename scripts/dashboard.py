import streamlit as st
import plotly.express as px
import plotly.graph_objects as go
import pandas as pd

# Set page config
st.set_page_config(
    page_title="Sales Analysis Dashboard",
    page_icon="📊",
    layout="wide"
)

# Title
st.title('Sales Analysis Dashboard')

# Load the data
try:
    df = pd.read_csv('data/processed/sales_analysis.csv')
    df['date'] = pd.to_datetime(df['date'])
except FileNotFoundError:
    st.error("Data file not found. Please ensure 'data/processed/sales_analysis.csv' exists.")
    st.stop()

# Create two columns for layout
col1, col2 = st.columns(2)

# Daily Sales Trends
with col1:
    st.subheader('Daily Sales Trends')
    daily_sales = df.groupby('date')['total_sales'].sum().reset_index()
    fig = px.line(daily_sales, x='date', y='total_sales',
                  title='Daily Sales Trends',
                  labels={'date': 'Date', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    st.plotly_chart(fig, use_container_width=True)

# Product Category Distribution
with col2:
    st.subheader('Product Category Distribution')
    category_sales = df.groupby('category')['total_sales'].sum().reset_index()
    fig = px.pie(category_sales, values='total_sales', names='category',
                 title='Sales by Category',
                 color_discrete_sequence=px.colors.qualitative.Set3)
    fig.update_layout(template='plotly_white')
    st.plotly_chart(fig, use_container_width=True)

# Create two more columns for additional charts
col3, col4 = st.columns(2)

# Sales by Payment Method
with col3:
    st.subheader('Sales by Payment Method')
    payment_sales = df.groupby('payment_method')['total_sales'].sum().reset_index()
    fig = px.bar(payment_sales, x='payment_method', y='total_sales',
                 title='Sales by Payment Method',
                 labels={'payment_method': 'Payment Method', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    st.plotly_chart(fig, use_container_width=True)

# Top 10 Products
with col4:
    st.subheader('Top 10 Products by Sales')
    product_sales = df.groupby('product_name')['total_sales'].sum().reset_index()
    top_products = product_sales.nlargest(10, 'total_sales')
    fig = px.bar(top_products, x='product_name', y='total_sales',
                 title='Top 10 Products by Sales',
                 labels={'product_name': 'Product', 'total_sales': 'Total Sales'})
    fig.update_layout(template='plotly_white')
    st.plotly_chart(fig, use_container_width=True)

# Add some metrics at the bottom
st.markdown("---")
col5, col6, col7 = st.columns(3)

with col5:
    total_sales = df['total_sales'].sum()
    st.metric("Total Sales", f"${total_sales:,.2f}")

with col6:
    avg_sales = df['total_sales'].mean()
    st.metric("Average Sale", f"${avg_sales:,.2f}")

with col7:
    total_orders = len(df)
    st.metric("Total Orders", f"{total_orders:,}") 
    