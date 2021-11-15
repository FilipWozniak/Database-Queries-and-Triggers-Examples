-- 2 SELECT STATEMENTS WITH WHERE CLAUSE

SELECT FIRST_NAME, LAST_NAME, CITY, ACCOUNT_TYPE, DATE_OPENED FROM CUSTOMER
INNER JOIN ACCOUNT ON  CUSTOMER.CUSTOMER_ID=ACCOUNT.CUSTOMER_ID
WHERE ACCOUNT_TYPE='SAVING' AND CITY='WARSAW'
ORDER BY FIRST_NAME, LAST_NAME;

SELECT BRANCH.BRANCH_ID, NAME, CITY, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEE
INNER JOIN BRANCH ON EMPLOYEE.BRANCH_ID = BRANCH.BRANCH_ID
WHERE SALARY>3500 AND CITY LIKE '%SAW'
ORDER BY BRANCH.BRANCH_ID, SALARY;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY, COUNTRY, ADDRESS, HIRE_DATE FROM EMPLOYEE
INNER JOIN EMPLOYEE_DETAIL ON EMPLOYEE.EMPLOYEE_ID = EMPLOYEE_DETAIL.EMPLOYEE_DETAIL_ID
WHERE HIRE_DATE > DATE '2004-01-01' AND COUNTRY='POLAND';

-- 2 SELECT STATEMENTS WITH AGGREGATE FUNCTION

SELECT ROUND(AVG(TRANSACTION_AMOUNT), 0) || '$' AS AVERAGE FROM TRANSACTION
INNER JOIN ACCOUNT ON TRANSACTION.ACCOUNT_ID = ACCOUNT.ACCOUNT_ID
WHERE ACCOUNT_TYPE='DEPOSIT' AND DATE_OPENED BETWEEN DATE '2011-01-01' AND DATE '2013-01-01';

SELECT OCCUPATION, AVG(SALARY) || '$' AS MONTHLY, AVG(SALARY * 12) || '$' AS YEARLY
FROM EMPLOYEE
HAVING AVG(SALARY) BETWEEN 4000 AND 10000
GROUP BY OCCUPATION
ORDER BY OCCUPATION;

-- SELECT AVG(NVL(SALARY * 12, 0)) AS AVERAGE, BRANCH_ID  AS "PER YEAR" FROM EMPLOYEE
-- GROUP BY BRANCH_ID;

SELECT NVL(SALARY, 0) FROM EMPLOYEE WHERE EMPLOYEE_ID=10;

-- 1 SELECT STATEMENTS WITH SUBQUERY

SELECT * FROM EMPLOYEE
WHERE OCCUPATION = (SELECT OCCUPATION FROM EMPLOYEE WHERE FIRST_NAME='FILIP');

-- 1 SELECT STATEMENTS WITH CORRELATED SUBQUERY

SELECT FIRST_NAME, LAST_NAME, SALARY, BRANCH_ID
FROM EMPLOYEE EMP
WHERE SALARY =
       (SELECT MIN(SALARY) FROM EMPLOYEE WHERE BRANCH_ID = EMP.BRANCH_ID GROUP BY BRANCH_ID);

INSERT INTO EMPLOYEE VALUES
  (32, 'ALA', 'KOWALSKA', 'PROGRAMMER', 45674564, 'DSFSDFSD', 12000, 3);
COMMIT;

-- 1 AFTER STATEMENT TRIGGER (INSERT, UPDATE, DELETE)

-- -- INSERT

CREATE OR REPLACE TRIGGER INFO_ABOUT_RECORDS_TRIGGER
AFTER INSERT
ON CREDIT_CARD FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('NEW RECORD HAS JUST BEEN ADDED TO DATABASE');
END;
/

INSERT INTO CREDIT_CARD VALUES
  (22, 'STUDENT', 2345245124523448, 5, 10);

COMMIT;

DROP TRIGGER INFO_ABOUT_RECORDS_TRIGGER;

-- -- UPDATE

