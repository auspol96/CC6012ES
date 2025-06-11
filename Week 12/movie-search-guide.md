
# 🔍 ASP.NET Core MVC: Add Search Functionality to Movie List

This guide explains how to add a **search bar** to filter movies by title on the Movie list page.

---

## ✅ Step 1: Update MovieController to Support Search

📁 File: `Controllers/MovieController.cs`

```csharp
public async Task<IActionResult> Index(string searchString)
{
    // Start with the full movie list
    var movies = from m in _context.Movies
                 select m;

    // If the user entered a search term, filter the movies by Title
    if (!string.IsNullOrEmpty(searchString))
    {
        movies = movies.Where(s => s.Title.Contains(searchString));
    }

    // Pass the search term back to the view for redisplay
    ViewData["CurrentFilter"] = searchString;

    return View(await movies.ToListAsync());
}
```

📝 **Explanation:**
- `searchString` is the input from the search box.
- `ViewData["CurrentFilter"]` retains the user's search input in the view.

---

## ✅ Step 2: Update the Movie List View with a Search Form

📁 File: `Views/Movie/Index.cshtml`

```html
@model IEnumerable<MovieApp.Models.Movie>

<h2>Movie List</h2>

<!-- 🔍 Search Form -->
<form asp-controller="Movie" asp-action="Index" method="get" class="mb-3">
    <input type="text" name="searchString" 
           value="@ViewData["CurrentFilter"]" 
           class="form-control" 
           placeholder="Search by title..." />
    <button type="submit" class="btn btn-primary mt-2">Search</button>
</form>

<!-- 📄 Movie Table -->
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

📝 **Explanation:**
- The form uses `method="get"` so the search term appears in the URL (e.g., `?searchString=Titanic`).
- `@ViewData["CurrentFilter"]` ensures the search box keeps the entered text after searching.

---

## ✅ Summary

You’ve successfully added:
- A search input to the movie listing page.
- A filtering mechanism in the controller.
- Logic to preserve the search input after submission.

You can now easily extend this by:
- Adding genre/category dropdown filters.
- Adding sorting by date or price.

---
