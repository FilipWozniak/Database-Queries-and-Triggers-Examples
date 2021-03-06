-- EMPLOYEE
-- EMPLOYEE DETAIL
-- BRANCH
-- TRANSACTION
-- STATUS
-- ACCOUNT
-- CUSTOMER
-- CREDIT CARD

-- JAN
-- FEB
-- MAR
-- APR
-- MAY
-- JUN
-- JUL
-- AUG
-- SEP
-- OCT
-- NOV
-- DEC

DROP TABLE STATUS CASCADE CONSTRAINTS;
DROP TABLE TRANSACTION CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_DETAIL CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE BRANCH CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CREDIT_CARD CASCADE CONSTRAINTS;
DROP TABLE LOGS CASCADE CONSTRAINTS;

DROP TABLE STATUS;
DROP TABLE TRANSACTION;
DROP TABLE EMPLOYEE_DETAIL;
DROP TABLE EMPLOYEE;
DROP TABLE BRANCH;
DROP TABLE CREDIT_CARD;
DROP TABLE ACCOUNT;
DROP TABLE CUSTOMER;
DROP TABLE LOGS;

CREATE TABLE CUSTOMER (
  CUSTOMER_ID NUMBER(4) NOT NULL PRIMARY KEY,
  FIRST_NAME VARCHAR2(20) NOT NULL,
  LAST_NAME VARCHAR2(20) NOT NULL,
  ADDRESS VARCHAR2(30) NOT NULL,
  CITY  VARCHAR2(20) NOT NULL
);

INSERT INTO CUSTOMER VALUES
  (1, 'PIOTR', 'KAMINSKI', 'MICKIEWICZA 35', 'WARSAW');
INSERT INTO CUSTOMER VALUES
  (2, 'SZYMON', 'NOWICKI', 'DEBOWA 5', 'WARSAW');
INSERT INTO CUSTOMER VALUES
  (3, 'KAMIL', 'JANKOWSKI', 'AKSAMITNA 139', 'KRAKOW');
INSERT INTO CUSTOMER VALUES
  (4, 'GABRIELA', 'GRZELAK', 'SIENKIEWICZA 1', 'WARSAW');
INSERT INTO CUSTOMER VALUES
  (5, 'DOMINIK', 'CHOJNACKI', 'BATOREGO 49', 'WROCLAW');
INSERT INTO CUSTOMER VALUES
  (6, 'NATALIA', 'KOWALIK', 'BERBERYSOWA 9', 'WROCLAW');
INSERT INTO CUSTOMER VALUES
  (7, 'MICHALINA', 'STASIAK', 'RYNEK 13A', 'WARSAW');
INSERT INTO CUSTOMER VALUES
  (8, 'ZUZANNA', 'WALCZAK', 'ANDERSA 18', 'GDANSK');
INSERT INTO CUSTOMER VALUES
  (9, 'MARTYNA', 'KWIATKOWSKA', 'BAJKOWA 139', 'GLIWICE');
INSERT INTO CUSTOMER VALUES
  (10, 'KRZYSZTOF', 'KOWALSKI', 'BARSKA 10C', 'GDANSK');

CREATE TABLE ACCOUNT (
  ACCOUNT_ID NUMBER(4) NOT NULL PRIMARY KEY,
  ACCOUNT_TYPE  VARCHAR2(20) NOT NULL,
  DATE_OPENED DATE,
  CUSTOMER_ID NUMBER(4) NOT NULL,
  FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
);

INSERT INTO ACCOUNT VALUES
  (1, 'SAVING', TO_DATE('23-APR-2009', 'DD-MON-YYYY'), 6);
INSERT INTO ACCOUNT VALUES
  (2, 'CHECKING', TO_DATE('05-DEC-2011', 'DD-MON-YYYY'), 4);
INSERT INTO ACCOUNT VALUES
  (3, 'CHECKING', TO_DATE('12-NOV-2012', 'DD-MON-YYYY'), 3);
INSERT INTO ACCOUNT VALUES
  (4, 'SAVING', TO_DATE('03-APR-2014', 'DD-MON-YYYY'), 7);
