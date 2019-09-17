SET SERVEROUTPUT ON;

DECLARE 
V_FNAME VARCHAR2(40);
BEGIN 
SELECT first_name INTO V_FNAME 
FROM employees 
WHERE employee_id=101;
DBMS_OUTPUT.PUT_LINE('The first name is'||' '||V_FNAME);
END;

DECLARE 
V_SAL NUMBER(8,2);
BEGIN
SELECT salary INTO V_SAL
FROM employees
WHERE employee_id=101;
DBMS_OUTPUT.PUT_LINE('Before update, salary is'||' '||V_SAL);

UPDATE employees SET SALARY=V_SAL+200
WHERE employee_id=101;
DBMS_OUTPUT.PUT_LINE('After update, salary is'||' '||V_SAL);
END;

SELECT salary FROM employees WHERE employee_id=101;

DECLARE 
V_hiredate DATE;
V_location VARCHAR2(13):='ATLANTA';
V_deptno NUMBER(2) NOT NULL := 10;
C_comm CONSTANT NUMBER := 1400;