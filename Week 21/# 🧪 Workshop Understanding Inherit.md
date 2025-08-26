# 🧪 Workshop: Understanding Inheritance in ASP.NET MVC

## 🌟 Learning Objective

Use inheritance to build a **reusable model structure** for different types of animals, and display their shared and unique behaviors on a webpage.

---

## 📁 Folder Structure

```
/Models
    ├── Animal.cs         ← Base class
    ├── Dog.cs            ← Child class
    ├── Cat.cs            ← Another child class
/Controllers
    └── AnimalController.cs
/Views/Animal
    └── Index.cshtml
```

---

## ✅ Step 1: Create the Base Model

**Location:** `/Models/Animal.cs`

```csharp
namespace InheritanceDemo.Models
{
    public class Animal
    {
        public string Name { get; set; }

        public virtual string Eat()
        {
            return $"{Name} is eating.";
        }

        public virtual string Sleep()
        {
            return $"{Name} is sleeping.";
        }
    }
}
```

---

## ✅ Step 2: Create a Derived Model (Dog)

**Location:** `/Models/Dog.cs`

```csharp
namespace InheritanceDemo.Models
{
    public class Dog : Animal
    {
        public string Bark()
        {
            return $"{Name} is barking.";
        }
    }
}
```

---

## ✅ Step 3: Add Another Derived Model (Cat)

**Location:** `/Models/Cat.cs`

```csharp
namespace InheritanceDemo.Models
{
    public class Cat : Animal
    {
        public string Meow()
        {
            return $"{Name} is meowing.";
        }
    }
}
```

---

## ✅ Step 4: Create the Controller

**Location:** `/Controllers/AnimalController.cs`

```csharp
using Microsoft.AspNetCore.Mvc;
using InheritanceDemo.Models;

namespace InheritanceDemo.Controllers
{
    public class AnimalController : Controller
    {
        public IActionResult Index()
        {
            Dog dog = new Dog { Name = "Buddy" };
            Cat cat = new Cat { Name = "Luna" };

            ViewBag.DogInfo = new List<string>
            {
                dog.Eat(),
                dog.Sleep(),
                dog.Bark()
            };

            ViewBag.CatInfo = new List<string>
            {
                cat.Eat(),
                cat.Sleep(),
                cat.Meow()
            };

            return View();
        }
    }
}
```

---

## ✅ Step 5: Create the View

**Location:** `/Views/Animal/Index.cshtml`

```html
@{
    ViewData["Title"] = "Animal Inheritance Demo";
}

<h2>Dog: Buddy</h2>
<ul>
@foreach (var line in ViewBag.DogInfo as List<string>)
{
    <li>@line</li>
}
</ul>

<h2>Cat: Luna</h2>
<ul>
@foreach (var line in ViewBag.CatInfo as List<string>)
{
    <li>@line</li>
}
</ul>
```

---

## ✅ Expected Output (on `/Animal/Index`)

```
Dog: Buddy
- Buddy is eating.
- Buddy is sleeping.
- Buddy is barking.

Cat: Luna
- Luna is eating.
- Luna is sleeping.
- Luna is meowing.
```

---

## 🧩 Student Challenges

### Challenge 1:

Create a `Bird` class that inherits from `Animal` and includes a method `Fly()`.

### Challenge 2:

Add another animal such as `Elephant` that can `Trumpet()`, and render it in the view.

---

## 🧠 Summary Table

| Concept       | Explanation                                                  |
| ------------- | ------------------------------------------------------------ |
| Base Class    | General parent class (`Animal`) with common functionality    |
| Derived Class | Child class (`Dog`, `Cat`) that inherits from the base class |
| virtual       | Allows method to be overridden in derived class              |
| Inheritance   | Promotes code reuse and logical hierarchy                    |

---

## ✍️ Exam Question: Explain Inheritance with Sample Code

**Sample Answer**: See full implementation above. In this example:

* `Animal` is the base class.
* `Dog` and `Cat` inherit from `Animal`.
* They reuse `Eat()` and `Sleep()` and add unique methods like `Bark()` and `Meow()`.

---

Let me know if you'd like similar workshops for:

* **Overloading**
* **Overriding**
* **Constructors**
* **Abstraction (with interface or abstract class)**
