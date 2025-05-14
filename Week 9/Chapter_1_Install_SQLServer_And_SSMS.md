
# 📘 Chapter 1: Installing SQL Server Express and SSMS

## 🗓 Week 9 Topic: Getting Ready for Database Integration in ASP.NET Core

In this chapter, students will:
- Install **SQL Server Express 2022**
- Install **SQL Server Management Studio (SSMS)**
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

### 📌 Important: Know Your Server Name

Once installed, your **server name** is usually:

```
localhost\SQLEXPRESS
```

This value will be used later in your connection string inside the ASP.NET Core project.

---

## ✅ Step 2: Install SQL Server Management Studio (SSMS)

1. Download from the official site:  
   🔗 [https://aka.ms/ssmsfullsetup](https://aka.ms/ssmsfullsetup)

2. Run the installer and choose **default settings**.

3. After installation, open **SSMS** and log in:

   - **Server name**: `localhost\SQLEXPRESS`
   - **Authentication**: `Windows Authentication`
   - Click **Connect**

---

## 🧪 Verifying Your Setup

Once logged into SSMS, you should see:
- Databases > System Databases
- Options to create new databases

---

## 🔗 Example Connection String (to use in `appsettings.json`)

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```

> Note: Double backslashes (`\\`) are needed in C# JSON files.

---

## ✅ Summary

You have now:
- Installed SQL Server 2022 Express
- Installed SSMS
- Logged into your database server
- Located your server name and learned how to write your connection string

🎉 You're ready to use this database in your ASP.NET Core project!

➡️ Continue to Chapter 2 to configure EF Core and perform your first database migration.