INSERT INTO ACCOUNT VALUES
  (5, 'DEPOSIT', TO_DATE('20-JAN-2012', 'DD-MON-YYYY'), 2);
INSERT INTO ACCOUNT VALUES
  (6, 'CHECKING', TO_DATE('12-AUG-2010', 'DD-MON-YYYY'), 10);
INSERT INTO ACCOUNT VALUES
  (7, 'SAVING', TO_DATE('26-OCT-2012', 'DD-MON-YYYY'), 1);
INSERT INTO ACCOUNT VALUES
  (8, 'DEPOSIT', TO_DATE('23-SEP-2010', 'DD-MON-YYYY'), 6);
INSERT INTO ACCOUNT VALUES
  (9, 'SAVING', TO_DATE('21-MAR-2012', 'DD-MON-YYYY'), 9);
INSERT INTO ACCOUNT VALUES
  (10, 'DEPOSIT', TO_DATE('14-MAR-2012', 'DD-MON-YYYY'), 5);
INSERT INTO ACCOUNT VALUES
  (11, 'DEPOSIT', TO_DATE('05-SEP-2013', 'DD-MON-YYYY'), 8);
INSERT INTO ACCOUNT VALUES
  (12, 'SAVING', TO_DATE('24-FEB-2011', 'DD-MON-YYYY'), 7);
INSERT INTO ACCOUNT VALUES
  (13, 'DEPOSIT', TO_DATE('02-NOV-2011', 'DD-MON-YYYY'), 10);

CREATE TABLE CREDIT_CARD (
  CREDIT_CARD_ID NUMBER(4) NOT NULL PRIMARY KEY,
  CARD_TYPE VARCHAR2(20) NOT NULL,
  CARD_NUMBER NUMBER(16) NOT NULL,
  DISCOUNT NUMBER(2) DEFAULT 0 NOT NULL,
  ACCOUNT_ID NUMBER(4) NOT NULL,
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT (ACCOUNT_ID)
);

INSERT INTO CREDIT_CARD VALUES
  (1, 'BUSINESS', 4941291845692341, 20, 12);
INSERT INTO CREDIT_CARD VALUES
  (2, 'STUDENT', 9720910462158290, 5, 11);
INSERT INTO CREDIT_CARD VALUES
  (3, 'STANDARD', 4787813303298872, 15, 10);
INSERT INTO CREDIT_CARD VALUES
  (4, 'STANDARD', 8343305162290861, 10, 9);
INSERT INTO CREDIT_CARD VALUES
  (5, 'STUDENT', 4465356184922656, 5, 3);
INSERT INTO CREDIT_CARD VALUES
  (6, 'STUDENT', 8509059799104846, 10, 2);
INSERT INTO CREDIT_CARD VALUES
  (7, 'BUSINESS', 5572779606691607, 5, 7);
INSERT INTO CREDIT_CARD VALUES
  (8, 'STUDENT', 6896104186031550, 10, 8);
INSERT INTO CREDIT_CARD VALUES
  (9, 'STANDARD', 1656406592934178, 5, 13);
INSERT INTO CREDIT_CARD VALUES
  (10, 'STANDARD', 8412794701078716, 5, 1);
INSERT INTO CREDIT_CARD VALUES
  (11, 'STUDENT', 7003785939918852, 10, 4);
INSERT INTO CREDIT_CARD VALUES
  (12, 'BUSINESS', 9652976161783338, 15, 5);
INSERT INTO CREDIT_CARD VALUES
  (13, 'STUDENT', 9420509019823069, 20, 6);

CREATE TABLE BRANCH (
  BRANCH_ID NUMBER(4) NOT NULL PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL,
  CITY VARCHAR2(20) NOT NULL,
  ADDRESS VARCHAR2(30) NOT NULL,
  PHONE NUMBER(9) NOT NULL
);

INSERT INTO BRANCH VALUES
  (1, 'LOCAL BANK', 'WARSAW', 'BRZOZOWA 23B', 881392103);
INSERT INTO BRANCH VALUES
  (2, 'MAIN BANK', 'WARSAW', 'MARSZALKOWSKA 3', 758435322);
