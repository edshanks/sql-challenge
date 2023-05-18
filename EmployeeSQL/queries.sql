--query views
--#1
CREATE VIEW one AS
SELECT employees.emp_id,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries on 
employees.emp_id = salaries.emp_id;

--#2
CREATE VIEW two AS
SELECT first_name,
	last_name,
	sex,
	hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

--#3
CREATE VIEW three AS
SELECT dept_manager.dept_id,
	departments.dept_name,
	dept_manager.emp_id,
	employees.last_name,
	employees.first_name
FROM dept_manager

INNER JOIN employees ON
dept_manager.emp_id = employees.emp_id

INNER JOIN departments ON
dept_manager.dept_id = departments.dept_id;

--#4
CREATE VIEW four AS
SELECT dept_emp.id, dept_emp.emp_id,
	employees.last_name, employees.first_name,
	departments.dept_name
FROM dept_emp

INNER JOIN employees ON
dept_emp.emp_id = employees.emp_id

INNER JOIN departments ON
dept_emp.dept_id = departments.dept_id;

--#5
CREATE VIEW five AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE '%Hercules%' AND last_name LIKE 'B%'
;

--#6
CREATE VIEW six AS
SELECT emp_id, last_name, first_name
FROM employees
WHERE emp_id IN(
	SELECT emp_id
	FROM dept_emp
	WHERE dept_id IN(
		SELECT dept_id
		FROM departments
		WHERE dept_name LIKE '%Sales%'
		)
	);

--#7
CREATE VIEW seven AS
SELECT emp_id, last_name, first_name, 'Development' AS dept_name
FROM employees
WHERE emp_id IN(
	SELECT emp_id
	FROM dept_emp
	WHERE dept_id IN(
		SELECT dept_id
		FROM departments
		WHERE dept_name LIKE '%Development%'
		)
	)
	
UNION 	
	
SELECT emp_id, last_name, first_name, 'Sales' AS dept_name
FROM employees, departments
WHERE emp_id IN(
	SELECT emp_id
	FROM dept_emp
	WHERE dept_id IN(
		SELECT dept_id
		FROM departments
		WHERE dept_name LIKE '%Sales%'	
		)
	);
	
--#8
CREATE VIEW eight AS
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;