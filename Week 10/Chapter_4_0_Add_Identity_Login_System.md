
# 🔐 Chapter 4.0: Setting Up Identity and Creating Login System

---

## 🎯 Objective

By the end of this chapter, students will:
- Add ASP.NET Core Identity to an existing project
- Set up a login and registration system
- Store user credentials securely in SQL Server
- Enable login/logout navigation from the UI

---

## 🧰 Required Packages

Open the **Package Manager Console** and install:

```powershell
Install-Package Microsoft.AspNetCore.Identity.EntityFrameworkCore
Install-Package Microsoft.EntityFrameworkCore.SqlServer
Install-Package Microsoft.AspNetCore.Identity.UI
```

---

## ✅ Step 1: Add Identity Support to Your DbContext

In `Data/ApplicationDBContext.cs`, modify:

```csharp
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

public class ApplicationDBContext : IdentityDbContext
{
    public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options) { }

    public DbSet<Movie> Movies { get; set; }
}
```

---

## ✅ Step 2: Register Identity in `Program.cs`

```csharp
builder.Services.AddDbContext<ApplicationDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddDefaultIdentity<IdentityUser>(options =>
{
    options.SignIn.RequireConfirmedAccount = false;
})
.AddRoles<IdentityRole>()
.AddEntityFrameworkStores<ApplicationDBContext>();
```

Also ensure:

```csharp
builder.Services.AddControllersWithViews();
```

---

## ✅ Step 3: Scaffold Identity UI

Right-click your project → Add → **New Scaffolded Item**  
Choose: **Identity**  
✔️ Select:
- Login
- Register
- Logout
- Identity layout

✔️ Select `ApplicationDBContext` as data context.

Click **Add**

---

## ✅ Step 4: Add Identity Routes

In `Program.cs`, add this **before `app.MapControllerRoute`**:

```csharp
app.MapRazorPages(); // Required for Identity UI
```

---

## ✅ Step 5: Add Login/Register Links

In `_Layout.cshtml`:

```html
<partial name="_LoginPartial" />
```

Make sure it’s inside the `<ul>` section in the navbar.

---

## ✅ Step 6: Run Migration

```powershell
Add-Migration AddIdentity
Update-Database
```

---

## 🧪 Test Checklist

- ✅ Run the app
- ✅ Click **Register** or **Login**
- ✅ A user should be created and redirected to home

---

## ✅ Expected Result

- User can register and login
- Identity tables are created in SQL Server
- Navigation UI updates based on authentication

➡️ Next: **Chapter 4.1 – Add Roles: Admin and Customer**
