-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8QZPp8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Drop table if exists
DROP TABLE Dept_Emp;
DROP TABLE Salaries;
DROP TABLE Dept_Manager;
DROP TABLE Departments;
DROP TABLE Employees;
DROP TABLE Titles;

--create departments table
CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

--create salaries table
CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);

--create dept employees table
CREATE TABLE Dept_Emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

--create dept manager table
CREATE TABLE Dept_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);

--create titles table
CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

--create employees table
CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

--add foreign key restraints
ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_title_id FOREIGN KEY(title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


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
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

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