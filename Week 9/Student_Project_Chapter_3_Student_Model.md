# Student Project – Chapter 3
## Creating the Student Model (No Database Yet)

---

## 🎯 Objective
By the end of this chapter, students will:

- Understand what a **Model** is in MVC
- Create a `Student` class in C#
- Use data annotations for validation
- Prepare the model for future database use (without EF Core yet)

> This chapter focuses on **C# models only** — still no database, no EF Core.

---

## 🧠 What Is a Model? (Simple Explanation)

A **Model** represents data in your application.

In real life:
- Student registration form → Student model
- One row in a table → One model object

Right now, our model is **just a C# class**.

---

## 🟦 Step 1: Create the Models Folder

1. In **Solution Explorer**
2. Right-click the project → **Add → New Folder**
3. Name it: `Models` (if it does not already exist)

---

## 🟦 Step 2: Create Student Model Class

1. Right-click **Models**
2. Add → **Class**
3. Name it: `Student.cs`
4. Click **Add**

Paste the following code:

```csharp
using System;
using System.ComponentModel.DataAnnotations;

namespace StudentMVC.Models
{
    public class Student
    {
        public int StudentId { get; set; }

        [Required]
        [StringLength(20)]
        public string StudentCode { get; set; }

        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [DataType(DataType.Date)]
        public DateTime DateOfBirth { get; set; }

        [Required]
        [StringLength(100)]
        public string Program { get; set; }

        [Range(1, 6)]
        public int YearLevel { get; set; }

        public bool IsActive { get; set; }
    }
}
```

---

## 🧠 Explanation of Key Properties

| Property | Meaning |
|--------|--------|
| `StudentId` | Unique identifier |
| `StudentCode` | University student code |
| `FullName` | Student full name |
| `Email` | Email address |
| `DateOfBirth` | Birth date |
| `Program` | Study program |
| `YearLevel` | Current year |
| `IsActive` | Active / inactive student |

---

## 🧪 Step 3: Build the Project

Press:

```
Ctrl + Shift + B
```

### Expected Result
- Build succeeds
- No warnings or errors

---

## 🧠 Important Teaching Note

At this stage:
- ❌ No database table
- ❌ No EF Core
- ❌ No migrations

The `Student` model is **pure C#**.

This separation helps students understand:
> “Model ≠ Database (yet)”

---

## ✅ Chapter Completion Checklist

✔ Student model created  
✔ Data annotations added  
✔ Project builds successfully  
✔ No database dependency  

---

## ▶️ Next Chapter

➡️ **Chapter 4: Connecting Student Model to Database Using EF Core**  
(We will carefully introduce EF Core in the next chapter)
