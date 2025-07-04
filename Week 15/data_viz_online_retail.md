# 📊 Data Visualization with the Online Retail Dataset in Colab

This notebook guides you through creating visualizations of the Online Retail dataset using Python, pandas, matplotlib, and seaborn.

---

## 🎯 Objectives
✅ Learn how to visualize sales and customer behavior
✅ Gain insights using charts and plots
✅ Practice storytelling with data

---

## 🔷 Setup
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv('/content/drive/MyDrive/Data/online_retail.csv')

# Preprocess
df = df.dropna(subset=['CustomerID'])
df = df[(df['Quantity'] > 0) & (df['UnitPrice'] > 0)]
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])
df['TotalPrice'] = df['Quantity'] * df['UnitPrice']
```

---

## 📊 1. Sales by Country
```python
country_sales = df.groupby('Country')['TotalPrice'].sum().sort_values(ascending=False)
plt.figure(figsize=(12,6))
country_sales.head(10).plot(kind='bar')
plt.title('Top 10 Countries by Revenue')
plt.ylabel('Revenue')
plt.show()
```

---

## 📈 2. Monthly Sales Trend
```python
df['Month'] = df['InvoiceDate'].dt.to_period('M')
monthly_sales = df.groupby('Month')['TotalPrice'].sum()
plt.figure(figsize=(12,6))
monthly_sales.plot(marker='o')
plt.title('Monthly Revenue Trend')
plt.ylabel('Revenue')
plt.xlabel('Month')
plt.show()
```

---

## 🧺 3. Top Selling Products
```python
top_products = df.groupby('Description')['Quantity'].sum().sort_values(ascending=False)
plt.figure(figsize=(12,6))
top_products.head(10).plot(kind='barh')
plt.title('Top 10 Products by Quantity Sold')
plt.xlabel('Quantity')
plt.gca().invert_yaxis()
plt.show()
```

---

## 🔍 4. Customer Frequency vs. Monetary Value
```python
customer_df = df.groupby('CustomerID').agg({
    'InvoiceNo': 'nunique',
    'TotalPrice': 'sum'
}).reset_index()
customer_df.columns = ['CustomerID', 'Frequency', 'Monetary']
plt.figure(figsize=(8,6))
sns.scatterplot(data=customer_df, x='Frequency', y='Monetary')
plt.title('Customer Frequency vs Monetary Value')
plt.xlabel('Frequency')
plt.ylabel('Monetary Value')
plt.show()
```

---

## 🔷 5. Heatmap: Product Sales by Country
```python
top_countries = df['Country'].value_counts().head(5).index
top_items = df['Description'].value_counts().head(5).index
heatmap_data = df[df['Country'].isin(top_countries) & df['Description'].isin(top_items)]
pivot = heatmap_data.pivot_table(index='Description', columns='Country', values='Quantity', aggfunc='sum')
plt.figure(figsize=(8,6))
sns.heatmap(pivot, annot=True, fmt=".0f", cmap='YlGnBu')
plt.title('Quantity of Top Products Sold in Top Countries')
plt.show()
```

---

## 📝 Notes
- The darker the heatmap cell, the higher the quantity.
- Use `.head()` and `.describe()` to explore data before plotting.
- Encourage students to interpret each visualization and extract business insights.

---

✅ End of Lesson

