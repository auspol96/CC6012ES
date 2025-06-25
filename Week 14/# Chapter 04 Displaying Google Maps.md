# Chapter 4: Displaying Google Maps with Routing in ASP.NET Core MVC

In this chapter, we will learn how to integrate **Google Maps** into our ShippingApp project to visualize the **start location**, **destination**, and **route** between them.

---

## ✅ Objective

By the end of this chapter, the app will:

* Show a map for each shipping record
* Display the **FromLocation** and **ToLocation** with a route

---

## 🔧 Step 1: Get a Google Maps API Key

1. Go to: [https://console.cloud.google.com/](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable these APIs:

   * **Maps JavaScript API**
   * **Directions API**
4. Go to **Credentials > Create Credentials > API Key**
5. Restrict the key:

   * **HTTP referrers**: add `http://localhost:*`
   * **API restrictions**: allow only the two APIs above
6. Copy the generated key

---

## 📁 Step 2: Add Google Maps View

In `Views/Shipping/Index.cshtml`, scroll to where you want to show the map and insert:

```html
<div id="map" style="height: 500px; width: 100%; margin-bottom: 30px;"></div>
```

Add this script **at the bottom of the file**, replacing `YOUR_API_KEY`:

```html
@section Scripts {
    <script>
        function initMap() {
            const directionsService = new google.maps.DirectionsService();
            const directionsRenderer = new google.maps.DirectionsRenderer();
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 6,
                center: { lat: 34.0522, lng: -118.2437 } // Default: Los Angeles
            });
            directionsRenderer.setMap(map);

            const request = {
                origin: '@Model.First().FromLocation',
                destination: '@Model.First().ToLocation',
                travelMode: google.maps.TravelMode.DRIVING
            };

            directionsService.route(request, function (result, status) {
                if (status === "OK") {
                    directionsRenderer.setDirections(result);
                } else {
                    alert("Directions request failed: " + status);
                }
            });
        }
    </script>
    <script async
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>
}
```

---

## 🔄 Step 3: Test the Map

1. Run the project
2. Browse to `http://localhost:PORT/Shipping`
3. The map should render the route between the first shipping's FromLocation and ToLocation

---

## 💡 Next Steps

* Allow users to click each row and update the map dynamically
* Visualize all routes on the same map (advanced)

Would you like to explore those enhancements in Chapter 5?
