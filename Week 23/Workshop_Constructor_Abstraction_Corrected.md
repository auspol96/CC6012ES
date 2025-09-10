# 🛠 Workshop: Constructor Chaining & Abstraction in ASP.NET MVC

---

🌟 **Learning Objective**  
Use constructor chaining to simplify object creation with defaults, and apply abstraction using interfaces to define a contract for multiple implementations.

📘 **What are Constructor Chaining & Abstraction?**  
- **Constructor Chaining** allows one constructor to call another, avoiding code duplication.  
- **Abstraction** hides details and forces derived classes to implement required methods, often using `interface` or `abstract class`.  

Constructor Chaining (การเรียกซ้อน constructor) คือการทำให้ constructor หนึ่งไปเรียก constructor อีกตัวในคลาสเดียวกัน  
Abstraction (การทำให้เป็นนามธรรม) คือการซ่อนรายละเอียด และบังคับให้คลาสลูก implement method ตามสัญญา  

---

📁 **Folder Structure**
```
/Models
    ├── Student.cs        ← Class with constructor chaining
    ├── IPayment.cs       ← Interface
    ├── CashPayment.cs    ← Payment implementation
    ├── QRPayment.cs      ← Another implementation
/Controllers
    └── PaymentController.cs
/Views/Payment
    └── Index.cshtml
```

---

✅ **Step 1: Create Student Model with Constructor Chaining**  
**Location**: `/Models/Student.cs`

```csharp
namespace ConstructorDemo.Models
{
    public class Student
    {
        public string Name { get; set; }
        public int Grade { get; set; }

        // Default constructor
        public Student() : this("New Student", 7) { }

        // Constructor with Name only
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

---

✅ **Step 2: Define Interface & Implementations**  
**Location**: `/Models/IPayment.cs`

```csharp
namespace ConstructorDemo.Models
{
    public interface IPayment
    {
        string Pay(decimal amount);
    }
}
```

**Location**: `/Models/CashPayment.cs`

```csharp
namespace ConstructorDemo.Models
{
    public class CashPayment : IPayment
    {
        public string Pay(decimal amount)
        {
            return $"Paid {amount} by Cash.";
        }
    }
}
```

**Location**: `/Models/QRPayment.cs`

```csharp
namespace ConstructorDemo.Models
{
    public class QRPayment : IPayment
    {
        public string Pay(decimal amount)
        {
            return $"Paid {amount} by QR Code.";
        }
    }
}
```

---

✅ **Step 3: Create the Controller**  
**Location**: `/Controllers/PaymentController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using ConstructorDemo.Models;

namespace ConstructorDemo.Controllers
{
    public class PaymentController : Controller
    {
        public IActionResult Index()
        {
            Student s1 = new Student();
            Student s2 = new Student("Somchai");
            Student s3 = new Student("Suda", 9);

            IPayment cash = new CashPayment();
            IPayment qr = new QRPayment();

            ViewBag.Student1 = $"{s1.Name} - Grade {s1.Grade}";
            ViewBag.Student2 = $"{s2.Name} - Grade {s2.Grade}";
            ViewBag.Student3 = $"{s3.Name} - Grade {s3.Grade}";

            ViewBag.CashPay = cash.Pay(100);
            ViewBag.QrPay = qr.Pay(200);

            return View();
        }
    }
}
```

---

✅ **Step 4: Create the View**  
**Location**: `/Views/Payment/Index.cshtml`

```html
@{
    ViewData["Title"] = "Constructor & Abstraction Demo";
}

<h2>Students</h2>
<p>@ViewBag.Student1</p>
<p>@ViewBag.Student2</p>
<p>@ViewBag.Student3</p>

<h2>Payments</h2>
<p>@ViewBag.CashPay</p>
<p>@ViewBag.QrPay</p>
```

---

✅ **Expected Output (on /Payment/Index)**
```
Students
New Student - Grade 7
Somchai - Grade 7
Suda - Grade 9

Payments
Paid 100 by Cash.
Paid 200 by QR Code.
```

---

🧩 **Student Challenges**
1. Add `CreditCardPayment` that implements `IPayment` → `"Paid {amount} by Credit Card."`.  
2. Add `BankTransferPayment` with a unique implementation.  
3. Add another constructor for `Student` that includes Address.  

---

🧠 **Summary Table**

| Concept     | Explanation |
|-------------|-------------|
| Constructor Chaining | Allows reuse of initialization code across multiple constructors |
| Abstraction | Defines contract (via interface) without showing implementation |
| Interface   | A set of methods a class must implement |
| Implementation | Class providing actual logic (CashPayment, QRPayment) |

---

✍️ **Exam Question**  
**Explain Constructor Chaining and Abstraction with Sample Code.**  

*Sample Answer*:  
In this example, `Student` demonstrates constructor chaining: `new Student()` and `new Student("Somchai")` both call the main constructor, reducing duplicate code.  
For abstraction, `IPayment` defines a contract `Pay()`, and `CashPayment` and `QRPayment` implement different behaviors while sharing the same interface.

---
