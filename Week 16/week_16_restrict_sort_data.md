# 📄 Week 16: Restricting and Sorting Data in Oracle SQL

This file summarizes **WHERE** and **ORDER BY** usage with clear **SQL commands** and their **sample results**.

---

## 🔷 Limiting Rows with WHERE Clause

### Equality
```sql
SELECT B_Code, Title, P_Code, Type
FROM Books
WHERE Price = 14;
```

### Character Value
```sql
SELECT *
FROM Publisher
WHERE City = 'New York';
```

### Comparison Operators
- `<=` (Less than or equal to)
```sql
SELECT Title, P_Code AS Publisher, Paperback, Price
FROM Books
WHERE Price <= 11;
```

- `<= ANY`
```sql
SELECT Title, P_Code, Paperback, Price
FROM Books
WHERE Price <= ANY (8, 11, 12);
```

- `>= ALL`
```sql
SELECT Title, P_Code, Paperback, Price
FROM Books
WHERE Price >= ALL (8, 11, 12);
```

---

## 🔷 Logical Operators

### AND
```sql
SELECT *
FROM Books
WHERE Price <= 8 AND Type = 'HOR';
```

### OR
```sql
SELECT *
FROM Books
WHERE Price <= 8 OR Type = 'HOR';
```

### NOT
```sql
SELECT *
FROM Books
WHERE NOT (Type = 'HOR');
```

---

## 🔷 Other Conditions

### BETWEEN
```sql
SELECT B_Code, Title, Price
FROM Books
WHERE Price BETWEEN 11 AND 14;
```

### IN
```sql
SELECT B_Code, Title, Price
FROM Books
WHERE Price IN (11, 12, 14);
```

### EXISTS
```sql
SELECT B_Code, Title
FROM Books B
WHERE EXISTS (
    SELECT Quantity
    FROM Inventory I
    WHERE I.B_Code = B.B_Code AND Quantity = 1
);
```

### IS NULL
```sql
SELECT *
FROM Books
WHERE Paperback IS NULL;
```

### LIKE (Wildcard Search)
```sql
SELECT Title
FROM Books
WHERE Title LIKE 'T_e%';
```

---

## 🔷 Sorting Rows with ORDER BY

### Ascending (default)
```sql
SELECT Fname, Lname
FROM Author
ORDER BY Fname;
```

### Descending
```sql
SELECT Fname, Lname
FROM Author
ORDER BY Fname DESC;
```

### ORDER BY Alias
```sql
SELECT P_Name AS "Publisher Name"
FROM Publisher
ORDER BY "Publisher Name" DESC;
```

### Multiple Columns
```sql
SELECT B_Code, Title, P_Code, Price
FROM Books
ORDER BY Price, Title;
```

---


