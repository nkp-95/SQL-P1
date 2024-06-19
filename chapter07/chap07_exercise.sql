--7�� ������ �Լ��� ������ �׷�ȭ
--7-1 
SELECT SUM(SAL)
  FROM EMP;
-- SUM = �հ�

--7-2
SELECT DEPTNO, SUM(SAL)  
  FROM EMP;
 -- GROUP BY DEPTNO;

--7-3 ������ �Լ�: NULL�� ���� ó��
SELECT SUM(COMM) AS "�߰� ���� �հ�"
  FROM EMP;

--7-4
SELECT SUM(DISTINCT SAL) --�ߺ�����
     , SUM(ALL SAL)  --�ߺ� ����x
     , SUM(SAL)
     , SUM(DISTINCT SAL) + 4250
  FROM EMP;

SELECT DISTINCT SAL FROM EMP;

--7-5 EMP ���̺� �� ���� - 
--NULL�� ���� ����ϱ� ������ ����ڰ� �ȸ���
SELECT COUNT(COMM)
     , COUNT(MGR)
     , COUNT(EMPNO)
     , COUNT(*)
     , COUNT(1)--ù��° �÷� ī����  --�ǹ�
  FROM EMP;

--7-6 �μ���ȣ�� 30�� ������ 
SELECT COUNT(*)
  FROM EMP
 WHERE DEPTNO = 30;

--7-7 
SELECT COUNT(DISTINCT SAL)
     , COUNT(ALL SAL)
     , COUNT(SAL)
  FROM EMP;  --NULL�����ʹ� ��ȯ�������� ����
  
--7-8
SELECT COUNT(COMM)
  FROM EMP;  --4
--7-9
SELECT COUNT(COMM)
  FROM EMP
 WHERE COMM IS NOT NULL;  --4
 
--7-10 10�� �μ����� �ִ�޿� ���
SELECT MAX(SAL)
  FROM EMP
 WHERE DEPTNO = 10;

--7-11 10�� �μ����� �ּұ޿� ���
SELECT MIN(SAL)
  FROM EMP
 WHERE DEPTNO = 10;

--7-12 20�� �μ����� ����� �Ի����� ���� �ֱ� �Ի��� ���
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;  --1987/07/13
 
