# 📘 Student Guide: Understanding Database Normalization

Database normalization is a process used to organize a database into tables and columns to reduce data redundancy and improve data integrity.

---

## 🔍 Why Normalize?

- ✅ Avoid duplicate data
- ✅ Improve consistency
- ✅ Simplify queries and updates
- ✅ Enable better reporting

---

## 🧱 Step-by-Step Normalization Process

We’ll use an example based on a household goods transport system, like "e-Shift".

---

### 🔴 Step 1: Unnormalized Form (UNF)

**Table Example:**

| CustomerID | CustomerName | JobID | StartLocation | EndLocation | Product1 | Product2 |
|------------|--------------|-------|----------------|--------------|----------|----------|
| 101 | John Smith | J001 | London | Leeds | Chair | Table |

❌ Problem: Repeating groups (`Product1`, `Product2`)

---

### ✅ Step 2: First Normal Form (1NF)

**Rule**: No repeating groups. Each cell should contain atomic (single) values.

**Fixed Table:**

| CustomerID | CustomerName | JobID | StartLocation | EndLocation | Product |
|------------|--------------|-------|----------------|--------------|----------|
| 101 | John Smith | J001 | London | Leeds | Chair |
| 101 | John Smith | J001 | London | Leeds | Table |

---

### ✅ Step 3: Second Normal Form (2NF)

**Rule**: No partial dependencies. All non-key attributes must depend on the entire primary key.

**Split into:**

#### Customer Table

| CustomerID | CustomerName |
|------------|--------------|
| 101        | John Smith   |

#### Job Table

| JobID | CustomerID | StartLocation | EndLocation |
|-------|------------|----------------|--------------|
| J001  | 101        | London         | Leeds        |

#### Product Table

| JobID | Product |
|-------|---------|
| J001  | Chair   |
| J001  | Table   |

---

### ✅ Step 4: Third Normal Form (3NF)

**Rule**: No transitive dependencies. Attributes should only depend on the primary key.

If `Region` depends on `Location`, move it:

#### Location Table

| Location | Region    |
|----------|-----------|
| London   | UK South  |
| Leeds    | UK North  |

---

## 🧩 Summary

| Normal Form | Rule                              | Action Taken                      |
|-------------|-----------------------------------|-----------------------------------|
| 1NF         | No repeating groups               | Separate rows or create table     |
| 2NF         | No partial dependency             | Move dependent columns            |
| 3NF         | No transitive dependency          | Extract derived info to new table |

---

## 🎯 Practice Exercise

Normalize the following raw data:

| OrderID | CustomerName | Product1 | Product2 | DeliveryCity |
|---------|---------------|----------|----------|---------------|
| 5001    | Alice          | Lamp     | Mirror   | Manchester    |

**Tasks:**

1. Convert to 1NF
2. Decompose into 2NF
3. Adjust for 3NF if applicable

---

## 🎓 Final Tips

- Think in terms of **entities** and **relationships**
- Watch for repeating fields and copy-paste data
- Always define **primary keys**
- Normalize until data is easy to maintain and scale
