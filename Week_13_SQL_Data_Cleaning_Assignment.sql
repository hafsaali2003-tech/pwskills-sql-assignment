select * from dpp_28_sql_data;
-- Easy Level
/* Question 1: Identify NULL Values in the Position and Salary Columns. /*
Select *
from dpp_28_sql_data
where Position is null
or  Salary is null; 
/* Question 2: Update the Position column, replacing NULL values with 'Unknown'. /* 
set sql_safe_updates = 0;
Update dpp_28_sql_data 
set position = 'Unknown' 
where position is NULL; 
/* Question 3: Replace NULL salaries with the average salary of all employees. /* 
update dpp_28_sql_data 
set salary = ( select round(avg_salary) from (select avg(salary) as avg_salary
from dpp_28_sql_data ) as a )
where salary is NULL;
-- Intermediate Level 
 /* Question 4: Ensure all Position values are stored in lowercase for consistency. /* 
update dpp_28_sql_data 
set position = lower(position);
 /* Question 5: Find duplicate records where Gender, Experience (Years), Position, and Salary are identical. /*
select gender, `experience (Years)`, position, salary, count(*) as duplicates
from dpp_28_sql_data 
group by gender, `experience (Years)`, position, salary 
having count(*) > 1;
/* Question 6: Delete duplicate records, keeping the lowest ID. /*
delete from dpp_28_sql_data 
where id not in ( select emp_id from (
select min(id) as emp_id 
from dpp_28_sql_data 
group by gender, position, salary, `experience (years)`) as a);
-- Advanced Level 
/* Question 7: Replace salaries with the average salary per experience level. /*
update dpp_28_sql_data as d
join 
(select `experience (years)`, round(avg(salary)) as avg_salary
from dpp_28_sql_data
group by `experience (years)`) as a 
on   d.`experience (years)` = a.`experience (years)`
set d.salary = a.avg_salary;
/* Question 8 Identify and delete employees with negative or zero salaries. /* 
delete from dpp_28_sql_data 
where salary <= 0;
/* Question 9: Create a new column and Classify employees into salary bands:
"Low" (< 50,000)
"Medium" (50,000 - 100,000)
"High" (> 100,000). /*
alter table dpp_28_sql_data 
add Salary_Band varchar(20);
update dpp_28_sql_data 
set salary_band =
case 
when salary < 50000 then 'Low' 
when salary between 50000 and 100000 then 'Medium' 
else 'High' 
end; 
/* Question 10: Select employees who hold positions that do not contain 'Dev' in the position name. /* 
select *
from dpp_28_sql_data 
where position not like '%Dev%';
/* Question 11: Some employees have Experience (Years) < 0. Find and correct them. /* 
select * 
from dpp_28_sql_data 
where `experience (years)` < 0;
     update dpp_28_sql_data 
     set `experience (years)` = 'NULL'
     where `experience (years)` < 0;
/* Question 12: Find employees whose salary is below the 5th percentile or above the 95th percentile. /*
select * 
from 
(select *, percent_rank() over (order by salary) as percentile 
from dpp_28_sql_data 
where salary is not null ) as a 
where percentile < 0.5 
or percentile > 0.95; 

