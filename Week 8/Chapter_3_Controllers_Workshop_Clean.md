
# 📘 Chapter 3: Deep Dive into Controllers in ASP.NET Core MVC

## 🎯 Purpose
To give students a strong understanding of controller logic, action methods, and how data flows from controller to view.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Tools Needed
- Visual Studio 2022 or newer
- .NET SDK (preferably .NET 6 or newer)

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Search for **ASP.NET Core Web App (Model-View-Controller)**.
4. Name the project: `MvcControllerWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcControllerWorkshop`).
6. Click **Next**.

#### Project Settings
1. Target Framework: **.NET 6.0 (or later)**.
2. Authentication Type: **None**.
3. Check **Configure for HTTPS**.
4. Uncheck **Enable Docker**.
5. Click **Create**.

---

### ✅ Step 2: What is a Controller?

Open `Controllers/HomeController.cs`. Review:
```csharp
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
```
- The class inherits from `Controller`.
- The `Index` method is an action that returns a view.

---

### ✅ Step 3: Explore StudentController.cs

Copy `StudentController.cs` from the previous project or ZIP file into the `Controllers` folder of the new project.

Example method:
```csharp
public IActionResult Greet(string name)
{
    ViewData["Message"] = $"Welcome, {name}!";
    return View();
}
```

---

### ✅ Step 4: Return Types in Action Methods

| Return Type | Description |
|-------------|-------------|
| `ViewResult` | Renders a Razor view |
| `ContentResult` | Returns plain text |
| `RedirectResult` | Redirects to another action or URL |
| `JsonResult` | Returns data as JSON |

Example:
```csharp
public IActionResult SayHello()
{
    return Content("Hello from the controller!");
}
```

---

### ✅ Step 5: Passing Data to Views

1. Using ViewData:
```csharp
ViewData["Message"] = "Hello from ViewData";
```

2. Using ViewBag:
```csharp
ViewBag.Message = "Hello from ViewBag";
```

In the view:
```html
<h2>@ViewData["Message"]</h2>
<h3>@ViewBag.Message</h3>
```

---

### ✅ Step 6: Accepting Parameters in Actions

```csharp
public IActionResult Welcome(string name, int age)
{
    return Content($"Welcome {name}, you are {age} years old!");
}
```

Test the route: `/Student/Welcome?name=Rattapol&age=49`

---

### ✅ Step 7: Create a New Controller (TeacherController)

1. Right-click `Controllers` > Add > Controller
2. Choose **MVC Controller - Empty**
3. Name it `TeacherController`

Add the following:
```csharp
public class TeacherController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    [Route("teacher/subject/{subjectName}")]
    public IActionResult Info(string subjectName)
    {
        return Content($"You are learning about {subjectName}");
    }
}
```

---

### ✅ Step 8: Redirect and JSON Return

Redirect Example:
```csharp
public IActionResult GoToHome()
{
    return RedirectToAction("Index", "Home");
}
```

JSON Example:
```csharp
public IActionResult GetStudentData()
{
    var student = new { Id = 1, Name = "Rattapol" };
    return Json(student);
}
```

---

## 🧪 Hands-on Mini Challenge

- Add a controller called `CourseController`
- Add two actions:
  - `List()` returns a Razor view
  - `Details(string id)` returns content with the course name
- Use both default and custom attribute routing

---

## 📝 Summary Notes

- A **Controller** is the entry point for handling browser requests.
- Actions can return **View**, **Content**, **Redirect**, or **Json**
- Data can be passed using `ViewData`, `ViewBag`, or `TempData`
- Parameters can be received via query strings or route templates

---

### ✅ Outcome of This Chapter
Students will:
- Understand controller structure and actions
- Know how to pass/receive data
- Use custom routes and return various response types
