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

        public IActionResult Index()
        {
            var shipments = _context.Shippings.ToList();
            return View(shipments);
        }
    }
}
```

---

### 2. Create `Index.cshtml` View
**Path:** `/Views/Shipping/Index.cshtml`
```html
@model IEnumerable<ShippingApp.Models.Shipping>

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
        @foreach (var ship in Model)
        {
            <tr>
                <td>@ship.FromLocation</td>
                <td>@ship.ToLocation</td>
                <td>@ship.ItemName</td>
                <td>@ship.ShippingDate.ToShortDateString()</td>
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

# Chapter 04 – Create New Shipment Form

## ✅ Objective
Allow users to add a new shipment entry via a web form.

---

## 📂 Folder/File Structure
```
/Controllers
  └── ShippingController.cs
/Views
  └── /Shipping
      └── Create.cshtml
```

---

## 💻 Code & Setup

### 1. Update `ShippingController.cs`
Add this to the existing controller:
```csharp
[HttpGet]
public IActionResult Create()
{
    return View();
}

[HttpPost]
public IActionResult Create(Shipping shipping)
{
    if (ModelState.IsValid)
    {
        _context.Shippings.Add(shipping);
        _context.SaveChanges();
        return RedirectToAction("Index");
    }
    return View(shipping);
}
```

---

### 2. Create `Create.cshtml` View
**Path:** `/Views/Shipping/Create.cshtml`
```html
@model ShippingApp.Models.Shipping

<h2>Add New Shipment</h2>

<form asp-action="Create" method="post">
    <div class="form-group">
        <label asp-for="FromLocation"></label>
        <input asp-for="FromLocation" class="form-control" />
        <span asp-validation-for="FromLocation" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="ToLocation"></label>
        <input asp-for="ToLocation" class="form-control" />
        <span asp-validation-for="ToLocation" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="ItemName"></label>
        <input asp-for="ItemName" class="form-control" />
        <span asp-validation-for="ItemName" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="ShippingDate"></label>
        <input asp-for="ShippingDate" class="form-control" type="date" />
        <span asp-validation-for="ShippingDate" class="text-danger"></span>
    </div>
    <button type="submit" class="btn btn-primary">Create</button>
</form>
```

---

## 🧪 Expected Result
- Users can navigate to `/Shipping/Create` and input shipping information.
- Submitted data is saved to the database.
- After submission, user is redirected to the shipping list page.

---

Let me know when you're ready to proceed to **Chapter 05 – Edit Shipment Entry**.
