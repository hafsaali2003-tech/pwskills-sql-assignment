-- 1 – Introduction to SQL and Basic Queries
-- Objective: Understand the basic concepts of SQL and perform basic queries.
/* 1. Task 1: Setup a Database
. Install MySQL or PostgreSQL.
. Create a database named company_db. /*
create database company_db;
use company_db;
/* 2. Task 2: Create a Table
Create a table employees with the following columns:
. id (INTEGER, Primary Key)
. first_name (VARCHAR)
. last_name (VARCHAR)
. department (VARCHAR)
. salary (INTEGER) /*
create table employees (
id integer primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary integer );
/* 3. Task 3: Insert Data
. Insert at least 5 records into the employees table. /*
insert into employees (id, first_name, last_name, department, salary)
values
(1, 'Hafsa', 'Ali', 'Data Analytics', 60000),
(2, 'Bushra', 'Anjum', 'Data Science', 50000),
(3, 'Taiba', 'Khan', 'Urdu Teacher', 45000),
(4, 'Rasha', 'Ali', 'Makeup Artist', 40000),
(5, 'Sakshi', 'Tripathi', 'HR Executive', 30000);
/* 4. Task 4: Basic SELECT Query
. Retrieve all data from the employees table. /*
select * from employees;
update employees set department = 'Sales'
where id = 2;
-- 2 – Filtering Data Using WHERE Clause
-- Objective: Learn how to filter data using the WHERE clause.
/* 1. Task 1: Basic Filtering
. Write a query to retrieve all employees from the Sales department. /*
select * from employees
where department = 'Sales';
/* 2. Task 2: Comparison Operators
. Write a query to find employees with a salary greater than 50000. /*
select * from employees
where salary > 50000;
update employees set salary = 65000
where id = 2;
/* 3. Task 3: Logical Operators (AND, OR)
. Retrieve all employees from the Sales department and whose salary is greater than 50000. /*
select * from employees
where department = 'Sales'
and salary > 50000;
/* 4. Task 4: DISTINCT Keyword
. Retrieve a list of unique departments from the employees table. /*
select distinct department from employees;
-- 3 – Modifying Data (INSERT, UPDATE, DELETE)
-- Objective: Understand how to modify data.
/* 1. Task 1: Inserting Multiple Rows
. Insert 3 more employees into the employees table using a single INSERT statement. /*
insert into employees (id, first_name, last_name, department, salary)
values
(6, 'Divyanshi', 'Rastogi', 'Heart Surgeon', 55000),
(7, 'Samra', 'Fatima', 'Professor', 35000),
(8, 'Sakshi', 'Mishra', 'Sales', 45000);
/* 2. Task 2: Updating Data
. Update the salary of the employee with id = 2 (Jane Smith) to 60000. /*
Update employees set salary = 60000
where id = 2
and first_name = 'Jane'
and last_name = 'Smith';
Update employees set 
first_name = case
when id = 2 then 'Jane'
when id = 3 then 'John'
end,
last_name = case
when id = 2 then 'Smith'
when id = 3 then 'Doe'
end
where id in ( 2, 3);
/* 3. Task 3: Deleting Data
Delete the employee with id = 3 (John Doe). /*
delete from employees where id = 3 
and first_name = 'John'
and last_name = 'Doe';
/* 4. Task 4: Verify Changes
. Use SELECT * FROM employees; to verify the changes. /*
select * from employees;
-- 4 – Using Constraints (NOT NULL, UNIQUE, DEFAULT, CHECK)
-- Objective: Learn about constraints for data integrity.
/* 1. Task 1: Create a Table with Constraints
. Create a new table employees_v2 with NOT NULL, UNIQUE, and CHECK constraints. /*
create table employees_v2 (
id integer primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
department varchar(50),
salary integer check ( salary > 0) 
);
/* 2. Task 2: Insert Data with Constraints
. Try inserting data into employees_v2, including a duplicate email to observe the UNIQUE constraint
violation. /*
insert into employees_v2 (id, first_name, last_name, email, department, salary)
values
(1, 'Aqsa', 'Ali', 'aqsa@gmail.com', 'Data Analytics', 60000),
(2, 'Hera', 'Anjum', 'aqsa@gmail.com', 'Data Science', 50000);
select * from employees_v2;
