-- Database: EmployeeSQL

------------------------------------------
-- creating schemas for employee tables --
-------------------------------------------

-- table containing departments
create table departments 
(
	dept_no varchar(4) primary key,
	dept_name varchar(50)
);

-- table containing job titles
create table titles
(
	title_id varchar(5) primary key,
	title varchar(50)
);

-- table containing employee information (except salaries)
-- using varchar for emp_no as it takes up less storage than integer
create table employees
(
	emp_no varchar(7) primary key,
	emp_title varchar(5) not null,
	birth_date varchar(10),
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(1),
	hire_date varchar(10),
	foreign key (emp_title) references titles(title_id) 
);

-- junction table which tells which departments an employee is in
-- an employee can be part of more than one department
-- primary key will be a composite of employee and department number
create table dept_emp
(
	emp_no varchar(7) not null,
	dept_no varchar(4) not null,
	foreign key (emp_no) references employees(emp_no), 
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
);

-- table containing department managers 
-- a department can have multiple managers
-- primary key will be a composite of manager's employee number and department number
create table dept_manager
(
	dept_no varchar(4) not null,
	emp_no varchar(7) not null,
	foreign key (emp_no) references employees(emp_no), 
	foreign key (dept_no) references departments(dept_no),
	primary key (dept_no, emp_no)
);

-- table containing employee salaries
create table salaries
(
	emp_no varchar(7) primary key,
	salary float,
	foreign key (emp_no) references employees(emp_no)
);


-- DROP DATABASE IF EXISTS "EmployeeSQL";

CREATE DATABASE "EmployeeSQL"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "EmployeeSQL"
    IS 'for sql challenge';