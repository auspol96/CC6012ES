# Chapter 11: Simple Authorization in ASP.NET Core

## 🎯 Objective
Add basic user authorization to protect pages from unauthenticated access.

---

## 📝 Instructions

### Step 1: Add [Authorize] Attribute
In `MoviesController.cs`, add:

```csharp
[Authorize]
public class MoviesController : Controller
```

Or on specific actions like `Create()`.

### Step 2: Run the App
Try accessing protected routes without logging in. You should be redirected to the login page.

---

## 🧪 Deliverables
- Screenshot showing redirection to login.
- Code with `[Authorize]` applied.

---
