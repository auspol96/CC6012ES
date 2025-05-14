
# 📘 Chapter 3: Defining the Movie Model and ApplicationDBContext

---

## 🎯 Objective

By the end of this chapter, students will be able to:
- Create a model class that represents a table in the database
- Create a DbContext class that allows Entity Framework to interact with the database
- Understand the mapping between models and database tables

---

## ✅ Step 1: Create the Model Class (Movie.cs)

1. Navigate to the `Models` folder. If it doesn't exist, create one.
2. Add a new class file called `Movie.cs`.

Paste the following code:

```csharp
using System;
using System.ComponentModel.DataAnnotations;

namespace MvcMovie.Models
{
    public class Movie
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, MinimumLength = 2)]
        public string Title { get; set; }

        [Display(Name = "Release Date")]
        [DataType(DataType.Date)]
        public DateTime ReleaseDate { get; set; }

        [Range(1, 500, ErrorMessage = "Price must be between 1 and 500.")]
        public decimal Price { get; set; }

        [RegularExpression(@"^[A-Z]+[a-zA-Z]*$", ErrorMessage = "Genre must start with a capital letter.")]
        public string Genre { get; set; }
    }
}
```

---

## ✅ Step 2: Create the Database Context (ApplicationDBContext.cs)

1. Navigate to the `Data` folder. Create it if it doesn't exist.
2. Add a new class file named `ApplicationDBContext.cs`.

Paste the following code:

```csharp
using Microsoft.EntityFrameworkCore;
using MvcMovie.Models;

namespace MvcMovie.Data
{
    public class ApplicationDBContext : DbContext
    {
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options)
        {
        }

        public DbSet<Movie> Movies { get; set; }
    }
}
```

📌 This class connects your model to the database and enables EF Core to perform operations such as create, read, update, and delete.

---

## 🧪 Validation

- Press `Ctrl + Shift + B` to build the project
- Ensure there are **no red squiggly lines or errors** in `Movie.cs` or `ApplicationDBContext.cs`

---

## 🎯 Expected Result

By the end of this chapter:
- You will have defined a `Movie` model with appropriate data annotations
- You created `ApplicationDBContext` and linked it to the `Movie` model
- Your application is ready for migrations

➡️ Proceed to Chapter 4 to generate and apply migrations to build your database.
