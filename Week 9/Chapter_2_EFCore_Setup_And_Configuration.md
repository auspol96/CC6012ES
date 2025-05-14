
# 📘 Chapter 2: EF Core Setup and Project Configuration

## 🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will:
- Understand the role of Entity Framework Core (EF Core) in ASP.NET Core MVC projects.
- Install necessary EF Core packages.
- Configure the connection string for SQL Server.
- Register the database context class in the application.

---

## ✅ Step 1: Install EF Core NuGet Packages

In **Visual Studio**, open:

```
Tools > NuGet Package Manager > Package Manager Console
```

Then enter the following commands **one at a time**:

```bash
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

These packages allow ASP.NET Core MVC to connect and interact with SQL Server databases using EF Core.

---

## ✅ Step 2: Update appsettings.json

In your project root, open the file `appsettings.json` and configure the connection string:

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

🧠 **Explanation**:
- `Server=localhost\SQLEXPRESS`: Connect to your local SQL Server Express instance
- `Database=MovieDB`: This is the name of the database that EF Core will create
- `Trusted_Connection=True`: Use Windows Authentication

---

## ✅ Step 3: Register DbContext in Program.cs

Open `Program.cs` and add the following line **before** `var app = builder.Build();`

```csharp
builder.Services.AddDbContext<ApplicationDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

📌 Make sure you add this at the top of the file:

```csharp
using Microsoft.EntityFrameworkCore;
using MvcMovie.Data;
```

---

## 🧪 Validation

You should now be able to build your project without errors.

Try pressing **Ctrl + Shift + B** or click `Build > Build Solution`.

---

## 🎯 Expected Result

By the end of this chapter:
- You should have installed EF Core and related packages
- You have a correct connection string in `appsettings.json`
- Your `DbContext` is registered in `Program.cs`
- Your project builds successfully

➡️ Proceed to Chapter 3 to define your model and DbContext class.
