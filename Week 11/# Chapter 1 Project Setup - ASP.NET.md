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

Install-Package Microsoft.AspNetCore.Identity.EntityFrameworkCore -Version 7.0.20
Install-Package Microsoft.EntityFrameworkCore.SqlServer -Version 7.0.20
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 7.0.20

```
---

✅ Step 3: replace with below script to Program.cs, to accknowlege db connection string and add identity default setting.
In Program.cs, add:

```csharp

using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

//  Tell ASP.NET to use your custom login path
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Account/Login";
    options.AccessDeniedPath = "/Account/AccessDenied";
});

builder.Services.AddControllersWithViews();

var app = builder.Build();

app.UseStaticFiles();
app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapDefaultControllerRoute();   //  This is enough
// app.MapRazorPages();           //  REMOVE THIS LINE!

app.Run();



```
Create a new folder: /Data/

In Data/ApplicationDbContext.cs:

```csharp

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

```csharp

using System.ComponentModel.DataAnnotations;

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

```csharp

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

@model LoginViewModel

<form asp-action="Login" asp-controller="Account" method="post">
    @Html.AntiForgeryToken()

    <div asp-validation-summary="All" class="text-danger"></div> <!--  Show errors -->

    <input asp-for="Email" placeholder="Email" />
    <input asp-for="Password" type="password" />
    <input asp-for="RememberMe" type="checkbox" /> Remember Me

    <button type="submit">Login</button>
</form>


```
---
✅ 7. Add Links in Layout under nav in html tag

In Shared/_Layout.cshtml:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@ViewData["Title"] - MovieApp</title>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/css/site.css" asp-append-version="true" />
    <link rel="stylesheet" href="~/MovieApp.styles.css" asp-append-version="true" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
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

            <div class="container-fluid">
                <a class="navbar-brand" asp-area="" asp-controller="Home" asp-action="Index">MovieApp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a class="nav-link text-dark" asp-area="" asp-controller="Home" asp-action="Index">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
                        </li>
                    </ul>
                    <partial name="_LoginPartial" />
                </div>
            </div>
        </nav>
    </header>
    <div class="container">
        <main role="main" class="pb-3">
            @RenderBody()
        </main>
    </div>

    <footer class="border-top footer text-muted">
        <div class="container">
            &copy; 2025 - MovieApp - <a asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
        </div>
    </footer>
    <script src="~/lib/jquery/dist/jquery.min.js"></script>
    <script src="~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="~/js/site.js" asp-append-version="true"></script>
    @await RenderSectionAsync("Scripts", required: false)
</body>
</html>

```

---

## ✅ Outcome

✅ DONE!
You now have:

✅ Manual login and registration

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
