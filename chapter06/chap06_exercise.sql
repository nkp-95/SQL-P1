--6��
-- ���� �����͸� �����ϴ� ���� �Լ�
--6-1 UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
--6-2
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) = UPPER('Scott');  --�Ѵ� �빮�ڷ� �ٲ㼭 ��

SELECT *
  FROM EMP
 WHERE LOWER(ENAME) = LOWER('Scott');  --�Ѵ� �ҹ��ڷ� �ٲ㼭 ��
 
--6-3
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) LIKE UPPER('%scott%'); 

--6-4 ���ڿ� ���̸� ���ϴ� LENGTH �Լ�
SELECT ENAME, LENGTH(ENAME)
  FROM EMP;

--6-5����̸��� ���̰� 5�̻��� �� ���
SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 5;

--6-6
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
  FROM DUAL;  --DUAL���� ���߱�� SELECT, FROM�� �ݵ�� �־���ϱ� ����

SELECT SYSDATE FROM DUAL;  --��¥ ��������

--��å�̸��� 6���� �̻��� ������ ��� ���� �ۼ�
SELECT *
  FROM EMP
 WHERE LENGTH(JOB) >= 6;
 
--���ڿ� �Ϻθ� �����ϴ� SUBSTR(�÷���, ������ġ, �������) �Լ�  �߿�
--6-7
SELECT JOB
     --, SUBSTR(JOB, 1, 2)  --�ε��� �ƴ�
     --, SUBSTR(JOB, 3, 2)
     --, SUBSTR(JOB, 5)
     , SUBSTR(JOB, -5)--���� = �ڿ������� 5��°���� ������ ���̱���
  FROM EMP;

SELECT JOB
     , SUBSTR(JOB, -LENGTH(JOB))  --ó������ ������
     , SUBSTR(JOB, -LENGTH(JOB), 2)--ó������ 2����
     , SUBSTR(JOB, -3)-- �ڿ��� 3��°���� ������
  FROM EMP;

