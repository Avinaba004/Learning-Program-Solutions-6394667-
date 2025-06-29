CREATE TABLE bank_accounts (
  account_id   NUMBER PRIMARY KEY,
  customer_id  NUMBER,
  balance      NUMBER
);

-- Sample Data
INSERT INTO bank_accounts VALUES (101, 1, 5000);
INSERT INTO bank_accounts VALUES (102, 2, 3000);

COMMIT;
SELECT * FROM bank_accounts;
CREATE OR REPLACE PROCEDURE TransferFunds (
  from_account IN NUMBER,
  to_account   IN NUMBER,
  amount          IN NUMBER
) IS
  from_balance NUMBER;
BEGIN
  -- Getting the balance of the source account
  SELECT balance INTO from_balance
  FROM bank_accounts
  WHERE account_id = from_account;

  -- Checking if there is sufficient balance
  IF from_balance < amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance.');
  END IF;

  -- Deducting from the source
  UPDATE bank_accounts
  SET balance = balance - amount
  WHERE account_id = from_account;

  -- Adding amount to destination
  UPDATE bank_accounts
  SET balance = balance + amount
  WHERE account_id = to_account;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Transferring RS.'||amount||' from Account Id:'||from_account||' to Account Id:'||to_account);
END;
/

EXEC TransferFunds(101, 102, 1000);

SELECT * FROM bank_accounts;