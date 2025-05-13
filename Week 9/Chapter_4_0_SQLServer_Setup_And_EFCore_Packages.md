
# 📘 Chapter 4.0: Setting Up SQL Server and EF Core Packages for ASP.NET Core MVC

## 🎯 Objective

This chapter helps students prepare the backend environment for using Entity Framework Core (EF Core) with ASP.NET Core MVC by:
- Installing SQL Server and SQL Server Management Studio (SSMS)
- Installing essential EF Core packages via NuGet

---

## ✅ Step 1: Install SQL Server Express

1. Download from:  
   [https://www.microsoft.com/en-us/sql-server/sql-server-downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

2. Choose:
   - Edition: **SQL Server 2022 Express**
   - Installation type: **Basic**

3. Once installed, the instance name will be:  
   ```
   SQLEXPRESS
   ```

---

## ✅ Step 2: Install SQL Server Management Studio (SSMS)

1. Download from:  
   [https://aka.ms/ssmsfullsetup](https://aka.ms/ssmsfullsetup)

2. After installation, open SSMS and connect to the local instance using:

   ```
   Server Name: localhost\SQLEXPRESS
   Authentication: Windows Authentication
   ```

---

## ✅ Step 3: Enable TCP/IP (One-Time Configuration)

1. Open **SQL Server Configuration Manager**
   - Press `Win + R`, type: `SQLServerManager15.msc` and hit Enter

2. Go to:
   ```
   SQL Server Network Configuration > Protocols for SQLEXPRESS
   ```

3. Enable **TCP/IP**

4. Restart SQL Server from `services.msc`:
   - Find: `SQL Server (SQLEXPRESS)`
   - Right-click → Restart

---

## ✅ Step 4: Install Required EF Core Packages

In **Visual Studio**, open:
```
Tools > NuGet Package Manager > Package Manager Console
```

Then run the following:

```bash
Install-Package Microsoft.EntityFrameworkCore -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.9
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.9
```

---

## 📦 Installed Package Overview

| Package                                 | Purpose                                 |
|----------------------------------------|-----------------------------------------|
| Microsoft.EntityFrameworkCore          | Core EF functionality                   |
| Microsoft.EntityFrameworkCore.SqlServer| SQL Server provider for EF              |
| Microsoft.EntityFrameworkCore.Tools    | Enables migration and scaffolding tools |

You will see these listed under:
```
Solution Explorer > Packages
```

---

## ✅ Summary

You are now ready to:
- Connect to SQL Server
- Use EF Core for database management
- Proceed with modeling and migrations

➡️ Continue to **Chapter 4.1** to build the model and validate it.
