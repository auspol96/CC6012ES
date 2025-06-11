
# ASP.NET Core MVC Guide: Listing Movies & Redirect After Login

This guide will walk you step-by-step to:
1. Create a Movie model and database table.
2. List movies using a controller and view.
3. Setup login functionality using Identity.
4. Redirect users to the Movie page after login.

---

## 🧱 Step 1: Create the Movie Model

📁 File: `Models/Movie.cs`

```csharp
using System;

namespace MovieApp.Models
{
    public class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime ReleaseDate { get; set; }
        public decimal Price { get; set; }
        public string Genre { get; set; }
    }
}
```

---

## 🗃 Step 2: Setup the Database Context

📁 File: `Data/ApplicationDbContext.cs`

```csharp
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MovieApp.Models;

namespace MovieApp.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Movie> Movies { get; set; }
    }
}
```

📌 Make sure to add the correct `using` statements and inherit from `IdentityDbContext`.

---

## 🛠 Step 3: Configure Services

📁 File: `Program.cs`

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddDefaultIdentity<IdentityUser>()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Account/Login";
});
```

---

## 🎮 Step 4: Create Movie Controller

📁 File: `Controllers/MovieController.cs`

```csharp
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MovieApp.Data;
using MovieApp.Models;

[Authorize]
public class MovieController : Controller
{
    private readonly ApplicationDbContext _context;

    public MovieController(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        var movies = await _context.Movies.ToListAsync();
        return View(movies);
    }
}
```

---

## 🧾 Step 5: Create the Movie List View

📁 File: `Views/Movie/Index.cshtml`

```html
@model IEnumerable<MovieApp.Models.Movie>

<h2>Movie List</h2>

<table class="table">
    <thead>
        <tr>
            <th>Title</th>
            <th>Release Date</th>
            <th>Price</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var movie in Model)
        {
            <tr>
                <td>@movie.Title</td>
                <td>@movie.ReleaseDate.ToString("yyyy-MM-dd")</td>
                <td>@movie.Price.ToString("C")</td>
                <td>@movie.Genre</td>
            </tr>
        }
    </tbody>
</table>
```

---

## 🔐 Step 6: Add Role-Based Login Logic

📁 File: `Controllers/AccountController.cs`

Update the `Login` method:

```csharp
[HttpPost]
public async Task<IActionResult> Login(LoginViewModel model, string? returnUrl = null)
{
    if (!ModelState.IsValid)
        return View(model);

    var user = await _userManager.FindByEmailAsync(model.Email);
    if (user == null)
    {
        ModelState.AddModelError("", "Invalid login attempt");
        return View(model);
    }

    var result = await _signInManager.PasswordSignInAsync(user, model.Password, model.RememberMe, false);
    if (result.Succeeded)
    {
        if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
            return Redirect(returnUrl);

        var roles = await _userManager.GetRolesAsync(user);
        if (roles.Contains("Admin"))
            return RedirectToAction("Index", "Admin");

        return RedirectToAction("Index", "Movie"); // ✅ Default redirect for normal user
    }

    ModelState.AddModelError("", "Invalid login attempt");
    return View(model);
}
```

---

## ✅ Step 7: Apply Authorization

To protect the movie list so only logged-in users can see it, make sure `[Authorize]` is added to `MovieController`.

---

## 🧪 Step 8: Test the App

1. Run `Update-Database` to create tables.
2. Register a user and log in.
3. You should be redirected to `/Movie/Index`.

---

## 📌 Final Notes

- Use `[Authorize(Roles = "Admin")]` if you want to create a separate admin area.
- You can seed the `Movies` table with test data via `DbInitializer` or migrations.

---
