# 📘 MongoDB Compass Guide Part 2: Create Related Collections and Join Data

## 🔹 Objective
Students will learn how to:
- Create new collections: `courses`, `enrollments`
- Insert related data
- Use `$lookup` to join collections and simulate relational joins

---

## 🔧 Step 1: Create the `courses` Collection

1. In MongoDB Compass, click on your database `PTUStudent_db`
2. Click `+ Create Collection`
3. Name it `courses`, then click `Create Collection`
4. Click on the `courses` collection and select `Add Data > Insert Document`

Example document:
```json
{
  "course_id": "CS101",
  "course_name": "Introduction to Programming",
  "credit": 3
}
```

Add another:
```json
{
  "course_id": "CS102",
  "course_name": "Data Structures",
  "credit": 3
}
```

---

## 🔧 Step 2: Create the `enrollments` Collection
This collection links students to the courses they're taking.

1. Create a collection named `enrollments`
2. Insert documents like:
```json
{
  "student_id": 1,
  "course_id": "CS101",
  "semester": "1/2024"
}
```

Add another:
```json
{
  "student_id": 1,
  "course_id": "CS102",
  "semester": "1/2024"
}
```

---

## 🔍 Step 3: Use `$lookup` to Join Collections

### What is `$lookup`?
`$lookup` is a MongoDB aggregation operator that performs a **left outer join** to retrieve matching documents from another collection.

#### Syntax:
```json
{
  "$lookup": {
    "from": "<other_collection>",
    "localField": "<field_in_current_collection>",
    "foreignField": "<field_in_other_collection>",
    "as": "<output_field_name>"
  }
}
```

### ✏️ Join `enrollments` with `courses`
1. Go to the `enrollments` collection
2. Select the **Aggregations** tab
3. Click `+ Add Stage`, then choose `$lookup`
4. Enter this:
```json
{
  from: "courses",
  localField: "course_id",
  foreignField: "course_id",
  as: "course_details"
}
```
5. Click `Execute` to view the result

---

## 🔍 Step 4: Join Student Info into the Result

1. Add another `$lookup` stage:
```json
{
  from: "students",
  localField: "student_id",
  foreignField: "student_id",
  as: "student_info"
}
```
2. Execute again

You should now see both course and student info embedded in your result documents.

---

## 📋 Example Final Result
```json
{
  "student_id": 1,
  "course_id": "CS101",
  "semester": "1/2024",
  "course_details": [
    {
      "course_id": "CS101",
      "course_name": "Introduction to Programming",
      "credit": 3
    }
  ],
  "student_info": [
    {
      "student_id": 1,
      "name": "Alice",
      "major": "Computer Science",
      "GPA": 3.25
    }
  ]
}
```

---

## 🏃\200d♂️ Next Challenge
Ask students to:
- Add new students and courses
- Enroll different students in different courses
- Try creating queries that filter by student GPA or course name using the filter box

---

Happy joining! 🚀