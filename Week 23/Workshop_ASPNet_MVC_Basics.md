# 🧪 Workshop: Understanding ASP.NET MVC Basics

---

🌟 **Learning Objective**  
Understand ASP.NET MVC folder structure, create a Controller + View, and pass data from Controller to View.

📘 **What is ASP.NET MVC?**  
ASP.NET MVC is a design pattern that separates an application into three main components:  
- **Model** → Represents the data and business logic  
- **View** → Represents the user interface  
- **Controller** → Handles user requests and coordinates between Model and View  

ASP.NET MVC (รูปแบบการออกแบบ) คือการแยกโครงสร้างโปรแกรมออกเป็น 3 ส่วน:  
- **Model** → ข้อมูลและตรรกะธุรกิจ  
- **View** → ส่วนแสดงผลให้ผู้ใช้เห็น  
- **Controller** → จัดการ request และเชื่อม Model เข้ากับ View  

---

📁 **Folder Structure**
```
/Models
    └── Student.cs
/Controllers
    └── StudentController.cs
/Views/Student
    └── Index.cshtml
```

---

✅ **Step 1: Create Model**  
**Location**: `/Models/Student.cs`

```csharp
namespace MvcDemo.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Grade { get; set; }
    }
}
```

---

✅ **Step 2: Create Controller**  
**Location**: `/Controllers/StudentController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using MvcDemo.Models;

namespace MvcDemo.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            var students = new List<Student>
            {
                new Student { Id = 1, Name = "Somchai", Grade = 7 },
                new Student { Id = 2, Name = "Suda", Grade = 9 }
            };

            return View(students);
        }
    }
}
```

---

✅ **Step 3: Create View**  
**Location**: `/Views/Student/Index.cshtml`

```html
@model List<MvcDemo.Models.Student>

<h2>Student List</h2>
<table>
    <tr>
        <th>ID</th><th>Name</th><th>Grade</th>
    </tr>
    @foreach (var s in Model)
    {
        <tr>
            <td>@s.Id</td>
            <td>@s.Name</td>
            <td>@s.Grade</td>
        </tr>
    }
</table>
```

---

✅ **Expected Output (on /Student/Index)**
```
Student List
1   Somchai   7
2   Suda      9
```

---

🧩 **Student Challenges**
1. เพิ่ม Student อีก 2 คนใน Controller.  
2. แสดง Grade เป็นข้อความ เช่น “Grade 7 → Junior High 1”.  
3. เพิ่ม Action `Details(int id)` ใน Controller เพื่อแสดงข้อมูลนักเรียนทีละคน.  

---

🧠 **Summary Table**

| Concept     | Explanation |
|-------------|-------------|
| Model       | Defines data (Student.cs) |
| Controller  | Handles requests and passes data (StudentController.cs) |
| View        | Displays data (Index.cshtml) |
| ViewBag/Model | Two ways to pass data to a View |

---

✍️ **Exam Question**  
**Explain the MVC pattern in ASP.NET and give an example of how data flows from Controller to View.**  

*Sample Answer*:  
In ASP.NET MVC, the Controller receives the request, prepares data using a Model, and passes it to a View for display. For example, in the StudentController, a list of students is created and returned to the View. The View then displays each student's ID, Name, and Grade.

---
