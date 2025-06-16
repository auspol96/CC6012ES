
# 🗑️ ASP.NET Core MVC: Add "Delete Movie" Functionality (with Confirmation)

This guide walks you through building a delete feature with confirmation before permanently removing a movie.

---

## ✅ Step 1: Add GET and POST Actions to MovieController

📁 File: `Controllers/MovieController.cs`

```csharp
[HttpGet]
public async Task<IActionResult> Delete(int? id)
{
    if (id == null)
        return NotFound();

    var movie = await _context.Movies
        .FirstOrDefaultAsync(m => m.Id == id);

    if (movie == null)
        return NotFound();

    return View(movie);
}

[HttpPost, ActionName("Delete")]
[ValidateAntiForgeryToken]
public async Task<IActionResult> DeleteConfirmed(int id)
{
    var movie = await _context.Movies.FindAsync(id);

    if (movie != null)
    {
        _context.Movies.Remove(movie);
        await _context.SaveChangesAsync();
    }

    return RedirectToAction(nameof(Index));
}
```

📝 **Explanation:**
- The GET method shows a confirmation page.
- The POST method deletes the record after confirmation.
- `[ActionName("Delete")]` allows both methods to share the same route `/Movie/Delete`.

---

## ✅ Step 2: Create the Delete View

📁 File: `Views/Movie/Delete.cshtml`

```csharp
@model Movie

<h2>Confirm Delete</h2>

<div class="alert alert-danger">
    Are you sure you want to delete this movie?
</div>

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

<form asp-action="Delete" method="post">
    <input type="hidden" asp-for="Id" />
    <button type="submit" class="btn btn-danger mt-3">Delete</button>
    <a asp-action="Index" class="btn btn-secondary mt-3">Cancel</a>
</form>
```

📝 **Explanation:**
- Shows movie details to confirm before deleting.
- Submits to the POST `DeleteConfirmed` action.

---

## ✅ Summary

You’ve now added:
- A confirmation page to prevent accidental deletion.
- A safe server-side method to remove the movie from the database.
- Navigation controls for user confirmation and cancel.

🎯 You’ve now completed full CRUD:
- Create ✅
- Read (Index + Details) ✅
- Update (Edit) ✅
- Delete (with confirmation) ✅

---
