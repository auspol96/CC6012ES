# Chapter 1: Adding Google Maps Route Links

In this chapter, you will extend your ShippingApp to include a clickable link for each record that opens the route between `FromLocation` and `ToLocation` in Google Maps.

---

## 🎯 Objective

✅ Add a computed property `MapLink` to the `ShippingRequest` model.  
✅ Display the link in the Shipping list table (`Index.cshtml`).  
✅ Clicking the link opens Google Maps directions in a browser.

---

## 1️⃣ Update the `ShippingRequest.cs` Model

Open `Models/ShippingRequest.cs` and replace its content with the following code:

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

        // ✅ Computed property for Google Maps link
        [Display(Name = "Route Link")]
        public string MapLink
        {
            get
            {
                var from = Uri.EscapeDataString(FromLocation ?? string.Empty);
                var to = Uri.EscapeDataString(ToLocation ?? string.Empty);
                return $"https://www.google.com/maps/dir/{from}/{to}/";
            }
        }
    }
}
```

---

## 2️⃣ Update the View to Show the Link

Open the file:  
✅ `Views/Shipping/Index.cshtml`

Find the table where your shipping list is displayed.  
Modify the header row (`<thead>`) to include a **Route** column:

```html
<th>Route</th>
```

Then modify the row (`<tr>`) inside the loop to add a link:

```html
@foreach (var item in Model)
{
    <tr>
        <td>@item.FromLocation</td>
        <td>@item.ToLocation</td>
        <td>@item.ItemDescription</td>
        <td>@item.Weight</td>
        <td>
            <a href="@item.MapLink" target="_blank">View Route</a>
        </td>
    </tr>
}
```

---

## 3️⃣ Run the Application

✅ Build & run the application.  
✅ Navigate to `http://localhost:xxxx/Shipping`.  
✅ You will see a **"View Route"** link in each row of the table.  
✅ Clicking the link opens Google Maps in a new tab showing directions between the two locations.

---

## 🔍 Example Output

| From Location   | To Location       | Item    | Weight | Route        |
|-----------------|-------------------|---------|--------|--------------|
| Los Angeles     | San Francisco     | Sofa    | 55.5   | [View Route] |

Clicking **View Route** opens:  
```
https://www.google.com/maps/dir/Los+Angeles,+CA/San+Francisco,+CA/
```

---

## ✅ Summary

You’ve learned how to:

- Add a computed property (`MapLink`) in your model.

- Render a dynamic Google Maps link in the view.

- Open the link in a new browser tab.
