# Student Project – Chapter 5
## Displaying Student List (Read-Only)

---

## 🎯 Objective
By the end of this chapter, students will be able to:

- Create a controller that reads data from the database
- Use EF Core to retrieve records (READ only)
- Pass data from Controller to View
- Display student data in a table using Razor

> This chapter is **READ-ONLY**.  
> No insert, update, or delete yet.

---

## 🧠 Big Picture

MVC data flow:

```
Browser → Controller → EF Core → SQL Server
SQL Server → EF Core → Controller → View → Browser
```

This chapter proves that:
> “MVC + EF Core + Database are correctly connected.”

---

## 🟦 Step 1: Create StudentController

1. Right-click **Controllers**
2. Add → **Controller**
3. Choose **MVC Controller – Empty**
4. Name it: `StudentController`

Replace the code with:

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StudentMVC.Data;

namespace StudentMVC.Controllers
{
    public class StudentController : Controller
    {
        private readonly ApplicationDbContext _context;

        public StudentController(ApplicationDbContext context)
        {
            _context = context;
        }

        // READ ONLY
        public async Task<IActionResult> Index()
        {
            var students = await _context.Students.ToListAsync();
            return View(students);
        }
    }
}
```

---

## 🟦 Step 2: Create Student Index View

1. Right-click **Views**
2. Add Folder → `Student`
3. Right-click `Student` folder
4. Add → View
5. Name: `Index`
6. Choose **Razor View**
7. Click **Add**

Paste the following code:

```razor
@model IEnumerable<StudentMVC.Models.Student>

<h2>Student List</h2>

<table border="1">
    <thead>
        <tr>
            <th>Student Code</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Program</th>
            <th>Year</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    @foreach (var student in Model)
    {
        <tr>
            <td>@student.StudentCode</td>
            <td>@student.FullName</td>
            <td>@student.Email</td>
            <td>@student.Program</td>
            <td>@student.YearLevel</td>
            <td>@(student.IsActive ? "Active" : "Inactive")</td>
        </tr>
    }
    </tbody>
</table>
```

---

## 🧪 Step 3: Run and Test

Run the project and navigate to:

```
https://localhost:xxxx/Student
```

### Expected Result
- Student list displayed
- Data comes from SQL Server
- No errors

---

## ⚠️ Common Issues & Fixes

### ❌ Error: Cannot resolve DbContext
✔ Ensure `ApplicationDbContext` is registered in `Program.cs`

### ❌ Error: Invalid object name 'Students'
✔ Ensure database table name is `Students`
✔ Ensure connection string points to `StudentDB`

---

## 🧠 Teaching Tip

Emphasize to students:

> “This page is proof that our system is wired correctly.”

If READ works:
- CREATE will work later
- UPDATE will work later
- DELETE will work later

---

## ✅ Chapter Completion Checklist

✔ StudentController created  
✔ EF Core query executed  
✔ Data displayed in View  
✔ No data modification  

---

## ▶️ Next Chapter

➡️ **Chapter 6: Creating New Student Records (Create Form + POST)**
