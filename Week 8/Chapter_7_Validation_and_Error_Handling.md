
# 📘 Chapter 7: Form Validation and Error Handling in ASP.NET Core MVC

## 🎯 Purpose
To teach students how to apply model validation using data annotations and handle form errors both on the client and server sides.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Choose **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcValidationWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcValidationWorkshop`).
6. Click **Next**.

#### Project Settings:
- Framework: **.NET 6.0 or later**
- Authentication: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Create a Validated Model

1. Right-click `Models` folder > Add > Class > Name it `Student.cs`.

Add the following code:
```csharp
using System.ComponentModel.DataAnnotations;

public class Student
{
    public int Id { get; set; }

    [Required(ErrorMessage = "Name is required")]
    [StringLength(50)]
    public string Name { get; set; }

    [Range(1, 120, ErrorMessage = "Age must be between 1 and 120")]
    public int Age { get; set; }

    [Required]
    [EmailAddress(ErrorMessage = "Invalid email address")]
    public string Email { get; set; }
}
```

---

### ✅ Step 3: Create Controller with GET/POST Actions

1. Right-click `Controllers` folder > Add > Controller > Empty > Name: `StudentController`

Add this code:
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

### ✅ Step 4: Create Views with Validation Support

1. Right-click `Views` > Add > New Folder > Name: `Student`

2. Create `Register.cshtml`:
```html
@model Student
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

<h2>Student Registration</h2>

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

3. Create `Success.cshtml`:
```html
@model Student

<h2>Registration Successful</h2>
<p>Name: @Model.Name</p>
<p>Age: @Model.Age</p>
<p>Email: @Model.Email</p>
```

---

### ✅ Step 5: Test the Form with Errors

- Run the app and navigate to `/Student/Register`.
- Submit an empty form or incorrect values to trigger validation.
- Try valid input and confirm redirection to the success page.

---

## 🧪 Hands-on Mini Challenge

- Add a `PhoneNumber` field to the model.
- Use `[Phone]` and `[Required]` annotations.
- Update the form and validate its behavior.

---

## 📝 Summary Notes

- Data Annotations enable easy validation rules on models.
- Use `asp-validation-for` to display error messages.
- Always check `ModelState.IsValid` before processing the data.

---

### ✅ Outcome of This Chapter
Students will:
- Apply validation rules using annotations
- Handle server-side and client-side validation
- Improve form reliability and user experience
