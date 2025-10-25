# 🧠 Basic SQL Lesson Plan: CS6004ES – Beginner SQL Tutorial

This lesson is designed for new students joining the CS6004ES module. It introduces **basic SQL operations** through hands-on commands and short explanations. Ideal for Week 1 or 2 foundation labs.

---

## 📌 Objectives
By the end of this lesson, students will:
- Understand the purpose of SQL
- Be able to create, insert, update, delete, and select from tables
- Learn to drop tables safely

---

## 📚 Lesson Topics & Syntax

### 1. CREATE TABLE
**Purpose:** To define the structure of a new table
```sql
CREATE TABLE Students (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Age INT
);
```

### 2. INSERT INTO
**Purpose:** To add new rows to the table
```sql
INSERT INTO Students (StudentID, FirstName, LastName, Email, Age)
VALUES (1, 'Anna', 'Smith', 'anna.smith@example.com', 21);
```

### 3. SELECT
**Purpose:** To retrieve data from one or more tables
```sql
-- Select all columns
SELECT * FROM Students;

-- Select specific columns
SELECT FirstName, Age FROM Students;
```

### 4. UPDATE
**Purpose:** To modify existing data
```sql
UPDATE Students
SET Age = 22
WHERE StudentID = 1;
```

### 5. DELETE
**Purpose:** To remove rows from the table
```sql
DELETE FROM Students
WHERE StudentID = 1;
```

### 6. DROP TABLE
**Purpose:** To permanently remove the table and its data
```sql
DROP TABLE Students;
```

---

## 🧪 Practice Exercise (Lab Style)

### Exercise 1:
1. Create a table named `Books` with fields:
   - `BookID` (INT, Primary Key)
   - `Title` (VARCHAR)
   - `Author` (VARCHAR)
   - `Price` (DECIMAL)
2. Insert 2 sample books.
3. Select all books.
4. Update the price of one book.
5. Delete one book by its ID.
6. Drop the table.

### Exercise 2:
Design your own table called `Courses` and:
- Add 3 rows of course data
- Display all rows
- Update a course name
- Delete one course

---

## ✅ Tips for Students
- Always test queries in a safe database (e.g., Oracle Live SQL, SQLite, SSMS demo)
- Use `SELECT * FROM tablename;` often to check your work
- Save your scripts for re-use and submission

---

Let this document guide your classroom walkthrough and hands-on demo.
For advanced learners, transition into using **constraints, foreign keys, and views** in later sessions.

