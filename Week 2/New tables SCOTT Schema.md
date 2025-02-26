# **Extending SCOTT Schema with Related Tables**

## **1. Introduction**
This document details the creation of additional tables related to the existing `EMP` table in the SCOTT schema. The newly added tables are `DEPARTMENTS`, `PROJECTS`, `TASKS`, and `COURSE`, ensuring referential integrity and logical connections.

---

## **2. Log in to SCOTT Schema**
Before creating the tables, log in as SCOTT:
```sh
sqlplus scott/tiger@xepdb1
```

---

## **3. Create `DEPARTMENTS` Table**
The `DEPARTMENTS` table holds department details and links to the `EMP` table via `DEPTNO`.
```sql
CREATE TABLE DEPARTMENTS (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(30),
    LOCATION VARCHAR2(50)
);
```

### **Insert Sample Data**
```sql
INSERT INTO DEPARTMENTS VALUES (10, 'Accounting', 'New York');
INSERT INTO DEPARTMENTS VALUES (20, 'Research', 'Dallas');
INSERT INTO DEPARTMENTS VALUES (30, 'Sales', 'Chicago');
INSERT INTO DEPARTMENTS VALUES (40, 'Operations', 'Boston');
COMMIT;
```

---

## **4. Create `PROJECTS` Table**
The `PROJECTS` table tracks projects assigned to employees.
```sql
CREATE TABLE PROJECTS (
    PROJECT_ID NUMBER(4) PRIMARY KEY,
    PROJECT_NAME VARCHAR2(50),
    EMPNO NUMBER(4),
    START_DATE DATE,
    END_DATE DATE,
    STATUS VARCHAR2(20)
);
```

### **Insert Sample Data**
```sql
INSERT INTO PROJECTS VALUES (1001, 'E-Commerce Platform', 7369, TO_DATE('01-JAN-2024', 'DD-MON-YYYY'), TO_DATE('30-JUN-2024', 'DD-MON-YYYY'), 'Active');
INSERT INTO PROJECTS VALUES (1002, 'Database Migration', 7521, TO_DATE('15-FEB-2024', 'DD-MON-YYYY'), TO_DATE('15-DEC-2024', 'DD-MON-YYYY'), 'Planned');
INSERT INTO PROJECTS VALUES (1003, 'HR System Upgrade', 7839, TO_DATE('10-MAR-2024', 'DD-MON-YYYY'), TO_DATE('10-NOV-2024', 'DD-MON-YYYY'), 'Active');
COMMIT;
```

---

## **5. Create `TASKS` Table**
The `TASKS` table manages tasks assigned to employees within specific projects.
```sql
CREATE TABLE TASKS (
    TASK_ID NUMBER(4) PRIMARY KEY,
    TASK_NAME VARCHAR2(100),
    EMPNO NUMBER(4),
    PROJECT_ID NUMBER(4),
    DEADLINE DATE,
    STATUS VARCHAR2(20)
);
```

### **Insert Sample Data**
```sql
SET DEFINE OFF;
INSERT INTO TASKS VALUES (2001, 'Database Design', 7369, 1001, TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'In Progress');
INSERT INTO TASKS VALUES (2002, 'Code Review', 7521, 1001, TO_DATE('25-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO TASKS VALUES (2003, 'Testing and Debugging', 7839, 1002, TO_DATE('30-JUN-2024', 'DD-MON-YYYY'), 'Completed');
COMMIT;
SET DEFINE ON;
```

---

## **6. Create `COURSE` Table and Enrollment Table**
The `COURSE` table stores details about courses that employees can enroll in. Since an employee can enroll in multiple courses, and each course can have multiple employees, a **many-to-many relationship** is established using the `ENROLLMENT` table.

### **Create `COURSE` Table**
```sql
CREATE TABLE COURSE (
    COURSE_ID NUMBER(4) PRIMARY KEY,
    COURSE_NAME VARCHAR2(100),
    COURSE_DURATION NUMBER(3),
    INSTRUCTOR VARCHAR2(50)
);
```

### **Insert Sample Data into `COURSE` Table**
```sql
INSERT INTO COURSE VALUES (3001, 'Oracle SQL Basics', 30, 'Dr. Smith');
INSERT INTO COURSE VALUES (3002, 'Advanced PL/SQL', 45, 'Prof. Johnson');
INSERT INTO COURSE VALUES (3003, 'Database Optimization', 60, 'Dr. Brown');
COMMIT;
```

### **Create `ENROLLMENT` Table (Many-to-Many Relationship)**
```sql
CREATE TABLE ENROLLMENT (
    EMPNO NUMBER(4),
    COURSE_ID NUMBER(4),
    ENROLL_DATE DATE,
    PRIMARY KEY (EMPNO, COURSE_ID)
);
```

### **Insert Sample Data into `ENROLLMENT` Table**
```sql
INSERT INTO ENROLLMENT VALUES (7369, 3001, TO_DATE('01-FEB-2024', 'DD-MON-YYYY'));
INSERT INTO ENROLLMENT VALUES (7521, 3002, TO_DATE('15-FEB-2024', 'DD-MON-YYYY'));
INSERT INTO ENROLLMENT VALUES (7839, 3003, TO_DATE('10-MAR-2024', 'DD-MON-YYYY'));
COMMIT;
```

---

## **7. Verifying Data and Relationships**

### **View Employees and Their Departments**
```sql
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOCATION
FROM EMP E
JOIN DEPARTMENTS D ON E.DEPTNO = D.DEPTNO;
```

### **View Employees and Their Enrolled Courses**
```sql
SELECT E.EMPNO, E.ENAME, C.COURSE_NAME, C.INSTRUCTOR
FROM ENROLLMENT EN
JOIN EMP E ON EN.EMPNO = E.EMPNO
JOIN COURSE C ON EN.COURSE_ID = C.COURSE_ID;
```

---

## **8. Final Database Structure**
### **Tables and Relationships**
```
DEPARTMENTS (DEPTNO) <--> EMP (DEPTNO)  
EMP (EMPNO) <--> PROJECTS (EMPNO)  
EMP (EMPNO) <--> TASKS (EMPNO)  
PROJECTS (PROJECT_ID) <--> TASKS (PROJECT_ID)  
EMP (EMPNO) <--> ENROLLMENT (EMPNO) <--> COURSE (COURSE_ID)
```

This ensures proper referential integrity between employees, departments, projects, tasks, and courses.

---

## **9. Conclusion**
This guide extends the SCOTT schema by adding:
✅ **DEPARTMENTS** table linked to **EMP**.  
✅ **PROJECTS** table linked to **EMP**.  
✅ **TASKS** table linked to **EMP** and **PROJECTS**.  
✅ **COURSE and ENROLLMENT tables** to support employee course registration.  
✅ **Sample data for verification**.  

This provides a **realistic business scenario** for database learning and SQL query practice. 🚀

