# 📘 SQL Subquery Exercises – BOOKS Database

This handout provides:
1. **Table structures and sample data**
2. **Insert statements** for reproducible datasets
3. **10 subquery exercises** for practice

---

## **1️⃣ Table Structures**

```sql
-- BOOKS Table
CREATE TABLE books (
    b_code      NUMBER PRIMARY KEY,
    title       VARCHAR2(255),
    p_code      NUMBER,
    type        VARCHAR2(50),
    paperback   VARCHAR2(10),
    price       NUMBER(7,2)
);

-- AUTHOR Table
CREATE TABLE author (
    author_id   NUMBER PRIMARY KEY,
    fname       VARCHAR2(50),
    lname       VARCHAR2(50)
);

-- WRITTEN_BY Table
CREATE TABLE written_by (
    book_id     NUMBER,
    author_id   NUMBER
);
```

---

## **2️⃣ Sample Data Inserts**

```sql
-- Clear tables first
TRUNCATE TABLE written_by;
TRUNCATE TABLE books;
TRUNCATE TABLE author;

-- Insert Authors
INSERT INTO author VALUES (1, 'John', 'Doe');
INSERT INTO author VALUES (2, 'Emily', 'Smith');
INSERT INTO author VALUES (3, 'Robert', 'Rowling');

-- Insert Books
INSERT INTO books VALUES (1001, 'Mastering Oracle SQL', 101, 'EDU', 'Yes', 45.50);
INSERT INTO books VALUES (1002, 'Introduction to ART History', 102, 'ART', 'Yes', 30.00);
INSERT INTO books VALUES (1003, 'Big Data Essentials', 103, 'TECH', 'No', 55.75);
INSERT INTO books VALUES (1004, 'Advanced Painting Techniques', 102, 'ART', 'Yes', 48.00);
INSERT INTO books VALUES (1005, 'Learning Python', 101, 'EDU', 'Yes', 38.25);
INSERT INTO books VALUES (1006, 'AI for Beginners', 103, 'TECH', 'No', 65.00);
INSERT INTO books VALUES (1007, 'Modern Art Sculptures', 104, 'ART', 'No', 42.50);

-- Insert Written_By Relationships
INSERT INTO written_by VALUES (1001, 1);
INSERT INTO written_by VALUES (1002, 3);
INSERT INTO written_by VALUES (1003, 1);
INSERT INTO written_by VALUES (1003, 3);
INSERT INTO written_by VALUES (1004, 3);
INSERT INTO written_by VALUES (1005, 2);
INSERT INTO written_by VALUES (1006, 3);
INSERT INTO written_by VALUES (1007, 2);
```

---

## **3️⃣ Subquery Exercises**

### **1. Single-Row Subquery**
Find the **title and price of the cheapest book**.

---

### **2. Single-Row with Condition**
List all books **more expensive than the most expensive ART book**.

---

### **3. Subquery with `IN` (Multi-Row)**
Show all books **written by Robert Rowling**.

---

### **4. Subquery with `ANY`**
Find all books **priced higher than any ART book**.

---

### **5. Subquery with `ALL`**
Find all books **cheaper than all TECH books**.

---

### **6. Subquery in `HAVING`**
Show **book type and max price per type** where the **max price is higher than the most expensive ART book**.

---

### **7. Subquery with Equality**
Find all books **of the same type as the cheapest book**.

---

### **8. Multi-Level Nested Subquery**
Find all **books by the author with the most expensive book**.

---

### **9. Subquery with Comparison**
List all books **that cost more than the average book price**.

---

### **10. Challenge**
Find the **title, price, and author full name** for all books **written by the author(s) who wrote the cheapest book**.

---

💡 **Tip for Students:**
- Use `MIN`, `MAX`, `AVG` for single-row subqueries
- Use `IN`, `ANY`, `ALL` for multi-row subqueries
- Combine subqueries with `JOIN` for advanced challenges
