
# 📘 Chapter 4.1: Advanced Model Validation and Binding (Revised with [HttpGet])

## 🎯 Learning Objectives
By the end of this chapter, students will be able to:
- Apply advanced validation rules to model properties
- Use server-side and client-side validation with Razor views
- Create custom validation rules using `IValidatableObject`
- Bind model data from dropdown lists and prevent overposting
- Implement Create() with or without EF Core
- Understand the use of `[HttpGet]` and `[HttpPost]` together

---

## 🧱 Setup Prerequisites

Ensure you already have:
- A `Movie` model defined in `MvcMovie.Models`
- A working controller named `MovieController`
- Views located under `Views/Movie`

---

## ✅ Step-by-Step Instructions

### ✅ Step 1: Add Advanced Validation to the Model

In `Models/Movie.cs`:
```csharp
using System.ComponentModel.DataAnnotations;

public class Movie : IValidatableObject
{
    public int Id { get; set; }

    [Required(ErrorMessage = "Title is required.")]
    [StringLength(100, MinimumLength = 2)]
    public string Title { get; set; }

    [Display(Name = "Release Date")]
    [DataType(DataType.Date)]
    public DateTime ReleaseDate { get; set; }

    [Range(1, 500, ErrorMessage = "Price must be between 1 and 500.")]
    public decimal Price { get; set; }

    [RegularExpression(@"^[A-Z]+[a-zA-Z]*$", ErrorMessage = "Genre must start with a capital letter.")]
    public string Genre { get; set; }

    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (Title?.ToLower() == "untitled")
        {
            yield return new ValidationResult("Title cannot be 'Untitled'.", new[] { "Title" });
        }

        if (ReleaseDate > DateTime.Now)
        {
            yield return new ValidationResult("Release date cannot be in the future.", new[] { "ReleaseDate" });
        }
    }
}
```

---

### ✅ Step 2: Create the Razor Form View with Validation Feedback

In `Views/Movie/Create.cshtml`:
```html
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

    <button type="submit">Save</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

### ✅ Step 3: Implement `Create()` in the Controller

---

### ✅ [HttpGet] – Display the Create Form

```csharp
[HttpGet]
public IActionResult Create()
{
    ViewBag.Genres = new SelectList(new[] { "Action", "Comedy", "Drama", "Animation" });
    return View();
}
```

This handles when the user opens `/Movie/Create` in the browser.

---

### Option A: [HttpPost] for In-Memory Only (No EF Core Yet)

```csharp
[HttpPost]
public IActionResult Create([Bind("Title,ReleaseDate,Price,Genre")] Movie movie)
{
    if (ModelState.IsValid)
    {
        TempData["Note"] = $"Movie '{movie.Title}' added (not saved to DB).";
        return RedirectToAction(nameof(Index));
    }

    ViewBag.Genres = new SelectList(new[] { "Action", "Comedy", "Drama", "Animation" });
    return View(movie);
}
```

---

### Option B: [HttpPost] with EF Core + SQL Server

First, inject your DbContext:
```csharp
private readonly MvcMovieContext _context;

public MovieController(MvcMovieContext context)
{
    _context = context;
}
```

Then:
```csharp
[HttpPost]
public async Task<IActionResult> Create([Bind("Title,ReleaseDate,Price,Genre")] Movie movie)
{
    if (ModelState.IsValid)
    {
        _context.Add(movie);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
    }

    ViewBag.Genres = new SelectList(new[] { "Action", "Comedy", "Drama", "Animation" });
    return View(movie);
}
```

---

## 🧪 Mini Challenge

1. Add a `Director` field with `[Required]` and `[StringLength(50)]`
2. Add a dropdown list with fixed directors
3. Reject any name containing numbers using custom validation

---

## ✅ Expected Outcome

- Form is displayed via `[HttpGet] Create()`
- Form is submitted via `[HttpPost] Create(...)`
- Server-side validation is triggered correctly
- The app works with or without database persistence

---

## 📝 Summary

| Feature                | Purpose                                      |
|------------------------|----------------------------------------------|
| `[HttpGet]`            | Handles opening the form (GET request)       |
| `[HttpPost]`           | Handles form submission                      |
| `DataAnnotations`      | Validates fields like `Title`, `Genre`, etc. |
| `IValidatableObject`   | Adds logic-based validation                  |
| `TempData`             | Passes notice across redirect                |
| `_context` + EF Core   | Enables true database saving                 |
