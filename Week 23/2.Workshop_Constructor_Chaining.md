# 🧪 Workshop: Understanding Constructor Chaining in ASP.NET MVC

---

🌟 **Learning Objective**  
Understand how constructor chaining works in C#, learn to use `this` and `base` keywords, and apply it in an ASP.NET MVC model.

📘 **What is Constructor Chaining?**  
- Constructor chaining means **calling one constructor from another** within the same class (using `this`) or from a base class (using `base`).  
- It helps avoid code duplication and ensures consistent initialization.  

Constructor Chaining (การเรียกซ้อน Constructor) คือการที่ constructor หนึ่งเรียก constructor อีกตัวหนึ่งเพื่อกำหนดค่าเริ่มต้นแบบไม่ต้องเขียนซ้ำ  

---

📁 **Folder Structure**
```
/Models
    └── Student.cs       ← Model with constructor chaining
/Controllers
    └── StudentController.cs
/Views/Student
    └── Index.cshtml
```

---

## ✅ Step 1: Create Model with Constructor Chaining
**Location**: `/Models/Student.cs`

```csharp
namespace ConstructorDemo.Models
{
    public class Student
    {
        public string Name { get; set; }
        public int Grade { get; set; }

        // Default constructor → calls main constructor
        public Student() : this("New Student", 7) { }

        // Constructor with Name only → calls main constructor
        public Student(string name) : this(name, 7) { }

        // Main constructor
        public Student(string name, int grade)
        {
            Name = name;
            Grade = grade;
        }
    }
}
```

👉 Explanation:  
- `this("New Student", 7)` → provides default values.  
- `this(name, 7)` → assigns grade 7 automatically if only name is provided.  
- The main constructor does the actual initialization.  

---

## ✅ Step 2: Create Controller
**Location**: `/Controllers/StudentController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using ConstructorDemo.Models;

namespace ConstructorDemo.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            Student s1 = new Student();
            Student s2 = new Student("Somchai");
            Student s3 = new Student("Suda", 9);

            ViewBag.Student1 = $"{s1.Name} - Grade {s1.Grade}";
            ViewBag.Student2 = $"{s2.Name} - Grade {s2.Grade}";
            ViewBag.Student3 = $"{s3.Name} - Grade {s3.Grade}";

            return View();
        }
    }
}
```

---

## ✅ Step 3: Create View
**Location**: `/Views/Student/Index.cshtml`

```html
@{
    ViewData["Title"] = "Constructor Chaining Demo";
}

<h2>Students</h2>
<p>@ViewBag.Student1</p>
<p>@ViewBag.Student2</p>
<p>@ViewBag.Student3</p>
```

---

## ✅ Expected Output (on /Student/Index)
```
Students
New Student - Grade 7
Somchai - Grade 7
Suda - Grade 9
```

---

🧩 **Student Challenges**
1. Add another constructor that accepts `Name`, `Grade`, and `Address`.  
2. Change the default constructor to start at `"Freshman", Grade = 1`.  
3. Use `base` keyword by creating a `Person` base class and chaining from `Student`.  

---

🧠 **Summary Table**

| Concept             | Explanation |
|---------------------|-------------|
| Constructor         | Special method to initialize an object |
| Constructor Chaining | One constructor calls another to avoid duplication |
| `this(...)`         | Calls another constructor in the **same class** |
| `base(...)`         | Calls a constructor in the **base class** |

---

✍️ **Exam Question**  
**Explain constructor chaining with an example. Why is it useful in C#?**  

✅ *Sample Answer*:  
Constructor chaining allows one constructor to call another using `this` or `base`. For example, in the `Student` class, `Student()` calls `Student(string name, int grade)` with default values. This avoids repeating initialization code and ensures all constructors lead to the same logic.

---
