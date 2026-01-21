# Chapter 2: EF Core Setup and Project Configuration (FULL BEGINNER VERSION)
🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Create a **new ASP.NET Core MVC project correctly**
- Understand the role of **Entity Framework Core (EF Core)**  
  *(EF Core allows us to treat database tables as C# objects)*  
- Install required EF Core NuGet packages
- Configure a SQL Server connection string
- Create and register a DbContext class **without errors**
- Build and run the project successfully

---

## ⚠️ Important Rule (READ FIRST)

> **If you reference a class in `Program.cs`, that class MUST already exist.**  
>  
> Many beginner errors happen because this rule is violated.

This chapter is written to **avoid those errors completely**.

---

## ✅ Step 0: Create a New ASP.NET Core MVC Project (START HERE)

### 0.1 Open Visual Studio
- Launch **Microsoft Visual Studio**
- Click **Create a new project**

---

### 0.2 Choose Project Template
Select:

```
ASP.NET Core Web App (Model-View-Controller)
```

Click **Next**

---

### 0.3 Configure Project

Fill in **exactly** as follows:

| Setting | Value |
|------|------|
| Project name | `WebApplication1` |
| Location | Any folder |
| Solution name | `WebApplication1` |

Click **Next**

⚠️ **Important for beginners**
- Project name matters because it becomes the **namespace**
- All later code depends on this name

---

### 0.4 Framework Settings

Choose:

| Setting | Value |
|------|------|
| Framework | `.NET 7.0` |
| Authentication | None |
| Configure for HTTPS | ✅ Checked |
| Use controllers & views | ✅ Checked |

Click **Create**

---

### ✅ Expected Result
- Project opens
- No errors
- You see folders: `Controllers`, `Models`, `Views`

---

## ✅ Step 1: Install EF Core NuGet Packages

In Visual Studio, open:

```
Tools > NuGet Package Manager > Package Manager Console
```

Run the following commands **one by one**:

```powershell
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

---

## ✅ Step 2: Configure `appsettings.json`

Open **appsettings.json** and replace its contents with:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;TrustServerCertificate=True"
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

- `Server=localhost\SQLEXPRESS` → Local SQL Server Express
- `Database=MovieDB` → Database name
- `Trusted_Connection=True` → Windows login
- `TrustServerCertificate=True` → Avoid SSL warnings locally

---

## ✅ Step 3: Create the DbContext Class (CRITICAL)

### 3.1 Create `Data` Folder

In **Solution Explorer**:

```
Right-click project → Add → New Folder → Name: Data
```

---

### 3.2 Create `ApplicationDbContext.cs`

Inside the **Data** folder, add a new class:

📄 **Data/ApplicationDbContext.cs**

```csharp
using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
    }
}
```

⚠️ Case-sensitive:
- `ApplicationDbContext` ✅
- `ApplicationDBContext` ❌ (WRONG)

---

## ✅ Step 4: Register DbContext in `Program.cs`

Open **Program.cs**

### 4.1 Add `using` statements at the top

```csharp
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;
```

❌ Do NOT use:
```csharp
using MvcMovie.Data;
```

---

### 4.2 Register DbContext (before `builder.Build()`)

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

## 🧪 Step 5: Validation (MUST PASS)

1. Build the project:
```
Ctrl + Shift + B
```

2. Run the project:
```
F5
```

### ✅ Success Indicators
- No red errors
- Browser opens
- You see **Welcome** page at `https://localhost`

---

## 🧠 Common Beginner Errors (Explain in Class)

| Error | Cause |
|----|----|
| DbContext not found | Class not created |
| Namespace error | Wrong project name |
| ApplicationDBContext | Wrong casing |
| SQL error | SQL Server not running |

---

## 🎯 Expected Result

By the end of this chapter, students should have:

✔ A correctly created MVC project  
✔ EF Core installed  
✔ Connection string configured  
✔ DbContext created and registered  
✔ Project builds and runs successfully  

---

➡️ **Proceed to Chapter 3:**  
_Defining Models and Linking Them to EF Core_

✅ **End of Chapter 2**
