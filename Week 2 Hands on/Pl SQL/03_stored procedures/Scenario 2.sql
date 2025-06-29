
CREATE TABLE employees (
  emp_id        NUMBER PRIMARY KEY,
  name          VARCHAR2(10),
  department_id NUMBER,
  salary        NUMBER
);


INSERT INTO employees VALUES (1, 'Avinaba', 10, 50000);
INSERT INTO employees VALUES (2, 'Sara', 10, 60000);
INSERT INTO employees VALUES (3, 'Samik', 20, 55000);

COMMIT;
SELECT * FROM employees;
--Creating the procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  dept_id IN NUMBER,
  bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE employees
  SET salary = salary + (salary * bonus_percent / 100)
  WHERE department_id = dept_id;

  COMMIT;
  dbms_output.put_line('After adding salary hike for department '||dept_id);
END;
/

EXEC UpdateEmployeeBonus(10, 10); 

SELECT * FROM employees;
