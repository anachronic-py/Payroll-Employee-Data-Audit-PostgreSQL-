# Payroll & Employee Data Audit (PostgreSQL)

## 📌 Project Overview
As a Finance MBA student transitioning into Data Analytics, I built this project to demonstrate how **PostgreSQL** can streamline financial reconciliation and departmental auditing. Moving beyond manual spreadsheets, this database allows for scalable, automated reporting on payroll distribution and employee demographics.

## 🛠️ Tech Stack
* **Database:** PostgreSQL (pgAdmin 4)
* **Language:** SQL
* **Key Concepts:** Relational Schema Design, Inner Joins, Aggregations, Subqueries.

## 🗂️ Database Schema
The project consists of two primary tables:
1. **`employee`**: Contains core professional data (ID, Salary, Designation, Hire Date).
2. **`department`**: Contains organizational data (Department Name, Age) linked via Employee Name.

## 🚀 Key Queries & Insights

### 1. Departmental Payroll Summary
I used `GROUP BY` and `SUM` to calculate the total salary outflow per department, helping management understand budget allocation at a glance.

```sql
SELECT d.department_name, 
       SUM(e.salary) AS total_cost, 
       ROUND(AVG(d.age), 1) AS average_age
FROM employee AS e
INNER JOIN department AS d ON e.employee_name = d.employee_name
GROUP BY d.department_name;

2. Identifying Top Earners (Subqueries)
Instead of manual filtering, I implemented a dynamic subquery to extract the highest-paid employee(s) across the entire organization.

SQL

SELECT e.employee_name, d.department_name, e.salary
FROM employee AS e
INNER JOIN department AS d ON e.employee_name = d.employee_name
WHERE e.salary = (SELECT MAX(salary) FROM employee);
3. Tenure Analysis
Calculating seniority by comparing the hire_date to the current system date.

SQL

SELECT e.employee_name, d.department_name, 
       CURRENT_DATE - e.hire_date AS days_employed
FROM employee AS e
JOIN department AS d ON e.employee_name = d.employee_name
ORDER BY days_employed DESC;
📈 Business Value
Efficiency: Reduces the time taken for monthly payroll audits.

Accuracy: Minimizes human error associated with VLOOKUPs in Excel.

Scalability: The logic remains consistent whether auditing 5 employees or 5,000.

Author: Naman Kumar Finance MBA | Aspiring Data Analyst
