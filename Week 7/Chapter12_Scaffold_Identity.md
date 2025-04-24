# Chapter 12: Scaffold Identity into a Razor Project

## 🎯 Objective
Generate identity UI to manage users, login, and registration.

---

## 📝 Instructions

### Step 1: Scaffold Identity
- Right-click project > Add > New Scaffolded Item > Identity.
- Select all default files and click **Add**.

### Step 2: Run EF Core Migration
```powershell
Add-Migration CreateIdentitySchema
Update-Database
```

### Step 3: Test
Run the app and visit `/Identity/Account/Register` or `/Login`.

---

## 🧪 Deliverables
- Screenshot of login and registration pages.
- Migration file created for identity schema.

---
