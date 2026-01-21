# Chapter 4: Creating and Applying Migrations with EF Core (REVISED & BEGINNER-SAFE)
🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Understand **what EF Core migrations are** and why they are needed
- Generate a migration from C# models (**Code-First approach**)
- Apply the migration to create the **actual database and tables**
- Verify the results using **SQL Server Management Studio (SSMS)**
- Fix common migration-related errors

> ⚠️ This chapter assumes **Chapters 2 and 3 are completed successfully**  
> - `ApplicationDbContext` exists  
> - `Movie` model exists  
> - Project builds with **no errors**

---

## 🧠 Step 1: What Is a Migration? (Concept First)

A **migration** is a set of instructions that tells EF Core **how to change the database**.

Think of migrations as:

> **Version control for your database schema**

### Important rule (very important for beginners):

> **EF Core will NOT change the database automatically.**  
> You must explicitly tell it when to update the database.

---

### Code-First Flow (Mental Model)

```
C# Model
   ↓
DbContext
   ↓
Migration (SQL instructions)
   ↓
Database (tables created/updated)
```

---

## ✅ Step 2: Create Your First Migration

### 2.1 Open Package Manager Console

In Visual Studio:

```
Tools > NuGet Package Manager > Package Manager Console
```

---

### 2.2 Run the Migration Command

Run the following command:

```powershell
Add-Migration InitialCreate
```

⚠️ **Important**
- Do NOT type `ApplicationDBContext`
- Correct name is **`ApplicationDbContext`**
- In this project, EF Core finds the context automatically

---

### 🧪 What EF Core does now

- Reads your `Movie` model
- Reads `ApplicationDbContext`
- Generates SQL needed to create tables
- **Does NOT touch the database yet**

---

### 📁 Files Created

EF Core creates a new folder:

```
Migrations/
```

Inside, you will see:

- `YYYYMMDDHHMMSS_InitialCreate.cs`
- `ApplicationDbContextModelSnapshot.cs`

These files:
- Describe **what to create**
- Track the **current schema state**

---

## ✅ Step 3: Apply the Migration (THIS CREATES TABLES)

Still in **Package Manager Console**, run:

```powershell
Update-Database
```

### 🧠 What happens here

EF Core will:

✔ Connect to SQL Server using `appsettings.json`  
✔ Create database **MovieDB** (if not exists)  
✔ Create table **Movies**  
✔ Create table **__EFMigrationsHistory**

✅ **This is the exact moment the table is created**

---

## 🧪 Step 4: Verify Using SSMS

### 4.1 Open SQL Server Management Studio (SSMS)

Connect using:

| Setting | Value |
|------|------|
| Server name | `localhost\SQLEXPRESS` |
| Authentication | Windows Authentication |

---

### 4.2 Check the Database

Navigate to:

```
Databases
 └── MovieDB
     └── Tables
```

You should see:

- `dbo.Movies`
- `dbo.__EFMigrationsHistory`

🎉 This confirms the migration worked.

---

## 🧠 Common Beginner Errors and Fixes

| Error | Cause | Fix |
|----|----|----|
Cannot connect to SQL Server | SQL service not running | Start SQL Server |
Wrong DbContext name | `ApplicationDBContext` used | Use `ApplicationDbContext` |
Connection string error | Missing `\\` | Double-check string |
No tables created | Forgot `Update-Database` | Run it |

---

## 🎯 Expected Result

By the end of this chapter, students should have:

✔ Generated their first migration  
✔ Applied the migration successfully  
✔ Seen `MovieDB` and `Movies` table in SSMS  
✔ Understood **when and how tables are created**

---

## 🧠 One-Line Exam Answer

> EF Core migrations generate and apply database schema changes based on C# models using a Code-First approach.

---

➡️ **Proceed to Chapter 5:**  
_Inserting and Displaying Movie Records_

✅ **End of Chapter 4**
