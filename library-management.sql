CREATE DATABASE LibraryManagement;
USE LibraryManagement;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    Category VARCHAR(100),
    AvailableCopies INT DEFAULT 1
);
SHOW TABLES;
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
SHOW TABLES;
INSERT INTO Students (StudentName, Email, Phone)
VALUES
('Renuka', 'renuka@gmail.com', '9876543210'),
('Anjali', 'anjali@gmail.com', '9876543211'),
('Kavya', 'kavya@gmail.com', '9876543212'),
('Sravani', 'sravani@gmail.com', '9876543213'),
('Divya', 'divya@gmail.com', '9876543214');
SELECT * FROM Students;
INSERT INTO Books (Title, Author, Category, AvailableCopies)
VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction', 5),
('Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 3),
('Harry Potter', 'J.K. Rowling', 'Fantasy', 4),
('Python Programming', 'John Smith', 'Technology', 6),
('Database Systems', 'Abraham Silberschatz', 'Education', 2);
SELECT * FROM Books;
INSERT INTO Borrowings (StudentID, BookID, BorrowDate, ReturnDate)
VALUES
(1, 1, '2026-08-01', '2026-08-10'),
(2, 3, '2026-08-05', '2026-08-15'),
(3, 2, '2026-08-10', '2026-08-20'),
(1, 4, '2026-08-12', '2026-08-22'),
(4, 5, '2026-08-15', '2026-08-25');
SELECT * FROM Borrowings;
SELECT 
    Students.StudentName,
    Books.Title,
    Borrowings.BorrowDate,
    Borrowings.ReturnDate
FROM Borrowings
JOIN Students ON Borrowings.StudentID = Students.StudentID
JOIN Books ON Borrowings.BookID = Books.BookID;
SELECT * FROM Books
WHERE AvailableCopies > 3;
SELECT * FROM Books
ORDER BY Title ASC;
SELECT COUNT(*) AS TotalBooks
FROM Books;
SELECT Category, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category;
SELECT 
    Students.StudentName,
    COUNT(Borrowings.BookID) AS TotalBorrowed
FROM Students
LEFT JOIN Borrowings 
ON Students.StudentID = Borrowings.StudentID
GROUP BY Students.StudentID, Students.StudentName;
CREATE VIEW BorrowedBooks AS
SELECT 
    Students.StudentName,
    Books.Title,
    Borrowings.BorrowDate,
    Borrowings.ReturnDate
FROM Borrowings
JOIN Students ON Borrowings.StudentID = Students.StudentID
JOIN Books ON Borrowings.BookID = Books.BookID;
SELECT * FROM BorrowedBooks;