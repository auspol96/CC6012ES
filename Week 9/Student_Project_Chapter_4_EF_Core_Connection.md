# Student Project – Chapter 4
## Connecting Student Model to Database with EF Core (Careful Introduction)

---

## 🎯 Objective
By the end of this chapter, students will:

- Understand what **Entity Framework Core (EF Core)** does
- Add EF Core to an existing MVC project
- Create a `DbContext`
- Map the `Student` model to an existing database table
- Verify the application can connect to the database

> This chapter **connects C# to SQL**, but still does NOT build full CRUD yet.

---

## 🧠 Big Picture (Very Important)

So far we have:

- Chapter 1: Database exists (`StudentDB`, `Students` table)
- Chapter 2: MVC project works
- Chapter 3: `Student` model exists (C# only)

Now:

> EF Core acts as a **bridge** between MVC and SQL Server.

---

## 🟦 Step 1: Install EF Core Packages

Open:

```
Tools → NuGet Package Manager → Package Manager Console
```

Run **one command at a time**:

```powershell
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

Wait for each command to finish before running the next.

---

## 🟦 Step 2: Configure Connection String

Open `appsettings.json` and update it:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=StudentDB;Trusted_Connection=True;TrustServerCertificate=True"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

### 🧠 Explanation
- Database already exists
- EF Core will **NOT create tables**
- EF Core will map to existing table

---

## 🟦 Step 3: Create ApplicationDbContext

Create folder:

```
Data
```

Add file:

```
ApplicationDbContext.cs
```

Paste the following:

```csharp
using Microsoft.EntityFrameworkCore;
using StudentMVC.Models;

namespace StudentMVC.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Student> Students { get; set; }
    }
}
```

---

## 🟦 Step 4: Register DbContext in Program.cs

Open `Program.cs`.

Add at the top:

```csharp
using Microsoft.EntityFrameworkCore;
using StudentMVC.Data;
```

Register DbContext **before** `builder.Build()`:

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

## 🧪 Step 5: Build & Run

1. Press **Ctrl + Shift + B**
2. Fix any build errors before continuing
3. Press **F5**

### Expected Result
- Project runs successfully
- No runtime errors
- Database connection is ready

---

## ⚠️ Important Rules (Read Carefully)

At this stage:

❌ Do NOT run `Add-Migration`  
❌ Do NOT run `Update-Database`  
❌ Do NOT modify database schema  

We are **database-first**, not code-first.

---

## 🧠 Teaching Tip

Explain to students:

> “EF Core does not mean database creation.  
> EF Core means database communication.”

---

## ✅ Chapter Completion Checklist

✔ EF Core installed  
✔ Connection string configured  
✔ DbContext created  
✔ Student mapped to database  
✔ Project builds and runs  

---

## ▶️ Next Chapter

➡️ **Chapter 5: Reading Student Data from Database (List Page)**