INSERT INTO BRANCH VALUES
  (3, 'FOREIGN BANK', 'LONDON', 'BAKER STREET 35', 834462424);
INSERT INTO BRANCH VALUES
  (4, 'LOCAL BANK', 'KRAKOW', 'IGNACEGO DOMEYKI 29', 739104681);

CREATE TABLE EMPLOYEE (
  EMPLOYEE_ID NUMBER(4) NOT NULL PRIMARY KEY,
  FIRST_NAME VARCHAR2(20) NOT NULL,
  LAST_NAME VARCHAR2(20) NOT NULL,
  OCCUPATION VARCHAR2(20) NOT NULL,
  PHONE NUMBER(9),
  EMAIL VARCHAR2(20),
  SALARY FLOAT(20),
  BRANCH_ID NUMBER(4) NOT NULL,
  FOREIGN KEY (BRANCH_ID) REFERENCES BRANCH (BRANCH_ID)
);

INSERT INTO EMPLOYEE VALUES
  (1, 'FILIP', 'WOZNIAK', 'PROGRAMMER', 823819491, 'WOZNIAK@GMAIL.COM', 3000, 1);
INSERT INTO EMPLOYEE VALUES
  (2, 'DAWID', 'WALAS', 'ANALYST', 920124951, 'WALAS@GMAIL.COM', 12000, 3);
INSERT INTO EMPLOYEE VALUES
  (3, 'KONRAD', 'PLASOTA', 'PROGRAMMER', 912371361, 'PLASOTA@GMAIL.COM', 8900, 2);
INSERT INTO EMPLOYEE VALUES
  (4, 'DANG HOANG', 'BUI', 'PRESIDENT', 738719217, 'HOANG@GMAIL.COM', 3900, 1);
INSERT INTO EMPLOYEE VALUES
  (5, 'KRYSTIAN', 'MALINOWSKI', 'SALESMAN', 671939412, 'MALINOWSKI@GMAIL.COM', 6050, 4);
INSERT INTO EMPLOYEE VALUES
  (6, 'JAN', 'KOWALSKI', 'ACCOUNTANT', 924194581, 'KOWALSKI@GMAIL.COM', 3100, 2);

CREATE TABLE EMPLOYEE_DETAIL (
  EMPLOYEE_DETAIL_ID NUMBER(4) NOT NULL PRIMARY KEY,
  FOREIGN KEY (EMPLOYEE_DETAIL_ID) REFERENCES EMPLOYEE (EMPLOYEE_ID),
  HIRE_DATE DATE,
  BIRTH_DATE DATE,
  CITY VARCHAR2(20) NOT NULL,
  COUNTRY VARCHAR2(20) NOT NULL,
  ADDRESS VARCHAR2(20) NOT NULL,
  EMPLOYMENT_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL
);

INSERT INTO EMPLOYEE_DETAIL VALUES
  (1, TO_DATE('05-APR-2007', 'DD-MON-YYYY'), TO_DATE('11-FEB-1993', 'DD-MON-YYYY'), 'WARSAW', 'POLAND', 'OZAROWSKA 46', 1);
INSERT INTO EMPLOYEE_DETAIL VALUES
  (2, TO_DATE('12-JUN-2005', 'DD-MON-YYYY'), TO_DATE('19-MAY-1992', 'DD-MON-YYYY'), 'WARSAW', 'POLAND', 'MALINOWA 32', 0);
INSERT INTO EMPLOYEE_DETAIL VALUES
  (3, TO_DATE('16-JUN-2008', 'DD-MON-YYYY'), TO_DATE('25-APR-1998', 'DD-MON-YYYY'), 'CHICAGO', 'USA', 'OAK STREET 75', 0);
INSERT INTO EMPLOYEE_DETAIL VALUES
  (4, TO_DATE('08-JUN-2002', 'DD-MON-YYYY'), TO_DATE('09-APR-1991', 'DD-MON-YYYY'), 'WARSAW', 'POLAND', 'TULIPANOWA 835A', 1);
