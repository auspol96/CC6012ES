
# 📄 ASP.NET Core MVC: Add Pagination to Movie List

This guide walks you through adding **pagination** to your Movie list page using manual logic (no external libraries).

---

## ✅ Step 1: Add Paging Logic to the Controller

📁 File: `Controllers/MovieController.cs`

```csharp
public async Task<IActionResult> Index(string sortOrder, string searchString, int? pageNumber)
{
    ViewData["CurrentFilter"] = searchString;
    ViewData["TitleSortParm"] = String.IsNullOrEmpty(sortOrder) ? "title_desc" : "";
    ViewData["DateSortParm"] = sortOrder == "Date" ? "date_desc" : "Date";
    ViewData["PriceSortParm"] = sortOrder == "Price" ? "price_desc" : "Price";

    var movies = from m in _context.Movies select m;

    if (!string.IsNullOrWhiteSpace(searchString))
    {
        movies = movies.Where(s => s.Title.Contains(searchString));
    }

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

    int pageSize = 5;
    return View(await PaginatedList<Movie>.CreateAsync(movies.AsNoTracking(), pageNumber ?? 1, pageSize));
}
```

---

## ✅ Step 2: Create the `PaginatedList<T>` Helper Class

📁 File: `Helpers/PaginatedList.cs`

```csharp
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

public class PaginatedList<T> : List<T>
{
    public int PageIndex { get; private set; }
    public int TotalPages { get; private set; }

    public PaginatedList(List<T> items, int count, int pageIndex, int pageSize)
    {
        PageIndex = pageIndex;
        TotalPages = (int)Math.Ceiling(count / (double)pageSize);

        this.AddRange(items);
    }

    public bool HasPreviousPage => PageIndex > 1;
    public bool HasNextPage => PageIndex < TotalPages;

    public static async Task<PaginatedList<T>> CreateAsync(IQueryable<T> source, int pageIndex, int pageSize)
    {
        var count = await source.CountAsync();
        var items = await source.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToListAsync();
        return new PaginatedList<T>(items, count, pageIndex, pageSize);
    }
}
```

📝 Place this class in a folder like `Helpers`.

---

## ✅ Step 3: Update the View to Show Pagination Links

📁 File: `Views/Movie/Index.cshtml`

At the top:

```csharp
@model PaginatedList<MovieApp.Models.Movie>
```

At the **bottom** of the page, add:

```html
<nav aria-label="Page navigation">
    <ul class="pagination">
        <li class="page-item @(Model.HasPreviousPage ? "" : "disabled")">
            <a class="page-link" asp-action="Index"
               asp-route-pageNumber="@(Model.PageIndex - 1)"
               asp-route-sortOrder="@ViewData["CurrentSort"]"
               asp-route-searchString="@ViewData["CurrentFilter"]">Previous</a>
        </li>

        @for (int i = 1; i <= Model.TotalPages; i++)
        {
            <li class="page-item @(i == Model.PageIndex ? "active" : "")">
                <a class="page-link" asp-action="Index"
                   asp-route-pageNumber="@i"
                   asp-route-sortOrder="@ViewData["CurrentSort"]"
                   asp-route-searchString="@ViewData["CurrentFilter"]">@i</a>
            </li>
        }

        <li class="page-item @(Model.HasNextPage ? "" : "disabled")">
            <a class="page-link" asp-action="Index"
               asp-route-pageNumber="@(Model.PageIndex + 1)"
               asp-route-sortOrder="@ViewData["CurrentSort"]"
               asp-route-searchString="@ViewData["CurrentFilter"]">Next</a>
        </li>
    </ul>
</nav>
```

---

## ✅ Summary

You’ve added:
- A `PaginatedList<T>` helper to manage paging logic.
- Dynamic query slicing using `Skip()` and `Take()`.
- Pagination controls that preserve filters and sorting.

🎯 Try changing `pageSize = 5` to `10` or `3` to see it in action.

---

