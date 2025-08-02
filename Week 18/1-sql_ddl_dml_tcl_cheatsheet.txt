# 📘 SQL Command Categories – DDL, DML, TCL

This cheat sheet summarizes the **three main categories of SQL commands** with definitions, purposes, and examples.

---

## **1️⃣ DDL – Data Definition Language**

**Purpose:** Define and manage the **structure (schema)** of the database objects.

- Changes are **auto-committed** (cannot be rolled back)
- Affects **tables, views, indexes, sequences**, etc.

**Common Commands:**
| Command      | Purpose                            | Example |
|-------------|------------------------------------|---------|
| **CREATE**   | Create new objects                 | `CREATE TABLE books (...);` |
| **ALTER**    | Modify existing objects            | `ALTER TABLE books ADD isbn VARCHAR2(20);` |
| **DROP**     | Delete objects                     | `DROP TABLE books;` |
| **TRUNCATE** | Remove all rows quickly            | `TRUNCATE TABLE books;` |
| **RENAME**   | Rename an object                   | `RENAME books TO book_master;` |

💡 **Tip:** DDL statements are **auto-committed**.

---

## **2️⃣ DML – Data Manipulation Language**

**Purpose:** Manage **data** inside database tables.

- Changes **can be rolled back** until committed
- Affects **rows in tables**, not table structures

**Common Commands:**
| Command     | Purpose                    | Example |
|------------|----------------------------|---------|
| **INSERT**  | Add new rows                | `INSERT INTO books VALUES (1001, 'SQL', 45.50);` |
| **UPDATE**  | Modify existing rows        | `UPDATE books SET price = 50 WHERE b_code = 1001;` |
| **DELETE**  | Remove rows                 | `DELETE FROM books WHERE type = 'ART';` |
| **MERGE**   | Insert or update (UPSERT)   | `MERGE INTO books USING books_update ...` |

💡 **Tip:** DML changes require **COMMIT** to save or **ROLLBACK** to undo.

---

## **3️⃣ TCL – Transaction Control Language**

**Purpose:** Manage **transactions** for DML operations.

- Works with DML commands to **save, undo, or control** data changes

**Common Commands:**
| Command          | Purpose                      | Example |
|-----------------|------------------------------|---------|
| **COMMIT**       | Save all pending changes     | `COMMIT;` |
| **ROLLBACK**     | Undo changes since last commit | `ROLLBACK;` |
| **SAVEPOINT**    | Create a rollback point      | `SAVEPOINT sp1;` |
| **SET TRANSACTION** | Define transaction properties | `SET TRANSACTION READ ONLY;` |

💡 **Tip:** TCL commands only affect **DML statements**, because DDL auto-commits.

---

## ✅ **Quick Summary Table**

| Category | Works On       | Commands |
|---------|----------------|----------------------------------------|
| **DDL** | Structure       | CREATE, ALTER, DROP, TRUNCATE, RENAME  |
| **DML** | Data            | INSERT, UPDATE, DELETE, MERGE          |
| **TCL** | Transactions    | COMMIT, ROLLBACK, SAVEPOINT, SET TRANSACTION |

---

💡 **Class Tip:**
1. Run a DML statement like `INSERT` and try `ROLLBACK`.
2. Run a DDL statement like `DROP` and see that it commits automatically.
3. Combine with `SAVEPOINT` to demonstrate transaction control.
