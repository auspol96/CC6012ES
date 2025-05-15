
# 🔧 Chapter 2.1: Fixing HTTP 405 Error When Editing Records

---

## 🎯 Objective

In this chapter, students will:
- Understand the cause of the HTTP 405 Method Not Allowed error
- Learn how to properly set up the Edit view (`Edit.cshtml`) form
- Ensure the `POST` request matches the controller signature
- Complete a successful update operation and return to the list view

---

## 🛑 Problem Summary

When clicking **Save** on the Edit screen, users receive:

```
HTTP ERROR 405 – This page isn’t working
```

This happens because the form action does not pass the correct route parameter (`id`), and the framework cannot match the POST method with the controller.

---

## ✅ Step-by-Step Fix

---

### ✅ 1. Update the Form in `Edit.cshtml`

Replace the opening `<form>` tag in `Views/Movie/Edit.cshtml` with:

```html
<form asp-action="Edit" asp-route-id="@Model.Id" method="post">
```

> ✅ `asp-route-id="@Model.Id"` ensures the correct ID is passed during POST request.

---

### ✅ 2. Complete `Edit.cshtml` Code

```cshtml
@model Movie
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Edit Movie</h2>

<form asp-action="Edit" asp-route-id="@Model.Id" method="post">
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

### ✅ 3. Validate Controller Signature

Your controller must have this exact POST method:

```csharp
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(int id, [Bind("Id,Title,ReleaseDate,Price,Genre")] Movie movie)
```

> 🔁 The `id` route must match both the controller method and the form.

---

## 🧪 Test It Out

1. Navigate to `/Movie/Movie_list`
2. Click on **Edit** next to any movie
3. Make changes and click **Save**
4. You should see a popup (if implemented) and be redirected back to the updated list

---

## ✅ Expected Result

- No HTTP 405 error
- Data is successfully updated in the SQL Server database
- Confirmation and redirection work as expected

---