--7-13 20�� �μ����� ����� �Ի����� ���� ������ �Ի��� ���
SELECT MIN(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20; --1980/12/17

--STDDEV ǥ������, VARIANCE �л�
SELECT CEIL(STDDEV(SAL)), CEIL(VARIANCE(SAL))
  FROM EMP;

--7-14  �μ���ȣ�� 30�� ������� ��� �޿� ���
SELECT CEIL(AVG(SAL))--�ø���
     , FLOOR(AVG(SAL))--������
     , SIGN( 10 - 7 ) --�����-1, ������ -1
     , SIGN( 7 - 10 )
     , SIGN( 7 - 7 )  --������ 0
  FROM EMP
 WHERE DEPTNO = 30;
 
--7-15 DISTINCT �� �ߺ��� ������ �޿����� ��� �޿� ���ϱ�
SELECT AVG(DISTINCT SAL)
  FROM EMP
 WHERE DEPTNO = 30; 

--�߰�����
SELECT COUNT(SALARY)
 FROM EMPLOYEES
 WHERE SALARY > 8000;
 
SELECT COUNT(HIRE_DATE)
  FROM EMPLOYEES
 WHERE HIRE_DATE > '20070101';

 
SELECT SUM(MAX_SALARY)
     , AVG(MAX_SALARY)
  FROM JOBS;
  --GROUP BY MAX_SALARY;
  
SELECT SUM(SALARY)
     , AVG(SALARY)
  FROM EMPLOYEES
  WHERE JOB_ID = 'IT_PROG';
 
SELECT FIRST_NAME, SALARY
     , AVG(NVL(COMMISSION_PCT, 0)) OVER (ORDER BY FIRST_NAME) AS COM_AVG
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID BETWEEN 50 AND 80;-- AND FIRST_NAME= 'David';
 
SELECT MIN(MAX_SALARY)
     , MAX(MAX_SALARY)
  FROM JOBS;
  
SELECT MIN(MAX_SALARY)
     , MAX(MAX_SALARY)
  FROM JOBS
 WHERE JOB_TITLE = 'Programmer';
  
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;
 
SELECT FIRST_NAME, SALARY
     , VARIANCE(SALARY) OVER (ORDER BY HIRE_DATE)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100;



--07-2�� ������� ���ϴ� ��(�÷�)�� ���� ����ϴ� GROUP BY ��
--7-16 ���� ������
SELECT CEIL(AVG(SAL)), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT CEIL(AVG(SAL)), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION
SELECT CEIL(AVG(SAL)), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--7-17
SELECT CEIL(AVG(SAL)), DEPTNO
  FROM EMP
 GROUP BY DEPTNO;  --�μ����� ��� ����

--7-18 �μ���ȣ �� ��å�� ��� �޿�, �μ���ȣ �� ��å�� ����
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 GROUP BY DEPTNO, JOB
 ORDER BY DEPTNO, JOB;
 
--7-19 GROUP BY ���� ���� ���� SELECT���� ���Խ� ���� �߻�
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 GROUP BY DEPTNO; --����:ORA-00979: GROUP BY ǥ������ �ƴմϴ�  <= �� ��� ����
--SELECT�� GROUP BY �� ��ġ�ؾ���
-- SELECT DEPTNO, JOB =>GROUP BY DEPTNO, JOB
--7-21
SELECT DISTINCT DEPTNO, CHG_SAL
  FROM(
    SELECT DEPTNO
         --, AVG(SAL) OVER (ORDER BY DEPTNO)
         , CEIL(AVG(SAL) OVER (ORDER BY DEPTNO)) AS CHG_SAL
      FROM EMP
);
--7-22
SELECT DEPTNO
     , CEIL(AVG(SAL))
  FROM EMP
  --WHERE AVG(SAL) > 2200 ���X
 GROUP BY DEPTNO
 HAVING AVG(SAL) > 2000 --GROUP BY �ؿ� �̷��� ����� ����
 ORDER BY DEPTNO;

--SELECT
--FROM
--WHERE
--GROUP BY
--ORDER BY
--������ �����

--7-23
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE SAL <= 3000
 GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
 ORDER BY DEPTNO, JOB;

--7-4�� �׷�ȭ�� ���õ� ���� �Լ� = ROLLUP, CUBE, GROUPING SETS�Լ�
--7-24 ���� GROUP BY ���� ����� �׷�ȭ
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
 GROUP BY DEPTNO, JOB
 ORDER BY DEPTNO, JOB;

--7-25 ROLLUP ���  --�߰��߰��� �Ѱ� ǥ������
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), TRUNC(AVG(SAL))
  FROM EMP
 GROUP BY ROLLUP( DEPTNO, JOB);
--ROLLUP(A, B)
/*
  1. A�׷캰, B�׷쿡 �ش��ϴ� ������
  2. A�׷쿡 �ش��ϴ� ��� ���
  3. ��ü ������ ��� ���
*/

 

--7-26 CUBE ��� �оߺ��� ���� ���� ������ �ٿ� ��Ż
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), TRUNC(AVG(SAL))
  FROM EMP
 GROUP BY CUBE( DEPTNO, JOB)
 ORDER BY DEPTNO, JOB;
 /* CYBE(A, B) -�ش� �׸� ��� ����� ���� ��� �������
    1. A�׷캰, B�׷쿡 �ش��ϴ� ������
    2. A�׷쿡 �ش��ϴ� ��� ���
    3. B�׷쿡 �ش��ϴ� ��� ���
    4. ��ü ������ ��� ���
*/


