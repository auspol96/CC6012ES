# 📘 Data Replication & Replicated Databases  
### *Lecture Summary for Students*

## 1. 🌍 What is Data Replication?
**Data replication** is the process of **copying data from one database site to another** so that multiple locations have a **local copy** of frequently used data.

### Why do we replicate data?
- Faster access for users at different locations  
- Reduces network load  
- Provides backup copies  
- Improves system availability  

**Simple explanation:**  
Replication = *copy the data so each site has its own local version.*

---

## 2. 📂 Replicated Database (Partial Replication)

A **replicated database** is a distributed database where **some** of the data is duplicated across selected sites — not all data is copied everywhere.

### Key characteristics:
- Selected tables or records are copied  
- Each site stores **only some replicated data**  
- Lower storage cost than full replication  
- Balances performance and storage  

**Example:**  
Only the "Sales" table is copied to two branches, but "Customer" data is kept only at HQ.

---

## 3. 📦 Fully Replicated Database (Full Replication)

A **fully replicated database** stores the **entire database** at **every site** in the distributed system.

### Key characteristics:
- Every site has a full copy  
- Maximum availability and read performance  
- Higher storage requirements  
- Updates must be synchronised across all sites  

**Example:**  
All branches of a company store:  
- Full Customer table  
- Full Sales table  
- Full Inventory table  

---

## 4. 🗂 Comparison Table

| Feature | Data Replication | Replicated DB | Fully Replicated DB |
|--------|------------------|---------------|----------------------|
| Meaning | Process of copying data | Some data duplicated | All data duplicated |
| Storage Cost | Depends on amount | Medium | Very high |
| Read Performance | Improved locally | Improved where copied | Highest |
| Update Overhead | Medium | Medium–High | Highest |
| Use Case | Availability and speed | Balance cost/performance | Maximum availability |

---

## 5. 🧠 Memory Trick

- **Replication** → *The process*  
- **Replicated DB** → *Some* data copied  
- **Fully Replicated DB** → *All* data copied everywhere  

---

## 6. 🧪 Quick Quiz

1. Only the Inventory table is copied to each branch → **Replicated DB**  
2. Every site has the entire database → **Fully Replicated DB**  
3. Why is full replication expensive?  
   → Needs more storage & heavy synchronisation  
4. Which provides fastest read performance?  
   → Fully replicated DB  

---

## 7. ✍ Exam‑Ready Short Answer

**Data replication:**  
The process of copying and maintaining data across multiple sites.

**Replicated database:**  
A distributed database where only some data is duplicated across selected sites.

**Fully replicated database:**  
A distributed database where the entire database is duplicated and stored at all sites.
