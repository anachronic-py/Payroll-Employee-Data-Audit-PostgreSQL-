create table employee(
	employee_id serial not null,
	employee_name varchar(50) not null,
	designation varchar(50) not null,
	salary numeric(10,2) not null,
	hire_date date not null
);

insert into employee( employee_name, designation, salary, hire_date)
	values
		('Ajit Kumar', 'MIS', 45000.00, '2025-10-10'),
		('Suman Kumari','Intern', 12000.00, '2025-11-12'),
		('Neha Raj', 'Recruiter', 30000.00, '2024-11-30'),
		('Jyoti Priya','Consultant', 24000.00, '2025-03-17'),
		('Amit Rai', 'Backend', 25000.00, '2023-01-25');
		
select * from employee;

		
create table department(
	employee_name varchar(50) not null,
	department_name varchar(50) not null,
	age numeric(3) not null
);

insert into department(employee_name, department_name, age)
	values
		('Ajit Kumar', 'Finance', 26),
		('Suman Kumari', 'Marketing', 22),
		('Neha Raj', 'HR', 24),
		('Jyoti Priya', 'Finance', 26),
		('Amit Rai', 'IT', 23);
		
select * from department;

-- check which employees belong to which department along with their salary.
select e.employee_name, e.designation, d.department_name, e.salary
from employee as e
inner join department as d
on e.employee_name = d.employee_name;

--employees who are in the Finance department and see their total cost to the company
select * from employee as e
inner join department as d
on e.employee_name = d.employee_name
where d.department_name = 'Finance';

--Let's see the name, department, and how many days they have been with the company since their hire_date.
select e.employee_name, d.department_name, Current_date - e.hire_date as days_employed
from employee as e
inner join department as d on e.employee_name = d.employee_name
order by days_employed desc;

--Calculate the Total Salary Outflow (Total Cost) and the Average Age for each department.
select d.department_name, sum(e.salary) as total_cost, avg(d.age) as average_age
from employee as e
inner join department as d on e.employee_name = d.employee_name
group by d.department_name;

--maximum salary earner
select * from employee as e
inner join department as d on e.employee_name = d.employee_name
where e.salary = (select max(salary) from employee);

-- minimum salary earner
select * from employee as e
inner join department as d on e.employee_name = d.employee_name
where e.salary = (select min(salary) from employee);
