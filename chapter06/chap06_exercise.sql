--6장
-- 문자 데이터를 가공하는 문자 함수
--6-1 UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
--6-2
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) = UPPER('Scott');  --둘다 대문자로 바꿔서 비교

SELECT *
  FROM EMP
 WHERE LOWER(ENAME) = LOWER('Scott');  --둘다 소문자로 바꿔서 비교
 
--6-3
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) LIKE UPPER('%scott%'); 

--6-4 문자열 길이를 구하는 LENGTH 함수
SELECT ENAME, LENGTH(ENAME)
  FROM EMP;

--6-5사원이름의 길이가 5이상인 행 출력
SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 5;

--6-6
SELECT LENGTH('한글'), LENGTHB('한글')
  FROM DUAL;  --DUAL구색 맞추기용 SELECT, FROM이 반드시 있어야하기 때문

SELECT SYSDATE FROM DUAL;  --날짜 가져오기

--직책이름이 6글자 이상인 데이터 출력 쿼리 작성
SELECT *
  FROM EMP
 WHERE LENGTH(JOB) >= 6;
 
--문자열 일부를 추출하는 SUBSTR(컬럼명, 시작위치, 추출길이) 함수  중요
--6-7
SELECT JOB
     --, SUBSTR(JOB, 1, 2)  --인덱스 아님
     --, SUBSTR(JOB, 3, 2)
     --, SUBSTR(JOB, 5)
     , SUBSTR(JOB, -5)--음수 = 뒤에서부터 5번째부터 지정된 길이까지
  FROM EMP;

SELECT JOB
     , SUBSTR(JOB, -LENGTH(JOB))  --처음부터 끝까지
     , SUBSTR(JOB, -LENGTH(JOB), 2)--처음부터 2개만
     , SUBSTR(JOB, -3)-- 뒤에서 3번째부터 끝까지
  FROM EMP;

