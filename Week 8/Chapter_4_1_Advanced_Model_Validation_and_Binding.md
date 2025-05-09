
# 📘 Chapter 4.1: Advanced Model Validation and Binding in ASP.NET Core MVC

## 🎯 Purpose
To teach students how to extend basic models with advanced validation attributes, custom rules, and binding techniques that ensure data quality and integrity in real-world applications.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Use Advanced Data Annotations

In `Models/Movie.cs`:
```csharp
public class Movie
{
    public int Id { get; set; }

    [Required]
    [StringLength(100, MinimumLength = 2)]
    public string Title { get; set; }

    [DataType(DataType.Date)]
    [Display(Name = "Release Date")]
    public DateTime ReleaseDate { get; set; }

    [Range(1, 1000)]
    public decimal Price { get; set; }

    [RegularExpression(@"^[A-Z]+[a-zA-Z]*$", ErrorMessage = "Only letters allowed, starting with capital")]
    public string Genre { get; set; }
}
```

---

### ✅ Step 2: Custom Validation Using IValidatableObject

In `Models/Movie.cs`:
```csharp
public class Movie : IValidatableObject
{
    public DateTime ReleaseDate { get; set; }
    public decimal Price { get; set; }

    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (ReleaseDate > DateTime.Today)
        {
            yield return new ValidationResult("Release date cannot be in the future.", new[] { nameof(ReleaseDate) });
        }

        if (Price > 500)
        {
            yield return new ValidationResult("Price must be below 500.", new[] { nameof(Price) });
        }
    }
}
```

---

### ✅ Step 3: Create a Form View with Validation Tags

In `Views/Movie/Create.cshtml`:
```html
@model Movie
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<form asp-action="Create" method="post">
    <div>
        <label asp-for="Title"></label>
        <input asp-for="Title" />
        <span asp-validation-for="Title" class="text-danger"></span>
    </div>
    <!-- Repeat for other fields -->
    <button type="submit">Save</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

### ✅ Step 4: Use Model Binding with Select Lists

In `MovieController.cs`:
```csharp
public IActionResult Create()
{
    ViewBag.Genres = new SelectList(new[] { "Action", "Comedy", "Drama" });
    return View();
}
```

In the view:
```html
<select asp-for="Genre" asp-items="ViewBag.Genres">
    <option value="">-- Select Genre --</option>
</select>
```

---

### ✅ Step 5: Prevent Overposting with Bind Attribute

In `MovieController.cs`:
```csharp
[HttpPost]
public async Task<IActionResult> Create([Bind("Title,ReleaseDate,Genre,Price")] Movie movie)
{
    if (ModelState.IsValid)
    {
        _context.Add(movie);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
    }
    return View(movie);
}
```

---

## 🧪 Hands-on Mini Challenge

1. Add a `Director` field to `Movie`, with `[Required]` and `[StringLength(50)]`.
2. Use a dropdown for selecting genre using `SelectList`.
3. Add a custom validation that disallows movies titled “Untitled”.

---

## 📝 Summary Notes

- Use `[StringLength]`, `[Display]`, `[RegularExpression]`, and `[Compare]` for common validations.
- Implement `IValidatableObject` for custom logic.
- Use `asp-validation-for` to show errors in the UI.
- Prevent overposting by binding only specific fields.

---

### ✅ Outcome of This Chapter
Students will:
- Apply rich data validation rules
- Create user-friendly, validated forms
- Understand model binding and security best practices
