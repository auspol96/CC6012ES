
# Chapter 8: Sorting, Filtering, and Paging (Revised & Stable Version)

## Objective
By the end of this chapter, students will be able to:
- Combine search, filter, sort, and paging safely
- Understand how query parameters preserve state
- Avoid common MVC runtime errors (NullReferenceException)
- Build a stable, real-world Index page

---

## Step 1: Correct Structure of Index.cshtml

Rules:
- Form = search & filter only
- Table = display data
- Paging = navigation
- Views must not assume ViewBag values exist

---

## Step 2: Revised Index.cshtml (Copy & Paste)

```cshtml
@model IEnumerable<WebApplication1.Models.Movie>

<h2>Movie List</h2>

<form asp-action="Index" method="get">
    <p>
        Title:
        <input type="text"
               name="searchString"
               value="@Context.Request.Query["searchString"]" />

        Genre:
        <select name="movieGenre">
            <option value="">All</option>
            @if (ViewBag.Genres != null)
            {
                foreach (var genre in ViewBag.Genres)
                {
                    <option value="@genre.Text"
                            selected="@(Context.Request.Query["movieGenre"] == genre.Text)">
                        @genre.Text
                    </option>
                }
            }
        </select>

        <input type="submit" value="Search" />
    </p>
</form>

<table border="1">
    <thead>
        <tr>
            <th>
                <a asp-action="Index"
                   asp-route-sortOrder="@ViewBag.TitleSort"
                   asp-route-searchString="@Context.Request.Query["searchString"]"
                   asp-route-movieGenre="@Context.Request.Query["movieGenre"]">
                    Title
                </a>
            </th>
            <th>
                <a asp-action="Index"
                   asp-route-sortOrder="@ViewBag.DateSort"
                   asp-route-searchString="@Context.Request.Query["searchString"]"
                   asp-route-movieGenre="@Context.Request.Query["movieGenre"]">
                    Release Date
                </a>
            </th>
            <th>
                <a asp-action="Index"
                   asp-route-sortOrder="@ViewBag.PriceSort"
                   asp-route-searchString="@Context.Request.Query["searchString"]"
                   asp-route-movieGenre="@Context.Request.Query["movieGenre"]">
                    Price
                </a>
            </th>
            <th>Genre</th>
            <th>Actions</th>
        </tr>
    </thead>

    <tbody>
        @if (!Model.Any())
        {
            <tr>
                <td colspan="5">No movies found.</td>
            </tr>
        }
        else
        {
            foreach (var movie in Model)
            {
                <tr>
                    <td>@movie.Title</td>
                    <td>@movie.ReleaseDate.ToShortDateString()</td>
                    <td>@movie.Price</td>
                    <td>@movie.Genre</td>
                    <td>
                        <a asp-action="Edit" asp-route-id="@movie.Id">Edit</a> |
                        <a asp-action="Delete" asp-route-id="@movie.Id">Delete</a>
                    </td>
                </tr>
            }
        }
    </tbody>
</table>

<div style="margin-top:15px;">
    @if (ViewBag.CurrentPage > 1)
    {
        <a asp-action="Index"
           asp-route-pageNumber="@(ViewBag.CurrentPage - 1)"
           asp-route-searchString="@Context.Request.Query["searchString"]"
           asp-route-movieGenre="@Context.Request.Query["movieGenre"]"
           asp-route-sortOrder="@Context.Request.Query["sortOrder"]">
            Previous
        </a>
    }

    <span>
        Page @ViewBag.CurrentPage of @ViewBag.TotalPages
    </span>

    @if (ViewBag.CurrentPage < ViewBag.TotalPages)
    {
        <a asp-action="Index"
           asp-route-pageNumber="@(ViewBag.CurrentPage + 1)"
           asp-route-searchString="@Context.Request.Query["searchString"]"
           asp-route-movieGenre="@Context.Request.Query["movieGenre"]"
           asp-route-sortOrder="@Context.Request.Query["sortOrder"]">
            Next
        </a>
    }
</div>
```

---

## Expected Result
- No runtime errors
- Search, sort, and paging work together
- Clean MVC structure

---

## Next Chapter
Chapter 9: Authentication and Authorization
