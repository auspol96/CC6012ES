# Chapter 2: list out users and identify admin role.

This chapter shows how to list out all users and assign administrator role.

---

## 🎯 Objective
- list out all users
- assign administrator role.

---

## 🧩 Step 1: Add view model to display.

Create Models/UserViewModel.cs:

```csharp

namespace MovieApp.Models
{
    public class UserViewModel
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }
    }
}


```

> 💡 These enable Identity and EF Core to work with SQL Server.

---

## 🛠️ Step 2: Add Action in AdminController.cs

📄 `Controllers/AdminController.cs`

```csharp

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using MovieApp.Models;

namespace MovieApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AdminController(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        // ✅ List all users with their role status
        public async Task<IActionResult> Index()
        {
            var users = _userManager.Users.ToList();
            var model = new List<UserViewModel>();

            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                model.Add(new UserViewModel
                {
                    Id = user.Id,
                    Email = user.Email,
                    IsAdmin = roles.Contains("Admin")
                });
            }

            return View(model);
        }

        // ✅ Promote user by ID
        [HttpPost]
        public async Task<IActionResult> Promote(string id)
        {
            var user = await _userManager.FindByIdAsync(id);
            if (user == null) return NotFound();

            if (!await _roleManager.RoleExistsAsync("Admin"))
            {
                await _roleManager.CreateAsync(new IdentityRole("Admin"));
            }

            var result = await _userManager.AddToRoleAsync(user, "Admin");

            if (result.Succeeded)
            {
                TempData["Message"] = $"{user.Email} promoted to Admin.";
            }

            return RedirectToAction("Index");
        }
    }
}

```

---

## 🔧 Step 3: Create the View /Views/Admin/Index.cshtml

Replace the below code

```html
@model List<MovieApp.Models.UserViewModel>

@{
    ViewData["Title"] = "Admin Dashboard";
}

<h2>Admin Dashboard</h2>

@if (TempData["Message"] != null)
{
    <div class="alert alert-success">@TempData["Message"]</div>
}

<table class="table">
    <thead>
        <tr>
            <th>Email</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var user in Model)
        {
            <tr>
                <td>@user.Email</td>
                <td>@(user.IsAdmin ? "Admin" : "User")</td>
                <td>
                    @if (!user.IsAdmin)
                    {
                        <form asp-action="Promote" method="post">
                            <input type="hidden" name="id" value="@user.Id" />
                            <button type="submit" class="btn btn-sm btn-primary">Promote to Admin</button>
                        </form>
                    }
                    else
                    {
                        <span>✔ Already Admin</span>
                    }
                </td>
            </tr>
        }
    </tbody>
</table>

...
```

> 🧠 Explanation:
> - `.AddDefaultIdentity()` adds user registration and login logic
> - `.AddRoles<IdentityRole>()` enables role-based access

---

## 🧱 Step 4: Create Initial Migration

Open **Package Manager Console** and run:

```bash
Add-Migration Init
Update-Database
```

> 🧠 This creates all Identity tables (AspNetUsers, AspNetRoles, etc.) in `MovieDB`

---

## 📊 What Tables Are Created?

| Table Name             | Description                     |
|-----------------------|----------------------------------|
| AspNetUsers           | Stores user accounts             |
| AspNetRoles           | Stores roles like Admin, User    |
| AspNetUserRoles       | Maps users to roles              |
| AspNetUserClaims      | Stores custom claims             |
| AspNetUserLogins      | External login providers         |
| AspNetUserTokens      | Auth tokens (e.g. remember me)   |
| AspNetRoleClaims      | Role-specific claims             |

---

## ✅ Outcome
- Identity is ready for Register/Login features (next chapter)
- Tables are generated in SQL Server
- Scaffold-free setup = full control

---

### Next ➡️ Chapter 3: Implement Register and Login System (Manual Views & Controllers)
Let me know when you’re ready!
