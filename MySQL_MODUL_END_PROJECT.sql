-- create database library
create database library;
show databases;
use library;

-- create table branch
create table branch(Branch_no int PRIMARY KEY,
    Manager_Id int,
    Branch_address VARCHAR(25),
    Contact_no VARCHAR(20));
    
-- create employee table
create table Employee(Eml_Id INT PRIMARY KEY,
    Eml_name VARCHAR(25),
    Position VARCHAR(20),
    Salary DECIMAL(10, 2),
    Branch_no int,
    FOREIGN KEY (Branch_no) references Branch(Branch_no));
    
-- create books table
create table Books(
    ISBN VARCHAR(30) PRIMARY KEY,
    Book_title VARCHAR(35),
    Category VARCHAR(30),
    Rental_Price DECIMAL(20, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(30),
    Publisher VARCHAR(35));
    
    -- create customer table
    create table Customer(
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(25),
    Customer_address VARCHAR(25),
    Reg_date DATE);
    
    -- create IssueStatus table
   create table IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(35),
    Issue_date DATE,
    isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (isbn_book) REFERENCES Books(ISBN));
   
    
    -- create ReturnStatus table
    create table ReturnStatus(Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(35),
    Return_date DATE,
    isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN));
    
    -- display all the tables
    insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)values 
    (1, 101, 'TM plazza', '9745715298'),
	(2, 102, 'North crist', '7854674300'),
	(3, 103, 'Hill top', '7689452891'),
	(4, 104, 'KT valley', '8590490644'),
	(5, 105, 'HFR yuo', '9061399505');
    select * from branch;
    
    insert into Employee (Eml_Id, Eml_name, Position, Salary, Branch_no)values 
    (101, 'Adil', 'Manager', 50000, 2),
	(102, 'Maya', 'Librarian', 40000, 5),
	(103, 'Vinu', 'Clear', 48000, 2),
	(104,'Aswathi', 'Librarian', 48000, 2),
	(105, 'Nikhil', 'Manager', 55000, 3),
    (106, 'Harald', 'Cleark', 43000, 5),
	(107, 'Miya', 'Security', 30000, 4),
	(108, 'Jimmy', 'Cleark', 42000, 2),
	(109, 'John', 'Librarian', 39000, 2),
	(110, 'Arun', 'Manager', 57000, 2);
    select * from employee;
  
insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values 
('1001', 'The Picture of Dorian Gray', 'Fiction', 399, 'yes', 'Oscar Wilde', 'Penguin Classics'),      
('1002', 'Pride and Prejudice', 'Romance', 799, 'yes', 'Jane Austen', 'Vintage Classics'),
('1003', 'Dracula', 'horror', 599, 'no', 'Bram Stoker', 'Penguin Classics'),
('1004', 'Anna Karenina', 'Classic', 499, 'yes', 'Frances Hodgson Burnett ', 'Puffin Classics'),
('1008', 'Watership Down', 'Fantacy', 699, 'yes', 'Richard Adams', 'Penguin books'),
('1006', 'The Road', 'Fiction', 699, 'no', 'Cormac McCarthy', 'vintage'),
('1007', 'Crime and Punishment', 'Psychological Thriller', 849, 'yes', 'Fyodor Dostoevsky', 'Penguin Classics'),
('1008', 'The Hobbit', 'Fantasy', 599, 'yes', ' J.R.R. Tolkien', 'HarperCollins'), 
('1009', 'Anna Karenina', 'Classic', 1199, 'no', 'Leo Tolstoy', 'vintage Classic'), 
('1010', 'Brave New World', 'Fiction', 699, 'yes', 'Aldous Huxley', 'Harper Perennial ');
select * from Books;

insert INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) values 
(101, 'Ava', '123 Main Street ', '2021-05-10'),
(102, 'Max', '456 Oak Avenue', '2022-07-06'),
(103, 'Mia', '789 Maple Drive', '2023-09-22'),
(104, 'Leo', '101 Elm Street','2024-02-21'),
(105, 'Zoe', '222 Pine Lane', '2021-08-29'),
(106, 'Ben', '333 Cedar Court', '2021-05-23'),
(107, 'Kai', '444 Birch Road', '2023-07-11'),
(108, 'Sam', '555 Walnut Street', '2021-12-20'),
(109, 'Eva', '666 Willow Way', '2022-03-27'),
(110, 'Ben', '777 Spruce Avenue', '2023-06-01');
select * from customer;

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, isbn_book)values 
(1, 107, 'Dracula', '2024-05-15', '1003'),
(2, 102, 'Anna Karenina', '2024-05-20', '1004'),
(3, 106, 'The Picture of Dorian Gray', '2024-05-25', '1001'),
(4, 104,'The Hobbit','2024-05-10','1008'),
(5, 103, 'Watership Down', '2024-06-01', '1008'),
(6, 102, 'Anna Karenina', '2024-06-05', '1004'),
(7, 102, 'The Hobbit', '2024-06-10', '1008'),
(8, 108, 'Crime and Punishment', '2024-06-15', '1007'),
(9, 103, 'The Road', '2023-06-05', '1006'),
(10,110, 'Pride and Prejudice', '2024-03-26', '1002');
select * from IssueStatus;


insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, isbn_book2) values 
(1, 107, 'Dracula', '2024-06-10', '1003'),
(2, 102, 'Anna Karenina', '2024-07-10', '1004'),
(3, 106, 'The Picture of Dorian Gray', '2024-06-25', '1001'),
(4, 104,'The Hobbit','2024-05-10','1008'),
(5, 103, 'Watership Down', '2024-07-01', '1008'),
(6, 102, 'Anna Karenina', '2024-07-05', '1004'),
(7, 102, 'The Hobbit', '2024-07-10', '1008'),
(8, 108, 'Crime and Punishment', '2024-07-15', '1007'),
(9, 103, 'The Road', '2023-07-05', '1006'),
(10,110, 'Pride and Prejudice', '2024-07-26', '1002');
select * from ReturnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books.

select Book_title, Category, Rental_Price from books where status= 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

select Eml_name, Salary from Employee order by Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

select b.Book_title, c.Customer_name from IssueStatus i join Books b ON i.isbn_book = b.isbn
join Customer c on i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.

select Category, COUNT(*) as Total_Books from Books group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select Eml_name, Position from Employee where Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

select Customer_name from Customer where Reg_date < '2022-01-01' and Customer_Id not in 
(select Issued_cust from IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

select Branch_no, count(*) AS Total_Employees from Employee group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

select distinct c.Customer_name from IssueStatus i join Customer c on i.Issued_cust = c.Customer_Id
where year(i.Issue_date) = 2023 and month(i.Issue_date) = 6;

-- 9. Retrieve book_title from book table containing history.

select Book_title from Books where Category = 'Fiction';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

select Branch_no, COUNT(*) AS Total_Employees from Employee group by Branch_no having count(*) > 2;