--INSTR
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1  --���ڰ� �ִ� ��ġ
     , INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_1 --���ڰ� �ִ� ��ġ
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_1 --4('���ĺ�', '������ġ', '���� ���ĺ��� ���° ���ĺ�)
     , INSTR('HELLO, ORACLE!', 'K') AS INSTR_1--������  0
     , INSTR('HELLO, ORACLE!', 'CL') AS INSTR_1
  FROM DUAL;
  
--6-10 INSTR �Լ��� ����̸��� S�� �ִ� �� ���ϱ�
SELECT *
  FROM EMP
 WHERE INSTR(ENAME, 'S') > 0;
 
--6-11
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S%';
 
--6-12 REPLACE
SELECT '010-1234-5678' AS REPLACE_BEFORE
     , REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1
     , REPLACE('010-1234-5678', '-') AS REPLACE_2
  FROM DUAL;
  
--LPAD, RPAD

SELECT 'ORACLE'
     , LPAD('ORACLE', 10, '#') AS LPAD_1  --10�ڸ� Ȯ�� #���� ����� ä��
     , RPAD('ORACLE', 10, '*') AS RPAD_1
     , LPAD('ORACLE', 10) AS LPAD_2
     , RPAD('ORACLE', 10) AS RPAD_2
  FROM DUAL;

--6-14 �������� ����ŷ ó��  
--     SUBSTR(JUMIN, 1, 7)
SELECT RPAD('971225 -', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

--6-15 �� �� ���̿� ������(|)
SELECT CONCAT(EMPNO, ENAME)
     , CONCAT(EMPNO, CONCAT('|', ENAME))
     , EMPNO || '|' || ENAME
  FROM EMP
 WHERE DEPTNO = 10;

--6-16 
SELECT TRIM('   __ORACLE__   ') AS T  --�߰��� �ִ� ������ ������(�յڸ� ����)
     , TRIM(LEADING FROM'   __ORACLE__   ') AS LTRIM
     , TRIM(TRAILING FROM'   __ORACLE__   ') AS RTRIM
     , TRIM(BOTH FROM'   __ORACLE__   ') AS TRIM
  FROM DUAL;

--6-17
SELECT TRIM('_' FROM '__ORACLE__') AS T  --'_'�߰��� ������ ������ ������(�յڸ� ����)
     , TRIM(LEADING '_' FROM '__ORACLE__') AS LTRIM
     , TRIM(TRAILING '_' FROM '__ORACLE__') AS RTRIM
     , TRIM(BOTH '_' FROM '__ORACLE__') AS TRIM
  FROM DUAL;
  
--6-18 
SELECT TRIM('   __ORACLE__   ') AS T  -- ������ ����
     , LTRIM('   __ORACLE__   ') AS LTRIM
     , RTRIM('   __ORACLE__   ') AS RTRIM
     , LTRIM('__ORACLE__', '_') AS LTRIM-- ���ڸ� �־� �ָ� �ش� ���ڸ� ������
     , RTRIM('__ORACLE__', '_') AS RTRIM
  FROM DUAL;
  
SELECT JOB_TITLE, LOWER(JOB_TITLE), UPPER(JOB_TITLE)
  FROM JOBS;
  
SELECT SUBSTR(FIRST_NAME, 1, 1), LAST_NAME
  FROM EMPLOYEES;

SELECT REPLACE(JOB_ID, 'REP', 'REPRESENTATIVE') --�߿�
  FROM EMPLOYEES;
  
SELECT CONCAT(SUBSTR(FIRST_NAME, 1, 1) , CONCAT(' ', LAST_NAME))
  FROM EMPLOYEES;
  
SELECT LENGTH(FIRST_NAME) + LENGTH(LAST_NAME)
  FROM EMPLOYEES; 
  
SELECT JOB_ID, INSTR(JOB_ID, 'A')--���ĺ� ��ġ �˻�
  FROM EMPLOYEES;

SELECT LPAD(CITY, 15, '.'), RPAD(CITY, 15, '.')
  FROM LOCATIONS;

SELECT CITY, LTRIM(CITY, 'S'), RTRIM(CITY, 'e')
  FROM LOCATIONS
 WHERE CITY LIKE 'S%' OR CITY LIKE '%e';

--06-3�� ���� �Լ�
SELECT ROUND(2134.5678) AS ROUND
     , ROUND(2134.5678, 0) AS ROUND --�Ҽ��� 1�ڸ����� �ݿø�
     , ROUND(2134.5678, 1) AS ROUND --�Ҽ��� 2�ڸ����� �ݿø�
     , ROUND(2134.5678, 2) AS ROUND --�Ҽ��� 3�ڸ����� �ݿø�
     , ROUND(2134.5678, -1) AS ROUND_M1 --�ڿ��� ù°�ڸ����� �ݿø�
     , ROUND(2134.5678, -2) AS ROUND_M2 --�ڿ��� ��°�ڸ����� �ݿø�
  FROM DUAL;

--6-20 �����Լ�
SELECT TRUNC(2134.5678) AS TRUNC
     , TRUNC(2134.5678, 0) AS TRUNC0 --�Ҽ��� 1�ڸ����� ����
     , TRUNC(2134.5678, 1) AS TRUNC1 --�Ҽ��� 2�ڸ����� ����
     , TRUNC(2134.5678, 2) AS TRUNC2 --�Ҽ��� 3�ڸ����� ����
     , TRUNC(2134.5678, -1) AS TRUNC_M1 --�ڿ��� ù°�ڸ����� ����
     , TRUNC(2134.5678, -2) AS TRUNC_M2 --�ڿ��� ��°�ڸ����� ����
  FROM DUAL;

--6-21
SELECT CEIL(3.14)  --=4
     , FLOOR(3.14) --=3
     , CEIL(-3.14) --=-3
     , FLOOR(-3.14)--=-4
  FROM DUAL;
  

--6-22  MOD ��������  ==%
SELECT MOD(15, 6) --3
     , MOD(10, 2) --0
     , MOD(11, 2) --1
  FROM DUAL;
  
--��¥ �Լ�
--6-23
SELECT SYSDATE AS NOW
     , SYSDATE - 1 AS YESTERDAY
     , SYSDATE + 1 AS TOMORROW
  FROM DUAL;

--6-24
SELECT SYSDATE 
     , ADD_MONTHS(SYSDATE, 4)  --4���� ��
     , ADD_MONTHS(SYSDATE, 4) + 17
  FROM DUAL;

--6-25�Ի� 10�ֳ�
SELECT EMPNO, ENAME, HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP;

SELECT 12 * 38 FROM DUAL;  --456

SELECT EMPNO, ENAME, HIREDATE
     , ADD_MONTHS(HIREDATE, 456) AS WORK28YEAR
  FROM EMP;

--6-26 �Ի� 38�� �̸��� ��� ���
SELECT EMPNO, ENAME, HIREDATE
     , ADD_MONTHS(HIREDATE, 456) AS WORK28YEAR
  FROM EMP
 WHERE ADD_MONTHS(HIREDATE, 456) > SYSDATE;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) EMPL
  FROM DUAL;

--6-27
SELECT EMPNO, ENAME, HIREDATE, SYSDATE
     , MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS
     , TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS2
  FROM EMP;

--6-28
SELECT SYSDATE
     , NEXT_DAY(SYSDATE, '������')
     , LAST_DAY(SYSDATE)
  FROM DUAL;

--6-29
SELECT SYSDATE
     , ROUND(SYSDATE, 'YYYY') AS FYYYY
     , ROUND(SYSDATE, 'Q') AS FYYYY
     , ROUND(SYSDATE, 'DDD') AS FYYYY
  FROM DUAL;

SELECT SYSDATE
     , TRUNC(SYSDATE, 'YYYY') AS FYYYY
     , TRUNC(SYSDATE, 'Q') AS FYYYY
     , TRUNC(SYSDATE, 'DDD') AS FYYYY
  FROM DUAL;

--6-33
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH12:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY') YYYY
     , TO_CHAR(SYSDATE, 'DAY') DAY
     , TO_CHAR(SYSDATE, 'DY') DY
     , TO_CHAR(SYSDATE, 'DD') DD
     , TO_CHAR(SYSDATE, 'MONTH') MONTH
     , TO_CHAR(SYSDATE, 'MON') MON
     , TO_CHAR(SYSDATE, 'MM') MM
  FROM DUAL;

--6-35
SELECT TO_CHAR(SYSDATE, 'MM') MM
     , TO_CHAR(SYSDATE, 'MON') MON
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') MON_JPN
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') MON_ENG
  FROM DUAL;

--6-38 ��������
SELECT SAL, TO_CHAR(SAL, '999,999') SAL_1
     , TO_CHAR(SAL, '$999,999') SAL_1
     , TO_CHAR(SAL, 'L999,999') SAL_1
     , TO_CHAR(SAL, '0009999999') SAL_2
  FROM EMP;

--���ڿ��� ���ڷ�
SELECT TO_NUMBER('1,300', '999,999')
     - TO_NUMBER('1,500', '999,999')
  FROM DUAL;

--���ڿ��� ��¥ �����ͷ� ��ȯ
SELECT TO_DATE('2024-06-05', 'YYYY-MM-DD') AS TODATE
     , TO_DATE('20240605', 'YYYY-MM-DD') AS TODATE2
  FROM DUAL;
  
--6-45  
SELECT EMPNO, ENAME, SAL, COMM  --NVL ������ �ΰ��� �վ ��� O
     , SAL*12+NVL(COMM,0) AS ANNSAL
     , NVL2(COMM,'�ξƴ�', '����') N2
     --          �����ִٸ�, ������
     , NVL2(COMM, SAL*12+COMM, SAL*12) ANN_SAL --COMM���� ������ ��� ������ ���� ���
  FROM EMP;

--6-47
SELECT EMPNO, ENAME, JOB, SAL
     , DECODE(JOB, 'MANAGER', SAL*1.1, 'SALESMAN', SAL*1.05,    -- =ELSE IF
                   'ANALYSY', SAL,
                   SAL*1.03) AS UPSAL    --ELSE
  FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL
     , DECODE(JOB, 'MANAGER', SAL*1.1, SAL*1.03) AS UPSAL
  FROM EMP;

--CASE��
SELECT EMPNO, ENAME, JOB, SAL
     , CASE JOB 
            WHEN 'MANAGER' THEN SAL*1.1
            WHEN 'SALESMAN'THEN SAL*1.05
            WHEN 'ANALYSY' THEN SAL
            ELSE  SAL*1.03 
        END AS UPSAL    
  FROM EMP;

SELECT EMPNO, ENAME, COMM
     , CASE WHEN COMM IS NULL THEN '�ش���� ����'
            WHEN COMM = 0 THEN '�������'
            WHEN COMM > 0 THEN '���� : ' || COMM
        END AS COMM_TEXT
  FROM EMP;

SELECT EMPNO
     , RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MARKING_EMPNO
     , ENAME
     , RPAD(SUBSTR(ENAME, 1, 1),  LENGTH(ENAME), '*') AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME)= 5;

