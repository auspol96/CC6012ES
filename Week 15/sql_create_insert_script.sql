-- SQL Table Creation Scripts
CREATE TABLE Author (
    Author_id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50)
);

CREATE TABLE Publisher (
    P_Code INT PRIMARY KEY,
    P_Name VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Books (
    B_Code INT PRIMARY KEY,
    Title VARCHAR(100),
    Publisher VARCHAR(100),
    Price DECIMAL(10, 2),
    Paperback VARCHAR(10)
);

CREATE TABLE Written_By (
    Book_id INT,
    Author_id INT,
    FOREIGN KEY (Book_id) REFERENCES Books(B_Code),
    FOREIGN KEY (Author_id) REFERENCES Author(Author_id)
);

CREATE TABLE Inventory (
    Inventory_id INT PRIMARY KEY,
    Book_id INT,
    Stock INT,
    FOREIGN KEY (Book_id) REFERENCES Books(B_Code)
);

-- SQL Insert Sample Data
INSERT INTO Author VALUES (1, 'John', 'Doe');
INSERT INTO Author VALUES (2, 'Emily', 'Smith');
INSERT INTO Author VALUES (3, 'Robert', 'Brown');

INSERT INTO Publisher VALUES (101, 'Pearson', 'New York');
INSERT INTO Publisher VALUES (102, 'O''Reilly', 'San Francisco');
INSERT INTO Publisher VALUES (103, 'Springer', 'Berlin');

INSERT INTO Books VALUES (1001, 'Data Science 101', 'Pearson', 49.99, 'Yes');
INSERT INTO Books VALUES (1002, 'Learning SQL', 'O''Reilly', 39.99, 'No');
INSERT INTO Books VALUES (1003, 'Big Data Basics', 'Pearson', 29.99, 'Yes');

INSERT INTO Written_By VALUES (1001, 1);
INSERT INTO Written_By VALUES (1002, 2);
INSERT INTO Written_By VALUES (1003, 1);

INSERT INTO Inventory VALUES (1, 1001, 50);
INSERT INTO Inventory VALUES (2, 1002, 30);
INSERT INTO Inventory VALUES (3, 1003, 100);
