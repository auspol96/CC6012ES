# Chapter 2: Add Identity Without Scaffolding

This chapter shows how to manually add ASP.NET Core Identity (roles).

---

## 🎯 Objective
- Add ASP.NET Core Identity manually
- Prepare for user authentication and role management

---

## 🧩 Step 1: Install Required NuGet Packages

Open **Package Manager Console** and run:

```bash
Install-Package Microsoft.AspNetCore.Identity.EntityFrameworkCore -Version 7.0.20
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.20
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.20

```

> 💡 These enable Identity and EF Core to work with SQL Server.

---

## 🛠️ Step 2: Create ApplicationDbContext

📄 `Data/ApplicationDbContext.cs`

```csharp
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace MovieApp.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }

        public DbSet<Movie> Movies { get; set; } // We'll add this in Chapter 6
    }
}
```

---

## 🔧 Step 3: Register Identity in Program.cs

📄 `Program.cs`

Replace the top part of your builder config with:

```csharp
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MovieApp.Data;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddDefaultIdentity<IdentityUser>()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Account/Login";
    options.AccessDeniedPath = "/Account/AccessDenied";
});

builder.Services.AddControllersWithViews();

var app = builder.Build();
...
```

> 🧠 Explanation:
> - `.AddDefaultIdentity()` adds user registration and login logic
> - `.AddRoles<IdentityRole>()` enables role-based access

---

## 🧱 Step 4: Create Initial Migration

Open **Package Manager Console** and run:

```bash
Add-Migration Init
Update-Database
```

> 🧠 This creates all Identity tables (AspNetUsers, AspNetRoles, etc.) in `MovieDB`

---

## 📊 What Tables Are Created?

| Table Name             | Description                     |
|-----------------------|----------------------------------|
| AspNetUsers           | Stores user accounts             |
| AspNetRoles           | Stores roles like Admin, User    |
| AspNetUserRoles       | Maps users to roles              |
| AspNetUserClaims      | Stores custom claims             |
| AspNetUserLogins      | External login providers         |
| AspNetUserTokens      | Auth tokens (e.g. remember me)   |
| AspNetRoleClaims      | Role-specific claims             |

---

## ✅ Outcome
- Identity is ready for Register/Login features (next chapter)
- Tables are generated in SQL Server
- Scaffold-free setup = full control

---

### Next ➡️ Chapter 3: Implement Register and Login System (Manual Views & Controllers)
Let me know when you’re ready!
