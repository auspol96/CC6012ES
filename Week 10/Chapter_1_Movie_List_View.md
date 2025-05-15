
# 📘 Chapter 1: Displaying Movies in a Table (Custom Movie_list.cshtml)

---

## 🎯 Objective

By the end of this chapter, students will be able to:
- Create a custom Razor View (`Movie_list.cshtml`)
- Fetch and display data from SQL Server using Entity Framework Core
- Format output using HTML table and Bootstrap
- Use basic navigation between views

---

## 🧩 Prerequisites

Before starting this chapter, you should have:
- A working ASP.NET Core MVC project
- A `Movie` model created with Title, ReleaseDate, Price, and Genre fields
- SQL Server and EF Core connected and working
- `_ViewImports.cshtml` with the following configuration:

```csharp
@using MvcMovie
@using MvcMovie.Models
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
```

This setup allows you to write:

```csharp
@model IEnumerable<Movie>
```

Instead of the longer:

```csharp
@model IEnumerable<MvcMovie.Models.Movie>
```

---

## ✅ Step 1: Add Action Method in `MovieController.cs`

```csharp
public async Task<IActionResult> Movie_list()
{
    var movies = await _context.Movies.ToListAsync();
    return View(movies);
}
```

---

## ✅ Step 2: Create `Movie_list.cshtml` Under `Views/Movie`

Create the file:

📂 `Views/Movie/Movie_list.cshtml`

Then add the following code:

```csharp
@model IEnumerable<Movie>
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2 class="mb-4">🎬 All Movies (Custom View)</h2>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>Title</th>
            <th>Release Date</th>
            <th>Price (THB)</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var movie in Model)
        {
            <tr>
                <td>@movie.Title</td>
                <td>@movie.ReleaseDate.ToString("dd MMM yyyy")</td>
                <td>@movie.Price.ToString("N2")</td>
                <td>@movie.Genre</td>
            </tr>
        }
    </tbody>
</table>

<a asp-action="Create" class="btn btn-success mt-3">➕ Add New Movie</a>
```

---

## 🧪 Step 3: Run and Test

Navigate to:

```
/Movie/Movie_list
```

You should see all movies in a styled table and a button to add more.

---

## ✅ Expected Result

- All saved movies display in an interactive table
- A back button (`Add New Movie`) allows inserting more data

✅ You’ve successfully created a new list view using a custom Razor Page.

➡️ Proceed to **Chapter 2: Building a Form to Insert Data**
