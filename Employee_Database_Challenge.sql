--Deliverable 1
--make retirement table
SELECT employees.emp_no,
    employees.first_name,
employees.last_name,
	titles.titles,
titles.from_date,
	titles.to_date
INTO retirement_titles	
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

--unique_titles with Distinct On
SELECT DISTINCT ON (emp_no) 
    emp_no, 
first_name, 
    last_name, 
titles 
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no;

--retiring_titles
Select COUNT(unique_titles.titles), unique_titles.titles
INTO retiring_titles
from unique_titles
GROUP BY unique_titles.titles
Order By "count" DESC;

--Deliverable 2
--mentorship eligibility table
Select Distinct ON(employees.emp_no) 
    employees.emp_no, 
employees.first_name,
    employees.last_name,
employees.birth_date,
    dept_emp.from_date,
dept_emp.to_date,
    titles.titles
INTO mentorship_eligibility
FROM employees
LEFT Join dept_emp
ON (employees.emp_no=dept_emp.emp_no)
LEFT Join titles
ON(dept_emp.emp_no=titles.emp_no)
WHERE (dept_emp.to_date = '9999-01-01')
    AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by employees.emp_no;