
# Student Management System  
## Chapter 2: Create MVC Project & Connect to Existing Database

---

## 🎯 Chapter Objective
By the end of this chapter, students will be able to:

- Create a new ASP.NET Core MVC project
- Install Entity Framework Core packages
- Configure a connection string to an **existing database**
- Register `DbContext` in the application
- Build the project with **no controllers and no models yet**

> This chapter prepares the MVC application **infrastructure only**.

---

## 🧠 Big Picture

In Chapter 1, we created:

- Database: `StudentDB`
- Table: `Students`
- Sample data using SQL

In this chapter:
- MVC will **connect to that database**
- MVC will **NOT create tables**
- MVC will **NOT insert data yet**

---

## 🟦 Step 1: Create a New MVC Project

1. Open **Visual Studio**
2. Click **Create a new project**
3. Select **ASP.NET Core Web App (Model-View-Controller)**
4. Click **Next**

### Project Configuration
- **Project name:** `StudentManagement`
- **Location:** your preferred folder
- **Solution name:** `StudentManagementSolution`
- Click **Next**

### Additional Settings
- **Framework:** .NET 7.0
- **Authentication:** None
- **Configure for HTTPS:** ✔
- **Enable Docker:** ❌

Click **Create**.

---

## 🟦 Step 2: Run the Project (Sanity Check)

Press **F5**.

You should see the default MVC home page.

> If this fails, do NOT continue. Fix it first.

---

## 🟦 Step 3: Install EF Core Packages

Open:

```
Tools → NuGet Package Manager → Package Manager Console
```

Run the following commands **one by one**:

```powershell
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

---

## 🟦 Step 4: Configure Connection String

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
- `StudentDB` already exists
- MVC will connect to it
- No tables are created in this chapter

---

## 🟦 Step 5: Create ApplicationDbContext (Empty for Now)

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

namespace StudentManagement.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // DbSet will be added in Chapter 3
    }
}
```

---

## 🟦 Step 6: Register DbContext in Program.cs

Open `Program.cs`.

Add **using statements at the top**:

```csharp
using Microsoft.EntityFrameworkCore;
using StudentManagement.Data;
```

Register DbContext **before** `builder.Build()`:

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

## 🧪 Step 7: Build the Project

- Press **Ctrl + Shift + B**
- Ensure **no errors**

### Expected Result
- Project builds successfully
- No controllers depend on missing models
- No runtime errors

---

## ⚠️ Important Warning (Read Carefully)

At this stage, the project must **NOT** contain:

- `StudentController`
- `Student.cs`
- `DbSet<Student>`
- Migrations

If any of these exist, **delete them**.

> Chapter order matters.

---

## ✅ Chapter Completion Checklist

✔ MVC project created  
✔ EF Core packages installed  
✔ Connected to existing `StudentDB`  
✔ `ApplicationDbContext` registered  
✔ Project builds cleanly  

---

## ▶️ Next Chapter

➡️ **Chapter 3: Creating the Student Model and Mapping to the Existing Table**
