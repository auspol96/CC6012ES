# Oracle SQL – Indexes

## 1. Introduction
An **INDEX** is a database object that improves the speed of data retrieval.  
Think of it like the **index at the back of a book** – instead of reading the whole book, you jump directly to the page you need.

- **Improves query performance** (especially on large tables).  
- **Independent from the base table** → creating or dropping an index does not affect the table data.  
- **Automatically created** when a **PRIMARY KEY** or **UNIQUE** constraint is defined.  
- **Manually created** for columns that are often used in search conditions (WHERE, JOIN, ORDER BY).  

---

## 2. Syntax
```sql
CREATE INDEX index_name
ON table_name (column1 [, column2, ...]);
```

### Explanation
- **index_name** → name of the index.  
- **table_name** → table to apply the index.  
- **columns** → one or more columns used in searching.  

---

## 3. Creating an Index
```sql
CREATE INDEX Book_IDX
ON Books (B_Code, Type, P_Code);
```
- Here, `Book_IDX` is created on three columns (`B_Code`, `Type`, `P_Code`).  
- Helps when queries often filter or join by these columns.  

---

## 4. Viewing Indexes
```sql
SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'BOOKS';
SELECT * FROM USER_IND_COLUMNS WHERE INDEX_NAME = 'BOOK_IDX';
```

---

## 5. Removing an Index
```sql
DROP INDEX Book_IDX;
```
⚠️ Index cannot be modified. To change it, you must drop and recreate it.

---

## 6. Hands-On Workshop

### Step 1: Create a Table
```sql
CREATE TABLE Sales (
   Sale_ID    NUMBER PRIMARY KEY,
   Product_ID NUMBER,
   Quantity   NUMBER,
   Sale_Date  DATE
);
```

### Step 2: Insert Sample Data
```sql
BEGIN
   FOR i IN 1..5000 LOOP
      INSERT INTO Sales VALUES (i, MOD(i, 100), TRUNC(DBMS_RANDOM.VALUE(1,10)), SYSDATE - MOD(i, 365));
   END LOOP;
   COMMIT;
END;
```
(This will create 5000 rows of dummy data.)

### Step 3: Query Without Index
```sql
SET TIMING ON;
SELECT * FROM Sales WHERE Product_ID = 50;
```

### Step 4: Create Index
```sql
CREATE INDEX Sales_Product_IDX
ON Sales (Product_ID);
```

### Step 5: Query With Index
```sql
SELECT * FROM Sales WHERE Product_ID = 50;
```

🔎 Compare execution speed before and after creating the index.  

You can also run:
```sql
EXPLAIN PLAN FOR
SELECT * FROM Sales WHERE Product_ID = 50;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```
to see how Oracle uses the index.

### Step 6: Drop Index
```sql
DROP INDEX Sales_Product_IDX;
```

---

## 7. Practice Questions
1. Create an index for the `Sale_Date` column in the `Sales` table.  
2. Write a query to verify whether the index has been created successfully.  
3. Drop the index you created in step 1.  
4. Discuss: When should we avoid creating indexes?  

---

## 8. Key Takeaways
- **Index = speed booster** for queries.  
- Useful for large tables and frequently queried columns.  
- Automatically created with PRIMARY KEY / UNIQUE.  
- Cannot be modified → must be dropped and recreated.  

---
