
-- 1. List the following details of each employee: employee number,
-- last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no
;

-- 2. List employees who were hired in 1986.

SELECT emp_no, hire_date
FROM employees
WHERE hire_date LIKE '1986%'
;

-- 3. List the manager of each department with the following 
-- information: department number, department name,
-- the manager's employee number, last name, first name, 
-- and start and end employment dates.

SELECT d.dept_no, d.dept_name, man.emp_no,
e.last_name, e.first_name, dept_emp.from_date, dept_emp.to_date
FROM departments as d
  INNER JOIN dept_manager as man ON d.dept_no = man.dept_no
  INNER JOIN employees as e ON man.emp_no = e.emp_no
  INNER JOIN dept_emp ON dept_emp.emp_no = e.emp_no
;

-- 4. List the department of each employee with the following 
-- information: employee number, last name, first name, 
-- and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
  INNER JOIN departments as d ON dept_emp.dept_no = d.dept_no
;

-- 5. List all employees whose first name is
-- "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name
FROM employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
  INNER JOIN departments as d ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number,last name, 
-- first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
  INNER JOIN departments as d ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS Count_of_last_name 
FROM employees 
GROUP BY last_name
ORDER BY COUNT_of_last_name
DESC
;




