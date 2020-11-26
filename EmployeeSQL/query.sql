-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
	ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE right(hire_date, 4) IN ('1986') ;    -- use IN because column hire_date is VARCHAR so cannot use '=' operator

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- Mapping connections: dept_manager: dept_no, dept_mag
--                      department: dept_name
--                      dept_emp: connect
--                      employees: emp_no, last name, first name

SELECT dm.dept_no as "Department number", d.dept_name as "Department name", dm.mag_no as "Manager number", e.emp_no as "Employee number", e.last_name as "Employee last name", e.first_name as "Employee first name"
FROM dept_manager dm
JOIN departments d
	ON dm.dept_no = d.dept_no
JOIN dept_emp de
	ON d.dept_no = de.dept_no
JOIN employees e
	ON de.emp_no = e.emp_no;
	
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- Mapping connections: employees: employee number, last name, first name
--                      dept_emp: dept_no
--                      departments: dept_name
SELECT e.emp_no as "Employee number", e.last_name as "Employee last name", e.first_name as "Employee first name", d.dept_name as "Department name" 
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex, d.dept_name
FROM employees e
WHERE first_name IN ('Hercules')
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT  e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = ('Sales');


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT  e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = ('Sales')
OR d.dept_name = ('Development')
ORDER BY first_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, count(last_name) as "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;

-- BONUS: See Jupyter Notebook file



