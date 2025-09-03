# 🧠 Application Development Workshop

## 🧬 Inheritance

### 📘 What is Inheritance?

**English:** Inheritance allows one class (called the child or derived class) to inherit the properties and methods of another class (called the parent or base class). It promotes code reuse and logical hierarchy.

**Thai:** Inheritance คือความสามารถที่คลาสหนึ่งสามารถสืบทอดคุณสมบัติ (properties) และพฤติกรรม (methods) จากคลาสแม่ได้ ทำให้ไม่ต้องเขียนโค้ดซ้ำ และช่วยจัดโครงสร้างโปรแกรมให้ชัดเจน

---

### 🛠️ Workshop: Simple Inheritance in ASP.NET Core MVC

#### Step 1: Create Base Class and Derived Class

```csharp
// Models/Person.cs
public class Person
{
    public string Name { get; set; }
    public int Age { get; set; }

    public virtual string GetDetails()
    {
        return $"Name: {Name}, Age: {Age}";
    }
}

// Models/Student.cs
public class Student : Person
{
    public string StudentID { get; set; }

    public override string GetDetails()
    {
        return base.GetDetails() + $", StudentID: {StudentID}";
    }
}
```

#### Step 2: Add Controller

```csharp
// Controllers/InheritanceController.cs
public class InheritanceController : Controller
{
    public IActionResult Index()
    {
        Student std = new Student()
        {
            Name = "Aung Aung",
            Age = 20,
            StudentID = "S12345"
        };

        ViewBag.Details = std.GetDetails();
        return View();
    }
}
```

#### Step 3: Create View

```html
<!-- Views/Inheritance/Index.cshtml -->
<h2>Student Details</h2>
<p>@ViewBag.Details</p>
```

---

## 🔁 Overloading

### 📘 What is Overloading?

**English:** Method overloading means creating multiple methods with the same name in the same class but with different parameter lists (number, order, or type of parameters). The compiler decides which method to call based on the arguments passed.

**Thai:** Method Overloading คือการที่คลาสหนึ่งมีเมธอดชื่อเดียวกันหลายตัว แต่มีพารามิเตอร์ต่างกัน (จำนวน, ลำดับ, หรือประเภท) ระบบจะเลือกใช้เมธอดที่ตรงกับพารามิเตอร์ที่ส่งมาให้อัตโนมัติ

---

### 🛠️ Workshop: Overloading Methods in ASP.NET Core MVC

#### Step 1: Define Overloaded Methods in a Class

```csharp
// Models/Printer.cs
public class Printer
{
    public void Print()
    {
        Console.WriteLine("Default print");
    }

    public void Print(string message)
    {
        Console.WriteLine($"Printing: {message}");
    }

    public void Print(string message, int copies)
    {
        for (int i = 0; i < copies; i++)
        {
            Console.WriteLine($"Copy {i + 1}: {message}");
        }
    }
}
```

#### Step 2: Call Overloaded Methods from Controller

```csharp
// Controllers/OverloadingController.cs
public class OverloadingController : Controller
{
    public IActionResult Index()
    {
        Printer printer = new Printer();
        printer.Print();
        printer.Print("Hello World");
        printer.Print("Multiple Copies", 3);

        return View();
    }
}
```

#### Step 3: Create View

```html
<!-- Views/Overloading/Index.cshtml -->
<h2>Check Output in Console</h2>
<p>This example demonstrates method overloading.</p>
```

---

## 🧪 Student Exercises

1. Create a class `Calculator` that includes:

   * `Add(int a, int b)`
   * `Add(double a, double b)`
   * `Add(int a, int b, int c)`
2. Try calling each method in the controller and observe results.
3. Add view content to display results using `ViewBag` or `ViewData`

---

Let me know when you're ready to continue with `Overriding`, `Constructor`, or `Abstraction`.
