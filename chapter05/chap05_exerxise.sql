-- 5��: �� �����ϰ� �پ��ϰ� ����� ����ϴ� WHERE���� ������
--5-1  P94
SELECT *
  FROM EMP;
  
--5-2 �μ���ȣ�� 30�� ������(��)�� ����ϱ�
SELECT *
  FROM EMP
 WHERE DEPTNO = 30;  -- '=' �񱳿����� ���ٸ� 
 
 --1�� ����
 --�����ȣ�� 7782�� ��� ������ �������� ���� �ۼ� �Ͻÿ�
SELECT *
  FROM EMP
 WHERE EMPNO = 7782;
 
--5-3 AND �����ڷ� ������ ���ǽ� ����ϱ�
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';   --�� ������ AND, OR  AND= �Ѵ� TRUE���� O

--�����ȣ�� 7499 �̰� �μ���ȣ�� 30�� ��� ������ ���
SELECT *
  FROM EMP
 WHERE EMPNO = 7499
   AND DEPTNO = 30;
   
--5-4 OR�����ڷ� �������� ������� ����ϱ�
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
    OR JOB = 'CLERK';
    
SELECT *
  FROM EMP
 WHERE JOB = 'SALESMAN'
    OR JOB = 'CLERK';   -- �ش��ϸ� ��� ������(TRUE)

--1�� ���� : �μ� ��ȣ�� 20 �̰ų� ������ SALESMAN�� ��� ���� ���
SELECT *
  FROM EMP
 WHERE DEPTNO = 20
    OR JOB = 'SALESMAN';
    
--5-5��� ������ :�޿����� 12�� ���� ���� 36000�� ���� ���
SELECT *
  FROM EMP
 WHERE SAL * 12 = 36000;
 
--5-6 �񱳿����� :�޿��� 3000�̻��� ���� ���� ��ȸ ���
SELECT *
  FROM EMP
 WHERE SAL >= 3000;
 
--1�� ���� 
--�޿��� 2500 �̻��̰� ������ ANALYST�� ��� ������ ���
SELECT *
  FROM EMP
 WHERE SAL >= 2500
   AND JOB = 'ANALYST';
   
--5-7 ���ڵ� ��� �� ���� (����)
SELECT *
  FROM EMP
 WHERE ENAME >= 'F';
 
 --5-8 
SELECT *
  FROM EMP 
 WHERE ENAME <= 'FORZ';
 
--��� ������  �����ʴ�( '<>', '!=', '^=' )
--���� '='
--5-9
SELECT *
  FROM EMP
 WHERE SAL != 3000;

--5-10
SELECT *
  FROM EMP
 WHERE SAL <> 3000;

--5-11
SELECT *
  FROM EMP
 WHERE SAL ^= 3000;
 
--5-12 �� ���� ������
SELECT *
  FROM EMP
 WHERE NOT SAL = 3000;

--IN ������  �߿�!!!
--OR �����ڸ� ��� ������ ������ �����ϴ� ������ ���
SELECT *
  FROM EMP 
 WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
--5-14
SELECT * 
  FROM EMP
 WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');--60�� ���ܱ��� ����

--5-15 ��� �����ڿ� AND ������ ���
SELECT * 
  FROM EMP
 WHERE JOB != 'MANAGER'
   AND JOB <> 'SALESMAN'
   AND JOB ^= 'CLERK';
 
--5-16  ��ΰ� �ƴѰ��
SELECT * 
  FROM EMP
 WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

--1�� ���� 
--�μ� ��ȣ�� 10, 20 ���� ��� ������ ����ϴ� ���� �ۼ�
SELECT *
  FROM EMP
 WHERE DEPTNO IN (10, 20); 

--5-17 ��� �񱳿�����
SELECT *
  FROM EMP
 WHERE SAL >= 2000 AND SAL <= 3000;
 
--5-18 BETWEEN A AND B���� ���� ��� 
SELECT *
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 3000;  -- >=, <= �̻� ����

--5-19
SELECT *
  FROM EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;  --�ʰ� �̸�
 
--LIKE�����ڿ� ���ϵ� ī�� : �ſ� �߿�
--5-20  --�̸��� S�� �����ϴ� ���� ���
SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';  --���ϵ� ī�� : Ư������ OR ���ڿ� ��ü OR ����
 
--LIKE �����ڿ� �Բ� ��� �Ҽ��ִ� ���ϵ� ī�� '_' DHK '%'
/*
_ : � ���̵� �Ѱ��� ���� �����͸� �ǹ�
% : ���̿� ������� ��� ���� ������ �ǹ� 
*/

--��� �̸��� �ι�° ���ڰ� L�� ����� ���
--5-21
SELECT *
  FROM EMP
 WHERE ENAME LIKE '_L%';
 
--��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ���
--5-22
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%AM%';
 
--5-23
SELECT *
  FROM EMP
 WHERE ENAME NOT LIKE '%AM%';
 
-- _ �� % ���ڰ� �����ͷ� ���� �Ǿ� �ִ°�찡 ��Ȥ ����




