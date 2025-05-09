# Chapter 3: Add a View to an ASP.NET Core MVC App

## 🎯 Objective
Create and connect Razor views to controller actions.

---

## 📝 Instructions

### Step 1: Update HelloWorldController
Change `Index()` method to return a view:

```csharp
public IActionResult Index()
{
    return View();
}
```

### Step 2: Add a View File
1. Right-click the `Views` folder > Add > New Folder: name it `HelloWorld`.
2. Inside `Views/HelloWorld`, add a new item: **Razor View** and name it `Index.cshtml`.
3. Paste this content:

```html
@{
    ViewData["Title"] = "Index";
}
<h2>Index</h2>
<p>Hello from our View Template!</p>
```

### Step 3: Run the App
Navigate to `https://localhost:{PORT}/HelloWorld` and see your new View.

---

## 🧪 Deliverables
- Screenshot of the custom Razor view in browser.
- `Index.cshtml` code snippet.

---
