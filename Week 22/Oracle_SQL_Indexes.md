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

---

## 3. Hands-On Workshop: Full Scan vs Index Scan

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
   FOR i IN 1..500000 LOOP
      INSERT INTO Sales
      VALUES (i, MOD(i, 100), TRUNC(DBMS_RANDOM.VALUE(1,10)), SYSDATE - MOD(i, 365));
   END LOOP;
   COMMIT;
END;
/
```

### Step 3: Gather Statistics
```sql
BEGIN
   DBMS_STATS.GATHER_TABLE_STATS(USER, 'SALES', cascade => TRUE);
END;
/
```

---

### 🔎 Case 1: Query Without Index → Full Table Scan
```sql
EXPLAIN PLAN FOR
SELECT * FROM Sales WHERE Product_ID = 50;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

**Expected Execution Plan**
```
| Id | Operation           | Name  |
|----|--------------------|-------|
|  0 | SELECT STATEMENT   |       |
|  1 | TABLE ACCESS FULL  | SALES |
```

Oracle scans the whole `SALES` table (Full Table Scan) to find matching rows.

---

### 🔎 Case 2: Query With Index → Index Range Scan
First, create an index:
```sql
CREATE INDEX Sales_Product_IDX ON Sales(Product_ID);

BEGIN
   DBMS_STATS.GATHER_TABLE_STATS(USER, 'SALES', cascade => TRUE);
END;
/
```

Then run the same query:
```sql
EXPLAIN PLAN FOR
SELECT Product_ID
FROM Sales
WHERE Product_ID = 50;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

**Expected Execution Plan**
```
| Id | Operation        | Name              |
|----|-----------------|-------------------|
|  0 | SELECT STATEMENT|                   |
|  1 | INDEX RANGE SCAN| SALES_PRODUCT_IDX |
```

Now Oracle uses the index → only scans rows with `Product_ID = 50`.

---

## 4. Removing an Index
```sql
DROP INDEX Sales_Product_IDX;
```

---

## 5. Practice Questions
1. Run the same query (`Product_ID = 50`) before and after creating the index. Compare the plans.  
2. Why does Oracle sometimes prefer **Full Scan** even if an index exists?  
3. Create a composite index `(Product_ID, Sale_Date)` and test with a query filtering both columns.  

---

## 6. Key Takeaways
- Full Table Scan = Oracle reads all rows.  
- Index Range Scan = Oracle uses the index to narrow down results faster.  
- Index works best when queries return a small subset of rows and only need indexed columns.  
- Optimizer chooses the cheapest path based on statistics.  

---
