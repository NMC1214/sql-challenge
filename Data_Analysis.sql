--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.sex,
	Salaries.salary
FROM Salaries
INNER JOIN Employees on Employees.emp_no = Salaries.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM Employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

--3.List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT Dept_Manager.Dept_no,
	Departments.Dept_name,
	Employees.Emp_no,
	Employees.last_name,
	Employees.first_name
FROM Employees
INNER JOIN Dept_Manager on Employees.Emp_no = Dept_Manager.emp_no
INNER JOIN Departments on Departments.Dept_no = Dept_Manager.Dept_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.Emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.Dept_name
FROM Employees
INNER JOIN Dept_Emp on Employees.Emp_no = Dept_Emp.emp_no
INNER JOIN Departments on Departments.Dept_no = Dept_Emp.Dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT Employees.first_name,
	Employees.last_name,
	Employees.sex
FROM Employees
WHERE Employees.last_name ~ '^B' AND Employees.first_name = 'Hercules';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.Emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp on Employees.Emp_no = Dept_Emp.emp_no
INNER JOIN Departments on Departments.Dept_no = Dept_Emp.Dept_no
WHERE Departments.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.Emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp on Employees.Emp_no = Dept_Emp.emp_no
INNER JOIN Departments on Departments.Dept_no = Dept_Emp.Dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT Employees.last_name,
	COUNT(Employees.last_name) AS last_name_count
FROM Employees
GROUP BY Employees.last_name
ORDER BY last_name_count DESC; 

--Bonus -- salaries and title for each employee
SELECT Employees.Emp_no,
	Employees.last_name,
	Employees.first_name,
	Salaries.salary,
	Titles.title
FROM Employees
INNER JOIN Salaries on Employees.Emp_no = Salaries.Emp_no
INNER JOIN Titles on Employees.title_id = Titles.title_id;
