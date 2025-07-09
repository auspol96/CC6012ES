# 📄 Online Retail Dataset Exercises (Google Colab)

This document guides you through meaningful exercises using the Online Retail dataset in **Google Colab**, with clear explanations and code examples.

---

## 🎯 Objective
✅ Explore, clean, analyze, and visualize the Online Retail dataset step by step using `pandas`.

---

## 🔷 1️⃣ Check Data Info & Missing Values
```python
df.info()
df.isnull().sum()
```
✅ Understand the structure of the data and identify which columns have missing values.

---

## 🔷 2️⃣ Clean the Data
### Remove rows with missing Customer IDs
```python
df_clean = df.dropna(subset=['CustomerID'])
```
✅ Ensures we analyze only rows tied to a customer.

### Remove rows with invalid Quantity or UnitPrice
```python
df_clean = df_clean[(df_clean['Quantity'] > 0) & (df_clean['UnitPrice'] > 0)]
```
✅ Keeps only valid sales.

---

## 🔷 3️⃣ Create Total Price Column
```python
df_clean['TotalPrice'] = df_clean['Quantity'] * df_clean['UnitPrice']
```
✅ Adds a new column to calculate total revenue per line item.

---

## 🔷 4️⃣ Basic KPIs
### Total revenue
```python
df_clean['TotalPrice'].sum()
```
✅ Total revenue of all transactions.

### Revenue by country
```python
df_clean.groupby('Country')['TotalPrice'].sum().sort_values(ascending=False)
```
✅ Compare how much each country contributes.

---

## 🔷 5️⃣ Most Popular Products
### Top 10 products by quantity sold
```python
df_clean.groupby('Description')['Quantity'].sum().sort_values(ascending=False).head(10)
```
✅ Shows the most sold products.

---

## 🔷 6️⃣ Monthly Sales Trend
### Convert InvoiceDate to datetime and extract month
```python
df_clean['InvoiceDate'] = pd.to_datetime(df_clean['InvoiceDate'])
df_clean['Month'] = df_clean['InvoiceDate'].dt.to_period('M')
```
### Plot monthly sales trend
```python
df_clean.groupby('Month')['TotalPrice'].sum().plot()
```
✅ Visualizes how sales change month by month.

---

## 🔷 7️⃣ Customer Segmentation
### Calculate customer frequency & monetary value
```python
customer_summary = df_clean.groupby('CustomerID').agg({
    'InvoiceNo': 'nunique',
    'TotalPrice': 'sum'
}).rename(columns={'InvoiceNo': 'Frequency', 'TotalPrice': 'Monetary'})
customer_summary.head()
```
✅ Helps understand how often and how much customers buy — useful for RFM analysis.

---

✅ End of instructions. Ready to use in Colab!