--7-27 DEPTNO �� ���� �׷�ȭ�� �� ROLLUP �Լ��� JOB ���� �ϱ�
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
 GROUP BY DEPTNO, ROLLUP(JOB);  --�μ���ȣ���� �Ұ踸 ����

SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
 GROUP BY JOB, ROLLUP(DEPTNO);--��å���� �Ұ踸


--7-29 GROUPING SETS �Լ�
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
 GROUP BY GROUPING SETS(DEPTNO, JOB)
 ORDER BY DEPTNO, JOB;--�μ� ��ȣ����, ��å���� 

--7-30 DEPTNO, JOB ���� �׷�ȭ ���� Ȯ�� : GROUPING 
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), TRUNC(AVG(SAL))
     , GROUPING(DEPTNO)  
     , GROUPING(JOB)
  FROM EMP
 GROUP BY ROLLUP( DEPTNO, JOB);  --GROUPING => 0=�׷�ȭ �Ȱ�, 1= �׷�ȭ �ȵȰ� 

SELECT DECODE(GROUPING(DEPTNO), 1, '�Ѱ�', DEPTNO) AS DEPTNO
     , DECODE(GROUPING(JOB), 1, DECODE(GROUPING(DEPTNO), 1, ' ', '�Ұ�'), JOB) AS JOB
     , COUNT(*), MAX(SAL), SUM(SAL), TRUNC(AVG(SAL)) AS AVG
  --   , GROUPING(DEPTNO)  
  --   , GROUPING(JOB)
  FROM EMP
 GROUP BY ROLLUP( DEPTNO, JOB);

SELECT DEPTNO
  FROM EMP
 GROUP BY DEPTNO;
 
--7-33
SELECT DEPTNO, ENAME
  FROM EMP
 GROUP BY DEPTNO, ENAME;
 
--11G���� ��� ����
--LISTAGG(): �μ��� ��� �̸��� ������ �����Ͽ� ���
--7-34
SELECT DEPTNO
     , LISTAGG(ENAME, ', ')
       WITHIN GROUP (ORDER BY SAL DESC) AS ENAMES
  FROM EMP
 GROUP BY DEPTNO;

--7-38 DECODE���� Ȱ���Ͽ� PIVOT �Լ��� ���� ��� ����
SELECT DEPTNO
     , MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK"
     , MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN"
     , MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT"
     , MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER"
     , MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
  FROM EMP
 GROUP BY DEPTNO
 ORDER BY DEPTNO;
 
SELECT DEPTNO, JOB, MAX(SAL) FROM EMP GROUP BY DEPTNO, JOB;

--7-39
SELECT *
    FROM(
    SELECT DEPTNO
         , MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK"
         , MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN"
         , MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT"
         , MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER"
         , MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
      FROM EMP
     GROUP BY DEPTNO
     ORDER BY DEPTNO
     )
     UNPIVOT(
     SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST)
     )
     ;
 
--7-36 RIVOT �Լ� :��å�� �μ� �ְ�޿�
SELECT *
  FROM (SELECT DEPTNO, JOB, SAL
          FROM EMP)
 PIVOT(MAX(SAL)
       FOR DEPTNO IN (10, 20, 30))
 ORDER BY JOB;
 
--7-37 �μ��� ��å �ְ� �޿� 2���� ǥ ���·� ���
SELECT *
  FROM (SELECT JOB, DEPTNO, SAL
          FROM EMP)
 PIVOT(MAX(SAL)
       FOR JOB IN ('CLERK' AS CLERK,
                    'SALESMAN' AS SALESMAN,
                    'PRESIDENT' AS PRESIDENT,
                    'MANAGER' AS MANAGER,
                    'ANALYST' AS ANALYST
                    ))
 ORDER BY DEPTNO;


