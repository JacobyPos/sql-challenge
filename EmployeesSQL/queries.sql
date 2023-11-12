--Queries

--Query 1
--employee info as well as salary
SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex,
	salaries.salary
FROM 
	employees
JOIN 
	salaries ON employees.emp_no = salaries.emp_no;
	
--Query 2
--for 1986 hires, first name, last name, and hire date
SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	hire_date::TEXT LIKE '1986%';
	
--Query 3
--Department managers, department info, and their employees info
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no AS "emp_no(Managers Only)",
	employees.first_name AS "last_name",
	employees.last_name AS "first_name"
FROM 
	dept_manager
JOIN 
	departments ON dept_manager.dept_no = departments.dept_no 
JOIN
	employees ON dept_manager.emp_no = employees.emp_no
ORDER BY
	dept_manager.dept_no;
	
--Query 4
--department employee info
SELECT
	dept_emp.dept_no,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name
FROM
	dept_emp
JOIN
	employees ON dept_emp.emp_no = employees.emp_no
ORDER BY
	dept_emp.dept_no;
	
--Query 5
--Employees name Hercules.  Last name starts with a B.
SELECT
	first_name,
	last_name,
	sex
FROM 
	employees
WHERE
	first_name = 'Hercules' 
	AND last_name LIKE 'B%'
ORDER BY last_name;

--Query 6
--Employees in the Sales department
SELECT
	employees.emp_no AS "emp_no(Sales Only)",
	employees.last_name,
	employees.first_name
FROM
	employees
JOIN
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales';
	
--Query 7
--employee/department info.  for Sales OR development
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development';

--Query 8
--frequency of last names in descending order
SELECT last_name, COUNT(last_name) AS "Frequency of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Name" DESC;
	