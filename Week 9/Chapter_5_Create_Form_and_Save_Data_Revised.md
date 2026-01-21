# Chapter 5: Creating Forms and Saving Data with EF Core (REVISED & ALIGNED)
🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Build HTML forms using **Razor syntax and Tag Helpers**
- Understand **GET vs POST** actions in MVC
- Validate user input using **Data Annotations**
- Save data into **SQL Server using EF Core**
- Display records retrieved from the database

> ⚠️ This chapter assumes **Chapters 2–4 are completed successfully**  
> - Database and `Movies` table already exist  
> - `ApplicationDbContext` is working  
> - Project runs without errors  

---

## ⚠️ Important Naming Rule (READ FIRST)

This project uses:

```
Project name: WebApplication1
```

So we MUST use:

- `WebApplication1.Models`
- `WebApplication1.Data`

❌ Do NOT use:
- `MvcMovie.Models`
- `MvcMovie.Data`

---

## ✅ Step 1: Create the Movie Controller

### 1.1 Create `MovieController.cs`

In the **Controllers** folder:

```
Right-click → Add → Controller → MVC Controller - Empty
Name: MovieController
```

---

### 1.2 Add Controller Code

📄 **Controllers/MovieController.cs**

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class MovieController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MovieController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: /Movie
        public async Task<IActionResult> Index()
        {
            var movies = await _context.Movies.ToListAsync();
            return View(movies);
        }

        // GET: /Movie/Create
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.Genres = new SelectList(
                new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
            return View();
        }

        // POST: /Movie/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Title,ReleaseDate,Price,Genre")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                _context.Add(movie);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Genres = new SelectList(
                new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
            return View(movie);
        }
    }
}
```

---

## ✅ Step 2: Create the Create View

📄 **Views/Movie/Create.cshtml**

```razor
@model WebApplication1.Models.Movie

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

    <button type="submit">Save</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

## ✅ Step 3: Create the Index View

📄 **Views/Movie/Index.cshtml**

```razor
@model IEnumerable<WebApplication1.Models.Movie>

<h2>Movie List</h2>

<table border="1">
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

## 🎯 Expected Result

- `/Movie/Create` shows a form
- Submitting saves data to SQL Server
- `/Movie` displays saved records
- Validation errors appear correctly

---

➡️ **Proceed to Chapter 6:**  
_Editing and Deleting Records_

✅ **End of Chapter 5**
