
# Chapter 8: Sorting and Paging Movie Records

## Objective
By the end of this chapter, students will be able to:
- Sort movie records by Title, Release Date, and Price
- Implement paging (pagination) in ASP.NET Core MVC
- Understand query parameters and scalability

---

## Step 1: Update Index Action (MovieController)

```csharp
public async Task<IActionResult> Index(string sortOrder, int pageNumber = 1)
{
    int pageSize = 5;

    ViewBag.TitleSort = string.IsNullOrEmpty(sortOrder) ? "title_desc" : "";
    ViewBag.DateSort = sortOrder == "date" ? "date_desc" : "date";
    ViewBag.PriceSort = sortOrder == "price" ? "price_desc" : "price";

    var movies = _context.Movies.AsQueryable();

    movies = sortOrder switch
    {
        "title_desc" => movies.OrderByDescending(m => m.Title),
        "date" => movies.OrderBy(m => m.ReleaseDate),
        "date_desc" => movies.OrderByDescending(m => m.ReleaseDate),
        "price" => movies.OrderBy(m => m.Price),
        "price_desc" => movies.OrderByDescending(m => m.Price),
        _ => movies.OrderBy(m => m.Title)
    };

    int totalCount = await movies.CountAsync();

    var pagedMovies = await movies
        .Skip((pageNumber - 1) * pageSize)
        .Take(pageSize)
        .ToListAsync();

    ViewBag.CurrentPage = pageNumber;
    ViewBag.TotalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

    return View(pagedMovies);
}
```

---

## Step 2: Update Index View Headers (Views/Movie/Index.cshtml), the code should be at the header table.

```html
<th><a asp-action="Index" asp-route-sortOrder="@ViewBag.TitleSort">Title</a></th>
<th><a asp-action="Index" asp-route-sortOrder="@ViewBag.DateSort">Release Date</a></th>
<th><a asp-action="Index" asp-route-sortOrder="@ViewBag.PriceSort">Price</a></th>
<th>Genre</th>
```

---

## Step 3: Add Pagination Controls (Views/Movie/Index.cshtml) after the table close tag.

```html
<div>
    @if (ViewBag.CurrentPage > 1)
    {
        <a asp-action="Index" asp-route-pageNumber="@(ViewBag.CurrentPage - 1)">Previous</a>
    }

    Page @ViewBag.CurrentPage of @ViewBag.TotalPages

    @if (ViewBag.CurrentPage < ViewBag.TotalPages)
    {
        <a asp-action="Index" asp-route-pageNumber="@(ViewBag.CurrentPage + 1)">Next</a>
    }
</div>
```

---

## Expected Result
- Sorting works via column headers
- Pagination limits records per page
- No routing or ambiguity errors

---

## Next Chapter
Chapter 9: Authentication and Authorization
