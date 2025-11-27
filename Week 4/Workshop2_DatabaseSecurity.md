# Workshop 2 – Access Control & SQL Permission Management  
*(Intermediate Level)*

## 1. Workshop Objective
In this workshop, students will practice:
- Creating database tables  
- Creating user accounts  
- Applying GRANT and REVOKE  
- Understanding value-dependent and context-dependent access rules  
- Designing proper access control for different departments  

---

## 2. Table Definitions (Employee and Product)

Below are the SQL scripts to create the required tables.

---

### 📌 **Employee Table**

```sql
-- =============================================
-- TABLE: Employee
-- =============================================
CREATE TABLE Employee (
    EmpID        INT PRIMARY KEY,
    Name         VARCHAR(100) NOT NULL,
    Position     VARCHAR(50) NOT NULL,
    Salary       DECIMAL(10,2) NOT NULL,
    Department   VARCHAR(50) NOT NULL
);
```

### ✔ Sample Data (Optional)
```sql
INSERT INTO Employee (EmpID, Name, Position, Salary, Department) VALUES
(1, 'Alice Tan', 'HR Officer', 35000.00, 'HR'),
(2, 'Bob Lee', 'HR Manager', 55000.00, 'HR'),
(3, 'Charlie Ong', 'Sales Officer', 30000.00, 'Sales'),
(4, 'Diana Lim', 'Inventory Manager', 40000.00, 'Inventory'),
(5, 'Evan Chan', 'Sales Staff', 28000.00, 'Sales');
```

---

### 📌 **Product Table**

```sql
-- =============================================
-- TABLE: Product
-- =============================================
CREATE TABLE Product (
    ProdID       INT PRIMARY KEY,
    ProdName     VARCHAR(100) NOT NULL,
    Price        DECIMAL(10,2) NOT NULL,
    Stock        INT NOT NULL,
    Supplier     VARCHAR(100) NOT NULL
);
```

### ✔ Sample Data (Optional)
```sql
INSERT INTO Product (ProdID, ProdName, Price, Stock, Supplier) VALUES
(101, 'Laptop X1', 1200.00, 50, 'TechSupplier Co.'),
(102, 'Wireless Mouse', 25.00, 200, 'GadgetWorld'),
(103, 'Office Chair', 150.00, 80, 'FurniMax'),
(104, 'Keyboard Pro', 45.00, 150, 'GadgetWorld'),
(105, 'Monitor 24"', 180.00, 60, 'TechSupplier Co.');
```

---

## 3. Company Roles

| Role | Description |
|------|-------------|
| HR_Staff | Can view employee data except salary |
| HR_Manager | Full access to Employee table |
| Sales_Staff | Can view products only |
| Inventory_Manager | Can update stock only |
| Guest | No rights |

---

## 4. Tasks for Students

### **Task 1 – Create Users**

```sql
CREATE USER HR_Staff IDENTIFIED BY pass123;
CREATE USER HR_Manager IDENTIFIED BY pass123;
CREATE USER Sales_Staff IDENTIFIED BY pass123;
CREATE USER Inventory_Manager IDENTIFIED BY pass123;
CREATE USER Guest IDENTIFIED BY pass123;
```

---

### **Task 2 – Grant Permissions**

#### **1. HR Staff – Can select all columns except Salary**
```sql
GRANT SELECT (EmpID, Name, Position, Department)
ON Employee
TO HR_Staff;
```

---

#### **2. HR Manager – Full access**
```sql
GRANT SELECT, INSERT, UPDATE, DELETE
ON Employee
TO HR_Manager;
```

---

#### **3. Sales Staff – Read-only product access**
```sql
GRANT SELECT ON Product TO Sales_Staff;
```

---

#### **4. Inventory Manager – Update stock only**
```sql
GRANT UPDATE (Stock)
ON Product
TO Inventory_Manager;
```

---

#### **5. Guest – No permissions**
```sql
REVOKE ALL PRIVILEGES ON Employee FROM Guest;
REVOKE ALL PRIVILEGES ON Product FROM Guest;
```

---

### **Task 3 – Value-Dependent Access Rule**
Allow Sales Staff to view only products priced over 100.

*(Conceptual example — not supported by all DBMS)*  
```sql
GRANT SELECT ON Product
WHERE Price > 100
TO Sales_Staff;
```

---

### **Task 4 – Context-Dependent Access Rule**
Allow Inventory Manager to update stock during Mon–Fri, 9am–5pm only.

*(Conceptual example — used for teaching logic)*  
```sql
GRANT UPDATE (Stock)
ON Product
WHEN Day() IN ('Mon','Tue','Wed','Thu','Fri')
AND Now() BETWEEN TIME '09:00:00' AND '17:00:00'
TO Inventory_Manager;
```

---

### **Task 5 – Revoke Example**
```sql
REVOKE SELECT ON Product FROM Sales_Staff;
```

---

## 5. Summary
This workshop gives hands-on practice on:
- Creating tables  
- Creating users  
- Applying GRANT & REVOKE  
- Understanding different departmental access levels  
- Designing practical security rules  

Students will now be ready for Workshop 3 (DAC vs MAC & Classification).
