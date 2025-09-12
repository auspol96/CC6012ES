# 🧪 Workshop: Understanding Abstraction in ASP.NET MVC

---

🌟 **Learning Objective**  
Understand the concept of Abstraction, learn how to define abstract classes and interfaces in C#, and compare with the same scenario without abstraction.

📘 **What is Abstraction?**  
- Abstraction is the process of **hiding internal details** and exposing only essential features.  
- In C#, abstraction is achieved using **abstract classes** or **interfaces**.  
- It provides a **contract** for subclasses to follow, making code more maintainable and scalable.  

Abstraction (การทำให้นามธรรม) คือการซ่อนรายละเอียด และบังคับให้ subclass ต้อง implement methods ที่กำหนดไว้  

---

📁 **Folder Structure**
```
/Models
    ├── Payment.cs           ← Abstract class
    ├── CashPayment.cs       ← Subclass
    ├── CreditCardPayment.cs ← Subclass
/Controllers
    └── PaymentController.cs
/Views/Payment
    └── Index.cshtml
```

---

## ✅ Step 1: Without Abstraction (no base class)

**Location**: `/Models/CashPayment.cs`
```csharp
namespace AbstractionDemo.Models
{
    public class CashPayment
    {
        public string Pay(decimal amount)
        {
            return $"Paid {amount} in cash.";
        }
    }
}
```

**Location**: `/Models/CreditCardPayment.cs`
```csharp
namespace AbstractionDemo.Models
{
    public class CreditCardPayment
    {
        public string Pay(decimal amount)
        {
            return $"Paid {amount} by credit card.";
        }
    }
}
```

👉 Issue:  
- No common contract (แต่ละ class เขียนเองหมด)  
- If we add `QRPayment` or `BankTransferPayment`, controller code must change each time  

---

## ✅ Step 2: With Abstraction (using abstract class)

**Location**: `/Models/Payment.cs`
```csharp
namespace AbstractionDemo.Models
{
    public abstract class Payment
    {
        // abstract method → subclass must implement
        public abstract string Pay(decimal amount);

        // normal method → can be reused by all subclasses
        public string PrintReceipt()
        {
            return "Receipt printed.";
        }
    }
}
```

**Location**: `/Models/CashPayment.cs`
```csharp
namespace AbstractionDemo.Models
{
    public class CashPayment : Payment
    {
        public override string Pay(decimal amount)
        {
            return $"Paid {amount} in cash.";
        }
    }
}
```

**Location**: `/Models/CreditCardPayment.cs`
```csharp
namespace AbstractionDemo.Models
{
    public class CreditCardPayment : Payment
    {
        public override string Pay(decimal amount)
        {
            return $"Paid {amount} by credit card.";
        }
    }
}
```

---

## ✅ Step 3: Create the Controller
**Location**: `/Controllers/PaymentController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using AbstractionDemo.Models;

namespace AbstractionDemo.Controllers
{
    public class PaymentController : Controller
    {
        public IActionResult Index()
        {
            List<Payment> payments = new List<Payment>
            {
                new CashPayment(),
                new CreditCardPayment()
            };

            ViewBag.Results = payments.Select(p => p.Pay(100)).ToList();

            return View();
        }
    }
}
```

---

## ✅ Step 4: Create the View
**Location**: `/Views/Payment/Index.cshtml`

```html
@{
    ViewData["Title"] = "Abstraction Demo";
}

<h2>Payment Results</h2>
<ul>
@foreach (var result in ViewBag.Results as List<string>)
{
    <li>@result</li>
}
</ul>
```

---

## ✅ Expected Output (on /Payment/Index)
```
Payment Results
- Paid 100 in cash.
- Paid 100 by credit card.
```

---

🧩 **Student Challenges**
1. Add `QRPayment` class that implements payment via QR Code.  
2. Add `BankTransferPayment` class that implements payment via Bank Transfer.  
3. Add another abstract method in `Payment` such as `Refund(decimal amount)` and implement it in all subclasses.  

---

🧠 **Summary Table**

| Concept           | Explanation |
|-------------------|-------------|
| Abstract class    | Class that cannot be instantiated; may include abstract and normal methods |
| Abstract method   | Declared without body → must be implemented by subclass |
| Without Abstraction | No contract, harder to maintain |
| With Abstraction  | Clear contract, easier to extend and reuse |

---

✍️ **Exam Question**  
**Explain Abstraction with an example. Compare between using and not using abstraction in a Payment system.**  

✅ *Sample Answer*:  
Without abstraction, each payment class (`CashPayment`, `CreditCardPayment`) defines its own `Pay()` method with no shared contract, leading to duplicated logic.  
With abstraction, a base class `Payment` defines the abstract method `Pay()`. All subclasses must implement this, ensuring consistency. This allows storing all payments in a single `List<Payment>` and makes the system easier to extend.

---