INSERT INTO EMP VALUES
(7999,'A_ADAM','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

COMMIT;

SELECT * FROM EMP WHERE ENAME LIKE 'A_A%';

SELECT * FROM EMP WHERE ENAME LIKE 'A@_A%' ESCAPE'@';  
--7999	A_ADAM	CLERK	7902	80/12/17	800		20
--_�� ���ϵ� ī�尡 �ƴ϶� ���ڷ� �ν��ϰ� ����

DELETE FROM EMP WHERE ENAME LIKE 'A@_A%' ESCAPE'@'; 
COMMIT;



SELECT * FROM EMP;

---------5�� ����------------
SELECT *
  FROM EMPLOYEES
  WHERE FIRST_NAME ='David';--��µǴ� �����ʹ� ��� ���� ������
  
SELECT *
  FROM JOBS
 WHERE MIN_SALEARY = 4000;
 
SELECT *
  FROM JOBS
 WHERE MIN_SALARY > 8000;
 
SELECT *
  FROM JOBS
 WHERE MAX_SALARY <= 10000;
 
SELECT *
  FROM JOBS
 WHERE MIN_SALARY >= 4000
   AND MAX_SALARY <=10000;

SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = 'IT_PROG'
   AND SALARY > 5000;
   
   
--5-24 P114
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
  FROM EMP;
  
--5-25
SELECT *
  FROM EMP
 WHERE COMM = NULL;  --���� ����Ÿ�� NULL�� �Է� ���ִ°��
 
--5-26
SELECT *
  FROM EMP
 WHERE COMM IS NULL;  -- ������ ���� ���� �� ã�� ���
 
SELECT *
  FROM EMP
 WHERE COMM IS NOT  NULL;  --IS NULL�� NOT �� IS �ڿ� ��

--5-27   ���� ����� �ִ� ��� �����͸� ���  
SELECT *
  FROM EMP
 WHERE MGR IS NOT NULL;--NULL�� �ƴϴ� = �����Ѵ�
  
--5-28 AND �����ڿ� IS NOT
SELECT * 
  FROM EMP
 WHERE SAL > NULL  --FULSE�� �ƹ��͵� �ȳ���
   AND COMM IS NULL;

--5-28 OR �����ڿ� IS NULL ������  ������
SELECT * 
  FROM EMP
 WHERE SAL > NULL  --FULSE
    OR COMM IS NULL;
    
--���տ����� : UNION, UNION ALL, MINUS, INTERSECT     
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO IN ( 10, 20 );    
-- UNION �ߺ��κ� 1�����, UNION ALL �ߺ��κ� 2�����, MINUS ��ġ�� �κ� �����ϰ� ���� INTERSECT ��ġ�� �κи�
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION  --�� �Ʒ��� �̾��� = DEPTNO IN ( 10, 20 );  
SELECT EMPNO, ENAME, SAL, DEPTNO -- ���� ������ �Ȱ��ƾ���
  FROM EMP
 WHERE DEPTNO = 20
 ;
 
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO IN ( 10, 20 );    
-- UNION �ߺ��κ� 1�����, UNION ALL �ߺ��κ� 2�����, MINUS ��ġ�� �κ� �����ϰ� ���� INTERSECT ��ġ�� �κи�
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION  ALL --�ߺ��Ǵ��� ��� ���
SELECT EMPNO, ENAME, SAL, DEPTNO -- ���� ������ �Ȱ��ƾ���
  FROM EMP
 WHERE DEPTNO = 20
 ;
 
SELECT DISTINCT DEPTNO FROM EMP;
--5-36
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
--5-37 INTERSECT ������
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;

--������ �켱����
--������ : ��������� > ��Һ񱳿����� > �׿ܺ�(IS NULL, LIKE, IN) > BETWEEN > ��

SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S';
 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';

--���տ����� �̻�� ����   
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO IN ( 20, 30)
   AND SAL > 2000;

--���տ����� ��� ����     
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;

SELECT *
  FROM EMP
 WHERE SAL < 2000
   OR SAL > 3000;
   
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
 WHERE ENAME LIKE '%E%'
   AND DEPTNO = 30
   AND SAL NOT BETWEEN 1000 AND 2000;
   
SELECT *
  FROM EMP
 WHERE COMM IS NULL --���� ����
   AND MGR IS NOT NULL  --����� ����
   AND JOB IN ('MANAGER', 'CLERK')  
   AND ENAME NOT LIKE '_L%';
   

--����
SELECT *
  FROM JOBS
 ORDER BY JOB_TITLE;
  
 
SELECT *
  FROM COUNTRIES
 ORDER BY COUNTRY_NAME DESC;
 
SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 12000;
   
SELECT *
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 12000;
   
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID IN ('IT_PROG', 'ST_MAN');
 
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL;
 
SELECT *
  FROM DEPARTMENTS
 WHERE MANAGER_ID IS NOT NULL;
 
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID LIKE 'AD%';
 
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%ni%';
 
SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID BETWEEN 2000 AND 3000;
 
SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID >= 2000
UNION ALL
SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID <= 3000;
 
 SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID >= 2000
MINUS
SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID <= 3000;
 
 SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID >= 2000
INTERSECT
SELECT LOCATION_ID, STREET_ADDRESS, CITY
  FROM LOCATIONS
 WHERE LOCATION_ID <= 3000;


--6-