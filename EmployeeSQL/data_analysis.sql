-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s USING (emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT m.emp_no AS "employee_number", 
	m.dept_no AS "department_number",
	d.dept_name AS "department_name",
	e.last_name,
	e.first_name
FROM dept_manager m
INNER JOIN departments d ON m.dept_no = d.dept_no
INNER JOIN employees e ON m.emp_no = e.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no AS "department_numer",
	de.emp_no AS "employee_number",
	e.last_name,
	e.first_name,
	d.dept_name AS "department_name"
FROM dept_emp de
INNER JOIN employees e USING (emp_no)
INNER JOIN departments d USING (dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name 
SELECT de.emp_no AS "employee_number",
	e.last_name,
	e.first_name
FROM dept_emp de
LEFT JOIN employees e USING (emp_no)
WHERE de.dept_no IN
	(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no AS "employee_number",
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp de
LEFT JOIN employees e USING (emp_no)
LEFT JOIN departments d USING (dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;