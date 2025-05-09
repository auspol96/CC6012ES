
# 📘 Chapter 4.1: Advanced Model Validation and Binding (Improved & Corrected)

## 🎯 Learning Objectives
By the end of this chapter, students will be able to:
- Apply advanced validation rules to model properties
- Use server-side and client-side validation with Razor views
- Create custom validation rules using `IValidatableObject`
- Bind model data from dropdown lists and prevent overposting

---

## 🧱 Setup Prerequisites

Ensure you already have:
- A `Movie` model defined in `MvcMovie.Models`
- A working controller named `MovieController`
- Views located under `Views/Movie`

---

## ✅ Step-by-Step Instructions

### ✅ Step 1: Add Advanced Validation to the Model

In `Models/Movie.cs`, enhance the properties with annotations:
```csharp
using System.ComponentModel.DataAnnotations;

public class Movie
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
}
```

📌 **Purpose**: Ensure invalid inputs are blocked before database interaction.

---

### ✅ Step 2: Extend the Model with Custom Validation

⚠️ **Important**: Do NOT create a second `Movie` class.  
✅ Instead, **extend your existing `Movie` class** to implement the `IValidatableObject` interface:

```csharp
public class Movie : IValidatableObject
{
    // include all properties here as shown in Step 1

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

📌 **Purpose**: Provide custom validation logic that annotations can’t handle.

---

### ✅ Step 3: Create the Form View with Validation Feedback

In `Views/Movie/Create.cshtml`, use tag helpers:
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
        <input asp-for="Genre" />
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>

    <button type="submit">Save</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

📌 **Purpose**: Automatically validate user input and show error messages.

---

### ✅ Step 4: Bind Drop-down Lists with SelectList

In the controller (`MovieController.cs`):
```csharp
public IActionResult Create()
{
    ViewBag.Genres = new SelectList(new[] { "Action", "Comedy", "Drama", "Animation" });
    return View();
}
```

In `Create.cshtml`:
```html
<select asp-for="Genre" asp-items="ViewBag.Genres">
    <option value="">-- Select Genre --</option>
</select>
<span asp-validation-for="Genre" class="text-danger"></span>
```

📌 **Purpose**: Limit user input with a predefined list of genres.

---

### ✅ Step 5: Prevent Overposting with Bind Attribute

In controller `Create` action:
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

📌 **Purpose**: Prevent unauthorized fields from being submitted.

---

## 🧪 Mini Challenge

1. Add a `Director` property with `[Required]` and `[StringLength(50)]`
2. Populate a dropdown list with three directors
3. Add custom logic to reject directors containing numbers (e.g., “James1”)

---

## ✅ Expected Outcome

- Users are guided to enter valid data
- The app shows error messages inline
- Invalid submissions (e.g., “Untitled” movies) are rejected
- Data is securely and cleanly bound to the model

---

## 📝 Summary Notes

| Feature                | Purpose                                      |
|------------------------|----------------------------------------------|
| `DataAnnotations`      | Validate input at property level             |
| `IValidatableObject`   | Implement custom rule logic                  |
| `asp-validation-for`   | Show error messages in Razor forms           |
| `SelectList`           | Populate dropdowns from server               |
| `[Bind(...)]`          | Protect against overposting attacks          |
