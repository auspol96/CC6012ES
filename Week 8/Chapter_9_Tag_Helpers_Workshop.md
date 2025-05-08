
# 📘 Chapter 9: Razor Tag Helpers in ASP.NET Core MVC

## 🎯 Purpose
To help students understand and apply Razor Tag Helpers, which simplify HTML generation and improve integration between the Razor view and server-side C# logic.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Choose **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcTagHelpersWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcTagHelpersWorkshop`).
6. Click **Next**.

#### Project Settings:
- Target Framework: **.NET 6.0 or later**
- Authentication: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Setup the Model

Add `Student.cs` in the `Models` folder:

```csharp
public class Student
{
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Name { get; set; }

    [Range(1, 120)]
    public int Age { get; set; }

    [Required]
    [EmailAddress]
    public string Email { get; set; }
}
```

---

### ✅ Step 3: Create a Controller

Add `StudentController.cs` in the `Controllers` folder:

```csharp
public class StudentController : Controller
{
    public IActionResult Register()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Register(Student student)
    {
        if (ModelState.IsValid)
        {
            return View("Success", student);
        }

        return View(student);
    }
}
```

---

### ✅ Step 4: Use Razor Tag Helpers in View

Add `Register.cshtml` under `Views/Student`:

```html
@model Student
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Register Student</h2>

<form asp-action="Register" method="post">
    <div>
        <label asp-for="Name"></label>
        <input asp-for="Name" />
        <span asp-validation-for="Name" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Age"></label>
        <input asp-for="Age" />
        <span asp-validation-for="Age" class="text-danger"></span>
    </div>

    <div>
        <label asp-for="Email"></label>
        <input asp-for="Email" />
        <span asp-validation-for="Email" class="text-danger"></span>
    </div>

    <button type="submit">Submit</button>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

---

### ✅ Step 5: Create Success View

Add `Success.cshtml` under `Views/Student`:

```html
@model Student

<h2>Registration Successful</h2>

<p>Name: @Model.Name</p>
<p>Age: @Model.Age</p>
<p>Email: @Model.Email</p>
```

---

## 🧪 Hands-on Mini Challenge

- Add a new field `PhoneNumber` in the model.
- Add `asp-for` input and validation in the form.
- Observe how the form binds directly to the model with minimal code.

---

## 📝 Summary Notes

- Razor Tag Helpers provide a clean, readable way to generate dynamic HTML.
- `asp-for`, `asp-action`, and `asp-validation-for` are the most commonly used helpers.
- They help reduce manual code and improve maintainability.

---

### ✅ Outcome of This Chapter
Students will:
- Understand how Tag Helpers work
- Use `asp-for`, `asp-action`, `asp-controller`, and `asp-validation-for`
- Create form-based UIs that bind directly to models
