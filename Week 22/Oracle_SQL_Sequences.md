# Oracle SQL – Sequences

## 1. Introduction
A **SEQUENCE** is a database object that generates a sequence of unique numbers.  
It is often used to create primary key values automatically.

- **Shared by multiple users** → everyone can call the same sequence.  
- **Generates unique integers** → avoids duplicate values.  
- **Stored in Data Dictionary** → not in the table itself.  
- **Configurable** → can increase, decrease, cycle, or stop at a boundary value.

---

## 2. Syntax
```sql
CREATE SEQUENCE sequence_name
   [INCREMENT BY n]
   [START WITH n]
   [{MAXVALUE n | NOMAXVALUE}]
   [{MINVALUE n | NOMINVALUE}]
   [{CYCLE | NOCYCLE}]
   [{CACHE n | NOCACHE}];
```

### Explanation
- **INCREMENT BY n** → step size (+1, -1, +10, etc.)  
- **START WITH n** → first number generated  
- **MAXVALUE / MINVALUE** → limits of the sequence  
- **CYCLE / NOCYCLE** → loop back or stop when reaching boundary  
- **CACHE / NOCACHE** → performance option (cache stores numbers in memory)  

---

## 3. Creating a Sequence
```sql
CREATE SEQUENCE Author_seq
   INCREMENT BY 1
   START WITH 27
   MAXVALUE 9999
   NOCYCLE
   NOCACHE;
```

---

## 4. Viewing Sequences
To check all sequences you own:
```sql
SELECT * FROM USER_SEQUENCES;
```

---

## 5. Using Sequences
Insert a new record using the sequence:
```sql
INSERT INTO New_Author
VALUES (Author_seq.NEXTVAL, 'V.S.', 'Naipaul');
```

- `NEXTVAL` → generates the next number  
- `CURRVAL` → shows the current value of the sequence  

Example:
```sql
SELECT Author_seq.NEXTVAL FROM dual;   -- Get next number
SELECT Author_seq.CURRVAL FROM dual;   -- Get current number
```

---

## 6. Deleting a Sequence
```sql
DROP SEQUENCE Author_seq;
```

---

## 7. Hands-On Workshop

### Step 1: Create a Table
```sql
CREATE TABLE Students (
   Student_ID NUMBER PRIMARY KEY,
   First_Name VARCHAR2(50),
   Last_Name  VARCHAR2(50)
);
```

### Step 2: Create a Sequence
```sql
CREATE SEQUENCE Student_seq
   START WITH 1001
   INCREMENT BY 1
   MAXVALUE 2000
   NOCYCLE
   NOCACHE;
```

### Step 3: Insert Data Using Sequence
```sql
INSERT INTO Students
VALUES (Student_seq.NEXTVAL, 'John', 'Doe');

INSERT INTO Students
VALUES (Student_seq.NEXTVAL, 'Jane', 'Smith');
```

### Step 4: Verify Results
```sql
SELECT * FROM Students;
```
Expected:
```
STUDENT_ID | FIRST_NAME | LAST_NAME
-----------+------------+----------
1001       | John       | Doe
1002       | Jane       | Smith
```

### Step 5: Experiment
1. Change increment to `10` and observe how IDs are generated.  
2. Create a sequence with `CYCLE` and set `MAXVALUE 5`. Insert more than 5 rows and see how it restarts.  
3. Try `CURRVAL` and `NEXTVAL` queries separately.  

---

## 8. Practice Questions
1. Create a sequence that starts at 500, increments by 5, and cycles after reaching 520.  
2. Insert 6 rows using the above sequence into a test table. What happens to the values?  
3. Drop the sequence and recreate it with different settings.  

---

✅ **Key Takeaways**  
- Sequence = automatic number generator  
- Useful for IDs / primary keys  
- Configurable (increment, cycle, cache, etc.)  
- Shared across users  

---
