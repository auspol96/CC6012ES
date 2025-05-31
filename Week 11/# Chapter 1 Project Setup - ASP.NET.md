# Chapter 1: Project Setup - ASP.NET Core MVC with SQL Server

This chapter walks students through setting up a new ASP.NET Core MVC project connected to SQL Server.

---

## 🎯 Objective
- Create a clean ASP.NET Core MVC app with manual login and registration, using Identity + Roles (Admin, User) without using scaffolded templates.
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
In appsettings.json:
Replace the connection string with yours:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```
Add Required NuGet Packages
Right-click project → Manage NuGet Packages → Install:

```mathematica

Microsoft.AspNetCore.Identity.EntityFrameworkCore
Microsoft.EntityFrameworkCore.SqlServer
Microsoft.EntityFrameworkCore.Tools
```
---

✅ Step 3: replace with below script to Program.cs, to accknowlege db connection string and add identity default setting.
In Program.cs, add:

```csharp

using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MovieApp.Data;

var builder = WebApplication.CreateBuilder(args);

// Register services
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

// MOVE builder.Build() AFTER seeding roles
var app = builder.Build();

// SEED ROLES (Admin, User)
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

// Middleware pipeline
app.UseRouting();
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
✅ Step 4: Add Identity Tables
Run this in the Package Manager Console:

```bash
Add-Migration AddIdentityTables
Update-Database

```
It will create the necessary tables: AspNetUsers, AspNetRoles, AspNetUserRoles, etc.

---

✅ 5. Create ViewModels
Create /Models/RegisterViewModel.cs:

```json
using System.ComponentModel.DataAnnotations;

public class RegisterViewModel
{
    [Required, EmailAddress]
    public string Email { get; set; }

    [Required, DataType(DataType.Password)]
    public string Password { get; set; }

    [Required, DataType(DataType.Password), Compare("Password")]
    public string ConfirmPassword { get; set; }
}
```

Create /Models/LoginViewModel.cs:

```json

using System.ComponentModel.DataAnnotations;

public class LoginViewModel
{
    [Required, EmailAddress]
    public string Email { get; set; }

    [Required, DataType(DataType.Password)]
    public string Password { get; set; }

    public bool RememberMe { get; set; }
}

```
---

✅ 6. Create Views
Inside /Views/Account/, add:

6.1 Register.cshtml
6.2 Login.cshtml

Example: Register.cshtml

```html
@model RegisterViewModel

<form asp-action="Register" method="post">
    <label>Email</label>
    <input asp-for="Email" />
    <label>Password</label>
    <input asp-for="Password" type="password" />
    <label>Confirm Password</label>
    <input asp-for="ConfirmPassword" type="password" />
    <button type="submit">Register</button>
</form>
```
Do the same for Login.cshtml.
```html
@model MovieApp.Models.LoginViewModel
<form asp-action="Login" method="post">
    <input asp-for="Email" placeholder="Email" />
    <input asp-for="Password" type="password" placeholder="Password" />
    <input asp-for="RememberMe" type="checkbox" /> Remember Me
    <button type="submit">Login</button>
</form>
```
---
✅ 7. Add Links in Layout under nav in html tag

In Shared/_Layout.cshtml:
```html
@if (User.Identity.IsAuthenticated)
{
    <form asp-controller="Account" asp-action="Logout" method="post">
        <button type="submit">Logout</button>
    </form>
}
else
{
    <a asp-controller="Account" asp-action="Login">Login</a>
    <a asp-controller="Account" asp-action="Register">Register</a>
}
```
---
✅ Step 8: Protect by Role
In any controller or action:

```csharp

[Authorize(Roles = "Admin")]
public IActionResult AdminOnly()
{
    return View();
}
```
---
✅ Step 9: Add an Admin Manually
After registration, you can manually assign admin role:

```csharp

var user = await _userManager.FindByEmailAsync("admin@email.com");
await _userManager.AddToRoleAsync(user, "Admin");

```
You can place this logic temporarily in a controller to promote a user.


---

## ✅ Outcome

✅ DONE!
You now have:

✅ Manual login and registration

✅ Role support (Admin/User)

✅ Fully working MVC app using your SQL Server MovieDB

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
