# Chapter 7: Searching and Filtering Movies (LINQ + MVC)
🗓 Week 10

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Add **search and filter functionality** to a web application
- Use **LINQ** to query data from SQL Server
- Accept user input via **query string (GET request)**
- Enhance the Index page without changing database structure
- Understand how real-world listing pages work

---

## 🧠 Real-World Context

Most applications allow users to search and filter data.
This chapter adds those features **without creating new tables**.

---

## ✅ Step 1: Update (replace current index code with below) the Index Action (Controller)

📄 Controllers/MovieController.cs

```csharp
public async Task<IActionResult> Index(string searchString, string movieGenre)
{
    // Get distinct genres for dropdown
    IQueryable<string> genreQuery = _context.Movies
        .OrderBy(m => m.Genre)
        .Select(m => m.Genre)
        .Distinct();

    // Base query
    var movies = from m in _context.Movies
                 select m;

    // Filter by title
    if (!string.IsNullOrEmpty(searchString))
    {
        movies = movies.Where(s => s.Title.Contains(searchString));
    }

    // Filter by genre
    if (!string.IsNullOrEmpty(movieGenre))
    {
        movies = movies.Where(x => x.Genre == movieGenre);
    }

    ViewBag.Genres = new SelectList(await genreQuery.ToListAsync());

    return View(await movies.ToListAsync());
}

```

---

## ✅ Step 2: Update Index View

📄 Views/Movie/Index.cshtml

```razor
<form asp-action="Index" method="get">
    <p>
        Title:
        <input type="text" name="searchString" />

        Genre:
        <select name="movieGenre">
            <option value="">All</option>
            @foreach (var genre in ViewBag.Genres)
            {
                <option value="@genre.Text">@genre.Text</option>
            }
        </select>

        <input type="submit" value="Search" />
    </p>
</form>
```

---

## 🧪 Step 3: Test

- Navigate to `/Movie`
- Search by title
- Filter by genre

---

## 🎯 Expected Result

✔ Search by title  
✔ Filter by genre  
✔ No database changes  

---

➡️ Proceed to Chapter 8: Sorting and Pagination
