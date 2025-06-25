# Chapter 01: Project Setup and Entity Framework Installation

This guide helps you set up a new ASP.NET Core MVC project with Entity Framework Core for a shipping service application, compatible with .NET 7.0. We will avoid scaffolding and write code manually for clear understanding.

---

## 🎯 Objective

Set up the project with necessary packages to enable database access and prepare for further feature development.

---

## 📁 Step 1: Create New Project

1. Open **Visual Studio**.
2. Select **ASP.NET Core Web App (Model-View-Controller)**.
3. Name the project (e.g., `ShippingApp`).
4. Choose **.NET 7.0** as the framework.
5. Click **Create**.

---

## ⚙️ Step 2: Install Required Packages

Open **Tools > NuGet Package Manager > Package Manager Console**, and run the following commands one by one to install Entity Framework Core 7.0 packages (not 8.0, which is incompatible with .NET 7.0):

```powershell
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.20
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.20
Install-Package Microsoft.AspNetCore.Identity.EntityFrameworkCore -Version 7.0.20
```

> 🛑 If you install version 9.x or above, you'll see an error like:
> `Package Microsoft.EntityFrameworkCore.SqlServer 9.0.6 is not compatible with net7.0`.

---

## 🔧 Step 3: Verify `appsettings.json`

Open the `appsettings.json` file and make sure it looks like this:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=ShippingAppDb;Trusted_Connection=True;MultipleActiveResultSets=true"
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

---

## ✅ Step 4: Add Required `using` Statements

If you see errors like:

```plaintext
CS0234: The type or namespace name 'EntityFrameworkCore' does not exist
```

Ensure that you have installed the right packages, and **add the following `using` statement** in any file needing EF Core:

```csharp
using Microsoft.EntityFrameworkCore;
```

---

## 🗺 Step 5: Rebuild Project

1. Click **Build > Clean Solution**.
2. Then click **Build > Rebuild Solution**.

You are now ready to define your `DbContext` and entity classes.

---

✅ If everything works, you should **not** see the `CS0234` or `CS1061` errors anymore.

Next: We'll create `ApplicationDbContext.cs` and define our shipping-related models.
