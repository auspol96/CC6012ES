
# 🔃 ASP.NET Core MVC: Add Sorting to Movie List

This guide teaches you how to add **sorting functionality** to the movie list page in ASP.NET Core MVC.

---

## ✅ Step 1: Update MovieController to Handle Sort Order

📁 File: `Controllers/MovieController.cs`

```csharp
public async Task<IActionResult> Index(string sortOrder, string searchString)
{
    ViewData["CurrentFilter"] = searchString;

    // Set sort parameters to toggle on click
    ViewData["TitleSortParm"] = String.IsNullOrEmpty(sortOrder) ? "title_desc" : "";
    ViewData["DateSortParm"] = sortOrder == "Date" ? "date_desc" : "Date";
    ViewData["PriceSortParm"] = sortOrder == "Price" ? "price_desc" : "Price";

    var movies = from m in _context.Movies
                 select m;

    // Filter
    if (!string.IsNullOrWhiteSpace(searchString))
    {
        movies = movies.Where(s => s.Title.Contains(searchString));
    }

    // Sort
    switch (sortOrder)
    {
        case "title_desc":
            movies = movies.OrderByDescending(s => s.Title);
            break;
        case "Date":
            movies = movies.OrderBy(s => s.ReleaseDate);
            break;
        case "date_desc":
            movies = movies.OrderByDescending(s => s.ReleaseDate);
            break;
        case "Price":
            movies = movies.OrderBy(s => s.Price);
            break;
        case "price_desc":
            movies = movies.OrderByDescending(s => s.Price);
            break;
        default:
            movies = movies.OrderBy(s => s.Title);
            break;
    }

    return View(await movies.ToListAsync());
}
```

📝 **Explanation:**
- `sortOrder` comes from the query string (e.g., `?sortOrder=Date`).
- `ViewData` is used to pass state to the view to highlight and toggle sorting links.

---

## ✅ Step 2: Update the View with Sortable Column Headers

📁 File: `Views/Movie/Index.cshtml`

```html
@model IEnumerable<MovieApp.Models.Movie>

<h2>Movie List</h2>

<!-- Search Form -->
<form asp-controller="Movie" asp-action="Index" method="get" class="mb-3">
    <input type="text" name="searchString" value="@ViewData["CurrentFilter"]" class="form-control" placeholder="Search by title..." />
    <button type="submit" class="btn btn-primary mt-2">Search</button>
    <a asp-action="Index" class="btn btn-secondary mt-2 ms-2">Clear</a>
</form>

<table class="table">
    <thead>
        <tr>
            <th>
                <a asp-action="Index" asp-route-sortOrder="@ViewData["TitleSortParm"]" asp-route-searchString="@ViewData["CurrentFilter"]">Title</a>
            </th>
            <th>
                <a asp-action="Index" asp-route-sortOrder="@ViewData["DateSortParm"]" asp-route-searchString="@ViewData["CurrentFilter"]">Release Date</a>
            </th>
            <th>
                <a asp-action="Index" asp-route-sortOrder="@ViewData["PriceSortParm"]" asp-route-searchString="@ViewData["CurrentFilter"]">Price</a>
            </th>
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
- Each column header is a clickable link that toggles sorting.
- Query parameters are preserved (`searchString`, `sortOrder`).

---

## ✅ Summary

You’ve added:
- Sorting by **Title**, **Release Date**, and **Price**.
- Toggle logic between ascending and descending.
- Persistent search + sorting with `ViewData`.

---

✅ Now students can combine:
- `searchString` for filtering
- `sortOrder` for sorting
- Easily extendable to pagination or genre filtering

---
