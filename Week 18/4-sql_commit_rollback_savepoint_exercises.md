# 📝 SQL Transaction Control – COMMIT, ROLLBACK, SAVEPOINT

This guide explains how to **manage transactions** in SQL using **COMMIT**, **ROLLBACK**, and **SAVEPOINT** with simple examples and exercises.

---

## **1️⃣ COMMIT**

**Definition:**
- Permanently saves all changes made in the current transaction.
- After a `COMMIT`, you **cannot roll back** to undo the changes.

**Example:**
```sql
-- Insert a new book
INSERT INTO books VALUES (1012, 'Transaction Demo', 105, 'EDU', 'Yes', 29.99);

-- Save the changes
COMMIT;
```
✅ The new row is permanently stored.

---

## **2️⃣ ROLLBACK**

**Definition:**
- Undoes all changes in the current transaction since the last `COMMIT`.
- Useful if you made a mistake before committing.

**Example:**
```sql
-- Update price for a book
UPDATE books SET price = 100 WHERE b_code = 1001;

-- Oops! Undo it before committing
ROLLBACK;
```
✅ The book price will return to its previous value.

---

## **3️⃣ SAVEPOINT**

**Definition:**
- Marks a point in the transaction to **rollback partially** to.
- Useful for multi-step transactions.

**Example:**
```sql
-- Step 1: Insert new book
INSERT INTO books VALUES (1013, 'Partial Rollback 1', 106, 'TECH', 'Yes', 55.00);
SAVEPOINT sp1; -- Mark this point

-- Step 2: Insert another new book
INSERT INTO books VALUES (1014, 'Partial Rollback 2', 106, 'TECH', 'No', 60.00);
SAVEPOINT sp2;

-- Decide to rollback only step 2
ROLLBACK TO sp1;

-- Commit final state
COMMIT;
```
✅ Only the first insert remains, second insert is rolled back.

---

## **4️⃣ Student Exercise – Hands-On**

### **Exercise 1: COMMIT and ROLLBACK**
1. Insert a new book record into the `books` table.
2. Run a `SELECT` to verify it appears.
3. Execute `ROLLBACK` and verify the record disappears.
4. Repeat insert and run `COMMIT`.
5. Run `ROLLBACK` again – does the record disappear now?

**Expected Learning:**
- Understand difference between committed and uncommitted changes.

---

### **Exercise 2: SAVEPOINT**
1. Insert two new rows into `books`.
2. Create a `SAVEPOINT` after the first insert.
3. Rollback to that `SAVEPOINT`.
4. Verify that only the first insert remains.
5. Commit the final state.

**Expected Learning:**
- Learn to control partial rollbacks within a transaction.

---

### **Exercise 3: Mixed Operations**
1. Update a book price.
2. Delete an ART type book.
3. Create a `SAVEPOINT`.
4. Insert a new TECH book.
5. Rollback to the savepoint and check which changes remain.
6. Commit your final transaction.

**Expected Learning:**
- Understand how multiple DML operations can be managed using `SAVEPOINT` and `ROLLBACK`.

---

💡 **Tip for Students:**
- Always `SELECT` your table after each step to **observe the effect**.
- Remember: **DDL commands like CREATE, DROP, TRUNCATE auto-commit and cannot be rolled back.**
