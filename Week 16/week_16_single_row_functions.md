# 📄 Week 16: Single-Row Functions in Oracle SQL

This file summarizes single-row functions with clear **SQL commands** and their **sample results**.

🔷 What is a Single-Row Function in SQL?
A single-row function (also called a scalar function) is a built-in SQL function that processes one row at a time and returns one value per row.

🧾 Why called “single-row”?
Because it processes one row at a time and gives one output per row — as opposed to group (aggregate) functions like SUM() or AVG(), which process many rows and return a single result for a group.

🔷 Example Query:
```sql
SELECT UPPER(Fname) AS Upper_Name, ROUND(Price, 2) AS Rounded_Price
FROM Books;
```
✅ For each book in the table, it converts Fname to uppercase and rounds Price.


---

## 🔷 Character Functions

### UPPER (Case Manipulation)
```sql
SELECT UPPER(Fname) AS Upper_Name FROM Author;
```
✅ Converts `Fname` to uppercase.

### CONCAT & LENGTH (Character Manipulation)
```sql
SELECT Author_id,
       CONCAT(Fname, Lname) AS "Author Full Name",
       LENGTH(CONCAT(Fname, Lname)) AS "Length of Full Name"
FROM Author;
```
✅ Concatenates first and last names and returns length.

---

## 🔷 Numeric Functions

### ROUND (Discount Calculation)
```sql
SELECT Title,
       Price,
       Paperback,
       ROUND(((Price * 10) / 100), 2) AS "10% Discount"
FROM Books
WHERE Paperback LIKE 't';
```
✅ Calculates and rounds 10% discount for paperbacks.

---

## 🔷 Date Functions

### SYSDATE
```sql
SELECT SYSDATE AS Today FROM Dual;
```
✅ Shows current date.

### Date Arithmetic
```sql
SELECT SYSDATE AS "Today",
       (SYSDATE + 7) AS "Date After 7 Days",
       (SYSDATE - (SYSDATE + 7)) AS "Days Difference"
FROM Dual;
```
✅ Adds and subtracts days from `SYSDATE`.

---

## 🔷 Conversion Functions

### TO_CHAR (Number)
```sql
SELECT TO_CHAR(Price, '$99,999.00') AS Formatted_Price
FROM Books;
```
✅ Formats `Price` as currency string.

### TO_CHAR (Date)
```sql
SELECT TO_CHAR(SYSDATE, 'fmDDTH Month YYYY') AS "Formatted Date"
FROM Dual;
```
✅ Formats date with day, month, and year.

---

## 🔷 General Functions (Examples)
- `NVL(expr1, expr2)` — Replace `NULL` with a default value.
- `COALESCE(expr1, expr2, ...)` — Return first non-`NULL` value.

Example:
```sql
SELECT NVL(Discount, 0) AS Discount FROM Orders;
```
✅ Replaces `NULL` in `Discount` column with `0`.

---

## ✅ Notes
- Single-row functions operate **on each row** and return **one value per row**.
- Can be used in `SELECT`, `WHERE`, `ORDER BY` clauses.
- Can be nested for complex expressions.

---

🎯 Ready to push to GitHub as `week3_single_row_functions.md`!
