### Chapter 02 – Creating ApplicationDbContext and the Shipping Model

In this chapter, we will:
1. Create the `Shipping` model class.
2. Create the `ApplicationDbContext` class.
3. Register the DB context in `Program.cs`.
4. Apply migrations and update the database.

---

#### ✅ Step 1: Create the Shipping Model

**File:** `Models/ShippingRequest.cs`

```csharp
using System;
using System.ComponentModel.DataAnnotations;

namespace ShippingApp.Models
{
    public class ShippingRequest
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "From Location")]
        public string FromLocation { get; set; }

        [Required]
        [Display(Name = "To Location")]
        public string ToLocation { get; set; }

        [Required]
        [Display(Name = "Item Description")]
        public string ItemDescription { get; set; }

        [Required]
        [Display(Name = "Weight (kg)")]
        public double Weight { get; set; }
    }
}
```

---

#### ✅ Step 2: Create ApplicationDbContext

**File:** `Data/ApplicationDbContext.cs`

```csharp
using Microsoft.EntityFrameworkCore;
using ShippingApp.Models;

namespace ShippingApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<ShippingRequest> ShippingRequests { get; set; }
    }
}

```

---

#### ✅ Step 3: Register DbContext in Program.cs

**File:** `Program.cs`

Add this at the top:
```csharp
using Microsoft.EntityFrameworkCore;
using ShippingApp.Data;
```

Update service registration:
```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
```

---

#### ✅ Step 4: Update appsettings.json

**File:** `appsettings.json`

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=CFW20280531\\SQLEXPRESS;Database=ShippingAppDb;Trusted_Connection=True;TrustServerCertificate=True;"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

---

#### ✅ Step 5: Run Migrations

In **Package Manager Console**, run:

```powershell
Add-Migration InitialCreate
Update-Database
```

You will see the new `ShippingAppDb` created with `Shippings` table.

---

Let me know when ready for Chapter 03 – *Shipping Controller and List View*. 🚚
