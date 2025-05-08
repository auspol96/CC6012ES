
# 📘 Chapter 3: Deep Dive into Controllers in ASP.NET Core MVC

## 🎯 Purpose
To give students a strong understanding of controller logic, action methods, and how data flows from controller to view.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: What is a Controller?

#### 💡 Note for Instructor:
Explain that a controller is the C in MVC — responsible for handling user input, working with the model, and returning the appropriate response.

#### 📂 Example:
Open `Controllers/HomeController.cs`. Discuss:
```csharp
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
```
- The class inherits from `Controller`
- The `Index` method is an **Action**
- It returns a `View()` – which maps to a Razor file in `Views/Home/Index.cshtml`

---

### ✅ Step 2: Explore StudentController.cs

#### 💡 Note for Instructor:
This controller includes multiple real-world examples. Use it to show:
- Parameterized actions
- Passing data
- Attribute routing

Open: `Controllers/StudentController.cs`

Discuss this method:
```csharp
public IActionResult Greet(string name)
{
    ViewData["Message"] = $"Welcome, {name}!";
    return View();
}
```

---

### ✅ Step 3: Return Types in Action Methods

Explain the types of results a controller action can return:
| Return Type | Description |
|-------------|-------------|
| `ViewResult` | Renders a Razor view |
| `ContentResult` | Returns plain text |
| `RedirectResult` | Redirects to another action or URL |
| `JsonResult` | Returns data as JSON |

#### 💡 Instructor Tip:
Demonstrate each using the existing or new methods in `StudentController`.

Example:
```csharp
public IActionResult SayHello()
{
    return Content("Hello from the controller!");
}
```

---

### ✅ Step 4: Passing Data to Views

1. **Using ViewData**
```csharp
ViewData["Message"] = "Hello from ViewData";
```
2. **Using ViewBag**
```csharp
ViewBag.Message = "Hello from ViewBag";
```

#### 💡 Instructor Tip:
Explain the difference (ViewData is dictionary-based, ViewBag is dynamic). Show how this displays in the Razor view:
```html
<h2>@ViewData["Message"]</h2>
<h3>@ViewBag.Message</h3>
```

---

### ✅ Step 5: Accepting Parameters in Actions

```csharp
public IActionResult Welcome(string name, int age)
{
    return Content($"Welcome {name}, you are {age} years old!");
}
```

Test with: `/Student/Welcome?name=Rattapol&age=49`

#### 💡 Note:
This teaches how query strings map to parameters.

---

### ✅ Step 6: Create a New Controller (TeacherController)

1. Right-click `Controllers` > Add > Controller
2. Choose **MVC Controller - Empty**
3. Name it `TeacherController`

Add:
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

#### 💡 Instructor Tip:
Show how attribute routing overrides default routing.

---

### ✅ Step 7: Redirect and JSON Return

#### Redirect Example:
```csharp
public IActionResult GoToHome()
{
    return RedirectToAction("Index", "Home");
}
```

#### JSON Example:
```csharp
public IActionResult GetStudentData()
{
    var student = new { Id = 1, Name = "Rattapol" };
    return Json(student);
}
```

#### 💡 Note:
This introduces concepts useful for APIs later.

---

## 🧪 Hands-on Mini Challenge

- Add a controller called `CourseController`
- Add two actions: `List()` (returns view), `Details(string id)` (returns content with course name)
- Use both default and attribute routing

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
