# Oracle SQL – Synonyms

## 1. Introduction
A **SYNONYM** is an alias (another name) for a database object.  
It makes referencing easier and hides the actual object owner/schema.  

- **Private Synonym** → available only to the user who created it.  
- **Public Synonym** → available to all users in the database.  
- Useful for simplifying queries and providing consistent names across schemas.  

---

## 2. Syntax
```sql
CREATE [PUBLIC] SYNONYM synonym_name
FOR object_name;
```

- `PUBLIC` → makes the synonym accessible to all users.  
- `synonym_name` → the alias name you want to use.  
- `object_name` → the actual table, view, sequence, or other object.  

---

## 3. Creating a Synonym
Example with a **View** (from Week 11):

```sql
CREATE VIEW Book_Vu_FIC AS
SELECT B_Code, Title, Price, P_Code
FROM Books
WHERE Type = 'FIC';
```

Now create a synonym for it:
```sql
CREATE SYNONYM Book_View
FOR Book_Vu_FIC;
```

Usage:
```sql
SELECT * FROM Book_View;
```

This query works as if you wrote `SELECT * FROM Book_Vu_FIC;`.

---

## 4. Public Synonym
```sql
CREATE PUBLIC SYNONYM Book_View
FOR Book_Vu_FIC;
```

Now **all users** can query `Book_View` without prefixing the schema.

---

## 5. Dropping a Synonym
```sql
DROP SYNONYM Book_View;
DROP PUBLIC SYNONYM Book_View;
```

---

## 6. Hands-On Workshop

### Step 1: Create a Table
```sql
CREATE TABLE Authors (
   Author_ID NUMBER PRIMARY KEY,
   First_Name VARCHAR2(50),
   Last_Name  VARCHAR2(50)
);
```

### Step 2: Create a Private Synonym
```sql
CREATE SYNONYM MyAuthors FOR Authors;
```

### Step 3: Insert Data
```sql
INSERT INTO MyAuthors VALUES (1, 'George', 'Orwell');
INSERT INTO MyAuthors VALUES (2, 'Virginia', 'Woolf');
```

### Step 4: Query Using the Synonym
```sql
SELECT * FROM MyAuthors;
```

### Step 5: Create a Public Synonym (requires DBA privilege)
```sql
CREATE PUBLIC SYNONYM AllAuthors FOR Authors;
```

Now any user can run:
```sql
SELECT * FROM AllAuthors;
```

### Step 6: Drop the Synonym
```sql
DROP SYNONYM MyAuthors;
```

---

## 7. Practice Questions
1. Create a synonym for the `Books` table called `MyBooks`. Run a query using the synonym.  
2. Create a public synonym for `Authors` (if you have DBA rights). Test by querying without the schema prefix.  
3. Drop a synonym and verify that the alias no longer works.  

---

## 8. Key Takeaways
- **Synonym = Alias name** for database objects.  
- **Private** synonym → for one user; **Public** synonym → shared by all users.  
- Makes queries shorter and easier, especially when accessing objects across schemas.  
- Synonyms do not store data, they only point to other objects.  

---
