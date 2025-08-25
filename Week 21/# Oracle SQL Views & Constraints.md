# Oracle SQL: Views & Constraints - Guided Practice Workbook

## 👩‍💻 Hands-On Learning: Views in Oracle SQL

### 🧠 Objective

Explore what can and cannot be done inside an Oracle SQL view definition. Practice writing views, testing clauses like `ORDER BY`, `FOR UPDATE`, and others.

---

### 🔍 Exercise 1: Test View with ORDER BY

```sql
CREATE OR REPLACE VIEW view_with_order AS
SELECT * FROM employees
ORDER BY employee_id;  -- Try this in your Oracle environment
```

🧪 **Expected Outcome:** This should work from Oracle 12c onward. If you're using older versions, test and note the result.

---

### 🔍 Exercise 2: Test View with FOR UPDATE

```sql
CREATE OR REPLACE VIEW view_with_update AS
SELECT * FROM employees
FOR UPDATE;  -- Try this
```

🧪 **Expected Outcome:** Oracle will throw an error: `ORA-02019: FOR UPDATE clause not allowed in view definition`

✅ **Conclusion:** `FOR UPDATE` is **not supported** in view definitions.

---

### ❓ Quiz: Which clause is not supported in a view?

> a. GROUP BY
> b. HAVING
> c. CUBE
> d. FOR UPDATE OF
> e. ORDER BY

✅ **Correct Answer:** d. FOR UPDATE OF

---

## 🔒 Oracle SQL: Constraint-Based Practice

### 🧠 Objective

Learn how constraints work in Oracle by writing, modifying, and querying them.

---

### 🔍 Exercise 3: Create a Table with Constraints

```sql
CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(100) NOT NULL,
    Price NUMBER,
    ISBN VARCHAR2(20) UNIQUE,
    CONSTRAINT chk_price CHECK (Price > 0)
);
```

✅ Try inserting valid and invalid rows to test each constraint.

---

### 🔍 Exercise 4: Add NOT NULL Constraint to Price Column

```sql
ALTER TABLE Books
MODIFY Price CONSTRAINT nn_price NOT NULL;
```

✅ This ensures price must be entered for every book.

---

### 🔍 Exercise 5: Query Constraints

```sql
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'BOOKS';

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'BOOKS';
```

✅ Use this to explore how Oracle tracks constraint metadata.

---

### 🧠 Challenge: Insert Rows and Observe Constraint Errors

```sql
INSERT INTO Books (BookID, Title, Price, ISBN) VALUES (1, NULL, 250, '123-456');  -- Should fail (NOT NULL)
INSERT INTO Books (BookID, Title, Price, ISBN) VALUES (1, 'SQL Guide', -5, '123-456');  -- Should fail (CHECK)
```

Try different cases and document the errors.

---

## ❓ Concept Review Questions (Self-Test)

1. Which is not a valid Oracle constraint?
   ✅ a. Cascade

2. Which constraint can only be defined at column level?
   ✅ b. NOT NULL

3. Can you create a view before creating the base table?
   ✅ No (Oracle requires base table to exist first)

4. What happens if a column used in a view is dropped or altered?
   ✅ The view becomes invalid.

5. What’s the difference between UNIQUE and PRIMARY KEY?

   * PRIMARY KEY = unique + not null + only one per table
   * UNIQUE = allows nulls, multiple per table

---

## ✅ Summary: Key Takeaways

* Views can't include `FOR UPDATE` clause.
* Constraints can be added after table creation.
* `NOT NULL` is column-level only.
* Use `USER_CONS_COLUMNS` to inspect constraint details.

---

## 🧪 What Next?

* Use `LiveSQL.oracle.com` or your local XE DB to run all queries.
* Try intentionally breaking constraints to learn how Oracle enforces them.
* Fork this content and add your own test cases or class notes!

> 💡 Ask yourself: "Can I explain the purpose and syntax of each constraint to a friend?"
