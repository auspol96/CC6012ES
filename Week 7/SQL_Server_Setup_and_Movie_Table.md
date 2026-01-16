
# 🛠️ SQL Server Installation & Setup Guide for ASP.NET Core MVC Students

## 🎯 Purpose
To help students install SQL Server Express, configure the environment, and create a `Movie` database and table for use in CRUD exercises.

---

## ✅ Step 1: Install SQL Server Express (Free Edition)

1. Visit the official download page:  
   👉 https://www.microsoft.com/en-us/sql-server/sql-server-downloads

2. Download **SQL Server 2022 Express** (or the latest version).

3. Launch the installer and choose **Basic** installation type.

4. Once installed, note your server name:
   - It will be something like: `localhost\SQLEXPRESS`

---

## ✅ Step 2: Install SQL Server Management Studio (SSMS)

1. Go to:  
   👉 https://aka.ms/ssmsfullsetup

2. Download and install **SQL Server Management Studio (SSMS)**.

3. Launch SSMS and connect to:
   ```
   Server Name: localhost\SQLEXPRESS
   Authentication: Windows Authentication
   ```

---

## ✅ Step 3: Create a New Database

1. In SSMS:
   - Right-click on **Databases > New Database**
   - Name it: `MvcMovieContext`
   - Click **OK**

---

## ✅ Step 4: Create the `Movies` Table

1. Open **New Query** window in SSMS
2. Paste and run this SQL script:
```sql
USE MvcMovieContext;
GO

CREATE TABLE Movies (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    ReleaseDate DATETIME2 NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Genre NVARCHAR(MAX) NULL
);
```

---

## ✅ Step 5: Connect from ASP.NET Core Project

In your `appsettings.json`:
```json
"ConnectionStrings": {
  "MvcMovieContext": "Server=localhost\\SQLEXPRESS;Database=MvcMovieContext;Trusted_Connection=True;"
}
```

Make sure this matches what you saw in SSMS.

---

## 🧪 Test Run

1. Run your ASP.NET Core MVC app.
2. Try accessing the Movie Index page.
3. If everything works, you should see your CRUD UI!

---

## 📝 Summary Notes

- SQL Server Express is free and ideal for development.
- SSMS makes database creation and editing easy.
- This setup avoids using LocalDB or SQLite for more production-like experience.

---

### ✅ Outcome
Students will:
- Successfully install SQL Server and SSMS
- Create a working database and table for use in MVC CRUD apps
- Connect the database to their ASP.NET Core application
