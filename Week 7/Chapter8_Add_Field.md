# Chapter 8: Add a New Field to an ASP.NET Core MVC App

## 🎯 Objective
Add a new property `Rating` to the `Movie` model and update the database and views accordingly.

---

## 📝 Instructions

### Step 1: Update Movie.cs
Add a `Rating` property:

```csharp
public string? Rating { get; set; }
```

### Step 2: Update Controller
Add `Rating` to the `[Bind]` attribute in `Create` and `Edit` actions:

```csharp
[Bind("Id,Title,ReleaseDate,Genre,Price,Rating")]
```

### Step 3: Update Views
Add `Rating` fields to:
- `Index.cshtml`
- `Create.cshtml`
- `Edit.cshtml`

### Step 4: Update Database
Run these commands:

```powershell
Add-Migration Rating
Update-Database
```

---

## 🧪 Deliverables
- Screenshots showing the `Rating` field in the UI.
- Migration file and updated model.

---