INSERT INTO EMPLOYEE_DETAIL VALUES
  (5, TO_DATE('13-MAR-2002', 'DD-MON-YYYY'), TO_DATE('28-NOV-1997', 'DD-MON-YYYY'), 'STOCKHOLM', 'SWEDEN', 'MYNTGATAN 3', 1);
INSERT INTO EMPLOYEE_DETAIL VALUES
  (6, TO_DATE('12-DEC-2003', 'DD-MON-YYYY'), TO_DATE('11-MAR-1994', 'DD-MON-YYYY'), 'WARSAW', 'POLAND', 'SMOLENSKA 84', 1);

CREATE TABLE TRANSACTION (
  TRANSACTION_ID NUMBER(4) NOT NULL PRIMARY KEY,
  TRANSACTION_DATE DATE,
  TRANSACTION_AMOUNT NUMBER(6),
  BRANCH_ID NUMBER(4) NOT NULL,
  ACCOUNT_ID NUMBER(4) NOT NULL,
  FOREIGN KEY (BRANCH_ID) REFERENCES BRANCH (BRANCH_ID),
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT (ACCOUNT_ID)
);

INSERT INTO TRANSACTION VALUES
  (1, TO_DATE('19-JAN-2017', 'DD-MON-YYYY'), 300, 4, 13);
INSERT INTO TRANSACTION VALUES
  (2, TO_DATE('18-MAR-2017', 'DD-MON-YYYY'), 100, 4, 1);
INSERT INTO TRANSACTION VALUES
  (3, TO_DATE('11-JAN-2017', 'DD-MON-YYYY'), 20, 1, 3);
INSERT INTO TRANSACTION VALUES
  (4, TO_DATE('25-NOV-2016', 'DD-MON-YYYY'), 150, 1, 5);
INSERT INTO TRANSACTION VALUES
  (5, TO_DATE('06-MAY-2016', 'DD-MON-YYYY'), 2400, 4, 7);
INSERT INTO TRANSACTION VALUES
  (6, TO_DATE('01-SEP-2017', 'DD-MON-YYYY'), 60, 3, 9);
INSERT INTO TRANSACTION VALUES
  (7, TO_DATE('15-JUN-2017', 'DD-MON-YYYY'), 100, 3, 2);
INSERT INTO TRANSACTION VALUES
  (8, TO_DATE('04-AUG-2016', 'DD-MON-YYYY'), 1500, 2, 4);
INSERT INTO TRANSACTION VALUES
  (9, TO_DATE('08-AUG-2016', 'DD-MON-YYYY'), 3000, 1, 8);
INSERT INTO TRANSACTION VALUES
  (10, TO_DATE('07-SEP-2016', 'DD-MON-YYYY'), 900, 1, 6);
INSERT INTO TRANSACTION VALUES
  (11, TO_DATE('01-SEP-2016', 'DD-MON-YYYY'), 700, 1, 11);
INSERT INTO TRANSACTION VALUES
  (12, TO_DATE('15-JAN-2015', 'DD-MON-YYYY'), 1050, 2, 10);
INSERT INTO TRANSACTION VALUES
  (13, TO_DATE('07-OCT-2015', 'DD-MON-YYYY'), 1800, 3, 12);
INSERT INTO TRANSACTION VALUES
  (14, TO_DATE('25-MAR-2016', 'DD-MON-YYYY'), 100, 1, 4);
INSERT INTO TRANSACTION VALUES
  (15, TO_DATE('07-JAN-2014', 'DD-MON-YYYY'), 2300, 3, 1);
INSERT INTO TRANSACTION VALUES
  (16, TO_DATE('27-MAY-2016', 'DD-MON-YYYY'), 1700, 4, 4);
INSERT INTO TRANSACTION VALUES
  (17, TO_DATE('12-SEP-2017', 'DD-MON-YYYY'), 300, 4, 2);
INSERT INTO TRANSACTION VALUES
  (18, TO_DATE('16-OCT-2017', 'DD-MON-YYYY'), 150, 2, 5);

