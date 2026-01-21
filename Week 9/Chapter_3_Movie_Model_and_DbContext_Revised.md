# Chapter 3: Defining the Movie Model and DbContext (REVISED & ALIGNED)
🗓 Week 9 Continued

---

## 🎯 Objective

By the end of this chapter, students will be able to:

- Create a **Model class** that represents a database table
- Understand how **EF Core maps Models to tables**
- Extend the existing **ApplicationDbContext**
- Correctly link Models to EF Core without errors
- Prepare the project for **database migrations**

> ⚠️ This chapter assumes **Chapter 2 was completed successfully**  
> (`ApplicationDbContext` already exists and is registered in `Program.cs`)

---

## ⚠️ Important Naming Rule (READ FIRST)

> **All namespaces must match your project name exactly.**

In this course, we use:

```
Project name: WebApplication1
```

So we will use:
- `WebApplication1.Models`
- `WebApplication1.Data`

❌ Do NOT use:
- `MvcMovie.Models`
- `MvcMovie.Data`

(unless your project is actually named `MvcMovie`)

---

## ✅ Step 1: Create the Model Class (`Movie.cs`)

### 1.1 Navigate to the Models Folder

In **Solution Explorer**:
- Locate the `Models` folder  
- If it does not exist:  
  ```
  Right-click project → Add → New Folder → Name: Models
  ```

---

### 1.2 Create `Movie.cs`

Inside the `Models` folder:
```
Right-click → Add → Class → Name: Movie.cs
```

---

### 1.3 Add the Movie Model Code

📄 **Models/Movie.cs**

```csharp
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class Movie
    {
        public int Id { get; set; }   // Primary Key

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, MinimumLength = 2)]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Release Date")]
        [DataType(DataType.Date)]
        public DateTime ReleaseDate { get; set; }

        [Range(1, 500, ErrorMessage = "Price must be between 1 and 500.")]
        public decimal Price { get; set; }

        [RegularExpression(@"^[A-Z]+[a-zA-Z]*$", 
            ErrorMessage = "Genre must start with a capital letter.")]
        public string Genre { get; set; } = string.Empty;
    }
}
```

### 🧠 Explanation (Simple)

| Element | Meaning |
|------|--------|
| `Movie` | Table name (Movies) |
| `Id` | Primary key |
| Data Annotations | Validation rules |
| Properties | Table columns |

---

## ✅ Step 2: Update the Existing `ApplicationDbContext`

⚠️ **DO NOT create a new DbContext file**  
You already created `ApplicationDbContext` in **Chapter 2**.

---

### 2.1 Open Existing DbContext

Open:

```
Data/ApplicationDbContext.cs
```

---

### 2.2 Add `DbSet<Movie>`

📄 **Data/ApplicationDbContext.cs**

```csharp
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(
            DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Movie> Movies { get; set; }
    }
}
```

### 🧠 What this does

- `DbSet<Movie>` tells EF Core:
  > “Create a Movies table based on the Movie model”

---

## 🧪 Step 3: Validation (MUST PASS)

1. Build the project:
```
Ctrl + Shift + B
```

2. Confirm:
- No red errors
- No namespace warnings
- No duplicate DbContext files

---

## 🎯 Expected Result

By the end of this chapter, students should have:

✔ A `Movie` model with validation rules  
✔ `ApplicationDbContext` updated correctly  
✔ Proper mapping between Model and DbContext  
✔ Project ready for EF Core migrations  

---

## 🧠 Common Student Errors (Explain in Class)

| Error | Cause |
|----|----|
| Namespace not found | Wrong project name |
| ApplicationDBContext | Wrong casing |
| Duplicate DbContext | Created a second file |
| Model not found | Missing `using Models` |

---

➡️ **Proceed to Chapter 4:**  
_Creating and Applying EF Core Migrations_

✅ **End of Chapter 3**
