
# Student Management System  
## Chapter 1: Database Design and Sample Data (SQL First)

---

## 🎯 Chapter Objective
By the end of this chapter, students will be able to:

- Understand the structure of a **Student Management System**
- Create a database and table using SQL
- Insert sample student records
- Query data to understand how MVC will later interact with the database

> In this chapter, **NO MVC code is written**.  
> We focus only on the **database layer**.

---

## 🧠 Big Picture (Important Concept)

In real-world systems:
- Databases often exist **before** applications
- Applications (MVC) are built **on top of existing data**

This chapter reflects **industry practice**.

---

## 🗄️ Step 1: Create the Database

Open **SQL Server Management Studio (SSMS)** and run:

```sql
CREATE DATABASE StudentDB;
GO
```

Verify the database appears in:
```
Databases > StudentDB
```

---

## 🧱 Step 2: Create the Students Table

Switch to the `StudentDB` database and run:

```sql
USE StudentDB;
GO

CREATE TABLE Students (
    StudentId INT IDENTITY(1,1) PRIMARY KEY,
    StudentCode VARCHAR(20) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Program VARCHAR(100) NOT NULL,
    YearLevel INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
);
```

---

## 🧾 Step 3: Insert Sample Data

```sql
INSERT INTO Students (StudentCode, FullName, Email, DateOfBirth, Program, YearLevel)
VALUES
('ST2024001', 'Alice Johnson', 'alice.johnson@example.com', '2002-05-14', 'BSc Computer Science', 2),
('ST2024002', 'Brian Smith', 'brian.smith@example.com', '2001-11-02', 'BSc Computer Science', 3),
('ST2024003', 'Catherine Lee', 'catherine.lee@example.com', '2003-01-21', 'BBA Business Administration', 1),
('ST2024004', 'David Tan', 'david.tan@example.com', '2000-08-09', 'BSc Information Technology', 4),
('ST2024005', 'Emily Wong', 'emily.wong@example.com', '2002-03-30', 'BSc Information Technology', 2),
('ST2024006', 'Frank Miller', 'frank.miller@example.com', '2001-06-18', 'BBA Business Administration', 3),
('ST2024007', 'Grace Kim', 'grace.kim@example.com', '2003-09-05', 'BSc Computer Science', 1),
('ST2024008', 'Henry Brown', 'henry.brown@example.com', '2000-12-12', 'BSc Computer Science', 4);
```

---

## 🔍 Step 4: Verify the Data

```sql
SELECT * FROM Students;
```

```sql
SELECT * FROM Students WHERE IsActive = 1;
```

```sql
SELECT * FROM Students ORDER BY CreatedDate DESC;
```

---

## 🧠 How This Relates to MVC (Preview)

- `Students` table → `Student` model
- `StudentDB` → EF Core connection string
- SQL rows → MVC views

> MVC will **NOT recreate this table**.  
> It will **map to it**.

---

## ✅ Expected Result

- `StudentDB` exists
- `Students` table has data
- Queries return correct results

---

## ▶️ Next Chapter

➡️ **Chapter 2: Creating the MVC Project and Connecting to an Existing Database**
