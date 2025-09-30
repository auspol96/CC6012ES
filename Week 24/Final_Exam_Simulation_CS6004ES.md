
# 🧪 Final Exam Simulation – CS6004ES (LMU)

**Date:** 2025-09-30  
**Module:** Application Development (ASP.NET Core MVC + OOP)  
**Duration:** 3 Hours  
**Format:** Hands-on Programming + Theory

---

## ✅ Part A – Practical Coding (2 Tasks)

### 🔹 Exercise 1: Book Management (Method Overloading)

#### 🎯 Goal:
Reinforce ASP.NET Core MVC and Method Overloading.

#### 📝 Instructions:
1. Create a model `Book` with the following properties:
    - `Title`
    - `Author`
    - `Price`
2. Create a controller `BookController`:
    - `Index()` → Returns a list of 3 sample books to the view.
    - `Discount()` → Apply default 10% discount.
    - `Discount(float percent)` → Overloaded to apply a custom discount.

3. Create a Razor view (`Index.cshtml`) to display the list of books.

#### ✅ Bonus:
Use `Debug.WriteLine()` to output old vs new prices in the backend.

---

### 🔹 Exercise 2: Student Grading System (Inheritance + Overriding)

#### 🎯 Goal:
Understand how inheritance and method overriding affect logic flow.

#### 📝 Instructions:

```csharp
// Base class
public class Student
{
    public string Name;
    public virtual string GetGrade(int score)
    {
        return score >= 50 ? "Pass" : "Fail";
    }
}

// Derived class
public class Postgraduate : Student
{
    public override string GetGrade(int score)
    {
        return score >= 60 ? "Pass" : "Fail";
    }
}
```

#### 👨‍💻 In Controller:

```csharp
Student s = new Student { Name = "John" };
Postgraduate p = new Postgraduate { Name = "Anna" };

Console.WriteLine($"{s.Name}: {s.GetGrade(55)}");  // Output: Pass
Console.WriteLine($"{p.Name}: {p.GetGrade(55)}");  // Output: Fail
```

Create a route `/Grading` that runs this logic and shows results.

---

## 📝 Part B – Theory & Concepts

### ✅ Multiple Choice (Choose One Correct Answer)

1. Which access modifier allows method overriding?
   - a. private
   - b. protected
   - c. static
   - d. sealed

2. Which statement is true about method overloading?
   - a. Methods must have different names  
   - b. Methods must have different return types  
   - c. Methods must have different parameter lists  
   - d. All overloaded methods must be in different classes  

3. Which keyword is required to override a method in a derived class?
   - a. abstract
   - b. override
   - c. sealed
   - d. static

4. What is the purpose of the `virtual` keyword?
   - a. Makes a class abstract
   - b. Prevents method overriding
   - c. Allows a method to be overridden
   - d. Converts method to static

### ✍️ Short Answer Questions

1. Explain the difference between method overloading and method overriding.

2. Give one real-world example of inheritance.

3. What is the role of a constructor in a class?

4. Why do we use abstraction in software design?

---

## 📘 Submission Instructions

- Ensure you push your code to GitHub.
- Use the folder structure:
  ```
  /FinalExamSimulation
      /Controllers
      /Models
      /Views
      /Readme.md
  ```

---

## 🙌 Good Luck!
