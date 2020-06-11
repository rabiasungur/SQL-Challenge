-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.sex, s.salary
from employees as e
right join salaries as s
on e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select t1. dept_no, t1.dept_name, t1.emp_no, e.last_name, e.first_name
from employees as e
join  (select d.dept_no, d.dept_name, dm.emp_no from departments as d join dept_manager as dm on d.dept_no = dm.dept_no) as t1
on e.emp_no = t1.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select t1.emp_no, e.last_name, e.first_name, t1.dept_name
from employees as e
join
	(select d.dept_name, de.emp_no 
	from departments as d
	join dept_emp as de
	on d.dept_no = de.dept_no) as t1
on e.emp_no = t1.emp_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select t1.emp_no, e.last_name, e.first_name, t1.dept_name
from employees as e
join
	(select d.dept_name, de.emp_no 
	from departments as d
	join dept_emp as de
	on d.dept_no = de.dept_no where dept_name = 'Sales') as t1
on e.emp_no = t1.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select t1.emp_no, e.last_name, e.first_name, t1.dept_name
from employees as e
join
	(select d.dept_name, de.emp_no 
	from departments as d
	join dept_emp as de
	on d.dept_no = de.dept_no where dept_name = 'Sales' or dept_name = 'Development') as t1
on e.emp_no = t1.emp_no

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as lastname_count from employees group by last_name order by lastname_count desc
