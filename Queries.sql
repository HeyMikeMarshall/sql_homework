-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no AS "Employee ID", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.gender AS "Gender", 
	s.salary AS "Salary"
	
    FROM employees AS e
    INNER JOIN salaries as s
    ON e.emp_no=s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * FROM employees 
    WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';


-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT m.dept_no AS "Department ID", 
	d.dept_name AS "Department Name", 
	m.emp_no AS "Employee ID", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	m.from_date AS "Start Date", 
	m.to_date AS "End Date"
	
    FROM dept_manager as m
        JOIN departments as d
            ON d.dept_no = m.dept_no
        JOIN employees as e
            ON e.emp_no = m.emp_no;



-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee ID", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
	
    FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
    JOIN departments AS d
	ON de.dept_no = d.dept_no;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * from employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';



-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee ID", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"

    FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
    JOIN departments AS d
	ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales';



-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee ID", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
	
    FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
    JOIN departments AS d
	ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(e.last_name) AS "Last Name Count", 
	e.last_name AS "Employee Last Name"
    FROM employees AS e
	GROUP BY e.last_name
	ORDER BY COUNT(e.last_name) DESC;