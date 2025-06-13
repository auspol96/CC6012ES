# Database Design and Normalization Guide

This guide walks students through designing a clean, efficient database using the principles of **normalization**. It is aimed at beginner to intermediate learners, especially those in the CS6004ES module.

---

## 📘 1. Introduction to Database Design
A good database design ensures:
- Data is stored efficiently
- Redundancy is minimized
- Data integrity is maintained

You will start by identifying entities and their relationships from a given business scenario.

---

## 🧱 2. Step-by-Step Design Process

### Step 1: Identify Entities
**Scenario**: A customer places an order for a car and some parts.

From this, we can identify:
- **Customer**: Name, Address, Email
- **Car**: Model, Brand, Price
- **Part**: Part Name, Part Price
- **Order**: Order ID, Order Date

### Step 2: Draft Unnormalized Table (UNF)
We collect all data in one large flat table:

| OrderID | OrderDate | CustomerName | CustomerEmail | CarModel | CarPrice | Part1 | Part1Price | Part2 | Part2Price |
|---------|-----------|---------------|----------------|----------|----------|-------|-------------|-------|-------------|
| 1001    | 2024-06-01 | Rattapol      | rat@example.com | Honda CRV | 900000   | Brake | 5000        | Tire  | 6000        |

### Step 3: First Normal Form (1NF)
- Eliminate repeating groups: each part gets its own row
- Atomic values only (one value per field)

| OrderID | OrderDate | CustomerName | CustomerEmail | CarModel | CarPrice | PartName | PartPrice |
|---------|-----------|---------------|----------------|----------|----------|----------|-----------|
| 1001    | 2024-06-01 | Rattapol      | rat@example.com | Honda CRV | 900000   | Brake    | 5000      |
| 1001    | 2024-06-01 | Rattapol      | rat@example.com | Honda CRV | 900000   | Tire     | 6000      |

---

## 🔄 3. Normalize to Final Tables (Up to 3NF)

### 🧪 Another Example: Student Course Registration System

#### Step 1 – UNF Table:
| StudentID | StudentName | CourseCode | CourseName | InstructorName |
|-----------|-------------|------------|------------|----------------|
| S001      | Anna Smith  | CS101      | Programming | Dr. Green     |
| S001      | Anna Smith  | CS102      | Databases   | Dr. White     |

#### Step 2 – 1NF:
- Remove repeating groups (already done)
- Ensure atomicity

| StudentID | StudentName | CourseCode | CourseName | InstructorName |
|-----------|-------------|------------|------------|----------------|
| S001      | Anna Smith  | CS101      | Programming | Dr. Green     |
| S001      | Anna Smith  | CS102      | Databases   | Dr. White     |

#### Step 3 – 2NF:
- Remove partial dependencies (CourseName and InstructorName depend on CourseCode, not StudentID)

Split into:

**`Student`**
| StudentID | StudentName |
|-----------|-------------|
| S001      | Anna Smith  |

**`Course`**
| CourseCode | CourseName  | InstructorName |
|------------|-------------|----------------|
| CS101      | Programming | Dr. Green      |
| CS102      | Databases   | Dr. White      |

**`Enrollment`**
| StudentID | CourseCode |
|-----------|------------|
| S001      | CS101      |
| S001      | CS102      |

### Step 4: Second Normal Form (2NF)
Second Normal Form addresses **partial dependencies**, which occur when a non-key attribute is dependent on only part of a composite primary key.

In our 1NF table, non-key fields like `CustomerName`, `CustomerEmail`, `CarModel`, and `CarPrice` depend only on `OrderID` or `PartName`, not on the full set of fields.

To fix this, we split the table into multiple smaller tables:

#### 🔄 Transformed into the following:

#### `Customer`
| CustomerID | Name      | Email             |
|------------|-----------|-------------------|
| C001       | Rattapol  | rat@example.com   |

#### `Car`
| CarID | Model     | Price   |
|--------|-----------|---------|
| CAR01  | Honda CRV | 900000  |

#### `Part`
| PartID | Name   | Price |
|--------|--------|-------|
| P001   | Brake  | 5000  |
| P002   | Tire   | 6000  |

#### `Order`
| OrderID | OrderDate | CustomerID | CarID |
|---------|-----------|------------|--------|
| O1001   | 2024-06-01 | C001       | CAR01  |

#### `OrderPart`
| OrderID | PartID |
|---------|--------|
| O1001   | P001   |
| O1001   | P002   |

- Create separate tables for Customers, Cars, Parts, and Orders

### Step 5: Third Normal Form (3NF)
Remove transitive dependencies:
- Ensure no non-key depends on another non-key

### ✅ Final Normalized Tables

#### `Customer`
| CustomerID | Name      | Email             |
|------------|-----------|-------------------|
| C001       | Rattapol  | rat@example.com   |

#### `Car`
| CarID | Model     | Brand | Price   |
|--------|-----------|--------|---------|
| CAR01  | CRV       | Honda  | 900000  |

#### `Part`
| PartID | Name   | Price |
|--------|--------|-------|
| P001   | Brake  | 5000  |
| P002   | Tire   | 6000  |

#### `Order`
| OrderID | CustomerID | OrderDate |
|---------|------------|-----------|
| O1001   | C001       | 2024-06-01 |

#### `OrderItem`
| OrderID | CarID  | PartID |
|---------|--------|--------|
| O1001   | CAR01  | P001   |
| O1001   | CAR01  | P002   |

---

## 🗂️ 4. Summary of the Process
| Step | Action |
|------|--------|
| 1    | Identify entities from the scenario |
| 2    | Draft a flat table (UNF) |
| 3    | Convert to 1NF by removing repeated groups |
| 4    | Apply 2NF by removing partial dependencies |
| 5    | Apply 3NF by removing transitive dependencies |

---

## 🧪 6. Practice Exercises

### ✏️ Exercise 1 – E-Commerce Order System
You are designing a database for an online store. Each customer can place multiple orders. Each order can include multiple items. Each item comes from a supplier.

Create an **unnormalized table** with sample data. Then normalize it through 1NF, 2NF, and 3NF.

Suggested fields:
- CustomerName, CustomerEmail
- OrderID, OrderDate
- ProductName, ProductPrice, Quantity
- SupplierName, SupplierContact

---

### ✏️ Exercise 2 – University Library System
Design a database for a university library system. Each student can borrow many books. Each book has details like title, author, and ISBN. A book can be returned or overdue.

Step-by-step:
1. Start with a **flat table** including all details
2. Apply 1NF → atomic values only
3. Apply 2NF → remove partial dependencies
4. Apply 3NF → remove transitive dependencies

Suggested fields:
- StudentID, StudentName
- BookTitle, Author, ISBN
- BorrowDate, ReturnDate, OverdueFlag

---

## 🧠 5. Teaching Tips
- Always start from a real-world story
- Encourage students to "question every column"
- Use visual tools to show relationships (ER diagrams)
- Normalize step-by-step instead of jumping to final form

---

Use this guide to help your students build databases that are scalable, maintainable, and logically organized.

