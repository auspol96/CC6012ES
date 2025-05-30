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

✅ Step 3: Add Identity Tables
Run this in the Package Manager Console:

```json
Add-Migration AddIdentityTables
Update-Database
It will create the necessary tables: AspNetUsers, AspNetRoles, AspNetUserRoles, etc.
```

---

✅ Step 4: Seed Roles (Admin/User)
In Program.cs, add:

```json
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
    string[] roles = { "Admin", "User" };
    foreach (var role in roles)
    {
        if (!await roleManager.RoleExistsAsync(role))
        {
            await roleManager.CreateAsync(new IdentityRole(role));
        }
    }
}
```
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
