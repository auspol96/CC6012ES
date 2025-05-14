
# 📘 Chapter 4: Creating and Applying Migrations with EF Core

---

## 🎯 Objective

By the end of this chapter, students will:
- Understand what EF Core migrations do
- Create a migration that defines the database structure
- Apply the migration to create the actual database and table in SQL Server
- Verify the table is created in SQL Server Management Studio (SSMS)

---

## ✅ Step 1: What is a Migration?

A **migration** is a way to update the database schema over time as your application changes.

Think of it as "version control" for your database.

In this chapter, we will:
- Generate a migration based on the `Movie` model
- Apply it to create the `MovieDB` database and `Movies` table

---

## ✅ Step 2: Create Your First Migration

1. Open **Package Manager Console** from:
   ```
   Tools > NuGet Package Manager > Package Manager Console
   ```

2. Run this command to create the migration:

```bash
Add-Migration InitialCreate -Context ApplicationDBContext
```

🧠 This will create a folder called `Migrations` with two files:
- `YYYYMMDD_InitialCreate.cs`
- `ModelSnapshot.cs`

These describe the changes to apply to your database.

---

## ✅ Step 3: Apply the Migration

Still in **Package Manager Console**, run:

```bash
Update-Database -Context ApplicationDBContext
```

This command will:
- Connect to the database specified in `appsettings.json`
- Create the database `MovieDB` (if it doesn’t exist)
- Create the `Movies` table according to your `Movie.cs` model

---

## 🧪 Step 4: Verify in SSMS

1. Open **SQL Server Management Studio**
2. Connect to:
   ```
   Server: localhost\SQLEXPRESS
   ```
3. Expand:
   ```
   Databases > MovieDB > Tables
   ```

You should see:

- `dbo.Movies`
- `dbo.__EFMigrationsHistory` (tracks applied migrations)

---

## ✅ Common Errors and Fixes

| Error | Fix |
|-------|-----|
| `Cannot connect to server` | Check TCP/IP is enabled and SQL Server is running |
| `DbContext error` | Confirm correct context name in commands |
| `Connection string error` | Check for typos or missing double backslashes |

---

## 🎯 Expected Result

By the end of this chapter:
- You will have created and applied your first EF Core migration
- The `MovieDB` database and `Movies` table are now visible in SSMS
- You are ready to add data and build views/controllers

➡️ Continue to Chapter 5 to insert and display movie records from your database.