SELECT *
  FROM (SELECT ENAME, JOB, SAL, COMM, HIREDATE
          FROM EMP)
 PIVOT(MAX(HIREDATE)
       FOR ENAME IN ('ENAME' AS ENAME))
 ORDER BY JOB;
 
SELECT *
  FROM(SELECT FIRST_NAME, EMPLOYEE_ID, SALARY
         FROM EMPLOYEES)
  PIVOT(MAX(SALARY)
        FOR FIRST_NAME IN ('FIRST_NAME' AS FIRST_NAME))
 ORDER BY EMPLOYEE_ID;
 
--����
SELECT DEPTNO, TRUNC(AVG(SAL), 0),MAX(SAL), MIN(SAL), COUNT(DEPTNO)
  FROM EMP
 GROUP BY DEPTNO;
 
SELECT JOB, COUNT(*)
  FROM EMP 
 GROUP BY JOB
 HAVING COUNT(JOB) >= 3;
 
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIREYEAR, DEPTNO, COUNT(*) AS CNT
  FROM EMP
  GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
  
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM  --�����ϸ� O, ������ X
     , COUNT(*) AS CNT
  FROM EMP
 GROUP BY NVL2(COMM, 'O', 'X');  --�ִ°� O�� ī��Ʈ, ���°� X�� ī��Ʈ
 
SELECT DEPTNO
     , TO_CHAR(HIREDATE, 'YYYY') AS HIREYEAR
     , COUNT(*) AS CNT
     , MAX(SAL) AS MAX_SAL
     , SUM(SAL) AS SUM_SAL
     , TRUNC(AVG(SAL)) AS AVG_SAL
     FROM EMP
 GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));

SELECT DECODE(GROUPING(DEPTNO), 1, '�Ѱ�', DEPTNO) AS DEPTNO
     , DECODE(GROUPING(TO_CHAR(HIREDATE, 'YYYY')), 1, --HD�� 1�϶� �Ұ� ǥ��
                      DECODE(GROUPING(DEPTNO),1, ' ','�Ұ�'),-- �ѹ��� DECODE�� �μ� DEPTNO�� 1�϶� ���� ǥ��
                        TO_CHAR(HIREDATE, 'YYYY')) AS HIREYEAR
     , COUNT(*) AS CNT
     , MAX(SAL) AS MAX_SAL
     , SUM(SAL) AS SUM_SAL
     , TRUNC(AVG(SAL)) AS AVG_SAL
     ,GROUPING(DEPTNO) DEPTNO
     ,GROUPING(TO_CHAR(HIREDATE, 'YYYY')) HD
     FROM EMP
 GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));

--1.�μ���ȣ 10���� ������� ��� ��ȣ, ��� �̸�, ������ ��� �Ͻÿ�.
SELECT EMPNO AS �����ȣ, ENAME AS ����̸�, SAL AS ����
  FROM EMP
 WHERE DEPTNO = 10;
 
--2. �����ȣ 7369�� ��� �̸�, �Ի���, �μ���ȣ�� ����Ͻÿ�
SELECT ENAME AS  ����̸�, HIREDATE �Ի���, DEPTNO �μ���ȣ
  FROM EMP
 WHERE EMPNO = 7369;
--3. �����ȣ 7300 ũ�� 7400 ���� ��� �̸�, �Ի���, �μ���ȣ�� ����Ͻÿ�. 
SELECT ENAME ����̸�, HIREDATE �Ի���, DEPTNO �μ���ȣ
  FROM EMP
 WHERE EMPNO > 7300 AND EMPNO < 7400;
-- 4. EMPLOYEE ��� ������ (�����ȣ ���� ������������) �˻��Ͻÿ�. 
SELECT *
  FROM EMP
 ORDER BY EMPNO DESC;
-- 5. �̸��� S�� �����ϴ� ��� ����� �����ȣ�� �̸��� ����Ͻÿ�.   
SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';


SELECT HIREDATE
  FROM EMP;
