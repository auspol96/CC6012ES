
# ➕ ASP.NET Core MVC: Add "Create Movie" Functionality

This guide walks you through building the "Create" feature in your Movie application.

---

## ✅ Step 1: Add the GET and POST Actions in MovieController

📁 File: `Controllers/MovieController.cs`

```csharp
[HttpGet]
public IActionResult Create()
{
    return View(); // Show the empty form
}

[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Create(Movie movie)
{
    if (ModelState.IsValid)
    {
        _context.Movies.Add(movie);         // Add the new movie to the context
        await _context.SaveChangesAsync();  // Save to the database
        return RedirectToAction(nameof(Index)); // Redirect back to movie list
    }

    return View(movie); // If validation fails, return the same form
}
```

📝 **Explanation:**
- `[HttpGet]` shows the form.
- `[HttpPost]` handles the submitted data.
- `ModelState.IsValid` ensures all required fields pass validation.

---

## ✅ Step 2: Create the View for the Form

📁 File: `Views/Movie/Create.cshtml`

```csharp
@model MovieApp.Models.Movie

<h2>Add New Movie</h2>

<form asp-action="Create" method="post">
    <div class="form-group">
        <label asp-for="Title"></label>
        <input asp-for="Title" class="form-control" />
        <span asp-validation-for="Title" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="ReleaseDate"></label>
        <input asp-for="ReleaseDate" class="form-control" type="date" />
        <span asp-validation-for="ReleaseDate" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="Price"></label>
        <input asp-for="Price" class="form-control" />
        <span asp-validation-for="Price" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="Genre"></label>
        <input asp-for="Genre" class="form-control" />
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>
    <button type="submit" class="btn btn-success mt-2">Save</button>
    <a asp-action="Index" class="btn btn-secondary mt-2">Cancel</a>
</form>

@section Scripts {
    @{await Html.RenderPartialAsync("_ValidationScriptsPartial");}
}
```

📝 **Explanation:**
- `asp-for` links input fields to model properties.
- Validation messages appear if input is invalid.
- Partial script section enables client-side validation.

---

## ✅ Step 3: Add Model Validation Rules (Optional)

📁 File: `Models/Movie.cs`

```csharp
using System;
using System.ComponentModel.DataAnnotations;

public class Movie
{
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Title { get; set; }

    [DataType(DataType.Date)]
    public DateTime ReleaseDate { get; set; }

    [Range(0, 1000)]
    public decimal Price { get; set; }

    [Required]
    public string Genre { get; set; }
}
```

📝 **Explanation:**
- These attributes validate form input before submission.
- ASP.NET Core will automatically show error messages if data is missing or invalid.

---

## ✅ Summary

You’ve now added:
- A form to collect new movie data.
- Controller logic to insert the new record.
- Model validation to catch incorrect input.

Next up: **Edit**, **Details**, or **Delete** operations to complete the CRUD cycle.

---
