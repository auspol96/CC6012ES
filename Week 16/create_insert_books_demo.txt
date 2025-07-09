# 📄 SQL Script: Create & Insert Demo Data (Books Database)

This document contains SQL statements to create and populate the following tables **without constraints**, and notes on how to drop them if needed.

---

## 📋 Tables
- `Author`
- `Publisher`
- `Books`
- `Inventory`

---

## 🔷 Drop Tables (if they exist)
If a student encounters **ORA-02449 or ORA-00942** errors while dropping, it could be due to foreign key constraints or case-sensitive names.

✅ **Solution:** Use `CASCADE CONSTRAINTS` and proper case if needed.

```sql
DROP TABLE Inventory;
DROP TABLE Books;
DROP TABLE Publisher;
DROP TABLE Author;

-- If normal drop fails, force drop with:
DROP TABLE "Books" CASCADE CONSTRAINTS;
```

---

## 🔷 Create Tables

```sql
CREATE TABLE Author (
    Author_id   NUMBER,
    Fname       VARCHAR2(50),
    Lname       VARCHAR2(50)
);

CREATE TABLE Publisher (
    P_Code      NUMBER,
    P_Name      VARCHAR2(100),
    City        VARCHAR2(100)
);

CREATE TABLE Books (
    B_Code      NUMBER,
    Title       VARCHAR2(255),
    P_Code      NUMBER,
    Type        VARCHAR2(50),
    Paperback   VARCHAR2(10),
    Price       NUMBER(7,2)
);

CREATE TABLE Inventory (
    Inventory_id   NUMBER,
    B_Code         NUMBER,
    Quantity       NUMBER
);
```

---

## 🔷 Insert Demo Data

### 👨‍💼 Author
```sql
INSERT INTO Author VALUES (1, 'John', 'Doe');
INSERT INTO Author VALUES (2, 'Emily', 'Smith');
INSERT INTO Author VALUES (3, 'Robert', 'Brown');
```

### 🏢 Publisher
```sql
INSERT INTO Publisher VALUES (101, 'Pearson', 'New York');
INSERT INTO Publisher VALUES (102, 'O''Reilly Media', 'San Francisco');
INSERT INTO Publisher VALUES (103, 'Springer', 'Berlin');
```

### 📚 Books
```sql
INSERT INTO Books VALUES (1001, 'Data Science Essentials', 101, 'SCI', 'Yes', 49.99);
INSERT INTO Books VALUES (1002, 'Learning SQL', 102, 'EDU', 'No', 39.50);
INSERT INTO Books VALUES (1003, 'Big Data Basics', 101, 'TECH', 'Yes', 29.95);
INSERT INTO Books VALUES (1004, 'Oracle SQL Guide', 102, 'EDU', 'Yes', 44.00);
INSERT INTO Books VALUES (1005, 'Advanced Data Analytics', 103, 'SCI', 'No', 55.75);
```

### 📦 Inventory
```sql
INSERT INTO Inventory VALUES (1, 1001, 25);
INSERT INTO Inventory VALUES (2, 1002, 10);
INSERT INTO Inventory VALUES (3, 1003, 50);
INSERT INTO Inventory VALUES (4, 1004, 15);
INSERT INTO Inventory VALUES (5, 1005, 5);
```

---

✅ End of file.
