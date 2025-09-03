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
Then run the same query (index-only):
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

## 6. Tips (Short Notes)
**`DBMS_STATS.GATHER_TABLE_STATS`**: Collects optimizer statistics for the table (and its indexes when `cascade => TRUE`). Stats include row counts and data distribution. The optimizer uses these stats to choose **Full Table Scan** vs **Index**. Gather stats after large inserts or creating new indexes.  

**`EXPLAIN PLAN FOR`**: Generates the **execution plan** for a SQL statement without running it; the plan is stored in `PLAN_TABLE`. View it with:  
```sql
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

---

## 7. Troubleshooting: “Why do I still see TABLE ACCESS FULL?”
Use this quick checklist:
1. **Verify the index exists & is usable**
   ```sql
   SELECT index_name, status, visibility
   FROM user_indexes
   WHERE table_name='SALES';
   SELECT index_name, column_name
   FROM user_ind_columns
   WHERE table_name='SALES';
   ```
2. **Refresh statistics**
   ```sql
   BEGIN
     DBMS_STATS.GATHER_TABLE_STATS(
       ownname   => USER,
       tabname   => 'SALES',
       cascade   => TRUE,
       method_opt=> 'FOR ALL COLUMNS SIZE AUTO'
     );
   END;
   /
   ```
3. **Make it index-only** (avoid `SELECT *` if possible):
   ```sql
   SELECT Product_ID FROM Sales WHERE Product_ID = 50;
   ```
4. **Increase selectivity or use composite index**:
   ```sql
   CREATE INDEX Sales_Prod_Date_IDX ON Sales(Product_ID, Sale_Date);
   BEGIN DBMS_STATS.GATHER_TABLE_STATS(USER, 'SALES', cascade => TRUE); END; /
   EXPLAIN PLAN FOR
   SELECT Product_ID FROM Sales
   WHERE Product_ID = 50 AND Sale_Date >= SYSDATE - 7;
   SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
   ```
5. **Demo-only (force index)**:
   ```sql
   EXPLAIN PLAN FOR
   SELECT /*+ INDEX(Sales Sales_Product_IDX) */ Product_ID
   FROM Sales WHERE Product_ID = 50;
   SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
   ```

---
