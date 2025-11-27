# Database Security – Part 2  
### Access Control, Authentication, DAC & MAC  
*(Intermediate Level)*

## 1. Access Requests
Every access request involves 3 components:

| Aspect | Meaning |
|--------|---------|
| **User** | Who is requesting access |
| **Operation** | What action is requested (SELECT, INSERT, UPDATE, DELETE) |
| **Data Object** | Where the operation applies (table, row, column, attribute value) |

---

## 2. Granularity of Data Objects
Access can be controlled at different levels:
- Entire database  
- A table  
- A set of rows or columns  
- A single attribute in one row  

This allows fine-grained access control based on the organisation’s needs.

---

## 3. Identification & Authentication
Before accessing the database, a user must:
1. **Identify** themselves (username)  
2. **Authenticate** their identity (password, fingerprint, smart card)  
3. Sometimes re-authenticate during the session  

Examples:
- ATM login  
- Oracle DB login  
- Biometric scans  

Authentication ensures that only genuine users enter the system.

---

## 4. Two Main Approaches to Database Security

### **A. Discretionary Access Control (DAC)**
- Control is based on user identity.
- Users are assigned different rights on different data objects.
- Flexible and widely used (SQL GRANT/REVOKE).

Example:
- User A can SELECT table1.
- User B can UPDATE table2 but not SELECT table1.

---

### **B. Mandatory Access Control (MAC)**
- Based on security classifications and clearances.
- Common in military, government, and defence.
- Users can only access objects at or below their clearance level.

Example Levels:
- Public  
- Confidential  
- Secret  
- Top Secret  

Rule:
> A user with clearance level *i* can only access objects with classification *≤ i*.

---

## 5. Access Matrix Model
An **access matrix** represents users, objects, and permissions.

### Example:
| User / Object | Table1 | Table2 |
|---------------|--------|--------|
| User A | SELECT | SELECT, UPDATE |
| User B | SELECT(attr1) | SELECT, INSERT |

Access matrix information can be stored as:
- **User profiles**  
- **Object profiles**  

---

## 6. Summary of Part 2
Students now understand:
- How access requests work  
- Granularity of control  
- Authentication principles  
- DAC vs MAC  
- Access matrix modelling  

The next section will cover how SQL implements these controls using **GRANT** and **REVOKE**.
