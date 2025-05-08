
# 📘 Chapter 8: CRUD with Entity Framework Core and SQL Server

## 🎯 Purpose
To help students implement full Create, Read, Update, and Delete (CRUD) functionality using Entity Framework Core and SQL Server in an ASP.NET Core MVC application.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Select **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcCrudWorkshop`.
5. Choose your location (e.g., `D:\Workshop\MvcCrudWorkshop`).
6. Click **Next**.

#### Project Settings:
- Target Framework: **.NET 6.0 or later**
- Authentication Type: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Add NuGet Packages

Install the following via NuGet Package Manager or terminal:

```
Microsoft.EntityFrameworkCore.SqlServer
Microsoft.EntityFrameworkCore.Tools
```

---

### ✅ Step 3: Configure SQL Server in appsettings.json

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=StudentDb;Trusted_Connection=True;MultipleActiveResultSets=true"
}
```

---

### ✅ Step 4: Create the Student Model

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

### ✅ Step 5: Create AppDbContext

```csharp
public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Student> Students { get; set; }
}
```

In `Program.cs`:
```csharp
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

### ✅ Step 6: Scaffold the Controller and Views

1. Right-click `Controllers` > Add > New Scaffolded Item.
2. Select **MVC Controller with views, using Entity Framework**.
3. Model class: `Student`
4. Data context class: `AppDbContext`
5. Click **Add**

---

### ✅ Step 7: Apply Migrations

1. Open Package Manager Console
2. Run:
```
Add-Migration InitialCreate
Update-Database
```

This creates the database and `Students` table.

---

### ✅ Step 8: Test the App

- Run the project and navigate to `/Student`.
- You should see a full CRUD interface: Create, List, Edit, Details, Delete.

---

## 🧪 Hands-on Mini Challenge

- Add a new field `PhoneNumber` to the Student model.
- Scaffold again or manually update the form/view.
- Apply a new migration and update the database.

---

## 📝 Summary Notes

- Entity Framework Core simplifies database access and operations.
- SQL Server LocalDB integrates easily with Visual Studio.
- Scaffolding generates working UI for CRUD operations.

---

### ✅ Outcome of This Chapter
Students will:
- Connect an MVC app to SQL Server using EF Core
- Use migrations to create and update a database
- Implement full CRUD operations using a scaffolded interface