CREATE TABLE STATUS (
  STATUS_ID NUMBER(4) NOT NULL,
  STATUS_NAME VARCHAR2(20) NOT NULL,
  STATUS_DATE DATE,
  TRANSACTION_ID NUMBER(4) NOT NULL,
  FOREIGN KEY (TRANSACTION_ID) REFERENCES TRANSACTION (TRANSACTION_ID)
);

ALTER TABLE STATUS
  ADD (
    CONSTRAINT STATUS_PK PRIMARY KEY (STATUS_ID)
  );

INSERT INTO STATUS VALUES
  (1, 'PENDING', TO_DATE('28-JAN-2018', 'DD-MON-YYYY'), 18);
INSERT INTO STATUS VALUES
  (2, 'PENDING', TO_DATE('22-MAR-2018', 'DD-MON-YYYY'), 2);
INSERT INTO STATUS VALUES
  (3, 'PENDING', TO_DATE('25-JAN-2018', 'DD-MON-YYYY'), 4);
INSERT INTO STATUS VALUES
  (4, 'PENDING', TO_DATE('14-MAR-2018', 'DD-MON-YYYY'), 1);
INSERT INTO STATUS VALUES
  (5, 'PENDING', TO_DATE('18-JAN-2018', 'DD-MON-YYYY'), 17);
INSERT INTO STATUS VALUES
  (6, 'PENDING', TO_DATE('11-MAY-2018', 'DD-MON-YYYY'), 10);
INSERT INTO STATUS VALUES
  (7, 'PENDING', TO_DATE('23-MAR-2018', 'DD-MON-YYYY'), 9);
INSERT INTO STATUS VALUES
  (8, 'FINISHED', TO_DATE('17-MAY-2018', 'DD-MON-YYYY'), 10);
INSERT INTO STATUS VALUES
  (9, 'PENDING', TO_DATE('19-MAR-2018', 'DD-MON-YYYY'), 3);
INSERT INTO STATUS VALUES
  (10, 'PENDING', TO_DATE('15-MAR-2018', 'DD-MON-YYYY'), 5);
INSERT INTO STATUS VALUES
  (11, 'FINISHED', TO_DATE('15-MAR-2018', 'DD-MON-YYYY'), 18);
INSERT INTO STATUS VALUES
  (12, 'PENDING', TO_DATE('26-JAN-2018', 'DD-MON-YYYY'), 15);
INSERT INTO STATUS VALUES
  (13, 'FINISHED', TO_DATE('24-MAR-2018', 'DD-MON-YYYY'), 2);
INSERT INTO STATUS VALUES
  (14, 'PENDING', TO_DATE('11-JAN-2018', 'DD-MON-YYYY'), 6);
INSERT INTO STATUS VALUES
  (15, 'PENDING', TO_DATE('12-APR-2018', 'DD-MON-YYYY'), 8);
INSERT INTO STATUS VALUES
  (16, 'PENDING', TO_DATE('18-FEB-2018', 'DD-MON-YYYY'), 11);
INSERT INTO STATUS VALUES
  (17, 'PENDING', TO_DATE('06-MAR-2018', 'DD-MON-YYYY'), 14);
INSERT INTO STATUS VALUES
  (18, 'PENDING', TO_DATE('08-MAR-2018', 'DD-MON-YYYY'), 13);
INSERT INTO STATUS VALUES
  (19, 'PENDING', TO_DATE('02-FEB-2018', 'DD-MON-YYYY'), 7);
INSERT INTO STATUS VALUES
  (20, 'FINISHED', TO_DATE('21-APR-2018', 'DD-MON-YYYY'), 17);
INSERT INTO STATUS VALUES
  (21, 'PENDING', TO_DATE('12-FEB-2018', 'DD-MON-YYYY'), 16);
INSERT INTO STATUS VALUES
  (22, 'FINISHED', TO_DATE('16-MAR-2018', 'DD-MON-YYYY'), 4);
INSERT INTO STATUS VALUES
  (23, 'FINISHED', TO_DATE('24-MAY-2018', 'DD-MON-YYYY'), 9);
INSERT INTO STATUS VALUES
  (24, 'PENDING', TO_DATE('02-FEB-2018', 'DD-MON-YYYY'), 12);

COMMIT;