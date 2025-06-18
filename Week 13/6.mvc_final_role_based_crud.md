# ASP.NET Core MVC — Final Integration: Role-Based CRUD Flow

This guide provides step-by-step code modifications for completing the final integration of your Movie CRUD application. The focus is on role-based access control, smoother user redirection, and clear UI visibility based on roles.

---

## ✅ STEP 1: Add Role-based Authorization Logic

**In `Program.cs` or `Startup.cs`**, make sure Identity and Roles are registered:

```csharp
builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();
```

---

## ✅ STEP 2: Protect Controller Actions by Role

**In `MovieController.cs`:**

```csharp
using Microsoft.AspNetCore.Authorization;

[Authorize(Roles = "Admin")]
public async Task<IActionResult> Create() { ... }

[Authorize(Roles = "Admin")]
public async Task<IActionResult> Edit(int? id) { ... }

[Authorize(Roles = "Admin")]
public async Task<IActionResult> Delete(int? id) { ... }

[AllowAnonymous]
public async Task<IActionResult> Index() { ... }
```

---

## ✅ STEP 3: Show/Hide Buttons in the View by Role

**In `Views/Movie/Index.cshtml`:**

```csharp
@using Microsoft.AspNetCore.Identity
@inject UserManager<IdentityUser> UserManager

@if (User.IsInRole("Admin"))
{
    <a asp-action="Create" class="btn btn-primary">Add Movie</a>
}

@foreach (var item in Model)
{
    <tr>
        <td>@item.Title</td>
        <td>@item.ReleaseDate.ToShortDateString()</td>
        <td>@item.Genre</td>
        <td>@item.Price</td>
        <td>
            @if (User.IsInRole("Admin"))
            {
                <a asp-action="Edit" asp-route-id="@item.Id">Edit</a> |
                <a asp-action="Delete" asp-route-id="@item.Id">Delete</a>
            }
        </td>
    </tr>
}
```

---

## ✅ STEP 4: Redirect Users After Login

**In `AccountController.cs`:**

```csharp
if (result.Succeeded)
{
    return RedirectToAction("Index", "Movie");
}
```

---

## ✅ STEP 5: Feedback After Create/Edit/Delete

**In `MovieController.cs`:**

```csharp
TempData["Message"] = "Movie deleted successfully.";
return RedirectToAction(nameof(Index));
```

**In `Index.cshtml`:**

```html
@if (TempData["Message"] != null)
{
    <div class="alert alert-success">
        @TempData["Message"]
    </div>
}
```

---

## ✅ STEP 6: Seed Roles and Admin User on Startup

**In `Program.cs` or a seeder service:**

```csharp
using Microsoft.AspNetCore.Identity;

async Task SeedRolesAndAdmin(IServiceProvider services)
{
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
    var userManager = services.GetRequiredService<UserManager<IdentityUser>>();

    if (!await roleManager.RoleExistsAsync("Admin"))
        await roleManager.CreateAsync(new IdentityRole("Admin"));

    var adminEmail = "admin@example.com";
    var admin = await userManager.FindByEmailAsync(adminEmail);

    if (admin == null)
    {
        admin = new IdentityUser { UserName = adminEmail, Email = adminEmail };
        await userManager.CreateAsync(admin, "Admin@123");
        await userManager.AddToRoleAsync(admin, "Admin");
    }
}

await SeedRolesAndAdmin(app.Services.CreateScope().ServiceProvider);
```

---

### 🎯 Result:
- Admin can create, edit, and delete movies.
- Normal users can only view.
- Buttons are shown/hidden based on roles.
- Feedback is shown via alerts.
- Seamless navigation without typing URLs directly.

---

Let me know if you'd like to extend this to include email verification, user profile, or AJAX-based interactivity.
