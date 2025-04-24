# Chapter 9: Add Validation to an ASP.NET Core MVC App

## 🎯 Objective
Apply validation attributes to ensure input correctness and enforce business rules.

---

## 📝 Instructions

### Step 1: Update Movie.cs

Add validation attributes:

```csharp
[Required]
[StringLength(60, MinimumLength = 3)]
public string? Title { get; set; }

[Required]
[Range(1, 100)]
[DataType(DataType.Currency)]
public decimal Price { get; set; }

[Required]
[RegularExpression(@"^[A-Z]+[a-zA-Z\s]*$")]
public string? Genre { get; set; }

[Required]
[RegularExpression(@"^[A-Z]+[a-zA-Z0-9"'\s-]*$")]
[StringLength(5)]
public string? Rating { get; set; }
```

### Step 2: Run the App
Try submitting invalid values and observe validation messages.

---

## 🧪 Deliverables
- Screenshots showing validation in action.
- Updated `Movie.cs` with validations.

---
