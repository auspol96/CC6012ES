# Database Security – Part 1  
### Fundamentals of Database Security  
*(Beginner Level)*

## 1. Introduction
Modern organisations rely heavily on multi-user database systems.  
While this increases productivity, it also introduces greater risks of data misuse.

### **Objective of Database Security**
The primary goal of database security is to protect data against:
- Unauthorised access  
- Unauthorised disclosure  
- Unauthorised alteration  
- Unauthorised destruction  

A secure database ensures that the right users access the right data in the right way.

---

## 2. Database Security vs Database Integrity

### 🔐 Database Security  
Focuses on *controlling access* to data:
- Only authorised users may access the database.
- Users must operate under the system’s access control rules.

### ✔ Database Integrity  
Focuses on *ensuring data accuracy*:
- Entity integrity  
- Domain integrity  
- Referential integrity  
- User-defined application integrity rules  

### **Common Features Between Security & Integrity**
Both require:
- Rules/constraints defined by the DBA  
- Storage of constraints in system catalog  
- DBMS enforcement of rules during user operations  

---

## 3. Issues to Consider in Database Security

### **A. Legal & Ethical Issues**
- Data protection laws (e.g. GDPR, DPA)  
- Whether a person has the legal right to access data  

### **B. Policy Issues**
- Internal organisational security policies  
- How data is handled and who can access it  

### **C. Hardware Issues**
- Physical security of servers  
- Reliability of hardware components  

### **D. Software Issues**
- Operating system reliability  
- Security vulnerabilities in DBMS software  

### **E. Database-Specific Concerns**
- Unauthorised access (internal or external)  
- Accidental or deliberate misuse  
- Sensitive data exposure  
- Data encryption for protection during transmission  

---

## 4. Summary of Part 1
In this part, students learned:
- Why database security matters  
- The difference between *security* and *integrity*  
- Legal, hardware, software, and policy issues  
- Key concerns in protecting database systems  

This foundation prepares students for Part 2, where we explore how access is controlled inside a database.
