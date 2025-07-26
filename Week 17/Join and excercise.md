--Week 4: Displaying Data from Multiple Tables
```sql
SELECT B.Title, B.P_Code, P.P_Name 
FROM Books B, Publisher P
WHERE P.P_Code = B.P_Code order by B.Title;
```

```sql
SELECT I.B_Code, B.Title, B.Price, I.Quantity
FROM Inventory I, Books B
WHERE I.B_Code = B.B_Code;
```

```sql
SELECT I.B_Code, B.Title, B.Price, I.Quantity
FROM Inventory I, Books B
WHERE I.B_Code = B.B_Code
AND I.Quantity = 3;
```

```sql
SELECT I.B_Code, B.Title, B.Price, I.Quantity
FROM Books B, Inventory I
WHERE I.B_Code (+) = B.B_Code;
```

```sql
SELECT first.Author_ID, Second.Author_ID, first.B_Code
FROM Written_By first, Written_By Second
WHERE first.B_Code = Second.B_Code;

```
--excercise 1
1.	Write a query to display author’s last name, Publisher name and city for all the books.
2.	Crate a unique listing of the book name published by Penguin USA. Include the publishers name in the output.
3.	Write a query to display Authors last name, Publisher name and city of all the books with type ART.
4.	Display the name of books and their publisher name for all the books whose publisher have ‘a’ as second character in their names.
5.	Write a query to display the First name of author, books name and the release date for all the books of type ‘MYS’

--Week 5: Aggregating Data Using Group Functions

SELECT AVG(Price) AS AVG FROM Books;

SELECT COUNT(Title) AS CountTitle FROM Books;

SELECT MAX(Price) AS MaxPrice FROM Books;

SELECT MIN(Price) AS Minimum FROM Books;

SELECT STDDEV(Price) AS STDDeviation FROM Books; 

SELECT SUM(Quantity) AS TotalInventory FROM Inventory;

SELECT VARIANCE(Price) AS VariancePrice FROM Books;

SELECT COUNT(DISTINCT P_Code) AS DistinctPublishers FROM Books;



select * from Written_By;

INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1001, 1);
INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1002, 2);
INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1003, 1);
INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1003, 3);
INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1004, 3);
INSERT INTO Written_By (BOOK_ID, AUTHOR_ID) VALUES (1005, 2);

select * from BOOKS;

SELECT column_name, data_type
FROM user_tab_columns
WHERE table_name = 'WRITTEN_BY';

SELECT BOOK_ID, COUNT(Author_id)  
FROM Written_By
GROUP BY BOOK_ID;

SELECT Paperback, Type, COUNT(Title)  
FROM Books
GROUP BY Paperback, Type;

select * from Books;

SELECT Paperback, Type, COUNT(Title)  
FROM Books
GROUP BY Paperback, Type
HAVING COUNT(Title) > 2;

SELECT MAX(AVG(Price))
FROM Books
GROUP BY P_Code;

--excercise 2
1. Display the details of book with highest price.
2. Display the details of books with lowest price.
3. Display the average price of all the books in BOOKS table
4. Display the sum of price for each type of Book.
5. Display the maximum price for each type of book.
6. Display the number of books of similar type.
7. Write a query to determine the difference between the highest and lowest price of the books.








