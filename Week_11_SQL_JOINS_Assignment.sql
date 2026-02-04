create database retail_company;
use retail_company;
create table Customers (
CustomerId int primary key,
CustomerName varchar(50),
City varchar(50)
);
insert into Customers (CustomerId, CustomerName, City)
values
(1, 'Arjun Mehta', 'Mumbai'),
(2, 'Priya Sharma', 'Delhi'),
(3, 'Soham Mishra', 'Bengaluru'),
(4, 'Sneha Kapoor', 'Pune'),
(5, 'Karan Singh', 'Jaipur');
create table Orders (
OrderId int primary key,
CustomerId int,
OrderDate date,
Amount int
);
insert into Orders (OrderId, CustomerId, OrderDate, Amount)
values
(101, 1, '2024-09-01', 4500),
(102, 2, '2024-09-05', 5200),
(103, 1, '2024-09-07', 2100),
(104, 3, '2024-09-10', 8400),
(105, 7, '2024-09-12', 7600);
create table Payments (
PaymentId varchar(10) primary key,
CustomerId int,
PaymentDate date,
Amount int
);
insert into Payments (PaymentId, CustomerId, PaymentDate, Amount)
values
('P001', 1, '2024-09-02', 4500),
('P002', 2, '2024-09-06', 5200),
('P003', 3, '2024-09-11', 8400),
('P004', 4, '2024-09-15', 3000);
create table Employees (
EmployeeId int primary key,
EmployeeName varchar(50),
ManagerId int null
);
insert into Employees (EmployeeId, EmployeeName, ManagerId)
values
(1, 'Amit Khanna', null),
(2, 'Neha Joshi', 1),
(3, 'Vivek Rao', 1),
(4, 'Rahul Das', 2),
(5, 'Isha Kulkarni', 2);





