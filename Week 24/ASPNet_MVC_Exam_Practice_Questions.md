# 📝 ASP.NET MVC Exam Practice Questions

---

## ❓ Question 1: MVC Concept
**Explain the role of Model, View, and Controller in ASP.NET MVC. Provide a real-world example (e.g., Student management system) to illustrate how data flows between them.**

✅ **Sample Answer**  
- **Model** → Represents the data and business logic (e.g., Student with Id, Name, Grade).  
- **Controller** → Handles the request, prepares data, and passes it to the View.  
- **View** → Displays the data to the user.  

Example: In a Student system, the Controller requests a list of students from the Model and sends it to the View. The View then renders a table showing the list.

---

## ❓ Question 2: Controller and Action
**Write a simple `BookController` with an `Index()` action that returns a list of 3 books (Id, Title, Author). Pass the list to a view and display it in a table. Provide both controller and view code.**

✅ **Sample Answer**  

**Controller**
```csharp
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace ExamDemo.Controllers
{
    public class BookController : Controller
    {
        public IActionResult Index()
        {
            var books = new List<dynamic>
            {
                new { Id = 1, Title = "C# Basics", Author = "John" },
                new { Id = 2, Title = "ASP.NET MVC", Author = "Mary" },
                new { Id = 3, Title = "Entity Framework", Author = "Alex" }
            };

            return View(books);
        }
    }
}
```

**View (Index.cshtml)**
```html
@model IEnumerable<dynamic>

<h2>Book List</h2>
<table>
    <tr><th>ID</th><th>Title</th><th>Author</th></tr>
    @foreach (var b in Model)
    {
        <tr>
            <td>@b.Id</td>
            <td>@b.Title</td>
            <td>@b.Author</td>
        </tr>
    }
</table>
```

---

## ❓ Question 3: ViewBag vs Strongly Typed Model
**Explain the difference between using `ViewBag` and using a strongly typed `Model` to pass data from a Controller to a View. Which approach is better for larger applications, and why?**

✅ **Sample Answer**  
- **ViewBag** → Dynamic, loosely typed, easy for small amounts of data.  
- **Model** → Strongly typed, compile-time checking, better for large/complex apps.  
👉 Strongly typed models are preferred in large projects because they reduce errors and improve maintainability.

---

## ❓ Question 4: Routing
**By default, the URL `/Student/Details/5` maps to the `Details(int id)` action in `StudentController`. Explain how ASP.NET MVC resolves this route. Then, write a sample `Details` action and View to display a single student's info.**

✅ **Sample Answer**  
- ASP.NET MVC uses default routing: `/Controller/Action/{id}`.  
- `StudentController` → `Details` action → `{id=5}` passed as parameter.  

**Controller**
```csharp
public class StudentController : Controller
{
    public IActionResult Details(int id)
    {
        var student = new { Id = id, Name = "Somchai", Grade = 7 };
        return View(student);
    }
}
```

**View (Details.cshtml)**
```html
@model dynamic

<h2>Student Details</h2>
<p>ID: @Model.Id</p>
<p>Name: @Model.Name</p>
<p>Grade: @Model.Grade</p>
```

---

## ❓ Question 5: Folder Structure
**Why is folder structure important in ASP.NET MVC projects? Draw or describe the standard MVC folder layout and explain what typically goes into each folder (Models, Views, Controllers).**

✅ **Sample Answer**  
Folder structure enforces consistency and makes it easier for developers to navigate.  

```
/Models        → Business logic & data (Student.cs, Book.cs)
/Views         → UI files (.cshtml) grouped by controller name
/Controllers   → Handle requests and responses
/wwwroot       → Static files (CSS, JS, images)
```

Each part of MVC has its own folder, which keeps responsibilities separate and improves maintainability.

---
