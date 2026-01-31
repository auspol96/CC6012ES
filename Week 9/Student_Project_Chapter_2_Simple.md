# Student Project – Chapter 2 (Simplified & Safe Version)
## Creating MVC Project and Running Without Database

---

## 🎯 Objective
By the end of this chapter, students will:

- Create a clean ASP.NET Core MVC project
- Understand project structure (Controllers, Models, Views)
- Run the project successfully **without database or EF Core**
- Avoid configuration errors and tooling issues

> This chapter is intentionally SIMPLE to prevent unnecessary problems.

---

## 🧠 Teaching Note (Important)
In real projects, adding database and EF Core too early can cause confusion.
So in this chapter:

❌ No SQL Server  
❌ No EF Core  
❌ No DbContext  

✅ Focus only on MVC fundamentals

---

## 🟦 Step 1: Create a New MVC Project

1. Open **Visual Studio**
2. Click **Create a new project**
3. Choose **ASP.NET Core Web App (Model-View-Controller)**
4. Click **Next**

### Project Settings
- **Project Name:** `StudentMVC`
- **Solution Name:** `StudentMVC`
- **Location:** Any folder
- Click **Next**

### Additional Settings
- **Framework:** .NET 7.0
- **Authentication:** None
- **Configure for HTTPS:** ✔
- **Enable Docker:** ❌

Click **Create**.

---

## 🟦 Step 2: Understand Project Structure

Open **Solution Explorer** and observe:

```
StudentMVC
├── Controllers
│   └── HomeController.cs
├── Models
├── Views
│   ├── Home
│   │   └── Index.cshtml
│   └── Shared
├── wwwroot
├── Program.cs
└── appsettings.json
```

### Explanation
- **Controllers**: Handle requests
- **Models**: Hold data (later)
- **Views**: UI pages
- **Program.cs**: App startup

---

## 🟦 Step 3: Run the Project

Press **F5** or click **▶ Run**.

### Expected Result
- Browser opens
- Default MVC Home page is displayed
- No errors

If this step fails, STOP and fix before continuing.

---

## 🟦 Step 4: Create Your First Controller (StudentController)

1. Right-click **Controllers**
2. Add → Controller
3. Choose **MVC Controller – Empty**
4. Name it: `StudentController`

Paste this code:

```csharp
using Microsoft.AspNetCore.Mvc;

namespace StudentMVC.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
```

---

## 🟦 Step 5: Create Student View

1. Right-click **Views**
2. Add Folder → name it `Student`
3. Right-click `Student` folder
4. Add → View
5. Name: `Index`
6. Choose **Razor View**
7. Click **Add**

Paste this content:

```html
<h2>Student List</h2>

<p>This page will show students in future chapters.</p>
```

---

## 🧪 Step 6: Test the Page

Run the project and go to:

```
https://localhost:xxxx/Student
```

You should see:

```
Student List
This page will show students in future chapters.
```

---

## ✅ Chapter Completion Checklist

✔ MVC project created  
✔ Project runs successfully  
✔ StudentController created  
✔ Student view displayed  
✔ No database involved  

---

## ▶️ What’s Next

➡️ **Chapter 3: Adding Student Model (No Database Yet)**  
➡️ **Chapter 4: Introducing Database and EF Core (Carefully)**

We build complexity **step by step**.
