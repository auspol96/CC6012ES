# Chapter 2: Add a Controller to an ASP.NET Core MVC App

## 🎯 Objective
Create and configure a basic controller to handle browser requests and return responses.

---

## ✅ Prerequisites
- Chapter 1 completed: MVC project created and running.

---

## 📝 Instructions

### Step 1: Add a New Controller
1. In **Solution Explorer**, right-click on the **Controllers** folder.
2. Select **Add > Controller**.
3. Choose **Empty MVC Controller**.
4. Name it `HelloWorldController.cs`.

### Step 2: Add Action Methods
Replace the content of `HelloWorldController.cs` with:

```csharp
using Microsoft.AspNetCore.Mvc;

namespace MvcMovie.Controllers
{
    public class HelloWorldController : Controller
    {
        public string Index()
        {
            return "This is my default action...";
        }

        public string Welcome(string name, int numTimes = 1)
        {
            return $"Hello {name}, NumTimes is: {numTimes}";
        }
    }
}
```

### Step 3: Run and Test
- Run the app and navigate to: `https://localhost:{PORT}/HelloWorld`
- Try: `https://localhost:{PORT}/HelloWorld/Welcome?name=Rick&numtimes=4`

---

## 🧪 Deliverables
- Screenshot of browser output showing both `Index` and `Welcome` results.
- Code snippet of the `HelloWorldController` class.

---
