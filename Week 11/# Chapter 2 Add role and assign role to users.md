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
> 🧠 Explanation:
> - `at first you may need to remark out this first [Authorize(Roles = "Admin")]
> - `this is due to there is no admin assign in our system below.

---

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


## ✅ Outcome
- You should see list of user/admin via https://localhost:7219/Admin
- You will be able to assign admin role to the system
- Once admin is assigned, please remove remark out from AdminController.cs. Then try to login again as admin and see the outcome.
- You should see admin assigned in the database as well.
```sql
  SELECT 
    u.Email, 
    r.Name AS Role
FROM 
    [MovieDB].[dbo].[AspNetUsers] u
JOIN 
    [MovieDB].[dbo].[AspNetUserRoles] ur ON u.Id = ur.UserId
JOIN 
    [MovieDB].[dbo].[AspNetRoles] r ON ur.RoleId = r.Id;

...


---


