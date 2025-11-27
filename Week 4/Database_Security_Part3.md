# Database Security – Part 3  
### SQL Security Rules, GRANT, REVOKE, and Classification  
*(Advanced Level)*

## 1. GRANT & REVOKE Overview
SQL supports security rules using:

### ✔ `GRANT` — Assign permissions  
### ✔ `REVOKE` — Remove permissions  

Structure:
```
GRANT operation
ON data_object
TO user;
```

---

## 2. Value-Independent Security Rules
Applies to entire tables or objects.

Example:
```
GRANT SELECT ON Employee
TO Paul;
```

---

## 3. Value-Dependent Security Rules
Applies only when certain conditions are met.

Example:
```
GRANT SELECT ON Supplier
WHERE Supplier_City = 'London'
TO John;
```

---

## 4. Context-Dependent Security Rules
Permissions depending on date/time or other system factors.

Example:
```
GRANT UPDATE ON Product
WHEN Day() IN ('Mon','Tue','Wed','Thu','Fri')
AND Now() BETWEEN TIME '09:00:00' AND TIME '17:00:00'
TO OrderDept;
```

Used to restrict operations to office hours.

---

## 5. Violation Response
You can specify what happens when a user attempts an unauthorised operation.

Example:
```
GRANT SELECT ON Employee
TO Fred
ON ATTEMPTED VIOLATION REJECT;
```

---

## 6. REVOKE – Removing Permissions
Examples:
```
REVOKE SELECT ON Employee FROM Fred;
REVOKE INSERT, UPDATE ON Product FROM SalesDept;
REVOKE ALL ON Supplier FROM John;
```

---

## 7. Mandatory Access Control Classification
Objects → Classification Levels  
Users → Clearance Levels  

Rule:
> A user with clearance level *i* can only access objects classified *≤ i*.

---

## 8. Discretionary vs Mandatory Control (Comparison Table)

| Aspect | Discretionary (DAC) | Mandatory (MAC) |
|--------|----------------------|------------------|
| Basis | User identity | Classification levels |
| Flexibility | High | Low |
| Use cases | Business systems | Government, defence |
| SQL support | Full | Not directly in SQL |

---

## 9. Summary of Part 3
Students learned:
- GRANT and REVOKE in SQL  
- Value-dependent and context-dependent rules  
- Violation responses  
- Mandatory control classification  
- DAC vs MAC comparison  

This completes the full Database Security lecture.
