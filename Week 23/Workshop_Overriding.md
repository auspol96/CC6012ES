# 🧪 Workshop: Overriding in MVC (~30 mins)

---

## 📘 Concept
- **Overriding** คือการเขียน method ทับ (override) method ที่มีอยู่ในคลาสแม่ (Base Class)  
- ต้องใช้ `virtual` ที่คลาสแม่ และ `override` ที่คลาสลูก  

---

## 🛠 Step 1: Create Base Class

```csharp
public class Animal
{
    public virtual void Speak()
    {
        Console.WriteLine("Some generic animal sound");
    }
}
```

---

## 🛠 Step 2: Create Derived Classes

```csharp
public class Dog : Animal
{
    public override void Speak()
    {
        Console.WriteLine("Woof Woof");
    }
}

public class Cat : Animal
{
    public override void Speak()
    {
        Console.WriteLine("Meow Meow");
    }
}
```

---

## 🛠 Step 3: Use in MVC Controller

```csharp
public class AnimalController : Controller
{
    public IActionResult Index()
    {
        Animal dog = new Dog();
        Animal cat = new Cat();

        ViewBag.DogSound = CaptureOutput(() => dog.Speak());
        ViewBag.CatSound = CaptureOutput(() => cat.Speak());

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

## 🛠 Step 4: Display in View

**Index.cshtml**
```html
<h2>Overriding Demo</h2>
<p>Dog says: @ViewBag.DogSound</p>
<p>Cat says: @ViewBag.CatSound</p>
```

---

## 🎯 Exercises
1. เพิ่มคลาส `Bird` ที่ override `Speak()` เป็น `"Tweet Tweet"`.  
2. แสดงผลใน View เช่นเดียวกับ Dog และ Cat.  

---
