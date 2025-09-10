# 🛠 Workshop: Constructor and Abstraction (~30 mins)

---

## 📘 Concept
- **Constructor Chaining**: เรียก constructor อื่นในคลาสเดียวกัน เพื่อลดการเขียนโค้ดซ้ำ  
- **Abstraction**: ใช้ `abstract class` หรือ `interface` เพื่อซ่อนรายละเอียด และกำหนดสัญญา (contract)  

---

## Part 1: Constructor Chaining

### 🛠 Step 1: Create Student Class

```csharp
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
```

---

### 🛠 Step 2: Usage Example

```csharp
var s1 = new Student();               // Name = "New Student", Grade = 7
var s2 = new Student("Somchai");      // Name = "Somchai", Grade = 7
var s3 = new Student("Suda", 9);      // Name = "Suda", Grade = 9
```

---

## Part 2: Abstraction (Interface + Abstract Class)

### 🛠 Step 1: Define Payment Contract

```csharp
// Interface
public interface IPayment
{
    void Pay(decimal amount);
}
```

---

### 🛠 Step 2: Implement Different Payment Types

```csharp
public class CashPayment : IPayment
{
    public void Pay(decimal amount)
    {
        Console.WriteLine($"Paid {amount} by Cash.");
    }
}

public class QRPayment : IPayment
{
    public void Pay(decimal amount)
    {
        Console.WriteLine($"Paid {amount} by QR Code.");
    }
}
```

---

### 🛠 Step 3: Use in MVC Controller

```csharp
public class PaymentController : Controller
{
    public IActionResult Index()
    {
        IPayment cash = new CashPayment();
        IPayment qr = new QRPayment();

        ViewBag.CashResult = CaptureOutput(() => cash.Pay(100));
        ViewBag.QrResult = CaptureOutput(() => qr.Pay(200));

        return View();
    }

    private string CaptureOutput(Action action)
    {
        using (var writer = new StringWriter())
        {
            Console.SetOut(writer);
            action();
            return writer.ToString();
        }
    }
}
```

---

### 🛠 Step 4: Display in View

**Index.cshtml**
```html
<h2>Payment System Demo</h2>
<p>Cash Payment: @ViewBag.CashResult</p>
<p>QR Payment: @ViewBag.QrResult</p>
```

---

## 🎯 Exercises
1. เพิ่ม `CreditCardPayment` ที่จ่ายด้วยบัตรเครดิต.  
2. เพิ่ม `BankTransferPayment` ที่จ่ายด้วยโอนเงิน.  
3. ใช้ constructor chaining สร้าง Student ที่มีค่า default เป็นชื่อ + grade ที่สมจริงกว่านี้ (เช่น `"Freshman", 7`).  

---
