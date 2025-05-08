
# 🧭 Chapter 2: Routing and Controllers in ASP.NET Core MVC

## 🎯 Purpose
To help students understand how routing works in ASP.NET Core MVC and how controllers handle incoming HTTP requests.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### 🛠 Tools Needed
- Visual Studio 2022 or newer (Community Edition is fine)
- .NET SDK (preferably .NET 6 or newer)

#### 💡 Notes:
Ensure students have the required tools installed before class. Run Visual Studio as Administrator if needed.

#### 📂 Instructions:
1. Open **Visual Studio**.
2. Go to **File > New > Project**.
3. Search for **ASP.NET Core Web App (Model-View-Controller)**.
4. Name the project: `MvcRoutingWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcRoutingWorkshop`).
6. Click **Next**.

### ⚙️ Project Settings
1. Target Framework: **.NET 6.0 (or later)**.
2. Authentication Type: **None**.
3. Check **Configure for HTTPS**.
4. Uncheck **Enable Docker**.
5. Click **Create**.

#### 💡 Notes:
This template includes folder structures for Models, Views, and Controllers.

---

### ✅ Step 2: Understand Default Routing

Open `Program.cs` and locate this code:

```csharp
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
```

#### 📘 Explanation:
- `{controller=Home}` → Default controller is `HomeController`
- `{action=Index}` → Default action is `Index` method
- `{id?}` → Optional parameter

---

### ✅ Step 3: Explore Given Controller (StudentController.cs)

1. Copy the `StudentController.cs` file from the ZIP file:
   - Path: `BasicASPTutorial/BasicASPTutorial/Controllers/StudentController.cs`
2. Paste it into your project’s `Controllers` folder.

#### 🧠 What to Highlight:
- The class inherits from `Controller`.
- Each public method is an **Action**.
- Action methods return `IActionResult`.

---

### ✅ Step 4: Run and Test Routes

#### 💡 Instructions:
1. Press `F5` to run the app.
2. Open a browser and test:
   - `/Student/Index` → View student list (requires view)
   - `/Student/Greet?name=Rattapol` → Pass data via query

---

### ✅ Step 5: Add a New Action

```csharp
public IActionResult Greet(string name)
{
    ViewData["Message"] = $"Welcome, {name}!";
    return View();
}
```

#### 🎯 Create Corresponding View:
1. Right-click `Views/Student` > Add > New Item > Razor View
2. Name it `Greet.cshtml`
3. Add:
```html
<h2>@ViewData["Message"]</h2>
```

---

### ✅ Step 6: Define a Custom Route

Add the `[Route]` attribute above an action:

```csharp
[Route("student/hello/{name}")]
public IActionResult Hello(string name)
{
    return Content($"Hello {name}, this is a custom route!");
}
```

Then navigate to `/student/hello/Rattapol` to test.

---

### ✅ Step 7: Student Challenge (Mini Exercise)

#### 🧪 Instructions:
- Add a new controller: `TeacherController`
- Add two actions:
  - `public IActionResult Index()`
  - `public IActionResult Info(string subject)`
- Use custom route for `Info`

---

## 📝 Summary Notes

- **Controllers** handle requests.
- **Routes** map URLs to controller actions.
- You can use **attribute routing** for custom paths.

---

### ✅ Outcome of This Chapter
Students will be able to:
- Understand MVC routing conventions
- Create and test multiple controller actions
- Implement both default and attribute-based routing
