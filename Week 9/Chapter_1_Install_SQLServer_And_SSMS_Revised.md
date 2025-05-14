
# 📘 Chapter 1: Installing SQL Server Express and SSMS

## 🗓 Week 9 Topic: Getting Ready for Database Integration in ASP.NET Core

In this chapter, students will:
- Install **SQL Server Express 2022**
- Install **SQL Server Management Studio (SSMS)**
- Enable TCP/IP protocol for SQL Server communication
- Understand how to identify their SQL Server **instance name** and **connection string**

---

## ✅ Step 1: Install SQL Server Express (Free Edition)

1. Download the installer from the official Microsoft site:  
   🔗 [https://www.microsoft.com/en-us/sql-server/sql-server-downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

2. Choose:
   - **Edition**: `SQL Server 2022 Express`
   - **Installation Type**: `Basic`

3. Complete installation by accepting the license and choosing default settings.

---

### 📌 Know Your Server Name

Once installed, your **server name** is usually:

```
localhost\SQLEXPRESS
```

This will be used later in the connection string.

---

## ✅ Step 2: Install SQL Server Management Studio (SSMS)

1. Download from:  
   🔗 [https://aka.ms/ssmsfullsetup](https://aka.ms/ssmsfullsetup)

2. Run the installer and accept the default options.

3. After installation, open **SSMS** and log in:

   - **Server name**: `localhost\SQLEXPRESS`
   - **Authentication**: `Windows Authentication`
   - Click **Connect**

---

## ✅ Step 3: Enable TCP/IP for SQL Server Communication

This step is important to avoid connection issues like error 40 when using EF Core.

1. Open **Run** (`Win + R`) and type:

   ```
   SQLServerManager15.msc
   ```

   > If you're using SQL Server 2017 or 2016, try:
   - `SQLServerManager14.msc`
   - `SQLServerManager13.msc`

2. In SQL Server Configuration Manager, go to:
   ```
   SQL Server Network Configuration > Protocols for SQLEXPRESS
   ```

3. Right-click **TCP/IP** and choose **Enable**

4. Restart the SQL Server service:
   - Open `services.msc`
   - Find **SQL Server (SQLEXPRESS)**
   - Right-click → **Restart**

---

## 🧪 Verifying Your Setup

Once logged into SSMS, you should see:
- Databases > System Databases
- Options to create and view tables

---

## 🔗 Example Connection String (to use in `appsettings.json`)

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```

> Note: Double backslashes (`\\`) are needed in `.NET` JSON strings.

---

## ✅ Summary

You have now:
- Installed SQL Server Express and SSMS
- Enabled TCP/IP for local database access
- Verified your server instance name
- Prepared to connect from your ASP.NET Core application

🎉 Proceed to Chapter 2 to install EF Core packages and configure your project.
