
# 🧹 Chapter 3: Add Delete Functionality in Movie_list View

---

## 🎯 Objective

In this chapter, students will:
- Add a delete button in the custom movie list view (`Movie_list.cshtml`)
- Implement delete logic in the `MovieController`
- Use a confirmation popup before deletion
- Show a success or failure alert after deletion and return to the list

---

## 🛠 Step-by-Step Implementation

---

### 1. 🧱 Add Delete Button to `Movie_list.cshtml`

In `Views/Movie/Movie_list.cshtml`, inside the `<tr>` element (same row as Edit), add:

```html
<td>
    <a asp-action="Edit" asp-route-id="@movie.Id" class="btn btn-warning btn-sm">Edit</a>
    <form asp-action="Delete" asp-route-id="@movie.Id" method="post" style="display:inline;" 
          onsubmit="return confirm('Are you sure you want to delete this movie?');">
        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
    </form>
</td>
```

> ✅ `method="post"` ensures it's secure (DELETE via POST).

---

### 2. 🔧 Update `MovieController.cs`

Add this method to handle deletion:

```csharp
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Delete(int id)
{
    var movie = await _context.Movies.FindAsync(id);
    if (movie != null)
    {
        _context.Movies.Remove(movie);
        await _context.SaveChangesAsync();
        TempData["Note"] = $"Movie '{movie.Title}' deleted successfully.";
    }
    else
    {
        TempData["Note"] = "Movie not found or already deleted.";
    }

    return RedirectToAction(nameof(Movie_list));
}
```

---

### 3. 💬 Show Success/Fail Popup in `Movie_list.cshtml`

At the top of the view, add:

```html
@if (TempData["Note"] != null)
{
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        @TempData["Note"]
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
}
```

---

### 🧪 Test Checklist

- ✅ Visit `/Movie/Movie_list`
- ✅ Click **Delete**
- ✅ Confirm the popup
- ✅ Movie should disappear
- ✅ Success message appears at the top

---

## ✅ Expected Result

| Feature | Result |
|--------|--------|
| Delete button | Added to the right of Edit |
| Confirmation | JavaScript prompt appears |
| Message | Bootstrap alert shows success/fail |
| Navigation | Returns to movie list |

---
