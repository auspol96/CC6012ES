
# ✏️ ASP.NET Core MVC: Add "Edit Movie" Functionality

This guide walks you through implementing the **Edit** feature for your Movie model.

---

## ✅ Step 1: Add GET and POST Actions in MovieController

📁 File: `Controllers/MovieController.cs`

```csharp
[HttpGet]
public async Task<IActionResult> Edit(int? id)
{
    if (id == null)   //This checks whether the incoming ID is null (i.e., not provided in the URL).
        return NotFound();

    var movie = await _context.Movies.FindAsync(id);   //This line attempts to find the movie in the database with that ID
    if (movie == null)
        return NotFound();

    return View(movie);
}

[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(int id, Movie movie)
{
    if (id != movie.Id)
        return NotFound();

    if (ModelState.IsValid)
    {
        try
        {
            _context.Update(movie); // Mark entity as modified
            await _context.SaveChangesAsync(); // Save changes to DB
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Movies.Any(e => e.Id == id))
                return NotFound();
            else
                throw;
        }

        return RedirectToAction(nameof(Index));
    }

    return View(movie); // Return with validation errors if any
}
```

📝 **Explanation:**
- The `GET` method loads the movie for editing.
- The `POST` method updates it if the form is valid.

---

## ✅ Step 2: Create the Edit View

📁 File: `Views/Movie/Edit.cshtml`

```csharp
@model MovieApp.Models.Movie

<h2>Edit Movie</h2>

<form asp-action="Edit" method="post">
    <input type="hidden" asp-for="Id" />

    <div class="form-group">
        <label asp-for="Title"></label>
        <input asp-for="Title" class="form-control" />
        <span asp-validation-for="Title" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="ReleaseDate"></label>
        <input asp-for="ReleaseDate" type="date" class="form-control" />
        <span asp-validation-for="ReleaseDate" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="Price"></label>
        <input asp-for="Price" class="form-control" />
        <span asp-validation-for="Price" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="Genre"></label>
        <input asp-for="Genre" class="form-control" />
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>

    <button type="submit" class="btn btn-primary mt-2">Save Changes</button>
    <a asp-action="Index" class="btn btn-secondary mt-2">Cancel</a>
</form>

@section Scripts {
    @{await Html.RenderPartialAsync("_ValidationScriptsPartial");}
}
```

📝 **Explanation:**
- Hidden field for `Id` keeps track of which movie to update.
- Other fields are reused similar to Create.

---

## ✅ Summary

You’ve now added:
- An Edit action that fetches a movie by ID.
- A view that allows the user to modify the movie’s data.
- Validation and error handling.

Next recommended step: **Details page** or **Delete movie confirmation page**.

---
