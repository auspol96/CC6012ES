# Chapter 6: Controller Methods and Views in ASP.NET Core

## 🎯 Objective
Improve display formatting and update views with clean labels.

---

## 📝 Instructions

### Step 1: Update Model Display Attributes
Edit `Movie.cs` to format ReleaseDate and Price:

```csharp
[Display(Name = "Release Date")]
[DataType(DataType.Date)]
public DateTime ReleaseDate { get; set; }

[Column(TypeName = "decimal(18, 2)")]
public decimal Price { get; set; }
```

### Step 2: Run and Verify
- Open your Movies Index page.
- Confirm updated labels and formatting are applied.

---

## 🧪 Deliverables
- Screenshot of the updated Movie list view.
- Updated `Movie.cs` model.

---
