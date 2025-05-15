
# 📘 Chapter 2: Editing a Movie Record with Confirmation Popup

---

## 🎯 Objective

By the end of this chapter, students will be able to:
- Add an Edit button for each movie in the table
- Create an Edit form to update movie details
- Show a JavaScript popup confirmation after saving
- Return the user to the movie list view

---

## ✅ Step 1: Add Edit Action Methods in `MovieController.cs`

Add the following actions to handle editing:

```csharp
[HttpGet]
public async Task<IActionResult> Edit(int? id)
{
    if (id == null) return NotFound();

    var movie = await _context.Movies.FindAsync(id);
    if (movie == null) return NotFound();

    ViewBag.Genres = new SelectList(new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
    return View(movie);
}

[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(int id, [Bind("Id,Title,ReleaseDate,Price,Genre")] Movie movie)
{
    if (id != movie.Id) return NotFound();

    if (ModelState.IsValid)
    {
        try
        {
            _context.Update(movie);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Movie updated successfully!";
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Movies.Any(e => e.Id == movie.Id)) return NotFound();
            else throw;
        }
        return RedirectToAction(nameof(Movie_list));
    }

    ViewBag.Genres = new SelectList(new[] { "Action", "Drama", "Comedy", "Sci-Fi" });
    return View(movie);
}
```

---

## ✅ Step 2: Update `Movie_list.cshtml`

In `Views/Movie/Movie_list.cshtml`, modify the table to include an **Edit** button:

```csharp
<td>
    <a asp-action="Edit" asp-route-id="@movie.Id" class="btn btn-sm btn-warning">Edit</a>
</td>
```

Add this column header:

```html
<th>Actions</th>
```

And this line under `@if (TempData["SuccessMessage"] != null)` (just below `<h2>`):

```csharp
@if (TempData["SuccessMessage"] != null)
{
    <script>
        alert("@TempData["SuccessMessage"]");
    </script>
}
```

---

## ✅ Step 3: Create `Edit.cshtml` in `Views/Movie`

```csharp
@model Movie
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Edit Movie</h2>

<form asp-action="Edit" method="post">
    <input type="hidden" asp-for="Id" />

    <div>
        <label asp-for="Title"></label>
        <input asp-for="Title" />
        <span asp-validation-for="Title" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="ReleaseDate"></label>
        <input asp-for="ReleaseDate" />
        <span asp-validation-for="ReleaseDate" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Price"></label>
        <input asp-for="Price" />
        <span asp-validation-for="Price" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Genre"></label>
        <select asp-for="Genre" asp-items="ViewBag.Genres">
            <option value="">-- Select Genre --</option>
        </select>
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>

    <button type="submit" class="btn btn-primary">Save Changes</button>
    <a asp-action="Movie_list" class="btn btn-secondary">Cancel</a>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

## 🧪 Step 4: Run and Test

1. Navigate to `/Movie/Movie_list`
2. Click “Edit” next to a movie
3. Modify values and press “Save Changes”
4. A popup will confirm the update and redirect to the list

---

## ✅ Expected Result

- Data updates are saved to SQL Server
- Popup confirmation appears
- User returns to the list view with updated values

➡️ Proceed to **Chapter 3: Delete Movie Records with Confirmation**
