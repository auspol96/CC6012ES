# Chapter 1: Project Setup - ASP.NET Core MVC with SQL Server

This chapter walks students through setting up a new ASP.NET Core MVC project connected to SQL Server.

---

## 🎯 Objective
- Create a new ASP.NET Core MVC project
- Configure SQL Server connection
- Verify project runs correctly

---

✅ Step 1: Create a New ASP.NET MVC Project
In Visual Studio:

File → New → Project.

Choose ASP.NET Core Web App (Model-View-Controller).

Name it something like MovieApp.

In the next window:

.NET 7 or higher.

Check Authentication Type → Individual Accounts (important for built-in Identity).

---

✅ Step 2: Configure appsettings.json
Replace the connection string with yours:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```

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
