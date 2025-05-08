
# 📘 Chapter 11: Local App Publishing & Runtime Setup (SQL Server + ASP.NET Core MVC)

## 🎯 Purpose
To teach students how to publish, run, and test their ASP.NET Core MVC applications locally — simulating real-world deployment using SQL Server LocalDB.

---

## 📌 Step-by-Step Guide

### ✅ Step 1: Prepare the Project for Publishing

#### Ensure:
- You have completed and tested all CRUD logic.
- Database migrations are applied using SQL Server LocalDB.

---

### ✅ Step 2: Update appsettings.json (for LocalDB)

In `appsettings.json`, confirm:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=StudentDb;Trusted_Connection=True;"
}
```

---

### ✅ Step 3: Publish the Project Locally

1. Right-click the project > **Publish**.
2. Choose **Folder** as the target.
3. Set a publish path like:  
   `C:\PublishedApps\MvcStudentApp\`
4. Click **Publish**.

Visual Studio will build and copy the app into the chosen folder.

---

### ✅ Step 4: Run the App Outside Visual Studio

1. Open Command Prompt or PowerShell.
2. Navigate to the publish folder:
   ```
   cd C:\PublishedApps\MvcStudentApp
   ```
3. Run the app:
   ```
   dotnet MvcStudentApp.dll
   ```

4. Browse to the URL shown in terminal (e.g., `http://localhost:5000`).

---

### ✅ Step 5: Add Environment Awareness

In `Program.cs`:
```csharp
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
```

Then in the publish folder, create a file called:
```
appsettings.Production.json
```

This lets you override production settings if needed.

---

### ✅ Step 6: Test Database Connection

Confirm:
- The app connects to LocalDB correctly.
- The data persists between launches.
- No runtime config errors.

---

### ✅ Step 7: Backup and Restore the Database (Optional)

To backup:
1. Open SQL Server Management Studio (SSMS).
2. Connect to `(localdb)\mssqllocaldb`.
3. Right-click your database (e.g., `StudentDb`) > **Tasks > Back Up...**

To restore later:
- Use **Restore Database...** in SSMS.

---

## 🧪 Hands-on Mini Challenge

- Change the published app’s title in `_Layout.cshtml`.
- Republish and re-run it outside Visual Studio.
- Explore `bin` and `wwwroot` folders in the publish output.

---

## 📝 Summary Notes

- Publishing locally helps simulate deployment conditions.
- LocalDB is ideal for testing SQL Server apps without extra setup.
- You can run `.dll` output from CLI without Visual Studio.
- Use `appsettings.{env}.json` for flexible configuration.

---

### ✅ Outcome of This Chapter
Students will:
- Know how to publish and run apps independently of Visual Studio
- Understand the structure of published output
- Simulate production-like scenarios locally using SQL Server
