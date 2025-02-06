**Oracle Database 21c Express Edition Installation & Setup Guide**

---

## **1. Introduction**
This guide provides step-by-step instructions for installing Oracle Database 21c Express Edition (XE), configuring essential settings, creating the SCOTT user, and setting up tables with sample data.

---

## **2. Installation of Oracle Database 21c XE**

### **2.1 Download Oracle XE**
1. Go to the **Oracle XE download page**:  
   [https://www.oracle.com/database/technologies/xe-downloads.html](https://www.oracle.com/database/technologies/xe-downloads.html)
2. Download the appropriate version for Windows.

### **2.2 Install Oracle XE**
1. Locate the downloaded installer (`OracleXE213_Win64.zip`) and extract it.
2. Run `setup.exe` as **Administrator**.
3. Follow the installation wizard:
   - Accept the License Agreement.
   - Choose the installation directory (default is recommended).
   - Set a strong password for **SYSTEM** and administrative users.
   - Click **Install** and wait for the process to complete.
4. Once installed, restart your computer.

### **2.3 Verify Oracle Services**
After restarting:
1. Open **Command Prompt (cmd)** as Administrator.
2. Check if the Oracle listener is running:
   ```cmd
   lsnrctl status
   ```
   - If not running, start it with:
     ```cmd
     lsnrctl start
     ```
3. Check if the database is up:
   ```cmd
   sqlplus / as sysdba
   SELECT NAME, OPEN_MODE FROM V$PDBS;
   ```
   - If `XEPDB1` is not `READ WRITE`, open it:
     ```sql
     ALTER PLUGGABLE DATABASE XEPDB1 OPEN;
     ```

---

## **3. Configure TNS Names for Easy Connection**
1. Locate `tnsnames.ora`:
   ```
   C:\app\karattapol\product\21c\homes\OraDB21Home1\network\admin\tnsnames.ora
   ```
2. Edit `tnsnames.ora` and add this entry:
   ```
   XEPDB1 =
     (DESCRIPTION =
       (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
       (CONNECT_DATA =
         (SERVICE_NAME = xepdb1)
       )
     )
   ```
3. Save and close the file.
4. Test the connection:
   ```cmd
   tnsping xepdb1
   ```
   - If successful, it should return **OK**.

---

## **4. Create the SCOTT User and Schema**

### **4.1 Create SCOTT User**
1. Open Command Prompt and login as SYSTEM:
   ```cmd
   sqlplus system/YourPassword@xepdb1
   ```
2. Run the following SQL commands:
   ```sql
   CREATE USER SCOTT IDENTIFIED BY tiger;
   GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO SCOTT;
   ```

### **4.2 Log in as SCOTT**
1. Exit SYSTEM session:
   ```sql
   EXIT;
   ```
2. Connect as SCOTT:
   ```cmd
   sqlplus scott/tiger@xepdb1
   ```

---

## **5. Create Tables and Insert Sample Data**

### **5.1 Create DEPT and EMP Tables**
```sql
CREATE TABLE DEPT (
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP (
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
```

### **5.2 Insert Sample Data**
```sql
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-DEC-1980', 'DD-MON-YYYY'), 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02-APR-1981', 'DD-MON-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('01-MAY-1981', 'DD-MON-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('09-JUN-1981', 'DD-MON-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('03-DEC-1981', 'DD-MON-YYYY'), 950, NULL, 30);
COMMIT;
```

### **5.3 Verify Tables**
```sql
SELECT * FROM EMP;
SELECT * FROM DEPT;
```
If you see employee records, the setup is complete!

---

## **6. Conclusion**
This guide has provided step-by-step instructions to:
- Install Oracle Database 21c XE.
- Configure TNS for easy connections.
- Create the SCOTT user.
- Set up EMP and DEPT tables with sample data.

Your Oracle database is now ready for use! 🚀