CREATE TABLE LOGS (
   EMPLOYEE_ID NUMBER,
   LOG_DATE DATE,
   SALARY NUMBER,
   ACTION VARCHAR2(20));

COMMIT;

CREATE OR REPLACE TRIGGER SALARY_INCREASE_TRIGGER
AFTER UPDATE ON EMPLOYEE
FOR EACH ROW
WHEN (new.SALARY > 1000)
BEGIN
    INSERT INTO LOGS (EMPLOYEE_ID, LOG_DATE, SALARY, ACTION)
       VALUES (:NEW.EMPLOYEE_ID, SYSDATE, :NEW.SALARY, 'NEW SALARY');
       DBMS_OUTPUT.PUT_LINE('SALARY FOR EVERY PROGRAMMER HAS JUST BEEN RAISED');
END;

UPDATE EMPLOYEE SET SALARY = SALARY + 1500.0
    WHERE OCCUPATION = 'PROGRAMMER';

COMMIT;

DROP TRIGGER SALARY_INCREASE_TRIGGER;

-- -- DELETE

CREATE OR REPLACE TRIGGER COUNT_RECORDS_TRIGGER
AFTER DELETE ON STATUS
DECLARE n INT;
BEGIN
    SELECT COUNT(*) INTO n FROM STATUS;
    DBMS_OUTPUT.PUT_LINE(' THERE ARE NOW ' || n || ' STATUSES');
END;

DELETE FROM STATUS WHERE STATUS_NAME = 'PENDING';

COMMIT;

DROP TRIGGER COUNT_RECORDS_TRIGGER;

-- 1 BEFORE STATEMENT TRIGGER (INSERT, UPDATE, DELETE)

-- -- INSERT

CREATE SEQUENCE STATUSES;

CREATE OR REPLACE TRIGGER AUTOINCREMENT_TRIGGER
  BEFORE INSERT ON STATUS
  FOR EACH ROW
BEGIN
  SELECT STATUSES.NEXTVAL
  INTO :NEW.STATUS_ID
  FROM DUAL;
END;

INSERT INTO STATUS
(STATUS_NAME, STATUS_DATE, TRANSACTION_ID)
VALUES
('PENDING', TO_DATE('18-SEP-2017', 'DD-MON-YYYY'), 3);

COMMIT;

DROP TRIGGER AUTOINCREMENT_TRIGGER;

-- -- UPDATE

CREATE OR REPLACE TRIGGER CHANGE_STATUS_TRIGGER
BEFORE UPDATE ON STATUS
FOR EACH ROW
WHEN (OLD.STATUS_NAME = 'PENDING')
BEGIN
   DBMS_OUTPUT.PUT_LINE('OLD STATUS: ' || :OLD.STATUS_NAME);
   DBMS_OUTPUT.PUT_LINE('NEW STATUS: ' || :NEW.STATUS_NAME);
END;
/

UPDATE STATUS SET STATUS_NAME = 'FINISHED'
WHERE STATUS_NAME = 'PENDING';

COMMIT;

DROP TRIGGER CHANGE_STATUS_TRIGGER;

-- -- DELETE

CREATE OR REPLACE TRIGGER PREVENTING_REMOVAL_TRIGGER
  BEFORE DELETE ON BRANCH
  FOR EACH ROW
DECLARE
BEGIN
  IF (:OLD.BRANCH_ID = 2)
  THEN
    RAISE_APPLICATION_ERROR (-20003, 'YOU CANNOT REMOVE MAIN BRANCH OF OUR BANK');
  END IF;
END;

DELETE FROM BRANCH WHERE NAME = 'MAIN BANK';

COMMIT;

DROP TRIGGER PREVENTING_REMOVAL_TRIGGER;

-- DML STATEMENTS SHOWING HOW ABOVE TRIGGERS WORK (ATTACHED BELOW EACH TRIGGER)

INSERT INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, OCCUPATION, PHONE, EMAIL, BRANCH_ID) VALUES
  (11, 'FILIP', 'WOZNIAK', 'PROGRAMMER', 827819491, 'WOZNIAK@GMAIL.COM', 2);
COMMIT;
SHOW ERRORS;