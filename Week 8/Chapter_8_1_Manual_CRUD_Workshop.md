
# 📘 Chapter 8.1: Manual CRUD Without Scaffolding in ASP.NET Core MVC

## 🎯 Purpose
To help students understand and implement full CRUD operations by manually creating controllers, views, and logic without using the Visual Studio scaffolding feature.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Select **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcManualCrudWorkshop`.
5. Choose your location (e.g., `D:\Workshop\MvcManualCrudWorkshop`).
6. Click **Next**.

#### Project Settings:
- Target Framework: **.NET 6.0 or later**
- Authentication Type: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Setup Entity Framework Core with SQL Server

In `appsettings.json`:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=StudentDb;Trusted_Connection=True;MultipleActiveResultSets=true"
}
```

In `Program.cs`:
```csharp
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

### ✅ Step 3: Create the Model

In `Models/Student.cs`:
```csharp
public class Student
{
    public int Id { get; set; }

    [Required]
    public string Name { get; set; }

    [Range(1, 120)]
    public int Age { get; set; }

    [Required]
    [EmailAddress]
    public string Email { get; set; }
}
```

---

### ✅ Step 4: Create AppDbContext

In `Data/AppDbContext.cs`:
```csharp
public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Student> Students { get; set; }
}
```

---

### ✅ Step 5: Apply Migrations

Open **Package Manager Console** and run:
```
Add-Migration InitialCreate
Update-Database
```

---

### ✅ Step 6: Manually Create the Controller

In `Controllers/StudentController.cs`:
```csharp
public class StudentController : Controller
{
    private readonly AppDbContext _context;

    public StudentController(AppDbContext context)
    {
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        return View(await _context.Students.ToListAsync());
    }

    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Create(Student student)
    {
        if (ModelState.IsValid)
        {
            _context.Add(student);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        return View(student);
    }

    public async Task<IActionResult> Edit(int id)
    {
        var student = await _context.Students.FindAsync(id);
        return View(student);
    }

    [HttpPost]
    public async Task<IActionResult> Edit(Student student)
    {
        if (ModelState.IsValid)
        {
            _context.Update(student);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        return View(student);
    }

    public async Task<IActionResult> Delete(int id)
    {
        var student = await _context.Students.FindAsync(id);
        _context.Students.Remove(student);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
    }

    public async Task<IActionResult> Details(int id)
    {
        var student = await _context.Students.FindAsync(id);
        return View(student);
    }
}
```

---

### ✅ Step 7: Create Views by Hand

1. Create `Views/Student/Index.cshtml`
2. Create `Create.cshtml`, `Edit.cshtml`, `Delete.cshtml`, and `Details.cshtml`

Example `Index.cshtml`:
```html
@model List<Student>

<h2>Student List</h2>
<a asp-action="Create">Add New</a>

<table>
    <thead>
        <tr><th>Name</th><th>Age</th><th>Email</th><th>Actions</th></tr>
    </thead>
    <tbody>
    @foreach (var s in Model)
    {
        <tr>
            <td>@s.Name</td>
            <td>@s.Age</td>
            <td>@s.Email</td>
            <td>
                <a asp-action="Edit" asp-route-id="@s.Id">Edit</a> |
                <a asp-action="Details" asp-route-id="@s.Id">Details</a> |
                <a asp-action="Delete" asp-route-id="@s.Id">Delete</a>
            </td>
        </tr>
    }
    </tbody>
</table>
```

Repeat similar steps for the rest of the views.

---

## 🧪 Hands-on Mini Challenge

- Add a `PhoneNumber` field to the model.
- Update the form views and controller logic to support it.
- Run the app and verify end-to-end manual CRUD.

---

## 📝 Summary Notes

- Manual CRUD gives you full control over logic, structure, and UI.
- You still benefit from EF Core’s database features.
- This method improves understanding of MVC responsibilities and data flow.

---

### ✅ Outcome of This Chapter
Students will:
- Perform CRUD operations without using scaffolding
- Write controller actions and Razor views from scratch
- Understand the MVC lifecycle in a more hands-on way
