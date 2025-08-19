
# Week 21: SQL Views – Step by Step Guide (Oracle)

## 🎯 Objectives
By the end of this lesson, you should be able to:
- Understand what a view is and why we use it.
- Create, modify, and drop views.
- Retrieve data from a view.
- Perform DML (INSERT, UPDATE, DELETE) through views.
- Apply advanced options like `WITH CHECK OPTION` and `WITH READ ONLY`.

---

## 1️⃣ What is a View?
- A **view** is a **virtual table** in Oracle.
- It does not store data physically but retrieves it from **base tables**.
- Benefits:
  - Simplifies complex queries.
  - Provides data security by hiding certain columns or rows.
  - Ensures logical data independence.
  - Allows query reuse.

---

## 2️⃣ Creating a Basic View

**Syntax (Oracle):**
```sql
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias [, alias]…)]
AS subquery
[WITH CHECK OPTION [CONSTRAINT constraint_name]]
[WITH READ ONLY [CONSTRAINT constraint_name]];
```

**Example:**
```sql
CREATE VIEW Book_Vu_FIC AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'FIC';
```
👉 This creates a view showing only Fiction (`FIC`) books.

---

## 3️⃣ Modifying a View
Use `CREATE OR REPLACE VIEW`:

```sql
CREATE OR REPLACE VIEW Book_Vu_FIC
    (Code, Book_Title, Book_Price, Publisher) AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'FIC';
```

👉 Now the view has column aliases.

---

## 4️⃣ Dropping a View
```sql
DROP VIEW Book_Vu_FIC;
```

---

## 5️⃣ Retrieving Data from a View
Query it like a table:
```sql
SELECT * FROM Book_Vu_FIC;
```

**Oracle Internally Does:**
1. Retrieves the view definition from `USER_VIEWS`.
2. Checks access rights on the base table(s).
3. Converts the query into equivalent operations on the base tables.

---

## 6️⃣ Performing DML Through a View
You can `INSERT`, `UPDATE`, `DELETE` through a view **if it is a simple view**.

⚠️ DML is **NOT allowed** if the view includes:
- `DISTINCT`
- `GROUP BY`
- `START WITH` / `CONNECT BY`
- `ROWNUM`
- Set operators (`UNION`, `INTERSECT`, `MINUS`)
- Subqueries in the SELECT clause

---

## 7️⃣ Advanced Options

### 🔹 WITH CHECK OPTION
- Ensures that any `INSERT` or `UPDATE` through the view must satisfy the view condition.
- Prevents adding invalid rows.

**Example:**
```sql
CREATE OR REPLACE VIEW Book_Vu_FIC AS
SELECT *
FROM Books
WHERE Type = 'FIC'
WITH CHECK OPTION CONSTRAINT Book_Vu_FIC;
```

👉 If you try to insert a book with `Type = 'SCI'` , Oracle will reject it.

**Error Message Example:**
```
ORA-01402: view WITH CHECK OPTION where-clause violation
```
or you may try to update the view below, it will be success.
```sql
UPDATE Book_Vu_SCI
SET PRICE = 799
WHERE B_CODE = 1001;
```

---

### 🔹 WITH READ ONLY
- Makes the view **non-updatable**.
- Any DML operation (`INSERT`, `UPDATE`, `DELETE`) will fail.

**Example:**
```sql
CREATE OR REPLACE VIEW Book_Vu_FIC
    (Code, Book_Title, Book_Price, Publisher) AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'FIC'
WITH READ ONLY;
```

**Error Message Example (if you try to update):**
```
ORA-42399: cannot perform a DML operation on a read-only view
```

---

## 8️⃣ Tutorial Exercises

### Exercise 1 – Basic View
Create a view `Book_Vu_SCI` that shows **Science books only**.

```sql
CREATE VIEW Book_Vu_SCI AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'SCI';
```

---

### Exercise 2 – Column Aliases
Modify the view to show columns as:
`BookCode`, `BookTitle`, `BookPrice`, `Publisher`.

```sql
CREATE OR REPLACE VIEW Book_Vu_SCI
    (BookCode, BookTitle, BookPrice, Publisher) AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'SCI';
```

---

### Exercise 3 – Data Retrieval
Retrieve all data from the `Book_Vu_SCI` view.

```sql
SELECT * FROM Book_Vu_SCI;
```

---

### Exercise 4 – DML on View
1. Update a price of a Science book through the view:
   ```sql
   UPDATE Book_Vu_SCI
   SET BookPrice = 599
   WHERE BookCode = '1001';
   ```
   ✅ This should work if the view is simple.

2. Try inserting a new book with `Type = 'ART'`:
   ```sql
   INSERT INTO Book_Vu_SCI (BookCode, BookTitle, BookPrice, Publisher)
   VALUES ('A101', 'Modern Art', 350, 'P01');
   ```
   ⚠ This will fail because the row does not meet the `Type = 'SCI'` condition.

---

### Exercise 5 – With Check Option
Recreate the view with `WITH CHECK OPTION`:

```sql
CREATE OR REPLACE VIEW Book_Vu_SCI AS
SELECT *
FROM Books
WHERE Type = 'SCI'
WITH CHECK OPTION CONSTRAINT Book_Vu_SCI;
```

- Try inserting a book with `Type = 'MATH'`.  
  👉 Oracle will block it.

---

### Exercise 6 – With Read Only
Recreate the view with `WITH READ ONLY`:

```sql
CREATE OR REPLACE VIEW Book_Vu_SCI
    (BookCode, BookTitle, BookPrice, Publisher) AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'SCI'
WITH READ ONLY;
```

- Try updating or deleting a row:
  ```sql
  DELETE FROM Book_Vu_SCI WHERE BookCode = '1001';
  ```
  👉 Oracle will return error **ORA-42399**.

---

## ✅ Summary
- **View = Virtual Table** (query saved as an object).
- Use `CREATE / REPLACE / DROP` to manage views.
- DML works only on **simple views**.
- `WITH CHECK OPTION` = enforces condition on DML.
- `WITH READ ONLY` = prevents DML completely.
- Oracle shows clear **error messages** when rules are broken.

---
