# Chapter 03 – List All Shippings

## ✅ Objective
Display a list of all shipping records from the database in a web page.

---

## 📂 Folder/File Structure
```
/Controllers
  └── ShippingController.cs
/Views
  └── /Shipping
      └── Index.cshtml
```

---

## 💻 Code & Setup

### 1. Create `ShippingController.cs`
**Path:** `/Controllers/ShippingController.cs`
```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShippingApp.Data;
using ShippingApp.Models;
using System.Linq;

namespace ShippingApp.Controllers
{
    public class ShippingController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ShippingController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var shippingList = await _context.ShippingRequests.ToListAsync();
            return View(shippingList);
        }

    }
}
```

---

### 2. Create `Index.cshtml` View
**Path:** `/Views/Shipping/Index.cshtml`
```html
@model IEnumerable<ShippingApp.Models.ShippingRequest>


<h2>Shipping List</h2>

<table class="table">
    <thead>
        <tr>
            <th>From Location</th>
            <th>To Location</th>
            <th>Item</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var item in Model)
        {
            <tr>
                <td>@item.FromLocation</td>
                <td>@item.ToLocation</td>
                <td>@item.ItemDescription</td>
                <td>@item.Weight</td>
            </tr>
        }

    </tbody>
</table>
```

---

### 3. Update Navigation Menu
**Path:** `/Views/Shared/_Layout.cshtml`
```html
<nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
    <div class="container">
        <a class="navbar-brand" asp-area="" asp-controller="Home" asp-action="Index">ShippingApp</a>
        <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
            <ul class="navbar-nav flex-grow-1">
                <li class="nav-item">
                    <a class="nav-link text-dark" asp-controller="Home" asp-action="Index">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" asp-controller="Shipping" asp-action="Index">Shipping List</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
```

---

## 🧪 Expected Result
- You should see a table listing all shipping records when you navigate to `/Shipping/Index`.
- The layout menu should have a working link to "Shipping List".

---

