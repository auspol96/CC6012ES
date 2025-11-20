# 🧪 Workshop 3: Horizontal & Vertical Fragmentation  
### *Hands-On Fragmentation Workshop with Detailed EMPLOYEE and PRODUCT Tables*

---

## 🎯 Workshop Objective
Students will practice **horizontal** and **vertical** fragmentation using real tables.  
They will learn how to split data across distributed database sites while ensuring correct reconstruction.

---

# 📘 Learning Outcomes
By the end of this workshop, students will be able to:
- Apply **horizontal fragmentation** (row-based)  
- Apply **vertical fragmentation** (column-based)  
- Identify appropriate fragmentation rules  
- Reconstruct original tables using JOINs  
- Design mixed fragmentation (advanced)  

---

# 📂 Tables Provided

## **EMPLOYEE Table**

| e-no  | e-name  | address          | status      | salary-grade | city      |
|-------|----------|-------------------|-------------|--------------|-----------|
| E1355 | James    | 20 High Street    | full-time   | G6           | London    |
| E0072 | Martin   | 50 Wood Lane      | part-time   | G5           | London    |
| E4813 | Clare    | 90 Oak Road       | fractional  | G3           | Stansted  |
| E0379 | Dominic  | 60 Greenway       | part-time   | G5           | London    |
| E3358 | Jose     | 10 Tree Road      | fractional  | G4           | Cambridge |
| E9947 | Spencer  | 40 Green Avenue   | full-time   | G9           | London    |
| E1275 | Hassan   | 60 Roman Road     | part-time   | G6           | London    |

---

## **PRODUCT Table**

| product_id | product_name     | category     | unit_price | stock_qty | warehouse_location |
|------------|------------------|--------------|------------|-----------|---------------------|
| P001       | Apple Juice      | Beverages    | 2.50       | 500       | Warehouse A         |
| P002       | Mineral Water    | Beverages    | 1.20       | 900       | Warehouse A         |
| P003       | Cheese Crackers  | Snacks       | 3.00       | 300       | Warehouse B         |
| P004       | Chocolate Cookies| Snacks       | 3.50       | 800       | Warehouse B         |
| P005       | Chicken Breast   | Fresh Food   | 5.20       | 200       | Warehouse C         |
| P006       | Salmon Fillet    | Fresh Food   | 8.90       | 150       | Warehouse C         |
| P007       | Coffee Beans     | Dry Goods    | 12.00      | 400       | Warehouse A         |
| P008       | Pasta Pack       | Dry Goods    | 2.80       | 700       | Warehouse B         |

---

# 🧩 Part 1 — Horizontal Fragmentation (Rows)

### **Task A: Fragment EMPLOYEE by City**
Create two fragments:

#### **Fragment 1 — EMP_LONDON**  
Rows where `city = 'London'`

#### **Fragment 2 — EMP_NON_LONDON**  
Rows where `city != 'London'`

Students must write the resulting tables exactly.

---

### **Task B: Fragment PRODUCT by Category**
Split PRODUCT into:

- Fragment 1: Beverages  
- Fragment 2: Snacks  
- Fragment 3: Fresh Food  
- Fragment 4: Dry Goods  

Students must list rows in each fragment.

---

# 🧱 Part 2 — Vertical Fragmentation (Columns)

### **Task C: Fragment EMPLOYEE by Attribute Groups**
Create:

#### Fragment 1 — EMP_PERSONAL  
- e-no  
- e-name  
- address  

#### Fragment 2 — EMP_JOB  
- e-no  
- status  
- salary-grade  
- city  

> Rule: **Primary key (e-no) must be included in all fragments.**

---

### **Task D: Fragment PRODUCT by Usage**
Create:

#### Fragment 1 — PRODUCT_PRICING  
- product_id  
- product_name  
- unit_price  

#### Fragment 2 — PRODUCT_STOCK  
- product_id  
- stock_qty  
- warehouse_location  

Again, include **product_id** in both fragments.

---

# 🔗 Part 3 — Reconstructing Original Tables

Students must write SQL JOIN statements:

### For EMPLOYEE:
```
SELECT *
FROM EMP_PERSONAL
JOIN EMP_JOB USING (e-no);
```

### For PRODUCT:
```
SELECT *
FROM PRODUCT_PRICING
JOIN PRODUCT_STOCK USING (product_id);
```

---

# 💡 Part 4 — Mixed Fragmentation (Advanced Challenge)

### **Task E: Combine Horizontal + Vertical Fragmentation**

Example instruction:

> First horizontally fragment EMPLOYEE by city.  
> Then vertically fragment each fragment into PERSONAL and JOB sub-fragments.

Students produce:

- EMP_LONDON_PERSONAL  
- EMP_LONDON_JOB  
- EMP_NON_LONDON_PERSONAL  
- EMP_NON_LONDON_JOB  

And show:

- How to reconstruct within each region  
- How to reconstruct the full EMPLOYEE table  

---

# 🎤 Part 5 — Group Presentation

Each group presents:

- Fragmentation rules chosen  
- Their resulting fragments  
- JOIN reconstruction steps  
- Benefits and limitations of their design  

---

# 🏆 Part 6 — Instructor Summary

Reinforce:

### ✔ Horizontal = rows  
### ✔ Vertical = columns  
### ✔ Primary key must appear in all vertical fragments  
### ✔ Mixed fragmentation is used in real distributed systems  
### ✔ Fragmentation reduces data movement and improves performance  

---

# ✔ End of Workshop 3  
Students now understand how to apply and justify real fragmentation strategies.

