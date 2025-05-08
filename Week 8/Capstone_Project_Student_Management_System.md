
# 🎓 Capstone Project: Student Management System

## 🎯 Project Goal
To consolidate everything learned in the ASP.NET Core MVC course by building a complete Student Management System with SQL Server, Entity Framework Core, validation, layouts, and manual CRUD operations.

---

## 🧱 Project Features and Requirements

### ✅ 1. Student Entity (Core Data)
- `Id`: int
- `Name`: string (Required, Max 100)
- `Age`: int (1-120)
- `Email`: string (Required, Email format)
- `PhoneNumber`: string (Optional)

### ✅ 2. CRUD Operations (Manual)
- Implement Create, Read, Update, Delete manually without scaffolding
- Form validation using Tag Helpers
- Server-side validation using Data Annotations

### ✅ 3. Course Management (Relational)
- Add a new entity: `Course`
  - `CourseId`, `CourseName`, `Credits`
- Allow assigning multiple courses to a student (many-to-many)
- Display enrolled courses on the Student Details page

### ✅ 4. Layout and Design
- Use `_Layout.cshtml` for consistent design
- Navigation bar with links to:
  - Home
  - Student List
  - Course List
- Footer with copyright

### ✅ 5. Data Persistence
- Use **SQL Server LocalDB**
- Apply EF Core migrations
- Create seed data for initial testing (optional)

### ✅ 6. Additional Features (Optional for Extra Credit)
- Search bar to filter students by name
- Sorting (by age or name)
- Partial views for reusable form fields or components
- Responsive layout using Bootstrap

---

## 📂 Project Folder Structure (Example)

```
MvcStudentManager/
│
├── Controllers/
│   ├── StudentController.cs
│   └── CourseController.cs
│
├── Models/
│   ├── Student.cs
│   └── Course.cs
│
├── Views/
│   ├── Shared/
│   ├── Student/
│   └── Course/
│
├── Data/
│   └── AppDbContext.cs
│
├── wwwroot/
│   └── css/site.css
│
├── appsettings.json
└── Program.cs
```

---

## 🧪 Evaluation Criteria

| Category               | Points |
|------------------------|--------|
| CRUD Functionality     | 30     |
| Validation (UI + Server)| 15     |
| Layout + Nav + Footer  | 15     |
| EF Core + SQL Server   | 20     |
| Bonus Features         | 10     |
| Code Structure & Style | 10     |

---

## 📅 Suggested Timeline
- **Day 1–2**: Project Setup, Student model, manual CRUD
- **Day 3–4**: Add Course model + relational logic
- **Day 5**: Layout and styling
- **Day 6**: Testing, polish, and optional features
- **Day 7**: Submit and present

---

## 📌 Deliverables
- Fully working MVC application
- Screenshots of all pages
- `README.md` with:
  - Description
  - Setup instructions
  - Feature list

---

### ✅ Outcome
Students will:
- Practice every major concept from the course
- Build a professional-grade web app
- Be confident in deploying local MVC apps with SQL Server
