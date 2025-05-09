
# 📘 Chapter 5.1: Manual CRUD Setup When Scaffolding Fails

## 🎯 Purpose
To provide an alternative approach when the scaffolding tool is not working or unavailable, enabling students to manually build CRUD operations using Entity Framework Core with SQL Server.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create the Model Manually

Create `Models/Movie.cs`:
```csharp
public class Movie
{
    public int Id { get; set; }

    [Required]
    public string Title { get; set; }

    [DataType(DataType.Date)]
    public DateTime ReleaseDate { get; set; }

    [Range(1, 1000)]
    public decimal Price { get; set; }

    public string Genre { get; set; }
}
```

---

### ✅ Step 2: Create the DbContext

In `Data/MvcMovieContext.cs`:
```csharp
public class MvcMovieContext : DbContext
{
    public MvcMovieContext(DbContextOptions<MvcMovieContext> options) : base(options) { }

    public DbSet<Movie> Movies { get; set; }
}
```

Register it in `Program.cs`:
```csharp
builder.Services.AddDbContext<MvcMovieContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("MvcMovieContext")));
```

Add to `appsettings.json`:
```json
"ConnectionStrings": {
  "MvcMovieContext": "Server=(localdb)\\mssqllocaldb;Database=MvcMovieContext;Trusted_Connection=True;"
}
```

---

### ✅ Step 3: Add Migration and Create Database

Open **Package Manager Console**:
```
Add-Migration InitialCreate
Update-Database
```

---

### ✅ Step 4: Create Controller Manually

Create `Controllers/MovieController.cs` with basic CRUD operations.

---

### ✅ Step 5: Create Views Manually

Create Razor views under `Views/Movie/`:
- `Index.cshtml`
- `Create.cshtml`
- `Edit.cshtml`
- `Delete.cshtml`
- `Details.cshtml`

---

## 📝 Summary Notes

- Manual CRUD setup is a fallback when scaffolding fails.
- Students gain a clearer understanding of how MVC layers work together.
- This reinforces model binding, validation, and EF Core usage.

---

### ✅ Outcome of This Chapter
Students will:
- Successfully build CRUD operations manually
- Understand EF Core integration without relying on scaffolding
- Be prepared to troubleshoot and build full apps under constraints
