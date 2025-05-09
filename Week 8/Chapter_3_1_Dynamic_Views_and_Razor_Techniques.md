
# 📘 Chapter 3.1: Dynamic Views and Razor Techniques

## 🎯 Purpose
To enhance students’ understanding of how to create dynamic, interactive views in ASP.NET Core MVC using Razor syntax, model binding, partial views, and reusable components.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a Strongly-Typed View

In `Views/Movie/Details.cshtml`:
```html
@model Movie

<h2>@Model.Title</h2>
<p>Release Date: @Model.ReleaseDate.ToShortDateString()</p>
<p>Genre: @Model.Genre</p>
<p>Price: @Model.Price.ToString("C")</p>
```

---

### ✅ Step 2: Use ViewData, ViewBag, and TempData

In Controller:
```csharp
public IActionResult Info()
{
    ViewData["Note"] = "This message is from ViewData.";
    ViewBag.Warning = "Be careful!";
    TempData["Once"] = "TempData survives redirects.";
    return View();
}
```

In View:
```html
<p>@ViewData["Note"]</p>
<p>@ViewBag.Warning</p>
```

---

### ✅ Step 3: Use Razor Syntax for Conditions and Loops

```html
@model IEnumerable<Movie>

<h2>Movie List</h2>
<ul>
@foreach (var movie in Model)
{
    <li>
        @movie.Title (@movie.ReleaseDate.Year)
    </li>
}
</ul>

@if (!Model.Any())
{
    <p>No movies available.</p>
}
```

---

### ✅ Step 4: Create and Use a Partial View

1. Add `_MovieCard.cshtml` under `Views/Shared/`:
```html
@model Movie

<div class="movie-card">
    <h3>@Model.Title</h3>
    <p>@Model.Genre - @Model.ReleaseDate.ToShortDateString()</p>
</div>
```

2. Use it in another view:
```html
@foreach (var movie in Model)
{
    @await Html.PartialAsync("_MovieCard", movie)
}
```

---

### ✅ Step 5: Organize Scripts and Sections

In layout:
```html
@RenderSection("Scripts", required: false)
```

In view:
```html
@section Scripts {
    <script>
        alert("Loaded from section!");
    </script>
}
```

---

## 🧪 Hands-on Mini Challenge

1. Pass a custom message from controller to view using `ViewData` and `ViewBag`.
2. Create a loop of 3 hard-coded `Movie` objects in the controller and render them using a partial view.
3. Add conditional logic in the view to show a different message if no movies exist.

---

## 📝 Summary Notes

- Use `@model` to bind strongly-typed data in views.
- Razor provides C# logic in HTML using `@if`, `@foreach`, etc.
- `Partial Views` improve code reuse and modularity.
- `ViewData`, `ViewBag`, and `TempData` help transfer values between controller and view.

---

### ✅ Outcome of This Chapter
Students will:
- Create dynamic, reusable Razor views
- Display data using partial views and conditions
- Transfer data between controller and view effectively
