# 📘 SQL MERGE (UPSERT) – Full Example and Explanation

The `MERGE` statement (also called **UPSERT**) is used to **update existing rows** or **insert new rows** into a target table in a single SQL command.

It is very useful for **data synchronization** between a source (new data) and a target (existing data) table.

---

## **1️⃣ MERGE Syntax**

```sql
MERGE INTO target_table t
USING source_table s
ON (t.primary_key = s.primary_key)
WHEN MATCHED THEN
    UPDATE SET t.column1 = s.column1,
               t.column2 = s.column2
WHEN NOT MATCHED THEN
    INSERT (t.column1, t.column2)
    VALUES (s.column1, s.column2);
```

### 🔹 Explanation
1. **`MERGE INTO target_table`** → The table to be updated/inserted.
2. **`USING source_table`** → The source of new data.
3. **`ON condition`** → Determines if a row in source matches a row in target.
4. **`WHEN MATCHED`** → Action to take if the row already exists (usually UPDATE).
5. **`WHEN NOT MATCHED`** → Action to take if the row does not exist (usually INSERT).

---

## **2️⃣ Example Setup – BOOKS Tables**

### **Target Table: BOOKS**
```sql
CREATE TABLE books (
    b_code    NUMBER PRIMARY KEY,
    title     VARCHAR2(255),
    price     NUMBER(7,2)
);

INSERT INTO books VALUES (1001, 'Mastering Oracle SQL', 45.50);
INSERT INTO books VALUES (1002, 'Intro to ART History', 30.00);
```

**Current BOOKS Table:**
| B_CODE | TITLE                     | PRICE |
|--------|--------------------------|-------|
| 1001   | Mastering Oracle SQL      | 45.50 |
| 1002   | Intro to ART History      | 30.00 |

---

### **Source Table: BOOKS_UPDATE**
```sql
CREATE TABLE books_update (
    b_code    NUMBER,
    title     VARCHAR2(255),
    price     NUMBER(7,2)
);

INSERT INTO books_update VALUES (1001, 'Mastering Oracle SQL', 50.00); -- Price change
INSERT INTO books_update VALUES (1003, 'AI for Beginners', 65.00);     -- New book
```

**Current BOOKS_UPDATE Table:**
| B_CODE | TITLE                     | PRICE |
|--------|--------------------------|-------|
| 1001   | Mastering Oracle SQL      | 50.00 |
| 1003   | AI for Beginners          | 65.00 |

---

## **3️⃣ MERGE Statement**
```sql
MERGE INTO books t
USING books_update s
ON (t.b_code = s.b_code)
WHEN MATCHED THEN
    UPDATE SET t.price = s.price
WHEN NOT MATCHED THEN
    INSERT (b_code, title, price)
    VALUES (s.b_code, s.title, s.price);
```

---

### **4️⃣ What Happens?**
1. **Row with B_CODE 1001 exists** → Price updated to 50.00.
2. **Row with B_CODE 1003 does not exist** → Inserted as new row.

**Resulting BOOKS Table:**
| B_CODE | TITLE                     | PRICE |
|--------|--------------------------|-------|
| 1001   | Mastering Oracle SQL      | 50.00 |
| 1002   | Intro to ART History      | 30.00 |
| 1003   | AI for Beginners          | 65.00 |

---

## **5️⃣ Key Notes**
- **Combines INSERT and UPDATE in one statement** (UPSERT)
- **ON condition** is critical to determine match vs new row
- Use carefully to avoid unexpected updates if condition is too broad
- Often used for **data warehousing and ETL processes**

---

💡 **Student Exercise Suggestion:**
- Create a `BOOKS` and `BOOKS_UPDATE` table with 3 rows each
- Perform `MERGE` to update existing and insert new rows
- Verify results with `SELECT * FROM books;`
