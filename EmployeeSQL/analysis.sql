-- Database: EmployeeSQL

--------------
-- analysis --
--------------

--------------------------------------------------------------------------------------
-- List the employee number, last name, first name, sex, and salary of each employee.
---------------------------------------------------------------------------------------
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary 
from employees as e
join salaries as s on e.emp_no=s.emp_no
;

------------------------------------------------------------------------------------------
-- List the first name, last name, and hire date for the employees who were hired in 1986.
------------------------------------------------------------------------------------------

select first_name, last_name, hire_date 
from employees 
where hire_date like '%1986' 
;

------------------------------------------------------------------------------------------------------------
-- List the manager of each department along with their department number, department name, employee number, 
-- last name, and first name.
------------------------------------------------------------------------------------------------------------

select e. emp_no, e.first_name, e.last_name, m.dept_no, d.dept_name
from employees as e
join dept_manager as m on m.emp_no = e.emp_no
join departments as d on d.dept_no = m.dept_no;

------------------------------------------------------------------------------------------------------
-- List the department number for each employee along with that employee’s employee number, last name,
-- first name, and department name.
------------------------------------------------------------------------------------------------------

select e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
;

--------------------------------------------------------------------------------------------------
-- List first name, last name, and sex of each employee whose first name is Hercules and whose 
-- last name begins with the letter B.
--------------------------------------------------------------------------------------------------

select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%' 
;

----------------------------------------------------------------------------------------------------------
-- List each employee in the Sales department, including their employee number, last name, and first name.
----------------------------------------------------------------------------------------------------------

select emp_no, first_name, last_name from employees where emp_no in 
(
	select emp_no from dept_emp where dept_no in
	(
		select dept_no from departments where dept_name = 'Sales'
	)
)
;

----------------------------------------------------------------------------------------------------------
-- List each employee in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.
----------------------------------------------------------------------------------------------------------

select emp_no, first_name, last_name from employees where emp_no in 
(
	select emp_no from dept_emp where dept_no in
	(
		select dept_no from departments where dept_name = 'Sales' or dept_name = 'Development'
	)
)
;

-----------------------------------------------------------------------------------
-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name)
-----------------------------------------------------------------------------------

select last_name, count(last_name) as "Frequency of Last Name"
from employees
group by last_name
order by count(last_name) desc
;

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------



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