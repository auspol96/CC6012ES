
# 📘 Chapter 2.1: Advanced Controller Features in ASP.NET Core MVC

## 🎯 Purpose
To extend the basic controller concept by introducing dynamic content, multiple return types, parameter binding, and routing customizations.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Review the Basic Controller

Basic example from Chapter 2:
```csharp
public class HelloWorldController : Controller
{
    public string Index()
    {
        return "This is my default action...";
    }
}
```

---

### ✅ Step 2: Return Different Result Types

1. **ContentResult**
```csharp
public IActionResult ShowMessage()
{
    return Content("This is a plain message.");
}
```

2. **JsonResult**
```csharp
public IActionResult GetJson()
{
    var movie = new { Title = "Avengers", Year = 2019 };
    return Json(movie);
}
```

3. **Redirect**
```csharp
public IActionResult GoHome()
{
    return RedirectToAction("Index", "Home");
}
```

4. **StatusCode**
```csharp
public IActionResult NotAllowed()
{
    return StatusCode(403, "Forbidden");
}
```

---

### ✅ Step 3: Accept Parameters from URL

```csharp
public IActionResult Welcome(string name, int numTimes = 1)
{
    ViewData["Message"] = $"Hello {name}";
    ViewData["NumTimes"] = numTimes;
    return View();
}
```

Navigate to:
```
/HelloWorld/Welcome?name=John&numTimes=5
```

---

### ✅ Step 4: Use Attribute Routing

```csharp
[Route("hello/{name}/times/{numTimes:int}")]
public IActionResult Greet(string name, int numTimes)
{
    return Content($"Hello {name}, shown {numTimes} times.");
}
```

Navigate to:
```
/hello/Alice/times/3
```

---

### ✅ Step 5: Use TempData and ViewBag

```csharp
public IActionResult SetMessage()
{
    TempData["Notice"] = "Data saved successfully!";
    ViewBag.User = "Admin";
    return RedirectToAction("ShowMessage");
}

public IActionResult ShowMessage()
{
    string msg = TempData["Notice"] as string;
    string user = ViewBag.User; // will be null here
    return Content($"TempData: {msg}, ViewBag: {user}");
}
```

- **TempData** survives one redirect
- **ViewBag** is only for the current request

---

### ✅ Step 6: Organize with Area (Optional Advanced)

Add folder: `Areas/Admin/Controllers/AdminController.cs`

```csharp
[Area("Admin")]
public class AdminController : Controller
{
    public IActionResult Dashboard()
    {
        return View();
    }
}
```

To access:
```
/Admin/Admin/Dashboard
```

Register area in `Program.cs` (if not auto-enabled):
```csharp
app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");
```

---

## 🧪 Hands-on Mini Challenge

1. Create a controller called `UtilityController`.
2. Add 3 actions:
   - `RandomNumber(int min, int max)` — returns a random number.
   - `Today()` — returns current date.
   - `Greet(string name)` — uses `ViewBag` to display name in the view.
3. Create a view to show the `Greet` message.

---

## 📝 Summary Notes

- Controllers can return various result types beyond strings and views.
- You can bind parameters from the URL or query string.
- TempData is great for one-time messages between redirects.
- Use attribute routing to make clean, meaningful URLs.

---

### ✅ Outcome of This Chapter
Students will:
- Return JSON, status, and redirect responses from controllers
- Use routing with parameters and attribute routing
- Apply TempData, ViewData, and ViewBag for data flow
- Create flexible, dynamic controller logic
