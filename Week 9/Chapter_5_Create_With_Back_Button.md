
# 📘 Chapter 5: Creating a Form and Displaying Data Using EF Core in ASP.NET Core MVC

---

## 🎯 Objective

By the end of this chapter, students will be able to:
- Build a web form using Razor views and tag helpers
- Submit form data to SQL Server using EF Core
- Display saved records in a data table
- Use validation and model binding
- Navigate between views using a back button

---

## 🧩 Prerequisites

Ensure you have completed:
- SQL Server and SSMS setup (Chapter 1)
- EF Core package installations (Chapter 2)
- ApplicationDBContext and database configuration (Chapter 3)
- Model validation and data annotations (Chapter 4)

---

## ✅ Step 1: Verify `_ViewImports.cshtml`

Check that the following lines are included to simplify model and tag helper usage:

```csharp
@using MvcMovie.Models
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
```

---

## ✅ Step 2: Add Controller Actions

Open `Controllers/MovieController.cs` and ensure the following code exists:

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MvcMovie.Models;
using MvcMovie.Data;

public class MovieController : Controller
{
    private readonly ApplicationDBContext _context;

    public MovieController(ApplicationDBContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.Genres = new SelectList(new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("Title,ReleaseDate,Price,Genre")] Movie movie)
    {
        if (ModelState.IsValid)
        {
            _context.Add(movie);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        ViewBag.Genres = new SelectList(new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
        return View(movie);
    }

    public async Task<IActionResult> Index()
    {
        var movies = await _context.Movies.ToListAsync();
        return View(movies);
    }
}
```

---

## ✅ Step 3: Create the `Create.cshtml` View

In `Views/Movie/Create.cshtml`, insert the form below:

```csharp
@model Movie
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Create Movie</h2>

<form asp-action="Create" method="post">
    <div>
        <label asp-for="Title"></label>
        <input asp-for="Title" />
        <span asp-validation-for="Title" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="ReleaseDate"></label>
        <input asp-for="ReleaseDate" />
        <span asp-validation-for="ReleaseDate" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Price"></label>
        <input asp-for="Price" />
        <span asp-validation-for="Price" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Genre"></label>
        <select asp-for="Genre" asp-items="ViewBag.Genres">
            <option value="">-- Select Genre --</option>
        </select>
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>

    <button type="submit" class="btn btn-primary">Save</button>
    <a asp-action="Index" class="btn btn-secondary">Back to List</a>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

## ✅ Step 4: Create the `Index.cshtml` View

In `Views/Movie/Index.cshtml`, show a movie table:

```csharp
@model IEnumerable<Movie>
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Movie List</h2>

<table>
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
            <td>@movie.ReleaseDate.ToShortDateString()</td>
            <td>@movie.Price</td>
            <td>@movie.Genre</td>
        </tr>
    }
    </tbody>
</table>
```

---

## ✅ Step 5: Test the Workflow

1. Go to `/Movie/Create`
2. Submit a new movie
3. You’ll be redirected to `/Movie/Index`
4. Click “Back to List” to return again and insert more movies

---

## 🎯 Expected Result

- Form data saves correctly to SQL Server
- Validation is triggered for invalid input
- “Back to List” button helps navigate easily between views

➡️ You’re now ready for **Chapter 6: Edit and Delete Movies**.