--INSTR
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1  --글자가 있는 위치
     , INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_1 --글자가 있는 위치
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_1 --4('알파벳', '시작위치', '같은 알파벳의 몇번째 알파벳)
     , INSTR('HELLO, ORACLE!', 'K') AS INSTR_1--없으면  0
     , INSTR('HELLO, ORACLE!', 'CL') AS INSTR_1
  FROM DUAL;
  
--6-10 INSTR 함수로 사원이름에 S가 있는 행 구하기
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
     , LPAD('ORACLE', 10, '#') AS LPAD_1  --10자리 확보 #으로 빈공간 채움
     , RPAD('ORACLE', 10, '*') AS RPAD_1
     , LPAD('ORACLE', 10) AS LPAD_2
     , RPAD('ORACLE', 10) AS RPAD_2
  FROM DUAL;

--6-14 개인정보 마스킹 처리  
--     SUBSTR(JUMIN, 1, 7)
SELECT RPAD('971225 -', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

--6-15 두 열 사이에 파이프(|)
SELECT CONCAT(EMPNO, ENAME)
     , CONCAT(EMPNO, CONCAT('|', ENAME))
     , EMPNO || '|' || ENAME
  FROM EMP
 WHERE DEPTNO = 10;

--6-16 
SELECT TRIM('   __ORACLE__   ') AS T  --중간에 있는 공백은 못지움(앞뒤만 가능)
     , TRIM(LEADING FROM'   __ORACLE__   ') AS LTRIM
     , TRIM(TRAILING FROM'   __ORACLE__   ') AS RTRIM
     , TRIM(BOTH FROM'   __ORACLE__   ') AS TRIM
  FROM DUAL;

--6-17
SELECT TRIM('_' FROM '__ORACLE__') AS T  --'_'중간에 공백이 잇으면 못지움(앞뒤만 가능)
     , TRIM(LEADING '_' FROM '__ORACLE__') AS LTRIM
     , TRIM(TRAILING '_' FROM '__ORACLE__') AS RTRIM
     , TRIM(BOTH '_' FROM '__ORACLE__') AS TRIM
  FROM DUAL;
  
--6-18 
SELECT TRIM('   __ORACLE__   ') AS T  -- 공백을 지움
     , LTRIM('   __ORACLE__   ') AS LTRIM
     , RTRIM('   __ORACLE__   ') AS RTRIM
     , LTRIM('__ORACLE__', '_') AS LTRIM-- 문자를 넣어 주면 해당 문자를 지워줌
     , RTRIM('__ORACLE__', '_') AS RTRIM
  FROM DUAL;
  
SELECT JOB_TITLE, LOWER(JOB_TITLE), UPPER(JOB_TITLE)
  FROM JOBS;
  
SELECT SUBSTR(FIRST_NAME, 1, 1), LAST_NAME
  FROM EMPLOYEES;

SELECT REPLACE(JOB_ID, 'REP', 'REPRESENTATIVE') --중요
  FROM EMPLOYEES;
  
SELECT CONCAT(SUBSTR(FIRST_NAME, 1, 1) , CONCAT(' ', LAST_NAME))
  FROM EMPLOYEES;
  
SELECT LENGTH(FIRST_NAME) + LENGTH(LAST_NAME)
  FROM EMPLOYEES; 
  
SELECT JOB_ID, INSTR(JOB_ID, 'A')--알파벳 위치 검색
  FROM EMPLOYEES;

SELECT LPAD(CITY, 15, '.'), RPAD(CITY, 15, '.')
  FROM LOCATIONS;

SELECT CITY, LTRIM(CITY, 'S'), RTRIM(CITY, 'e')
  FROM LOCATIONS
 WHERE CITY LIKE 'S%' OR CITY LIKE '%e';

--06-3절 숫자 함수
SELECT ROUND(2134.5678) AS ROUND
     , ROUND(2134.5678, 0) AS ROUND --소수점 1자리에서 반올림
     , ROUND(2134.5678, 1) AS ROUND --소수점 2자리에서 반올림
     , ROUND(2134.5678, 2) AS ROUND --소수점 3자리에서 반올림
     , ROUND(2134.5678, -1) AS ROUND_M1 --자연수 첫째자리에서 반올림
     , ROUND(2134.5678, -2) AS ROUND_M2 --자연수 둘째자리에서 반올림
  FROM DUAL;

--6-20 버림함수
SELECT TRUNC(2134.5678) AS TRUNC
     , TRUNC(2134.5678, 0) AS TRUNC0 --소수점 1자리에서 버림
     , TRUNC(2134.5678, 1) AS TRUNC1 --소수점 2자리에서 버림
     , TRUNC(2134.5678, 2) AS TRUNC2 --소수점 3자리에서 버림
     , TRUNC(2134.5678, -1) AS TRUNC_M1 --자연수 첫째자리에서 버림
     , TRUNC(2134.5678, -2) AS TRUNC_M2 --자연수 둘째자리에서 버림
  FROM DUAL;

--6-21
SELECT CEIL(3.14)  --=4
     , FLOOR(3.14) --=3
     , CEIL(-3.14) --=-3
     , FLOOR(-3.14)--=-4
  FROM DUAL;
  

--6-22  MOD 나머지값  ==%
SELECT MOD(15, 6) --3
     , MOD(10, 2) --0
     , MOD(11, 2) --1
  FROM DUAL;
  
--날짜 함수
--6-23
SELECT SYSDATE AS NOW
     , SYSDATE - 1 AS YESTERDAY
     , SYSDATE + 1 AS TOMORROW
  FROM DUAL;

--6-24
SELECT SYSDATE 
     , ADD_MONTHS(SYSDATE, 4)  --4개월 후
     , ADD_MONTHS(SYSDATE, 4) + 17
  FROM DUAL;

--6-25입사 10주년
SELECT EMPNO, ENAME, HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP;

SELECT 12 * 38 FROM DUAL;  --456

SELECT EMPNO, ENAME, HIREDATE
     , ADD_MONTHS(HIREDATE, 456) AS WORK28YEAR
  FROM EMP;

--6-26 입사 38년 미만인 사원 출력
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
     , NEXT_DAY(SYSDATE, '월요일')
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

--6-38 숫자형식
SELECT SAL, TO_CHAR(SAL, '999,999') SAL_1
     , TO_CHAR(SAL, '$999,999') SAL_1
     , TO_CHAR(SAL, 'L999,999') SAL_1
     , TO_CHAR(SAL, '0009999999') SAL_2
  FROM EMP;

--문자열을 숫자로
SELECT TO_NUMBER('1,300', '999,999')
     - TO_NUMBER('1,500', '999,999')
  FROM DUAL;

--문자열을 날짜 데이터로 변환
SELECT TO_DATE('2024-06-05', 'YYYY-MM-DD') AS TODATE
     , TO_DATE('20240605', 'YYYY-MM-DD') AS TODATE2
  FROM DUAL;
  
--6-45  
SELECT EMPNO, ENAME, SAL, COMM  --NVL 있으면 널값이 잇어도 계산 O
     , SAL*12+NVL(COMM,0) AS ANNSAL
     , NVL2(COMM,'널아님', '널임') N2
     --          값이있다면, 없을때
     , NVL2(COMM, SAL*12+COMM, SAL*12) ANN_SAL --COMM값이 있으면 계산 없으면 빼고 계산
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

--CASE문
SELECT EMPNO, ENAME, JOB, SAL
     , CASE JOB 
            WHEN 'MANAGER' THEN SAL*1.1
            WHEN 'SALESMAN'THEN SAL*1.05
            WHEN 'ANALYSY' THEN SAL
            ELSE  SAL*1.03 
        END AS UPSAL    
  FROM EMP;

SELECT EMPNO, ENAME, COMM
     , CASE WHEN COMM IS NULL THEN '해당사항 없음'
            WHEN COMM = 0 THEN '수당없음'
            WHEN COMM > 0 THEN '수당 : ' || COMM
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
     , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB
     , NVL(TO_CHAR(COMM), 'N/A') AS COMM
     --NVL(): NULL을 특정한 값으로 치환하는 함수
     , NVL2(COMM, '수당 존재함', '없음') AS COMM_YN  --  (컬럼 ,  TRUE일때, FALSE일때)(값이 있을때 , 없을때)
     --NVL2(): NULL값인 경우와 아닌 경우를 구분하여 특정한 값으로 치환하는 함수
     , NVL2(COMM, TO_CHAR(COMM), 'N/A') AS COMM
  FROM EMP;
  
SELECT EMPNO, ENAME
     , CASE WHEN MGR IS NULL THEN ' '
            WHEN MGR IS NOT NULL THEN SUBSTR(MGR, 1,LENGTH(MGR))
        END AS MGR
        --CASE(): 복잡한 논리조건 처리 함수
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
        -- DECODE: 데이터가 조건값과 일치하면 치환값을 출력하고 
                -- 일치하지 않으면 기본값을 출력하는 조건 논리 처리 함수
     , DECODE(SUBSTR(MGR, 1, 2), NULL, '0000',
                    75, '5555', 76, '6666', 
                    77, '7777', 78, '8888', 
                    TO_CHAR(MGR)) AS CHG_MGR
  FROM EMP;

--자동형변환
SELECT 1 + TO_NUMBER('2') FROM DUAL;  --3
SELECT 1 + '2' FROM DUAL;  --3

--순위함수
SELECT FIRST_NAME, SALARY
     , RANK() OVER(ORDER BY SALARY DESC) AS RANK --공동 순위 건너뜀 => 다음 순위 출력
     , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK --공동 순위 건너뛰지 않음 
     , ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NUMBER  --일련번호 생성
  FROM EMPLOYEES;

