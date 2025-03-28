# Week 5: MongoDB Hands-On Guide

This guide summarizes the key points from the lecture slides starting from Slide 14 onward. It is designed to help you and your students get hands-on experience with MongoDB.

---

## 🚀 Getting Started with MongoDB

### 1. Download Tools (Local Setup)
- **MongoDB Community Server**: [Download here](https://www.mongodb.com/try/download/community)
- **MongoDB Compass (GUI)**: [Download here](https://www.mongodb.com/try/download/compass)

### 2. Use MongoDB Atlas (Cloud)
- Visit [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register)
- Create a free cluster.
- Load sample dataset (optional).
- Add your IP to the access list and create a database user.
- Connect using MongoDB Compass.

---

## 📦 Creating Databases and Collections
```javascript
use myNewDatabase

// Create a collection
db.createCollection("unicorns")

// Insert a document
db.unicorns.insert({ name: 'Aurora', gender: 'f', weight: 450 })
```

---

## 🔁 CRUD Operations

### Create (Insert)
```javascript
db.movies.insertOne({ title: "Titanic", year: 1997 })
db.movies.insertMany([{ title: "Inception" }, { title: "Interstellar" }])
```

### Read (Find)
```javascript
db.movies.find()
db.movies.find({ title: "Titanic" })
```

### Update
```javascript
db.movies.updateOne(
  { title: "Titanic" },
  { $set: { genre: "Drama" }, $currentDate: { lastModified: true } }
)
```

### Delete
```javascript
db.movies.deleteOne({ title: "Titanic" })
db.movies.deleteMany({ genre: "Drama" })
```

---

## 🔗 No Joins in MongoDB
MongoDB does not support joins like SQL. Instead, you:
- Use multiple queries
- Embed documents or arrays

Example:
```json
{
  name: "John",
  address: { city: "Bangkok", zip: "10200" }
}
```

---

## 📥 Denormalization
Rather than storing data in multiple tables, embed related info directly in one document.

Pros:
- Fast reads
- Simpler design

---

## 🔄 Aggregation Pipeline
```javascript
db.movies.aggregate([
  { $project: { _id: 0, genres: 1, imdb: 1, title: 1 } },
  { $unwind: "$genres" },
  { $group: { _id: "$genres", averageRating: { $avg: "$imdb.rating" } } },
  { $sort: { averageRating: -1 } }
])
```

---

## 🛠️ Advanced Tools

### Indexes
```javascript
db.movies.createIndex({ title: 1 })
```

### Explain Plan
```javascript
db.movies.find({ title: "Titanic" }).explain("executionStats")
```

### Replication
Ensures high availability by copying data to multiple servers.

### Sharding
Splits large data across multiple servers for better performance.

---

## ✅ Next Steps
- Practice creating your own collections and documents
- Explore Compass to visually interact with the data
- Try modifying and querying data using filters and projections

---

This guide was generated to help you and your students follow a simple, structured MongoDB experience. You can now upload this to GitHub for easy access.

Happy coding! 💻
