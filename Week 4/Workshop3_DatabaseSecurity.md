# Workshop 3 – DAC vs MAC & Security Classification  
*(Advanced Level)*

## 1. Workshop Objective
In this workshop, students will:
- Understand Mandatory Access Control (MAC)
- Compare Discretionary Access Control (DAC) vs MAC
- Assign clearance and classification levels
- Build an access matrix
- Make access decisions based on classification rules

---

## 2. Classification Levels (Hierarchy)

From lowest to highest:

1. **Public**
2. **Internal**
3. **Confidential**
4. **Secret**
5. **Top Secret**

Rule for MAC:
> A user can only access objects with classification **≤** their clearance level.

---

## 3. User Clearance Levels

| User  | Clearance Level |
|-------|-----------------|
| Alice | Internal |
| Bob   | Confidential |
| Carol | Secret |
| David | Top Secret |

---

## 4. Data Object Classifications

| Data Object              | Classification |
|--------------------------|----------------|
| Employee Names           | Public |
| Employee Salary          | Confidential |
| Product Cost Structure   | Internal |
| R&D Documents            | Secret |
| Acquisition Plans        | Top Secret |

---

## 5. Tasks for Students

---

### **Task 1 – Determine Access Rights**

Apply the rule:  
> User can only access data if object classification ≤ user clearance.

Example for **Alice (Internal)**:
- Employee Names → ✔ Allowed  
- Employee Salary → ✖ Denied  
- Product Cost Structure → ✔ Allowed  
- R&D Documents → ✖ Denied  
- Acquisition Plans → ✖ Denied  

Students should complete the same for Bob, Carol, and David.

---

### **Task 2 – Build an Access Matrix**

**Expected Answer:**

| User / Object | Names (Public) | Salary (Confidential) | Cost Structure (Internal) | R&D (Secret) | Acquisition (Top Secret) |
|---------------|----------------|------------------------|----------------------------|--------------|----------------------------|
| Alice (Internal) | ✔ | ✖ | ✔ | ✖ | ✖ |
| Bob (Confidential) | ✔ | ✔ | ✔ | ✖ | ✖ |
| Carol (Secret) | ✔ | ✔ | ✔ | ✔ | ✖ |
| David (Top Secret) | ✔ | ✔ | ✔ | ✔ | ✔ |

---

### **Task 3 – DAC vs MAC Reflection Questions**

Students answer:

1. Which model is more flexible?  
   **Answer:** DAC

2. Which model is more secure for sensitive data?  
   **Answer:** MAC

3. Which model fits a university environment?  
   **Answer:** DAC

4. Which model fits military or government systems?  
   **Answer:** MAC

5. Which model better prevents insider misuse?  
   **Answer:** MAC

---

### **Task 4 – Rewrite MAC decisions into SQL GRANT rules (DAC Simulation)**

Example for **Bob (Confidential)**:

```sql
GRANT SELECT ON Employee_Names TO Bob;
GRANT SELECT ON Employee_Salary TO Bob;
GRANT SELECT ON Product_CostStructure TO Bob;
```

Example for **Carol (Secret)**:

```sql
GRANT SELECT ON Employee_Names TO Carol;
GRANT SELECT ON Employee_Salary TO Carol;
GRANT SELECT ON Product_CostStructure TO Carol;
GRANT SELECT ON RnD_Documents TO Carol;
```

Example for **David (Top Secret)**:

```sql
GRANT SELECT ON All_Sensitive_Data TO David;
```

---

## 6. Summary

This workshop teaches students how to:
- Apply MAC decisions
- Construct access matrices
- Compare DAC and MAC
- Translate MAC outcomes into SQL GRANT rules (DAC simulation)

This completes the advanced part of the Database Security workshops.
