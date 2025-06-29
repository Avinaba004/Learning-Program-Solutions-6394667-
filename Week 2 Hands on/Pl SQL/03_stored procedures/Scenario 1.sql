
CREATE TABLE savings_accounts (
  account_id   NUMBER PRIMARY KEY,
  customer_id  NUMBER,
  balance      NUMBER
);

-- Insert sample accounts
INSERT INTO savings_accounts VALUES (1, 101, 1000);
INSERT INTO savings_accounts VALUES (2, 102, 2000);
INSERT INTO savings_accounts VALUES (3, 103, 3000);

COMMIT;
select * from savings_accounts;
--ProcessMonthlyInterest procedure

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (SELECT account_id, balance FROM savings_accounts) LOOP
    UPDATE savings_accounts
    SET balance = balance + (acc.balance * 0.01)
    WHERE account_id = acc.account_id;
  END LOOP;

  COMMIT;
END;
/
exec ProcessMonthlyInterest;
select * from savings_accounts;