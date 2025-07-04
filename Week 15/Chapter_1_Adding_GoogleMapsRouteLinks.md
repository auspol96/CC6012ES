
# Chapter 6: Adding Google Maps Route Links

In this chapter, you’ll add a **Google Maps link** to each shipping request so users can view the route between `FromLocation` and `ToLocation` directly in Google Maps.

---

## 🧰 Step 1: Modify the View

Open your `Views/Shipping/Index.cshtml` and adjust the table to include a **Map Link** column.

### Example:

```
<thead>
    <tr>
        <th>From Location</th>
        <th>To Location</th>
        <th>Item</th>
        <th>Weight</th>
        <th>Map Link</th>
    </tr>
</thead>
<tbody>
@foreach (var item in Model) {
    <tr>
        <td>@item.FromLocation</td>
        <td>@item.ToLocation</td>
        <td>@item.ItemDescription</td>
        <td>@item.Weight</td>
        <td>
            <a href="https://www.google.com/maps/dir/@item.FromLocation/@item.ToLocation" target="_blank">
                View Route
            </a>
        </td>
    </tr>
}
</tbody>
```

This creates a clickable link that opens Google Maps directions between the two locations.

---

## 🧰 Step 2: Test the Link

- Run your app and navigate to `/Shipping`.
- Verify that each row now has a **View Route** link.
- Click the link to ensure it opens the Google Maps route between the locations.

---

## 🧰 Step 3 (Optional): URL Encoding

Since location names might have spaces (e.g., `Los Angeles, CA`), you should URL-encode them. Update your Razor code:

```
@{
    string fromEncoded = Uri.EscapeDataString(item.FromLocation);
    string toEncoded = Uri.EscapeDataString(item.ToLocation);
}
<a href="https://www.google.com/maps/dir/@fromEncoded/@toEncoded" target="_blank">
    View Route
</a>
```

This ensures the link works properly even with spaces or special characters.

---

## 🎯 Summary

✅ Added a new **Map Link** column.  
✅ Generated dynamic links to Google Maps with the shipping route.  
✅ Optional: Improved with URL encoding.

---

You’re done! Users can now easily view the shipping route in Google Maps.
