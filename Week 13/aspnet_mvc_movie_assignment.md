# ASP.NET MVC Movie App Final Assignment

## 🎯 Objective
Enhance the Movie CRUD application into a user-friendly and secure system by applying proper authentication, role-based access control, and a smooth user flow.

---

## ✅ Requirements

### 1. **Role-Based Access Control**
- Setup two roles: `Admin` and `User`.
- Only Admin can `Create`, `Edit`, and `Delete` movies.
- Regular Users can only view the movie list and movie details.

### 2. **Authentication Integration**
- Use ASP.NET Identity for user login/logout.
- After login, redirect users to `/Movie/Index`.

### 3. **[Authorize] Usage**
- Protect Create/Edit/Delete methods:

```csharp
[Authorize(Roles = "Admin")]
```

- Allow anonymous viewing of movie list:

```csharp
[AllowAnonymous]
```

### 4. **UI Control Based on Roles**
- In `Index.cshtml`, hide or show buttons based on role:

```html
@if (User.IsInRole("Admin"))
{
    <a asp-action="Create" class="btn btn-primary">Add Movie</a>
    <a asp-action="Edit" asp-route-id="@item.Id">Edit</a>
    <a asp-action="Delete" asp-route-id="@item.Id">Delete</a>
}
```

### 5. **Routing and Navigation**
- Ensure all navigation flows through views (no manual URL input).
- Add navigation bar items in `_Layout.cshtml`:

```html
<ul class="navbar-nav">
    <li class="nav-item"><a class="nav-link" asp-controller="Movie" asp-action="Index">Movie List</a></li>
    @if (User.IsInRole("Admin"))
    {
        <li class="nav-item"><a class="nav-link" asp-action="Create" asp-controller="Movie">Add Movie</a></li>
    }
</ul>
```

### 6. **Feedback Messages**
- Use `TempData` for success or error messages:

```csharp
TempData["SuccessMessage"] = "Movie updated successfully!";
```

In view:

```html
@if (TempData["SuccessMessage"] != null)
{
    <div class="alert alert-success">@TempData["SuccessMessage"]</div>
}
```

### 7. **Security and Validation**
- Use `[ValidateAntiForgeryToken]` on all POST methods.
- Validate all form inputs server-side.

### 8. **Bonus (Optional)**
- Add pagination to movie list.
- Add a delete confirmation modal.
- Seed default Admin user and role on startup.

---

## 💡 Deliverables
- Functional ASP.NET MVC app with all CRUD operations secured by roles.
- Screenshots or screen recordings showing:
  - Admin flow: Login ➝ Create ➝ Edit ➝ Delete ➝ Logout.
  - User flow: Login ➝ View movie list.

---

## 📚 References
- [ASP.NET Core Identity Docs](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity)
- [Role-based authorization](https://learn.microsoft.com/en-us/aspnet/core/security/authorization/roles)
- [TempData in ASP.NET](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/app-state#tempdata)

---

## 📌 Notes
- Make sure no action requires entering the ID manually in the browser.
- The system must redirect and protect access as expected.
- UX should be smooth and error-free.

---

**Due Date:** _[Insert Date]_  
**Evaluation Criteria:** Functionality, security, role correctness, UX, and coding structure.