SELECT EMPNO, ENAME, SAL
     , TRUNC(SAL/21.5, 2) AS DAY_PAY
     , ROUND(SAL/21.5/8, 1) AS TIME_PAY
  FROM EMP;

SELECT EMPNO, ENAME, HIREDATE
     , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������'), 'YYYY-MM-DD') AS R_JOB
     , NVL(TO_CHAR(COMM), 'N/A') AS COMM
     --NVL(): NULL�� Ư���� ������ ġȯ�ϴ� �Լ�
     , NVL2(COMM, '���� ������', '����') AS COMM_YN  --  (�÷� ,  TRUE�϶�, FALSE�϶�)(���� ������ , ������)
     --NVL2(): NULL���� ���� �ƴ� ��츦 �����Ͽ� Ư���� ������ ġȯ�ϴ� �Լ�
     , NVL2(COMM, TO_CHAR(COMM), 'N/A') AS COMM
  FROM EMP;
  
SELECT EMPNO, ENAME
     , CASE WHEN MGR IS NULL THEN ' '
            WHEN MGR IS NOT NULL THEN SUBSTR(MGR, 1,LENGTH(MGR))
        END AS MGR
        --CASE(): ������ ������ ó�� �Լ�
     , CASE WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR, 1,2) = 75 THEN '5555'
            WHEN SUBSTR(MGR, 1,2) = 76 THEN '6666'
            WHEN SUBSTR(MGR, 1,2) = 77 THEN '7777'
            WHEN SUBSTR(MGR, 1,2) = 78 THEN '8888'
            --ELSE SUBSTR(MGR, 1,LENGTH(MGR))
            ELSE TO_CHAR(MGR)
        END AS CHG_MGR
  FROM EMP;

SELECT EMPNO, ENAME
     , DECODE(MGR, NULL, ' ', MGR)
        -- DECODE: �����Ͱ� ���ǰ��� ��ġ�ϸ� ġȯ���� ����ϰ� 
                -- ��ġ���� ������ �⺻���� ����ϴ� ���� �� ó�� �Լ�
     , DECODE(SUBSTR(MGR, 1, 2), NULL, '0000',
                    75, '5555', 76, '6666', 
                    77, '7777', 78, '8888', 
                    TO_CHAR(MGR)) AS CHG_MGR
  FROM EMP;

--�ڵ�����ȯ
SELECT 1 + TO_NUMBER('2') FROM DUAL;  --3
SELECT 1 + '2' FROM DUAL;  --3

--�����Լ�
SELECT FIRST_NAME, SALARY
     , RANK() OVER(ORDER BY SALARY DESC) AS RANK --���� ���� �ǳʶ� => ���� ���� ���
     , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK --���� ���� �ǳʶ��� ���� 
     , ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NUMBER  --�Ϸù�ȣ ����
  FROM EMPLOYEES;

