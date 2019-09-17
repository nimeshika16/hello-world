SELECT avg(salary), max(salary), min(salary), sum(salary) 
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%';

SELECT min(hire_date), max(hire_date)
FROM employees;

SELECT count(*) 
FROM employees
WHERE department_id=50;

SELECT count(commission_pct)
FROM employees
WHERE department_id=50;

SELECT count(distinct department_id)
FROM employees;

SELECT avg(commission_pct)
FROM employees;

SELECT avg(nvl(commission_pct,0))
FROM employees;

SELECT department_id, avg(salary)
FROM employees
GROUP BY department_id;

SELECT avg(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, sum(salary) 
FROM employees
WHERE department_id>40
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, max(salary)
FROM employees
GROUP BY department_id
HAVING max(salary)>10000;

SELECT job_id, sum(salary) AS payroll
FROM employees
WHERE job_id NOT LIKE '%REP'
GROUP BY job_id
HAVING sum(salary)>10000
ORDER BY sum(salary);

SELECT max(avg(salary))
FROM employees 
GROUP BY department_id;

SELECT employee_id, first_name, job_id, job_title
FROM employees NATURAL JOIN jobs;

SELECT first_name, last_name, department_id
FROM employees NATURAL JOIN departments;

SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments USING (department_id);

SELECT country_name, region_name
FROM countries JOIN regions USING(region_id);

SELECT l.city, d.department_name
FROM locations l JOIN departments d 
USING (location_id)
WHERE d.location_id=400;

SELECT l.city, d.department_name
FROM locations l JOIN departments d 
USING (location_id)
WHERE d.department_name='Operations';

SELECT e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
ON (e.department_id=d.department_id);

SELECT e.employee_id, j.job_title
FROM employees e JOIN jobs j
ON (e.job_id=j.job_id);

SELECT employee_id, city, department_name 
FROM employees e JOIN departments d 
ON d.department_id=e.department_id JOIN locations l 
ON d.location_id=l.location_id;

SELECT employee_id,city,department_name
FROM employees e
JOIN departments d
ON d.department_id=e.department_id
JOIN locations l
ON d.location_id=l.location_id
JOIN countries c
ON l.COUNTRY_ID=c.country_id
JOIN regions r
ON c.region_id=r.region_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id) AND e.manager_id=149;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id) WHERE e.manager_id=149;

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id=manager.employee_id);

SELECT e.last_name, e.salary, j.grade_level
FROM employees e JOIN job_grades j
ON e.salary 
BETWEEN j.lowest_sal AND j.highest_sal;

SELECT e.last_name, j.job_id, (j.end_date - j.start_date) "Duration"
FROM employees e JOIN job_history j
ON e.hire_date 
BETWEEN j.start_date AND j.end_date;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id=d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id(+)=d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id=d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id=d.department_id(+));

SELECT e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id=d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id(+)=d.department_id(+));

SELECT last_name, department_name
FROM employees CROSS JOIN departments;

SELECT last_name, hire_date 
FROM employees
WHERE hire_date> (SELECT hire_date
                  FROM employees
                  WHERE last_name='Davies');
                  
SELECT last_name, job_id, salary 
FROM employees
WHERE job_id = ANY(SELECT job_id
                FROM employees 
                WHERE last_name='Taylor')
AND salary > ANY(SELECT salary 
            FROM employees 
            WHERE last_name='Taylor');
            
SELECT last_name, job_id, salary
FROM employees
WHERE salary= (SELECT min(salary) FROM employees);

SELECT department_id,min(salary)
FROM employees
GROUP BY department_id
HAVING min(salary) > (SELECT min(salary) 
                      FROM employees 
                      WHERE department_id=50);
                      
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary <  ANY (SELECT salary FROM employees
                     WHERE job_id = 'IT_PROG');
                     
SELECT first_name, department_id, salary 
FROM employees
WHERE (salary, department_id) IN (SELECT min(salary), department_id
                                  FROM employees 
                                  GROUP BY department_id)
ORDER BY department_id;
                                  
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id 
                              FROM employees mgr);
                              
INSERT INTO departments (department_id, department_name) VALUES (45,'Purchasing');

DESC departments;

DESC employees;

SELECT * FROM employees;

SELECT * FROM locations;

CREATE TABLE sales_reps as SELECT * FROM employees;

DROP TABLE slaes_reps;

DELETE FROM sales_reps;

INSERT INTO sales_reps 
  SELECT * 
  FROM employees
  WHERE job_id LIKE '%REP%';
  
SELECT job_id FROM sales_reps;

SELECT * FROM sales_reps;

UPDATE employees 
SET department_id=50 WHERE employee_id=113;

UPDATE employees 
SET (job_id,salary) = (SELECT job_id, salary 
                       FROM employees 
                       WHERE employee_id = 205)
WHERE employee_id = 103;

CREATE TABLE copy_emp AS
  SELECT * 
  FROM employees;
  
  SELECT * FROM copy_emp;

UPDATE copy_emp 
SET department_id = (SELECT department_id
                     FROM employees 
                     WHERE employee_id = 100)
WHERE job_id = (SELECT department_id
                FROM employees 
                WHERE employee_id = 100);
                
DELETE FROM employees 
WHERE department IN (SELECT department_id
                        FROM departments
                        WHERE department_name LIKE '%Public%');
                        
TRUNCATE TABLE copy_emp;

ROLLBACK;

SELECT * FROM copy_emp;