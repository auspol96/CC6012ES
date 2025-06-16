
# 🔍 ASP.NET Core MVC: Add "Movie Details" Page

This guide walks you through showing the **details** of a single movie when a user clicks on it.

---

## ✅ Step 1: Add the Details Action to MovieController

📁 File: `Controllers/MovieController.cs`

```csharp
[HttpGet]
public async Task<IActionResult> Details(int? id)
{
    if (id == null)
        return NotFound();

    var movie = await _context.Movies.FirstOrDefaultAsync(m => m.Id == id);

    if (movie == null)
        return NotFound();

    return View(movie);
}
```

📝 **Explanation:**
- Checks if the `id` is null.
- Fetches the movie by ID using `FirstOrDefaultAsync`.
- Returns the movie to the view or a `NotFound()` result.

---

## ✅ Step 2: Create the Details View

📁 File: `Views/Movie/Details.cshtml`

```csharp
@model MovieApp.Models.Movie

<h2>Movie Details</h2>

<div class="card p-3">
    <dl class="row">
        <dt class="col-sm-3">Title</dt>
        <dd class="col-sm-9">@Model.Title</dd>

        <dt class="col-sm-3">Release Date</dt>
        <dd class="col-sm-9">@Model.ReleaseDate.ToString("yyyy-MM-dd")</dd>

        <dt class="col-sm-3">Price</dt>
        <dd class="col-sm-9">@Model.Price.ToString("C")</dd>

        <dt class="col-sm-3">Genre</dt>
        <dd class="col-sm-9">@Model.Genre</dd>
    </dl>
</div>

<a asp-action="Edit" asp-route-id="@Model.Id" class="btn btn-primary mt-3">Edit</a>
<a asp-action="Index" class="btn btn-secondary mt-3">Back to List</a>
```

📝 **Explanation:**
- `@model` defines the type of data passed to the view.
- `<dl>` is used for displaying field-value pairs.
- Buttons allow navigation to Edit or back to Index.

---

## ✅ Summary

You’ve added:
- A controller action to get a movie by ID.
- A view to display movie details in a readable format.

Next step: implement **Delete** with a confirmation page.

---
