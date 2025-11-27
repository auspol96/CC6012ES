# Workshop 1 – Understanding Database Threats  
*(Beginner Level)*

## 1. Workshop Objective
Students will learn:
- Common database attack types  
- How these attacks occur  
- How organisations can mitigate them  

---

## 2. Background
Read the article:  
🔗 https://www.bcs.org/articles-opinion-and-research/top-ten-database-attacks/

---

## 3. Scenario
You are the Database Administrator (DBA) of a retail company.  
Management wants to understand common threats to the database and how to prevent them.

---

## 4. Tasks for Students

### **Task 1 – Identify & Describe 5 Attacks**
From the reading, list 5 attacks and write:
- What the attack is  
- Why it is dangerous  
- A real-life example (self-created)

**Suggested Answers**
1) **SQL Injection**  
   - Inject malicious SQL to read or change data.  
   - Dangerous because it bypasses authentication.  

2) **Privilege Abuse**  
   - Insider misuses access they already have.  

3) **Weak Authentication**  
   - Weak or reused passwords.  

4) **Malware Attacks**  
   - Keyloggers or ransomware capturing DB credentials.  

5) **Denial of Service (DoS)**  
   - Overloading DB to take system offline.

---

### **Task 2 – Explain How SQL Injection Works**
**Expected Answer (Simple Explanation)**  
SQL injection happens when user inputs are sent directly into SQL queries without validation, allowing attackers to modify the query.

Example:
```
SELECT * FROM users WHERE username = 'admin' OR '1'='1';
```

---

### **Task 3 – Recommend Solutions**
Students must propose solutions for 5 threats.

**Sample Solutions**
- Use prepared statements / parameterised queries  
- Apply least privilege principle  
- Strong passwords + MFA  
- Regular auditing  
- Firewall + network segmentation  
- Encryption of data in transit and at rest  

---

## 5. Summary
This workshop introduces beginning-level security awareness and prepares students for Workshop 2, where they will practice SQL access control.
