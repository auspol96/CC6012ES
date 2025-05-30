# Chapter 1: Project Setup - ASP.NET Core MVC with SQL Server

This chapter walks students through setting up a new ASP.NET Core MVC project connected to SQL Server.

---

## 🎯 Objective
- Create a new ASP.NET Core MVC project
- Configure SQL Server connection
- Verify project runs correctly

---

## 🛠️ Step 1: Create a New Project

1. Open **Visual Studio 2022+**
2. Select **ASP.NET Core Web App (Model-View-Controller)**
3. Name it `MovieApp`
4. Framework: Select **.NET 7.0** or later
5. Leave Authentication as **None** for now (we'll add Identity later)
6. Uncheck **Enable Docker**
7. Create the project

---

## 🛠️ Step 2: Setup SQL Server Database

1. Open **SQL Server Management Studio (SSMS)**
2. Run this SQL to create the database:

```sql
CREATE DATABASE MovieDB;
```

> 💡 Tip: Use `localhost\SQLEXPRESS` if you're using SQL Server Express Edition.

---

## 🛠️ Step 3: Configure Connection String

1. Open `appsettings.json`
2. Replace or add the following:

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

> 🔒 Use double backslashes `\\` in JSON for the SQL Server instance name.

---

## 🛠️ Step 4: Verify the Project Runs

1. Click **Run ▶** in Visual Studio (or press `Ctrl + F5`)
2. The default landing page should load at `https://localhost:XXXX`
3. If you see the default ASP.NET Core homepage, everything is working 🎉

---

## ✅ Outcome

- Project compiles and runs
- Connected to the database `MovieDB`
- Ready for Identity and models in the next chapter

---

## 📦 Folder Checklist After This Chapter

```txt
MovieApp/
├── Controllers/
├── Models/
├── Views/
├── appsettings.json      ✅ contains correct connection string
├── Program.cs            ✅ default web app startup
├── MovieApp.csproj
```

---

### Next ➡️ Chapter 2: Add Identity Without Scaffolding
We'll add authentication and roles manually to give full control over the login system.

Let me know if you'd like me to generate it next.
