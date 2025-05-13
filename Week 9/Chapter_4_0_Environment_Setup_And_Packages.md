
# 📘 Chapter 4.0: Environment Setup and Package Installation for ASP.NET Core MVC with EF Core

## 🎯 Objective

Before starting database development with ASP.NET Core MVC, students must ensure that their development environment is fully configured. This chapter outlines how to:
- Set up the environment
- Install necessary NuGet packages
- Prepare the project for database integration

---

## ✅ Step 1: Install Visual Studio

1. Download from: [https://visualstudio.microsoft.com/](https://visualstudio.microsoft.com/)
2. During installation, select these workloads:
   - ✅ **ASP.NET and web development**
   - ✅ **.NET desktop development**
   - ✅ **Data storage and processing** (optional but useful)

---

## ✅ Step 2: Create a New ASP.NET Core MVC Project

1. Open Visual Studio
2. Click **Create a new project**
3. Choose:
   - Template: **ASP.NET Core Web App (Model-View-Controller)**
4. Configure:
   - Project name: `MvcMovie`
   - Location: Any working folder
5. Framework: Select **.NET 6 or .NET 7**

---

## ✅ Step 3: Install Required NuGet Packages

Open **Tools > NuGet Package Manager > Manage NuGet Packages for Solution**, or use **Package Manager Console**.

Install the following packages:

```bash
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

### Package Summary

| Package                                 | Purpose                                 |
|----------------------------------------|-----------------------------------------|
| Microsoft.EntityFrameworkCore          | Core ORM functionality                  |
| Microsoft.EntityFrameworkCore.SqlServer| SQL Server provider                     |
| Microsoft.EntityFrameworkCore.Tools    | Enables migrations and scaffolding      |

---

## ✅ Step 4: Verify Package Installation

In **Solution Explorer > Packages**, you should see:

```
- Microsoft.EntityFrameworkCore (7.0.9)
- Microsoft.EntityFrameworkCore.SqlServer (7.0.9)
- Microsoft.EntityFrameworkCore.Tools (7.0.9)
```

✅ These are required to use EF Core migrations, connect to SQL Server, and build models.

---

## ✅ Step 5: Enable Developer Features

Ensure the following tools are ready:
- **Package Manager Console** (`Tools > NuGet > PMC`)
- **SQL Server Management Studio (SSMS)** (optional for DB exploration)
- **SQL Server Express** installed and running

---

## ✅ Summary

Your environment is now ready to:
- Build models using EF Core
- Connect to a real SQL Server instance
- Perform migrations and CRUD operations

🎉 Proceed to Chapter 4.1 to build and validate your `Movie` model.
