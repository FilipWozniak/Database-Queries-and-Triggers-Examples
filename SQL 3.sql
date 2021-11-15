-- SQL3

-- TASK1
SELECT ROUND(AVG(SAL)) AS AVG FROM EMP;

-- TASK2
SELECT MIN(SAL) FROM EMP
  WHERE JOB='CLERK';

-- TASK3
SELECT COUNT(*) AS ILE FROM EMP
  WHERE DEPTNO=20;

-- TASK4
SELECT AVG(SAL) AS AVG FROM EMP
  GROUP BY JOB;

-- TASK5
SELECT AVG(SAL) AS AVG FROM EMP
  WHERE JOB NOT LIKE 'MANAGER'
  GROUP BY JOB;

-- TASK6
SELECT AVG(SAL) AS AVG, JOB, DEPTNO AS AVG FROM EMP
  GROUP BY JOB, DEPTNO;

-- TASK7
SELECT MAX(SAL), JOB FROM EMP
  GROUP BY JOB;

-- TASK8
SELECT AVG(SAL), DEPTNO FROM EMP
  GROUP BY DEPTNO
  HAVING COUNT(EMPNO)>3;

-- TASK9
SELECT JOB FROM EMP
  GROUP BY JOB
  HAVING AVG(SAL)>=3000;

-- TASK10
SELECT JOB, AVG(SAL) AS MONTHLY, AVG(SAL*12 + NVL(COMM, 0)) AS YEARLY
  FROM EMP
  GROUP BY JOB;

-- TASK11
SELECT MAX(SAL) AS MAX, MIN(SAL) AS MIN, MAX(SAL)-MIN(SAL) AS DIFFERENCE
  FROM EMP;

-- TASK12
SELECT DEPTNO FROM EMP
  GROUP BY DEPTNO
  HAVING COUNT(DEPTNO)>3;

-- TASK13
SELECT COUNT(EMPNO)-COUNT(DISTINCT EMPNO) FROM EMP;

-- TASK14
SELECT MIN(E.SAL), E.MGR FROM EMP E, EMP M
  WHERE E.MGR=M.EMPNO AND E.MGR IS NOT NULL
  GROUP BY E.MGR
  HAVING MIN(E.SAL)>=1000;

-- TASK15
SELECT COUNT(EMPNO) FROM EMP
  INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO
  WHERE LOC='DALLAS';

-- TASK16
SELECT MAX(SAL), GRADE FROM EMP, SALGRADE
  WHERE SAL BETWEEN LOSAL AND HISAL
  GROUP BY GRADE;

-- TASK17
SELECT SAL, COUNT(SAL) FROM EMP
  GROUP BY SAL
  HAVING COUNT(SAL)>1;

-- TASK18
SELECT AVG(SAL) FROM EMP, SALGRADE
  WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=2;

-- TASK19
SELECT MGR, COUNT(EMPNO)
  FROM EMP
  WHERE MGR IS NOT NULL
  GROUP BY MGR;

-- TASK20
SELECT SUM(SAL) AS TOTAL FROM EMP, SALGRADE
  WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=1;