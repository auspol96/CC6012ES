# 📘 Horizontal & Vertical Fragmentation  
### *Lecture Summary for Students*

## 1. 🌍 What is Fragmentation in Distributed Databases?

Fragmentation is the process of **splitting a table into smaller pieces** so that each piece can be stored at different sites in a distributed database.

There are two main types:

- **Horizontal fragmentation** → splits **rows**  
- **Vertical fragmentation** → splits **columns**

---

# 2. 🧩 Horizontal Fragmentation (Row-Based)

### 📌 Definition  
Horizontal fragmentation divides a table **by rows**, based on a condition such as location, department, or status.  
Each fragment contains **different rows** but the **same columns**.

### 📌 Why use it?
- Store data closer to where it is used  
- Reduce network traffic  
- Improve performance  

---

## 🧪 Example using EMPLOYEE Table  
We split employees **by city** (London vs Non-London).

### **Fragment 1: EMP_LONDON**
Rows where `city = 'London'`

| e-no | e-name | address | status | salary-grade | city |
|------|--------|---------|--------|--------------|------|
| E1355 | James | 20 High Street | full-time | G6 | London |
| E0072 | Martin | 50 Wood Lane | part-time | G5 | London |
| E0379 | Dominic | 60 Greenway | part-time | G5 | London |
| E9947 | Spencer | 40 Green Avenue | full-time | G9 | London |
| E1275 | Hassan | 60 Roman Road | part-time | G6 | London |

---

### **Fragment 2: EMP_OUTSIDE_LONDON**
Rows where `city != 'London'`

| e-no | e-name | address | status | salary-grade | city |
|------|--------|---------|--------|--------------|------|
| E4813 | Clare | 90 Oak Road | fractional | G3 | Stansted |
| E3358 | Jose | 10 Tree Road | fractional | G4 | Cambridge |

---

# 3. 🧱 Vertical Fragmentation (Column-Based)

### 📌 Definition  
Vertical fragmentation divides a table **by columns** so each site stores a subset of attributes.  
To allow reconstruction, **the primary key must be included in all fragments**.

### 📌 Why use it?
- Different sites need different attributes  
- Better efficiency for specialised queries  
- Secure sensitive attributes by storing separately  

---

## 🧪 Example using EMPLOYEE Table  

We separate **personal information** and **job information**.

### **Fragment 1: EMP_PERSONAL**
(Columns: e-no, e-name, address)

| e-no | e-name | address |
|------|--------|---------|
| E1355 | James | 20 High Street |
| E0072 | Martin | 50 Wood Lane |
| E4813 | Clare | 90 Oak Road |
| E0379 | Dominic | 60 Greenway |
| E3358 | Jose | 10 Tree Road |
| E9947 | Spencer | 40 Green Avenue |
| E1275 | Hassan | 60 Roman Road |

---

### **Fragment 2: EMP_JOB**
(Columns: e-no, status, salary-grade, city)

| e-no | status | salary-grade | city |
|------|--------|--------------|------|
| E1355 | full-time | G6 | London |
| E0072 | part-time | G5 | London |
| E4813 | fractional | G3 | Stansted |
| E0379 | part-time | G5 | London |
| E3358 | fractional | G4 | Cambridge |
| E9947 | full-time | G9 | London |
| E1275 | part-time | G6 | London |

---

### 🔗 Reconstruction of Original Table
```
EMPLOYEE = EMP_PERSONAL ⨝ EMP_JOB  
            (join on e-no)
```

---

# 4. 🗂 Comparison Table

| Feature | Horizontal Fragmentation | Vertical Fragmentation |
|--------|---------------------------|--------------------------|
| Splits by | **Rows** | **Columns** |
| Condition | City, region, status | Attribute grouping |
| Requirement | All rows covered | Primary key in all fragments |
| Purpose | Region-based distribution | Security & specialised queries |
| Data | Different rows, same columns | Same rows, different columns |

---

# 5. 🧠 Memory Trick

- **Horizontal = Rows** (rows lie horizontally)  
- **Vertical = Columns** (columns stand vertically)

---

# 6. ✍ Exam-Ready Answers

### **Horizontal Fragmentation:**  
Dividing a relation into fragments based on **row conditions**, with each fragment storing different rows but all columns.  
*Example:* London vs Non-London employees.

### **Vertical Fragmentation:**  
Dividing a relation into fragments based on **columns**, with primary key included in all fragments to allow reconstruction.  
*Example:* Personal info vs Job info.

