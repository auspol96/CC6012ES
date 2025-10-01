
# Week 12: ASP.NET Core MVC – Inheritance, Overloading, Overriding

This week, we will strengthen your understanding of object-oriented programming (OOP) in C# through **hands-on exercises** using **ASP.NET Core MVC**. You’ll apply concepts of **inheritance**, **overloading**, and **overriding** within controller logic and views.

---

## 🧪 Exercise 1: Method Overloading

### Objective:
Demonstrate method overloading in a controller by using multiple methods with the same name but different parameters.

### Instructions:
1. Create a new controller named `PrinterController`.
2. In this controller, create the following overloaded methods named `Print`:

```csharp
public string Print()
{
    return "Hello World";
}

public string Print(string message)
{
    return $"Message: {message}";
}

public string Print(int count)
{
    return $"Number of Copies: {count}";
}
```

3. Create an action method `Index()` in the controller to call all three methods.
4. Display the result using `ViewBag` or `ViewData` in the View.

### Expecting Output:
On the browser, visiting `/Printer` should show:
```
Hello World
Message: Welcome to Overloading
Number of Copies: 5
```

---

## 🧪 Exercise 2: Inheritance and Overriding

### Objective:
Understand inheritance and method overriding using a base and a derived class.

### Instructions:
1. Create a class `Printer` with a method `Print()` returning a string like `"Parent: I am the base class."`
2. Create a class `ColorPrinter` that inherits from `Printer` and overrides `Print()` to return `"Child: I am the overridden method from the child class."`
3. In your `InheritanceController`, create an action method `Index()` where:
   - You instantiate both `Printer` and `ColorPrinter`
   - Call the `Print()` method on each
4. Pass the outputs to the View using `ViewBag` or model binding.
5. Create a Razor view (`Index.cshtml`) to display the result.

### Expecting Output:
On the browser, visiting `/Inheritance` should show:
```
Parent: I am the base class.
Child: I am the overridden method from the child class.
```

---

Happy coding! 🎯
