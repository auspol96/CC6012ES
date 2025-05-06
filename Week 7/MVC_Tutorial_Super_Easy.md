# 🎬 ASP.NET Core MVC Movie App – Super Easy Step-by-Step Guide

Welcome! This guide will help you build a simple Movie Web App using ASP.NET Core MVC. We will go step by step so you can learn and practice easily.

---

## ✅ PART 1: Create a New MVC Project

1. Open **Visual Studio 2022**
2. Click **Create a new project**
3. Choose **ASP.NET Core Web App (Model-View-Controller)**
4. Name it `MvcMovie` and choose a location
5. Select **.NET 7.0**
6. Choose **Individual Accounts** for Authentication
7. Click **Create**

---

## ✅ PART 2: Add a Controller

1. Right-click the **Controllers** folder > Add > Controller
2. Choose **MVC Controller - Empty**
3. Name it `HelloWorldController.cs`
4. Add this code:

```csharp
public class HelloWorldController : Controller
{
    public string Index()
    {
        return "This is my default action...";
    }

    public string Welcome(string name, int numTimes = 1)
    {
        return $"Hello {name}, NumTimes is: {numTimes}";
    }
}
```

5. Run the app and go to:
   - `https://localhost:xxxx/HelloWorld`
   - `https://localhost:xxxx/HelloWorld/Welcome?name=Anna&numTimes=3`

---

## ✅ PART 3: Add Views

1. Right-click **Views** folder > Add folder: `HelloWorld`
2. Right-click `Views/HelloWorld` > Add > Razor View > Name it `Index.cshtml`
3. Add this inside:

```html
@{
    ViewData["Title"] = "Index";
}
<h2>Hello from our View Template!</h2>
```

4. Update controller to return a View instead of string.

---

## ✅ PART 4: Add a Model

1. Right-click **Models** folder > Add > Class > Name it `Movie.cs`
2. Add this code:

```csharp
public class Movie
{
    public int Id { get; set; }
    public string? Title { get; set; }
    public DateTime ReleaseDate { get; set; }
    public string? Genre { get; set; }
    public decimal Price { get; set; }
}
```

---

## ✅ PART 5: Connect to a Database

1. Add a class `MvcMovieContext` inside the **Data** folder:

```csharp
public class MvcMovieContext : DbContext
{
    public MvcMovieContext(DbContextOptions<MvcMovieContext> options)
        : base(options)
    {
    }

    public DbSet<Movie> Movie { get; set; }
}
```

2. Scaffold controller:
   - Right-click Controllers > Add > Scaffolded Item
   - Choose “MVC with views using EF”
   - Model = `Movie`, DbContext = `MvcMovieContext`
   - **Leave layout path blank**
   - Click Add

3. Open **Package Manager Console** and run:

```bash
Add-Migration InitialCreate
Update-Database
```

---

## ✅ PART 6 to 12: Enhance Your App

| Part | Feature           | What to Do |
|------|-------------------|------------|
| 6    | Improve labels     | Use `[Display(Name="...")]` |
| 7    | Add search         | Use `WHERE` in LINQ |
| 8    | Add Rating field   | Add to model, view, and DB |
| 9    | Add validation     | Use `[Required]`, `[Range]` |
| 10   | Details/Delete     | Test `/Details/1`, `/Delete/1` |
| 11   | Authorization      | Use `[Authorize]` on controller |
| 12   | Identity (Login)   | Scaffold Identity and test login |

---

## 🧪 Homework

- Try each step.
- Show screenshot of your working pages.
- If stuck, ask your teacher for help!

---

Happy Coding! 🎉
