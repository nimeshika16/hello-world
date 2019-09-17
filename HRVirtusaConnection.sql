SELECT *
FROM departments;

SELECT * 
FROM employees;

SELECT department_id, location_id
FROM departments; 

SELECT * 
FROM dual;

SELECT sysdate
FROM dual;

SELECT round(23.5)
FROM dual;

SELECT upper('madhu')
FROM dual;

SELECT last_name, salary, salary+30
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

SELECT last_name,job_id,salary,commission_pct
FROM employees;

SELECT last_name,12*salary*commission_pct
FROM employees;

SELECT last_name AS name, commission_pct AS comm
FROM employees;

SELECT last_name AS "Name", salary*12 "Annual Salary"
FROM employees;

SELECT first_name ||' '||last_name AS "Full Name"
From employees;

SELECT last_name ||'ia a'||job_id AS "Employee Details"
FROM employees;

SELECT department_name || q'[Department's Manager ID:]' || manager_id 
AS "Department and Manager Details"
From departments;

DESCRIBE employees;


--create a table sample
CREATE table sample(
sr_no number(10) primary key,
student_name varchar(40)
);

--populate sample table
INSERT into sample values(1,'madhu');

--update sample table
UPDATE sample
set student_name='Madhu'
where sr_no=1;

DESCRIBE sample;

SELECT * 
FROM sample;

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE DEPARTMENT_ID=90;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name='Whalen';

SELECT last_name 
FROM employees
WHERE hire_date='17-OCT-1997';

SELECT last_name, salary
FROM employees
WHERE salary>=2500;

SELECT last_name salary
FROM employees
WHERE salary BETWEEN 2500 AND 5000;

SELECT employee_id, last_name, job_id
FROM employees
WHERE manager_id IN (100,101,201);

SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT first_name
FROM employees
WHERE first_name LIKE '%a%e';

SELECT first_name, last_name
FROM employees 
WHERE manager_id IS NULL;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >=10000
AND job_id LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >=10000
OR job_id LIKE '%MAN%';

SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG','ST_CLERK','SA_REP');

SELECT last_name, job_id
FROM employees
WHERE job_id <> 'IT_PROG' OR job_id <> 'ST_CLERK' OR job_id <> 'SA_REP';

SELECT last_name, department_id, salary
FROM employees
WHERE department_id=60 OR department_id=80 AND salary>10000;

SELECT last_name, department_id, salary
FROM employees
WHERE (department_id=60 OR department_id=80) AND salary>10000;

SELECT last_name, job_id, department_id
FROM employees
ORDER BY hire_date;

SELECT last_name, job_id, department_id
FROM employees
ORDER BY department_id DESC;

SELECT first_name, last_name, job_id, hire_date, department_id
FROM employees
ORDER BY 3;

/*SELECT employee_id, first_name
 FROM employees 
 ORDER BY employee_id
 FETCH FIRST 5 ROWS ONLY;
 
SELECT employee_id, first_name
 FROM employees 
 ORDER BY employee_id
 OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;*/
 
SELECT employee_id, last_name
FROM employees
WHERE employee_id = &employee_no;

SELECT employee_id, last_name, salary*12
FROM employees
WHERE job_id = '&job_title';

SELECT first_name, last_name, job_id, &column_name
FROM employees
WHERE &CONDITION
ORDER BY &ORDER_COLUMN;

DEFINE employee_num=200
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id=&employee_num;
UNDEFINE employee_num

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id=&employee_num;

SET VERIFY ON
DEFINE employee_num=200
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id=&employee_num;

SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name='higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE lower(last_name)='higgins';

SELECT concat ('Hello','World') 
FROM dual;

SELECT substr('Madhu Nimeshika',6)
FROM dual;

SELECT length('Madhu Nimeshika')
FROM dual;

SELECT instr('Madhu Nimeshika','N')
FROM dual;

SELECT lpad('560450',8,'*')
FROM dual;

SELECT rpad('5600',7,'*')
FROM dual;

SELECT last_name, concat('Job Category:',job_id) "JOB" 
FROM employees
WHERE substr(job_id,4)='REP';    

SELECT employee_id, concat(first_name, last_name) NAME, 
length(last_name), instr(last_name,'a') "Contains 'a'?"
FROM employees
WHERE substr(last_name,-1,1)='n';

SELECT first_name, upper(concat(substr(last_name,1,8),'_US'))
FROM employees
WHERE department_id=60;

SELECT round(4567.098765,2)
FROM dual;

SELECT trunc(4567.098765,2)
FROM dual;

SELECT trunc(4568.098765,-2)
FROM dual;

SELECT ceil(4567.098765)
FROM dual;

SELECT floor(4567.098765)
FROM dual;

SELECT mod(4567.098765,2)
FROM dual;

SELECT employee_id as "Even Numbers", last_name
FROM employees
WHERE MOD(employee_id,2)=0;

SELECT last_name,hire_date
FROM employees
WHERE hire_date<'01-FEB-2013';

SELECT SESSIONTIMEZONE, CURRENT_DATE, CURRENT_TIMESTAMP
FROM dual;

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM employees
WHERE department_id=90;

SELECT months_between('01-SEP-2015','11-JAN-2015')
FROM dual;

SELECT add_months('31-JAN-2016',1)
FROM dual;

SELECT next_day('01-JAN-2015','FRIDAY')
FROM dual;

SELECT last_day('01-JAN-2015')
FROM dual;

SELECT round(SYSDATE,'MONTH')
FROM dual;

SELECT round(SYSDATE,'YEAR')
FROM dual;

SELECT trunc(SYSDATE,'MONTH')
FROM dual;

SELECT trunc(SYSDATE,'YEAR')
FROM dual;