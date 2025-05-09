
# 📘 Chapter 3.1: Dynamic Views and Razor Techniques (Improved)

## 🎯 Purpose
To enhance Razor View capabilities by teaching students how to:
- Pass dynamic data from controller to view
- Use conditional and loop logic
- Implement strongly typed models and partial views
- Display output step-by-step

---

## ✅ Workshop Overview

In this workshop, we will:
1. Create a `Movie` model
2. Pass movie data from the controller to the view
3. Display a movie list using loops and conditions
4. Use `ViewBag` and `ViewData`
5. Create and render a partial view

---

## 📌 Step-by-Step Instructions

### ✅ Step 1: Create the Movie Model

Create `Models/Movie.cs`:
```csharp
public class Movie
{
    public string Title { get; set; }
    public DateTime ReleaseDate { get; set; }
    public string Genre { get; set; }
}
```

🧾 **Result**: You now have a basic model to represent movies.

---

### ✅ Step 2: Create the Controller and Pass Movie List

In `Controllers/MovieController.cs`:
```csharp
public class MovieController : Controller
{
    public IActionResult Index()
    {
        var movies = new List<Movie>
        {
            new Movie { Title = "Avengers", Genre = "Action", ReleaseDate = new DateTime(2019, 4, 26) },
            new Movie { Title = "Encanto", Genre = "Animation", ReleaseDate = new DateTime(2021, 11, 24) },
            new Movie { Title = "Titanic", Genre = "Drama", ReleaseDate = new DateTime(1997, 12, 19) }
        };

        ViewBag.Heading = "Top Movies";
        return View(movies);
    }
}
```

🧾 **Result**: A controller sends a list of 3 movies to the view using a strongly typed list and adds a heading via `ViewBag`.

---

### ✅ Step 3: Create a Strongly Typed View with Loops

In `Views/Movie/Index.cshtml`:
```html
@model List<Movie>

<h2>@ViewBag.Heading</h2>

<ul>
@foreach (var movie in Model)
{
    <li>
        <strong>@movie.Title</strong> - @movie.Genre (@movie.ReleaseDate.ToString("yyyy"))
    </li>
}
</ul>

@if (!Model.Any())
{
    <p>No movies found.</p>
}
```

🧾 **Result**: You will see a bulleted list of movie titles with their genres and release years.

---

### ✅ Step 4: Display Additional Notes Using ViewData and TempData

Modify the controller:
```csharp
public IActionResult Info()
{
    ViewData["Message"] = "This data comes from ViewData.";
    TempData["Note"] = "This note is from TempData.";
    return View();
}
```

Create a new view `Views/Movie/Info.cshtml`:
```html
<p>@ViewData["Message"]</p>
<p>@TempData["Note"]</p>
```

🧾 **Result**: You'll see both ViewData and TempData values rendered on screen.

---

### ✅ Step 5: Create a Reusable Partial View

Create a new file: `Views/Shared/_MovieCard.cshtml`
```html
@model Movie

<div class="movie-card">
    <h3>@Model.Title</h3>
    <p>Genre: @Model.Genre</p>
    <p>Release Year: @Model.ReleaseDate.Year</p>
</div>
```

Use it in `Index.cshtml`:
```html
@foreach (var movie in Model)
{
    @await Html.PartialAsync("_MovieCard", movie)
}
```

🧾 **Result**: Each movie is shown using a reusable card layout, styled consistently.

---

## 🧪 Mini Challenge

1. Add a new property to the `Movie` model: `public string Director { get; set; }`
2. Update your controller to include this data.
3. Show the Director inside `_MovieCard.cshtml`.

---

## 📝 Summary Notes

- Razor views can receive full objects via `@model`
- Use `foreach`, `if`, and `ViewBag` to dynamically render views
- `Partial Views` simplify layout reuse
- You can inject context-specific data using `ViewData` and `TempData`

---

### ✅ Outcome of This Chapter
Students will:
- Render dynamic content from the controller
- Use Razor to loop, conditionally display, and structure views
- Build clean, reusable view components
