
# 📘 Chapter 6: Models and Data Binding in ASP.NET Core MVC

## 🎯 Purpose
To help students understand how to create and use models in ASP.NET Core MVC and how to bind form data to models.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Create a New ASP.NET Core MVC Project

#### Instructions:
1. Open Visual Studio.
2. Go to **File > New > Project**.
3. Choose **ASP.NET Core Web App (Model-View-Controller)**.
4. Name it: `MvcModelBindingWorkshop`.
5. Choose the location (e.g., `D:\Workshop\MvcModelBindingWorkshop`).
6. Click **Next**.

#### Project Settings:
- Framework: **.NET 6.0 or later**
- Authentication: **None**
- Enable HTTPS: **Yes**
- Enable Docker: **No**

---

### ✅ Step 2: Create a Model

1. Right-click the `Models` folder > Add > Class.
2. Name it `Student.cs`.

Add the following code:
```csharp
public class Student
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Age { get; set; }
    public string Email { get; set; }
}
```

---

### ✅ Step 3: Create a Controller

1. Right-click the `Controllers` folder > Add > Controller.
2. Select **MVC Controller - Empty**.
3. Name it `StudentController`.

Add the following:
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

### ✅ Step 4: Add Views for Register and Success

1. Right-click `Views` > Add > New Folder → name it `Student`.

2. Add **Register.cshtml**:
```html
@model Student

<h2>Student Registration</h2>

<form asp-action="Register" method="post">
    <label asp-for="Name"></label>
    <input asp-for="Name" />
    <br />

    <label asp-for="Age"></label>
    <input asp-for="Age" />
    <br />

    <label asp-for="Email"></label>
    <input asp-for="Email" />
    <br />

    <button type="submit">Submit</button>
</form>
```

3. Add **Success.cshtml**:
```html
@model Student

<h2>Registration Successful!</h2>

<p>Name: @Model.Name</p>
<p>Age: @Model.Age</p>
<p>Email: @Model.Email</p>
```

---

### ✅ Step 5: Run and Test

- Start the application.
- Navigate to `/Student/Register`.
- Fill in the form and submit to see the success page with model data.

---

## 🧪 Hands-on Mini Challenge

- Add a new property `PhoneNumber` to the `Student` model.
- Update both the form and success view to include this new field.
- Test form submission again.

---

## 📝 Summary Notes

- A **Model** represents the data structure in the application.
- Model binding automatically maps form data to model properties.
- Views can be strongly typed to work directly with models.

---

### ✅ Outcome of This Chapter
Students will:
- Be able to define and use models
- Understand model binding from form to controller
- Display and process data through strongly typed views
