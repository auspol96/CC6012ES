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
using Microsoft.EntityFrameworkCore;
using YourProjectNamespace.Data;

var builder = WebApplication.CreateBuilder(args);

// DB Context using your connection string
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Add Identity with default settings
builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddControllersWithViews();

var app = builder.Build();
app.UseAuthentication();
app.UseAuthorization();
app.MapDefaultControllerRoute();
app.Run();

```
Create a new folder: /Data/

In Data/ApplicationDbContext.cs:

```json
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
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
