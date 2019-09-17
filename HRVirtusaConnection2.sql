CREATE TABLE dept 
(deptno NUMBER(2),
dname VARCHAR2(15),
loc VARCHAR2(15),
create_date DATE DEFAULT SYSDATE);

DESC dept;

CREATE TABLE courses
(course_id VARCHAR(5) PRIMARY KEY, 
course_name VARCHAR(15)
);

CREATE TABLE students
(student_id NUMBER(5) PRIMARY KEY, 
student_name VARCHAR(15),
course_id VARCHAR(10),
CONSTRAINT student_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id)
); 

DROP TABLE courses;

CREATE TABLE teach_emp 
(
empno NUMBER(5) PRIMARY KEY,
ename VARCHAR2(15) NOT NULL,
job VARCHAR2(10),
mgr NUMBER(5),
hiredate DATE DEFAULT (sysdate),
photo BLOB,
sal NUMBER(7,2),
deptno NUMBER(3) NOT NULL
CONSTRAINT admin_dept_fkey REFERENCES departments(department_id)
);

CREATE TABLE dept80 AS
( SELECT employee_id, last_name, salary*12 AS sal, hire_date
  FROM employees
  WHERE department_id=80
);

ALTER TABLE dept80 ADD (job_id VARCHAR2(10));

ALTER TABLE dept80 MODIFY (last_name VARCHAR2(30));

ALTER TABLE dept80 DROP (job_id);

ALTER TABLE employees READ ONLY;

ALTER TABLE employees READ WRITE;

DROP TABLE dept80;

CREATE TABLE retired_employees 
(
empno NUMBER(5) PRIMARY KEY,
ename VARCHAR2(15) NOT NULL,
job VARCHAR2(10),
mgr NUMBER(5),
hiredate DATE DEFAULT (sysdate),
retiredate DATE DEFAULT (sysdate),
photo BLOB,
sal NUMBER(7,2),
department_id NUMBER(3) NOT NULL
CONSTRAINT dept_no_fkey REFERENCES departments(department_id), 
job_id VARCHAR2(3) NOT NULL
CONSTRAINT job_id_fkey REFERENCES jobs(job_id)
);

DROP TABLE retired_employees;

SELECT * from employees;

DESC employees;

DESC departments;

DESC jobs;

DESC locations;

SHOW TABLES;

SELECT job_id 
FROM employees
UNION 
SELECT job_id
FROM retired_employees;

SELECT job_id, department_id 
FROM employees
UNION ALL 
SELECT job_id, department_id 
FROM retired_employees
ORDER BY job_id;

SELECT manager_id, job_id
FROM employees
WHERE departpment_id=80
MINUS
SELECT manager_id, job_id
FROM retired_employees
WHERE departpment_id=80;

SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse Location"
FROM departments
UNION 
SELECT location_id, TO_CHAR(NULL) "Department", state_province
FROM locations;