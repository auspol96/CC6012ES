
# 📘 Chapter 10: Layouts and Shared Views in ASP.NET Core MVC

## 🎯 Purpose
To teach students how to use layout views to create consistent page structure, reuse UI components, and manage shared content across views.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Choose **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcLayoutWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcLayoutWorkshop`).
6. Click **Next**.

#### Project Settings:
- Target Framework: **.NET 6.0 or later**
- Authentication: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Understand Layout Structure

The layout file is located at:
```
Views/Shared/_Layout.cshtml
```

This file defines the common HTML structure of the app (header, footer, styles, etc.).

Key elements:
```html
@ViewData["Title"]     // Dynamic title per page
@RenderBody()          // Where child view content goes
@RenderSection()       // Optional sections like scripts
```

---

### ✅ Step 3: Link Views to Layout with _ViewStart.cshtml

Located at:
```
Views/_ViewStart.cshtml
```

Content:
```csharp
@{
    Layout = "_Layout";
}
```

This automatically applies the layout to all views unless overridden.

---

### ✅ Step 4: Customize _Layout.cshtml

Modify it to include navigation and shared content:
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>@ViewData["Title"] - My Website</title>
    <link rel="stylesheet" href="~/css/site.css" />
</head>
<body>
    <header>
        <h1>My Website</h1>
        <nav>
            <a asp-controller="Home" asp-action="Index">Home</a> |
            <a asp-controller="Student" asp-action="Register">Register</a>
        </nav>
    </header>
    <main>
        @RenderBody()
    </main>
    <footer>
        <p>&copy; 2025 - My Website</p>
    </footer>
</body>
</html>
```

---

### ✅ Step 5: Create Views Using Layout

Example `Index.cshtml` in `Views/Home`:
```html
@{
    ViewData["Title"] = "Home Page";
}

<h2>Welcome to the Home Page</h2>
<p>This view uses the shared layout automatically.</p>
```

---

### ✅ Step 6: Use RenderSection (Optional)

In `_Layout.cshtml`, add:
```html
@RenderSection("Scripts", required: false)
```

Then in a child view:
```html
@section Scripts {
    <script>alert("Hello from section!");</script>
}
```

---

### ✅ Step 7: Create a Partial View

1. Right-click `Views/Shared` > Add > Razor View > Name it `_NavBar.cshtml`
2. Content:
```html
<nav>
    <a asp-controller="Home" asp-action="Index">Home</a> |
    <a asp-controller="Student" asp-action="Register">Register</a>
</nav>
```

3. Use it in `_Layout.cshtml`:
```html
@await Html.PartialAsync("_NavBar")
```

---

## 🧪 Hands-on Mini Challenge

- Add a new view called `About.cshtml`
- Customize the title and add content
- Include a custom script section
- Add a footer partial view and include it in the layout

---

## 📝 Summary Notes

- Layout views provide a master page structure for your app
- `_ViewStart.cshtml` automatically applies a layout to views
- Use `@RenderBody()` for main content and `@RenderSection()` for optional content
- Partial views enable reusable UI components like navbars and footers

---

### ✅ Outcome of This Chapter
Students will:
- Understand how layouts create consistent site structure
- Use shared and partial views effectively
- Apply advanced layout techniques like sections and partials
