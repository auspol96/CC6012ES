# 🧪 Workshop: Understanding Overriding in ASP.NET MVC

---

🌟 **Learning Objective**  
Use method overriding to customize behaviors of derived classes, and display their unique outputs on a webpage.

📘 **What is Overriding?**  
Overriding is a concept in object-oriented programming that allows a derived class to provide a new implementation for a method defined in its base class.  
- The base method must be marked as `virtual`.  
- The derived method must use `override`.  

Overriding (การเขียนทับเมธอด) คือการที่ **คลาสลูก** เขียนทับการทำงานของ **คลาสแม่** เพื่อเปลี่ยนพฤติกรรมของเมธอดนั้น ๆ ให้เหมาะสมกับคลาสลูก

---

📁 **Folder Structure**
```
/Models
    ├── Animal.cs         ← Base class
    ├── Dog.cs            ← Derived class
    ├── Cat.cs            ← Another derived class
/Controllers
    └── AnimalController.cs
/Views/Animal
    └── Index.cshtml
```

---

✅ **Step 1: Create the Base Model**  
**Location**: `/Models/Animal.cs`

```csharp
namespace OverridingDemo.Models
{
    public class Animal
    {
        public string Name { get; set; }

        public virtual string Speak()
        {
            return $"{Name} makes a sound.";
        }
    }
}
```

---

✅ **Step 2: Create Derived Models (Dog, Cat)**  
**Location**: `/Models/Dog.cs`

```csharp
namespace OverridingDemo.Models
{
    public class Dog : Animal
    {
        public override string Speak()
        {
            return $"{Name} says Woof!";
        }
    }
}
```

**Location**: `/Models/Cat.cs`

```csharp
namespace OverridingDemo.Models
{
    public class Cat : Animal
    {
        public override string Speak()
        {
            return $"{Name} says Meow!";
        }
    }
}
```

---

✅ **Step 3: Create the Controller**  
**Location**: `/Controllers/AnimalController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using OverridingDemo.Models;

namespace OverridingDemo.Controllers
{
    public class AnimalController : Controller
    {
        public IActionResult Index()
        {
            Dog dog = new Dog { Name = "Buddy" };
            Cat cat = new Cat { Name = "Luna" };

            ViewBag.DogSpeak = dog.Speak();
            ViewBag.CatSpeak = cat.Speak();

            return View();
        }
    }
}
```

---

✅ **Step 4: Create the View**  
**Location**: `/Views/Animal/Index.cshtml`

```html
@{
    ViewData["Title"] = "Animal Overriding Demo";
}

<h2>Dog: Buddy</h2>
<p>@ViewBag.DogSpeak</p>

<h2>Cat: Luna</h2>
<p>@ViewBag.CatSpeak</p>
```

---

✅ **Expected Output (on /Animal/Index)**
```
Dog: Buddy
Buddy says Woof!

Cat: Luna
Luna says Meow!
```

---

🧩 **Student Challenges**
1. Create a `Bird` class that overrides `Speak()` → `"Tweet Tweet"`.  
2. Add an `Elephant` class that overrides `Speak()` → `"Trumpet!"`, and render it in the view.  

---

🧠 **Summary Table**

| Concept     | Explanation |
|-------------|-------------|
| Base Class  | General parent class (Animal) with a virtual method |
| Derived Class | Child class (Dog, Cat) that overrides the base method |
| virtual     | Marks method as overridable |
| override    | Replaces base method behavior in derived class |

---

✍️ **Exam Question**  
**Explain Overriding with Sample Code.**  

*Sample Answer*:  
In this example, `Animal` is the base class with a virtual method `Speak()`.  
`Dog` and `Cat` override this method with their own behavior, resulting in `"Woof!"` and `"Meow!"` instead of the generic `"makes a sound."`

---
