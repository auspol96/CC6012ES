# MongoDB Atlas Setup & Getting Started Guide

This guide will walk you through setting up **MongoDB Atlas (Cloud)**, installing **MongoDB Compass**, and adding your first data entries into a document database.

---

## 🧰 Prerequisites
- A MongoDB Atlas account: [https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
- Internet connection
- A computer (Windows/macOS/Linux)

---

## Step 1: Create Cluster on MongoDB Atlas

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) and **create a free account**.
2. Click **"Build a Database"** > choose the **Free Shared (M0)** tier.
3. Choose a **Cloud Provider** (AWS, GCP, or Azure) and Region.
4. Name your cluster (e.g., `PTUCluster0`) and click **Create Cluster**.

---

## Step 2: Set Up User & Security

1. **Database Access** > Add New Database User
   - Username: `your_username`
   - Password: `your_password`
   - Role: Read and write to any database

2. **Network Access** > Add IP Address
   - Click **Add Current IP Address**
   - Or use `0.0.0.0/0` to allow access from anywhere

---

## Step 3: Connect Using MongoDB Compass

1. Go to **Database** > Click **Connect** > Choose **MongoDB Compass**
2. If you haven’t installed Compass:
   - Download Compass from the link provided
   - Install Compass for your OS (e.g., Windows 64-bit ZIP)

3. Copy the **connection string** (e.g., `mongodb+srv://username:password@cluster0.mongodb.net/`)

4. Open **MongoDB Compass**:
   - Paste the connection string
   - Click **Connect**

---

## Step 4: Create a New Database & Collection

1. In Compass:
   - Click **"+ Create Database"**
   - Database Name: `PTUstudent_db`
   - Collection Name: `students`
   - Click **Create Database**

---

## Step 5: Add Data to a Collection

1. Select the `students` collection.
2. Click **"ADD DATA" > Insert Document**.
3. Enter a JSON object like:

```json
{
  "student_id": 1,
  "name": "Alice",
  "major": "Computer Science",
  "GPA": 3.85
}
```

4. Click **Insert**.
5. Repeat to add more entries. Example:

```json
{
  "student_id": 2,
  "name": "Adele",
  "major": "Computer Science",
  "GPA": 4.0
}
```

---

## Step 6: Querying Data Using Filters

In the **Filter Box**, enter a query like:

```json
{ "GPA": { "$gte": 3.5 } }
```

Click **Find** to see matching documents.

---

## Optional: Explore Sample Datasets

1. In MongoDB Atlas > Cluster > Load Sample Dataset
2. Reload Compass to explore new collections like `sample_mflix`

---

## ✅ You’re Ready!
You now have a working cloud-hosted MongoDB setup, can connect using Compass, and perform basic document operations.

---

For any questions, feel free to raise issues or post in the GitHub Discussion tab of this repo!
