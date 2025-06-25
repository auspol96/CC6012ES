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
  "DefaultConnection":"Server=localhost\\SQLEXPRESS;Database=ShippingAppDb;Trusted_Connection=True;TrustServerCertificate=True"
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
If you need to rerun the migration please follow this steps.
```powershell
Remove-Migration

Add-Migration InitialCreate

Update-Database
```
---

Let me know when ready for Chapter 03 – *Shipping Controller and List View*. 🚚
Then try to insert data manually per below.


```sql
INSERT INTO [ShippingAppDb].[dbo].ShippingRequests (FromLocation, ToLocation, ItemDescription, Weight)
VALUES 
('Los Angeles, CA', 'San Francisco, CA', 'Sofa', 55.5),
('Seattle, WA', 'Portland, OR', 'Bookshelf', 22.0),
('Chicago, IL', 'Detroit, MI', 'Dining Table', 75.2),
('Houston, TX', 'Austin, TX', 'TV Stand', 40.0),
('Phoenix, AZ', 'Tucson, AZ', 'Queen Bed Frame', 65.3),
('Miami, FL', 'Orlando, FL', 'Office Chair', 18.7),
('Atlanta, GA', 'Nashville, TN', 'Kitchen Cabinet', 88.1),
('Denver, CO', 'Salt Lake City, UT', 'Desk', 50.0),
('Boston, MA', 'New York, NY', 'Couch', 70.4),
('San Diego, CA', 'Las Vegas, NV', 'Mattress', 60.0),
('Dallas, TX', 'El Paso, TX', 'Coffee Table', 30.9),
('Minneapolis, MN', 'Milwaukee, WI', 'Shoe Rack', 12.2),
('Columbus, OH', 'Cleveland, OH', 'TV', 28.6),
('San Jose, CA', 'Fresno, CA', 'Wardrobe', 90.0),
('Indianapolis, IN', 'Louisville, KY', 'Storage Box', 15.3),
('Charlotte, NC', 'Raleigh, NC', 'Dining Chairs (Set of 4)', 44.0),
('Kansas City, MO', 'St. Louis, MO', 'Glass Table', 48.5),
('Albuquerque, NM', 'Santa Fe, NM', 'Bedside Table', 25.6),
('Oklahoma City, OK', 'Tulsa, OK', 'Filing Cabinet', 32.8),
('Las Vegas, NV', 'Phoenix, AZ', 'Books & Boxes', 20.0);

```


