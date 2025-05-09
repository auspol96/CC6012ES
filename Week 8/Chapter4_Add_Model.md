# Chapter 4: Add a Model to an ASP.NET Core MVC App

## 🎯 Objective
Define a model class to represent and manage data.

---

## 📝 Instructions

### Step 1: Add Movie.cs Model
1. Right-click on `Models` folder > Add > Class > Name: `Movie.cs`
2. Paste the following:

```csharp
using System.ComponentModel.DataAnnotations;

namespace MvcMovie.Models
{
    public class Movie
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        [DataType(DataType.Date)]
        public DateTime ReleaseDate { get; set; }
        public string? Genre { get; set; }
        public decimal Price { get; set; }
    }
}
```

---

## 🧪 Deliverables
- `Movie.cs` code.
- Explanation of each field's purpose.

---
