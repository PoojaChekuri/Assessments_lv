# -*- coding: utf-8 -*-
"""Untitled9.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1SRbyMqGnn16u3E0MdNlcKdSO0KTvQ5sW
"""

import streamlit as st
import pandas as pd

data = pd.read_csv("C:\Users\poojasree.c.lv\Downloads\Group - 3 org.csv")
#data = pd.DataFrame("C:\Users\poojasree.c.lv\Downloads\Group - 3 org.csv")

# Function to calculate revenue based on discount rate
def calculate_revenue(total_sales, discount_rate):
    return total_sales * (1 - discount_rate)

# Streamlit app
st.title("Revenue Prediction Simulation")

st.sidebar.header("Adjust Discount Rates")
discount_rate_inputs = {}
for category in data['category']:
    discount_rate_inputs[category] = st.sidebar.slider(
        f"Discount Rate for {category}", min_value=0.0, max_value=0.5, step=0.01, value=float(data[data['category'] == category]['discount_rate'].values[0])
    )

# Calculate new revenues based on user inputs
data['new_discount_rate'] = data['category'].apply(lambda x: discount_rate_inputs[x])
data['new_revenue'] = data.apply(lambda row: calculate_revenue(row['total_sales'], row['new_discount_rate']), axis=1)

# Display current and new data
st.write("### Current Data")
st.write(data[['category', 'discount_rate', 'total_sales', 'revenue', 'profits']])

st.write("### New Data with Adjusted Discount Rates")
st.write(data[['category', 'new_discount_rate', 'total_sales', 'new_revenue']])

# Calculate and display overall revenue
current_total_revenue = data['revenue'].sum()
new_total_revenue = data['new_revenue'].sum()
st.write(f"### Current Total Revenue: ${current_total_revenue:,.2f}")
st.write(f"### New Total Revenue: ${new_total_revenue:,.2f}")

# Plotting
st.write("## Revenue Comparison")
st.bar_chart(data[['category', 'revenue', 'new_revenue']].set_index('category'))

st.write("### Insights")
st.write("""
Adjusting the discount rates allows you to see the potential impact on total revenue.
Use the sliders in the sidebar to experiment with different discount rates and observe how they affect overall revenue.
""")

