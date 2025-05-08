
# 📘 Chapter 5: Views Using Empty Template in ASP.NET Core MVC

## 🎯 Purpose
To teach students how to create a View from scratch using the "Empty" Razor View template and manually connect it to controller logic.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Choose **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcEmptyViewWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcEmptyViewWorkshop`).
6. Click **Next**.

#### Project Settings:
- Framework: **.NET 6.0 or later**
- Authentication: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Create a New Controller

1. Right-click on the `Controllers` folder > Add > Controller.
2. Select **MVC Controller - Empty**.
3. Name it `InfoController`.

Add the following code:
```csharp
public class InfoController : Controller
{
    public IActionResult Summary()
    {
        return View();
    }
}
```

---

### ✅ Step 3: Add a View Using Empty Template

1. Right-click the `Views` folder > Add > New Folder → name it `Info`.
2. Right-click `Views/Info` → Add → New Item → Razor View.
3. Name it `Summary.cshtml`.
4. Select the **Empty** template (not Razor Layout, just blank page).

Add this content:
```html
@{
    ViewData["Title"] = "Summary Page";
}

<h2>@ViewData["Title"]</h2>
<p>This is a fully manual Razor View using the Empty template.</p>
```

---

### ✅ Step 4: Run and Navigate

Run the project and go to `/Info/Summary`.

You should see your custom page without any layout or styling.

---

### ✅ Step 5: Add More Static Views

1. Add another action in `InfoController`:
```csharp
public IActionResult Help()
{
    return View();
}
```

2. Create a new view file `Help.cshtml` in `Views/Info` using the Empty template.

Add content:
```html
<h2>Help Page</h2>
<p>Use this page to describe help information for your users.</p>
```

---

## 🧪 Hands-on Mini Challenge

- Add a new action: `FAQ()` in `InfoController`
- Create `FAQ.cshtml` manually using the Empty template
- Add 2–3 common questions and answers in HTML

---

## 📝 Summary Notes

- "Empty" Razor Views do not include layout or boilerplate HTML.
- Views must be placed in the `Views/{ControllerName}` folder to map automatically.
- Controller methods return Views using the same name by default.

---

### ✅ Outcome of This Chapter
Students will:
- Know how to add Razor Views using the Empty template
- Connect them to controller actions manually
- Build clean and focused HTML views from scratch
