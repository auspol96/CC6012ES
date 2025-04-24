# Chapter 7: Add Search to an ASP.NET Core MVC App

## 🎯 Objective
Implement search functionality to filter movies by title and genre.

---

## 📝 Instructions

### Step 1: Update Controller
Modify `Index` method in `MoviesController.cs`:

```csharp
public async Task<IActionResult> Index(string searchString)
{
    var movies = from m in _context.Movie select m;

    if (!string.IsNullOrEmpty(searchString))
    {
        movies = movies.Where(s => s.Title!.Contains(searchString));
    }

    return View(await movies.ToListAsync());
}
```

### Step 2: Update View
In `Views/Movies/Index.cshtml` add:

```html
<form asp-controller="Movies" asp-action="Index" method="get">
    <p>
        Title: <input type="text" name="SearchString" />
        <input type="submit" value="Filter" />
    </p>
</form>
```

---

## 🧪 Deliverables
- Screenshot showing filtered results.
- Updated controller and view snippets.

---
