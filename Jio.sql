
# Jio Case Study

create table Employee (
Emp_ID int(10),
First_Name varchar(10),
Last_Name varchar(10),
Dept_code int (3));

insert into Employee (Emp_ID, First_Name, Last_Name, Dept_Code)
values
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

create table Department(
Dept_Code int (10),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Department (Dept_Code,Dept_Name,Dept_Budget)
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);

#1 What are the unique Last_Names from the Employee Table?
select distinct Last_Name from employee;

#2 What is the total number of employees in the company?
select count(emp_id) from employee;

#3 What is the total budget for the company?
select sum(dept_budget) from department;

#4 What is the department code and budget for the "Operations" department?
SELECT Dept_name, Dept_Code, Dept_Budget FROM Department WHERE Dept_Name = 'Operations'; 

#5 What is the total budget for the "Information Technology" and "Finance and Accounting" departments?
SELECT SUM(Dept_Budget) FROM Department WHERE Dept_Name IN ('Information Technology', 'Finance and Accounting');

#6 Who are the employees working in the "Sales and Marketing" department?
select * from employee where dept_code = 23; 

#7 What is the name of the employee with Emp_ID 718929853?
select * from employee where emp_id = 718929853;

#8 What is the budget for the "Customer Service" department?
SELECT Dept_Budget FROM Department WHERE Dept_Name = "Customer Service";

#9 What is the total budget for all departments except "Operations"?
select Dept_Name, sum(dept_budget) from department where Dept_Name not in ("Operations") group by Dept_Name;

#10 What is the Emp_ID, First_Name and department_code of the employee with the last name "Shukla"?
select Emp_ID, First_Name, dept_code from employee where Last_Name = "Shukla";

#11 What is the average budget for the departments with Dept_Code 23 and 43?
select avg(dept_budget) from department where dept_code in (23,43);

#12 How many employees are there whose first name starts with the letter "S"?
select count(*) from employee where first_name like 'S%';

#13 List the name of Employees whose First_name starts with "S".
select * from employee where first_name like 'S%';

#14 List the name of Employees whose First_name starts with "S" and ends with "A".
select * from employee where first_name like 'S%A';

#15 Fetch Top 3 records of all the Departments in descending order based on the budget of the department.
select * from department order by Dept_Budget desc limit 3;

#16 Fetch data of all employees from the employee table whose dept_code is an odd number
SELECT * FROM Employee WHERE dept_code in(select dept_code from employee where dept_code%2=1);

#17 Create a clone of the table employee with a name Clone_table and having two columns, one with full name and the other with the department code with an alias D_Code
create table Clone_table
select concat (first_name," ", last_name) as Full_Name, Dept_code as D_Code from employee;

select * from Clone_table;

#18 Delete employee details of "Ajay Kumar" from Clone_Table
delete from clone_table where full_name = "Ajay Kumar";

#19 The name of the employee "rahul Srivasatava" has a lower case 'r', make changes in the clone table so that the full_name is written as "Rahul Srivastava"
update clone_table set full_name = "Rahul Srivastava" where full_name = "rahul Srivastava";

#20 Convert Full_name from clone table into uppercase.
update clone_table set full_name = upper(full_name);

#21 Fetch second to fifth record from the department table based on the Highest Budget.
select * from department order by dept_budget desc limit 2,5; 

#22 The employee with the name "Jalpesh Modi" has decided to move into another department, delete the D_code value corresponding to "Jalpesh_Modi" from the clone_table
update clone_table set D_code=null where full_name = "Jalpesh Modi";

#23 Change the name of the column D_Code to Department_code in clone table.
alter table clone_table rename column D_code to Department_Code;

#24 Since no mathematical operation will be performed on emp_id in employee table, convert its data type from int to varchar
alter table employee modify column Emp_ID varchar(20);

#25 The Company has decided to increase the budget of all the department by 10% , make changes accordingly to fetch old and new budget
select dept_code, dept_name, dept_budget as old_budget, dept_budget * 1.1 as new_budget from department;

#26 What is the name of the department with the lowest budget?
select dept_name, dept_budget from department order by dept_budget asc limit 1;

#27 Who are the employees working in the departments with budgets greater than 40,000,000?
select * from employee e join department d 
on e.Dept_Code = d.Dept_Code where dept_budget > 40000000;

#28 What is the name of the department with the second highest budget?
select * from department d order by dept_budget desc limit 1,1; 

#29 How many employees are there in each department?
SELECT Dept_Code, COUNT(*) AS total_employees
FROM Employee GROUP BY Dept_Code;

#30 Create a view of Employees working in Sales and Marketing department only.
CREATE VIEW sales_marketing_info AS
SELECT Employee.*, Department.Dept_Name FROM Employee
JOIN Department ON Employee.Dept_code = Department.Dept_Code
WHERE Department.Dept_Name = 'Sales and Marketing';

select * from sales_marketing_info; 