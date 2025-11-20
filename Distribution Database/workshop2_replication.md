# 🧪 Workshop 2: Data Replication & Replicated Databases  
### *Hands-On Planning Workshop with EMPLOYEE & PRODUCT Tables*

---

## 🎯 Workshop Objective
Students will learn how **data replication**, **replicated databases**, and **fully replicated databases** work by planning replicas across three different sites using real, detailed tables.

---

# 📘 Learning Outcomes
By the end of this workshop, students will be able to:
- Identify which data should be replicated to which site  
- Decide between **partial** and **full** replication  
- Design a replication architecture diagram  
- Understand trade-offs: storage cost, performance, and update overhead  

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

# 🧩 Part 1 — Scenario Setup

Students are assigned to plan replication for **three sites**:

### **Site A — Retail Store**
- Needs fast access to:
  - product_name  
  - unit_price  
  - stock_qty  
- Needs list of employees working at this store’s location

### **Site B — Head Office**
- Needs:
  - All EMPLOYEE data  
  - Product category + price  
  - Does *not* require stock quantity  

### **Site C — Warehouse Hub**
- Needs:
  - Full PRODUCT data  
  - Only employees with status = "full-time" or "manager roles"  

---

# 📝 Part 2 — Student Tasks

## **Task 1: Identify Required Data for Each Site**
Using the EMPLOYEE and PRODUCT tables, students determine:

- Which **columns** each site needs  
- Which **rows** each site needs  
- Whether the replication should be **partial** or **full**  

---

## **Task 2: Design the Replication Plan**

Students must decide for each site:

| Site | Type of Replication | Which Tables | Which Rows | Which Columns |
|------|----------------------|---------------|--------------|----------------|
| A | Partial / Full | Employee, Product | Based on city, category | Columns needed |
| B | Partial / Full | Employee, Product | All employees | Selected columns |
| C | Partial / Full | Product, Employee | Warehouse items | Job-related columns |

---

## **Task 3: Draw a Replication Diagram**

Students draw something like:

```
                [Head Office]
                  (partial/full)
                        |
        ------------------------------------
        |                                  |
 [Store A - partial]            [Warehouse C - full products]
```

They must label:
- Which data flows where  
- Partial or full replication  
- What columns or rows are included  

---

# 🎤 Part 3 — Group Presentation

Each group explains:

1. Why they replicated specific tables  
2. Why they chose partial vs full replication  
3. Impact on:
   - Performance  
   - Network load  
   - Storage  
   - Update propagation  

---

# 🏆 Part 4 — Instructor Summary

You will reinforce:

### ✔ Replication improves availability and speed  
### ✔ Full replication increases cost & update overhead  
### ✔ Most companies use **partial replication** depending on business needs  
### ✔ Data replication must consider the **site's role**

---

# 📚 Optional Extension

Students redesign the system with **incorrect replication choices**, then explain:

- Why it will cause poor performance  
- Which queries become slow  
- Why update conflicts may increase  

This deepens real-world understanding.

---

# ✔ End of Workshop 2  
Students now know how to plan and justify replication strategies using real tables.

