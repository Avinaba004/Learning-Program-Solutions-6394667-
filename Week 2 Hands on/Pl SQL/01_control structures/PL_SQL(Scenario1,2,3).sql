-- Creating a sample Customer table

CREATE TABLE customers (
  customer_id NUMBER,
  age NUMBER,
  balance NUMBER,
  interest_rate NUMBER
);
INSERT INTO customers VALUES (1, 65, 15000, 10.0);
INSERT INTO customers VALUES (2, 45,  9000, 12.0);
INSERT INTO customers VALUES (3, 70, 20000, 11.5);

COMMIT;
SELECT * FROM customers;

-- Scenario 1
BEGIN
  FOR cust IN (SELECT customer_id, age FROM customers) LOOP
    IF cust.age > 60 THEN
      UPDATE customers
      SET interest_rate = interest_rate * 0.99
      WHERE customer_id = cust.customer_id;
    END IF;
  END LOOP;

  COMMIT;
END;
/

-- SCENARIO 2
ALTER TABLE customers ADD IS__VIP VARCHAR2(10);

BEGIN
  FOR cust IN (SELECT customer_id, balance FROM customers) LOOP
    IF cust.balance > 10000 THEN
      UPDATE customers
      SET IS__VIP = 'VIP'
      WHERE customer_id = cust.customer_id;
      else
      UPDATE customers
      SET IS__VIP = 'NOT VIP'
      WHERE customer_id = cust.customer_id;
    END IF;
  END LOOP;

  COMMIT;
END;
/
SELECT * FROM customers;


--SCENARIO 3
--Creating a sample loan table
CREATE TABLE loans (
  loan_id      NUMBER,
  customer_id  NUMBER,
  due_date     DATE
);

INSERT INTO loans VALUES (101, 1, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
INSERT INTO loans VALUES (102, 2, TO_DATE('2025-07-01', 'YYYY-MM-DD'));
INSERT INTO loans VALUES (103, 3, TO_DATE('2025-08-10', 'YYYY-MM-DD'));

COMMIT;
SELECT * FROM loans;
DECLARE
  v_due_date DATE := SYSDATE + 30;
BEGIN
  FOR loan IN (
    SELECT customer_id, loan_id, due_date
    FROM loans
    WHERE due_date <= v_due_date
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Reminder: Loan ' || loan.loan_id || ' for Customer ' || loan.customer_id || 
      ' is due on ' || TO_CHAR(loan.due_date, 'DD-Mon-YYYY')
    );
  END LOOP;
END;
/

