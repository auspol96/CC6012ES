# Chapter 6: Editing and Deleting Records with EF Core (UPDATE & DELETE)
🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Edit existing records stored in SQL Server
- Delete records safely using confirmation
- Understand **Edit / Update / Delete** MVC flow
- Use EF Core to modify and remove data
- Complete the **full CRUD cycle** (Create, Read, Update, Delete)

> ⚠️ This chapter assumes **Chapters 2–5 are completed successfully**  
> - Movies table exists  
> - Create & Index pages are working  
> - Data is already stored in SQL Server  

---

## 🧠 CRUD Recap (Big Picture)

| Operation | MVC Action | EF Core Method |
|---------|-----------|---------------|
Create | Create (POST) | Add + SaveChanges |
Read | Index | ToListAsync |
Update | Edit (POST) | Update + SaveChanges |
Delete | DeleteConfirmed | Remove + SaveChanges |

---

## ✅ Step 1: Add Edit Actions to MovieController

### 1.1 Edit (GET) – Load Data into Form

```csharp
// GET: /Movie/Edit/5
public async Task<IActionResult> Edit(int? id)
{
    if (id == null)
    {
        return NotFound();
    }

    var movie = await _context.Movies.FindAsync(id);

    if (movie == null)
    {
        return NotFound();
    }

    ViewBag.Genres = new SelectList(
        new[] { "Action", "Drama", "Comedy", "Sci-Fi" },
        movie.Genre);

    return View(movie);
}
```

---

### 1.2 Edit (POST) – Save Changes

```csharp
// POST: /Movie/Edit/5
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(
    int id,
    [Bind("Id,Title,ReleaseDate,Price,Genre")] Movie movie)
{
    if (id != movie.Id)
    {
        return NotFound();
    }

    if (ModelState.IsValid)
    {
        try
        {
            _context.Update(movie);
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Movies.Any(e => e.Id == movie.Id))
            {
                return NotFound();
            }
            else
            {
                throw;
            }
        }

        return RedirectToAction(nameof(Index));
    }

    ViewBag.Genres = new SelectList(
        new[] { "Action", "Drama", "Comedy", "Sci-Fi" },
        movie.Genre);

    return View(movie);
}
```

---

## ✅ Step 2: Create the Edit View

📄 **Views/Movie/Edit.cshtml**

```razor
@model WebApplication1.Models.Movie

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
        <select asp-for="Genre" asp-items="ViewBag.Genres"></select>
        <span asp-validation-for="Genre" class="text-danger"></span>
    </div>

    <button type="submit">Update</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

## ✅ Step 3: Add Delete Actions to MovieController

### 3.1 Delete (GET) – Confirmation Page

```csharp
// GET: /Movie/Delete/5
public async Task<IActionResult> Delete(int? id)
{
    if (id == null)
    {
        return NotFound();
    }

    var movie = await _context.Movies
        .FirstOrDefaultAsync(m => m.Id == id);

    if (movie == null)
    {
        return NotFound();
    }

    return View(movie);
}
```

---

### 3.2 Delete (POST) – Remove Record

```csharp
// POST: /Movie/Delete/5
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

---

## ✅ Step 4: Create the Delete View

📄 **Views/Movie/Delete.cshtml**

```razor
@model WebApplication1.Models.Movie

<h2>Delete Movie</h2>

<h4>Are you sure you want to delete this movie?</h4>

<div>
    <p><strong>Title:</strong> @Model.Title</p>
    <p><strong>Release Date:</strong> @Model.ReleaseDate.ToShortDateString()</p>
    <p><strong>Price:</strong> @Model.Price</p>
    <p><strong>Genre:</strong> @Model.Genre</p>
</div>

<form asp-action="Delete" method="post">
    <input type="hidden" asp-for="Id" />
    <button type="submit">Yes, Delete</button>
    <a asp-action="Index">Cancel</a>
</form>
```

---

## ✅ Step 5: Update Index View with Action Links

📄 **Views/Movie/Index.cshtml**

Add a new column header:

```razor
<th>Actions</th>
```

Inside the loop:

```razor
<td>
    <a asp-action="Edit" asp-route-id="@movie.Id">Edit</a> |
    <a asp-action="Delete" asp-route-id="@movie.Id">Delete</a>
</td>
```

---

## 🧪 Step 6: Test the Application

1. Run the project (`F5`)
2. Navigate to `/Movie`
3. Edit an existing record
4. Delete a record and confirm

---

## 🎯 Expected Result

✔ Records can be edited  
✔ Records can be deleted  
✔ Database updates correctly  
✔ Full CRUD cycle completed  

---

➡️ **Next (Optional Enhancements):**
- Styling with Bootstrap
- Search and filter
- Pagination
- Authorization

✅ **End of Chapter 6**
