
# 📘 Chapter 5: Creating a Form and Saving Data to SQL Server with EF Core

---

## 🎯 Objective

By the end of this chapter, students will:
- Build a form using Razor syntax and Tag Helpers
- Submit user input to an EF Core-powered database
- View data records pulled directly from SQL Server
- Understand the use of GET/POST actions and validation

---

## ✅ Step 1: Add the Controller with Create Actions

In the `Controllers` folder, create or open `MovieController.cs`. Add the following:

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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

## ✅ Step 2: Add the Create View

In the folder `Views/Movie`, create `Create.cshtml`:

```csharp
@model MvcMovie.Models.Movie
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

    <button type="submit">Save</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

## ✅ Step 3: Add the Index View to Display Records

Create `Views/Movie/Index.cshtml`:

```csharp
@model IEnumerable<MvcMovie.Models.Movie>
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

## ✅ Step 4: Enable jQuery Validation (Optional but Recommended)

Ensure you have this in your `_Layout.cshtml` or `_ValidationScriptsPartial.cshtml`:

```html
<script src="~/lib/jquery/dist/jquery.min.js"></script>
<script src="~/lib/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="~/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>
```

---

## 🎯 Expected Result

- Students can navigate to `/Movie/Create` to submit new movie records
- Data is saved into SQL Server and appears on the `/Movie/Index` page
- Validation messages are shown for missing or invalid input

✅ This is the first complete data entry and display feature using EF Core.

➡️ You’re now ready to enhance your project with editing, deletion, and more styling in future chapters.
