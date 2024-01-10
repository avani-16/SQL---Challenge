-- Data Analysis

-- 1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex,
	(SELECT s.salary
	FROM salaries AS s
	WHERE e.emp_no = s.emp_no)
FROM employees AS e
LIMIT 10
;

--2) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE DATE_PART('year',e.hire_date) = 1986
LIMIT 10
;

--3) List the manager of each department along with their department number, 
     -- department name, employee number, last name, and first name.

SELECT 
	dm.emp_no, 
	d.dept_name, 
	de.dept_no, 
	e.first_name, 
	e.last_name
FROM 
	dept_manager AS dm
	
JOIN dept_emp AS de	
	ON dm.emp_no = de.emp_no
JOIN employees AS e 
	ON de.emp_no = e.emp_no
JOIN departments AS d 
	ON de.dept_no = d.dept_no
;

--4) List the department number for each employee along with that employee’s employee number,
     -- last name, first name, and department name.

-- Create View for the query
CREATE VIEW all_dept_emp AS
SELECT 
	de.dept_no, 
    e.emp_no,
	e.first_name, 
	e.last_name, 
	d.dept_name
FROM 
	employees AS e
	
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
;
-- Display the View
SELECT 
	dept_no,
	emp_no,
	last_name,
	first_name,
	dept_name
FROM
	all_dept_emp
	
--5) List first name, last name, and sex of each employee whose 
     --first name is Hercules and whose last name begins with the letter B.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees AS e
WHERE
	(e.first_name = 'Hercules')
	AND
	(e.last_name LIKE 'B%')
ORDER BY
	e.last_name
;

--6) List each employee in the Sales department, 
     --including their employee number, last name, and first name.

-- Create view for question-6 and question-7
CREATE VIEW dept AS 
SELECT 
	emp_no,
	last_name,
	first_name,
	dept_name
FROM all_dept_emp
;

-- Display Employee for only Sales Department
SELECT *
FROM all_dept_emp
WHERE 
	dept_name = 'Sales' -- Sales department
;

--7) List each employee in the Sales and Development departments, 
     --including their employee number, last name, first name, and department name. 

SELECT *
FROM all_dept_emp
WHERE
	dept_name = 'Sales' 
    OR 
	dept_name = 'Development'
	
--8)List the frequency counts, in descending order, 
    -- of all the employee last names (that is, how many employees share each last name). 
	
SELECT 
	last_name,
	COUNT(last_name) AS frequency
FROM employees

GROUP BY last_name
ORDER BY 
	COUNT(last_name) DESC
;


