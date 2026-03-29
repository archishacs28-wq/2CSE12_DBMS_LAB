# EXPERIMENT 6
##  Q1. Display empno, ename, deptno from employee table. Instead of displaying department numbers display the related department name (Use CASE function).
```sql
SELECT EMPNO, ENAME,
    CASE DEPTNO
    WHEN 10 THEN 'ACCOUNTING'
    WHEN 20 THEN 'RESEARCH'
    WHEN 30 THEN 'SALES'
    WHEN 40 THEN 'OPERATIONS'
    END AS DEPARTMENT_NAME
FROM EMPLOYEE;
```
**OUTPUT:**
```
+-------+--------+-----------------+
| EMPNO | ENAME  | DEPARTMENT_NAME |
+-------+--------+-----------------+
|  7369 | SMITH  | RESEARCH        |
|  7499 | ALLEN  | SALES           |
|  7521 | WARD   | SALES           |
|  7566 | JONES  | RESEARCH        |
|  7654 | MARTIN | SALES           |
|  7698 | BLAKE  | SALES           |
|  7782 | CLARK  | RESEARCH        |
|  7788 | SCOTT  | OPERATIONS      |
|  7839 | KING   | RESEARCH        |
|  7844 | TURNER | SALES           |
|  7876 | ADAMS  | RESEARCH        |
|  7900 | JAMES  | SALES           |
|  7902 | FORD   | RESEARCH        |
|  7934 | MILLER | ACCOUNTING      |
+-------+--------+-----------------+
```
## Q2.  Display your age in days.
```sql
SELECT DATEDIFF(CURDATE(), '2005-01-24') AS age_in_days;
```
**OUTPUT:**
```
+-------------+
| age_in_days |
+-------------+
|        7734 |
+-------------+
1 row in set (0.000 sec)
```
## Q3. Display your age in months.
```sql
SELECT TIMESTAMPDIFF(MONTH, '2005-01-24', CURDATE()) AS age_in_months;
```
**OUTPUT:**
```
+---------------+
| age_in_months |
+---------------+
|           254 |
+---------------+
1 row in set (0.000 sec)
```
## Q4. Display the current date as 15th August Friday 1990 format.
```sql
SELECT DATE_FORMAT(CURDATE(), '%D %M %W %Y') AS formatted_date;
```
**OUTPUT:**
```
+------------------------+
| formatted_date         |
+------------------------+
| 29th March Sunday 2026 |
+------------------------+
1 row in set (0.000 sec)
```
## Q5,Q6. Scott has joined the company on Wednesday 13th August 1990. Display the following output for each row from employee table:
```sql
SELECT CONCAT(ENAME,
' has joined the company on ',
DATE_FORMAT(hiredate, '%W %D %M %Y'))
AS required_format
FROM employee;
```
**OUTPUT:**
```
+--------------------------------------------------------------+
| required_format                                              |
+--------------------------------------------------------------+
| SMITH has joined the company on Wednesday 17th December 1980 |
| ALLEN has joined the company on Friday 20th February 1981    |
| WARD has joined the company on Sunday 22nd February 1981     |
| JONES has joined the company on Thursday 2nd April 1981      |
| MARTIN has joined the company on Monday 28th September 1981  |
| BLAKE has joined the company on Friday 1st May 1981          |
| CLARK has joined the company on Tuesday 9th June 1981        |
| SCOTT has joined the company on Thursday 9th December 1982   |
| KING has joined the company on Tuesday 17th November 1981    |
| TURNER has joined the company on Tuesday 8th September 1981  |
| ADAMS has joined the company on Wednesday 12th January 1983  |
| JAMES has joined the company on Thursday 3rd December 1981   |
| FORD has joined the company on Thursday 3rd December 1981    |
| MILLER has joined the company on Saturday 23rd January 1982  |
+--------------------------------------------------------------+
14 rows in set (0.001 sec)
```
## Q7. Find the date for nearest Saturday after current date
```sql
SELECT DATE_ADD(CURDATE(), INTERVAL (5 - WEEKDAY(CURDATE())) DAY) AS NEXT_SATURDAY;
```
**OUTPUT:**
```
+---------------+
| NEXT_SATURDAY |
+---------------+
| 2026-03-28    |
+---------------+
1 row in set (0.000 sec)
```
## Q8. Display current time.
```sql
SELECT CURTIME() AS `current_time`;
```
**OUTPUT:**
```
+--------------+
| current_time |
+--------------+
| 11:01:04     |
+--------------+
1 row in set (0.000 sec)
```
## Q9. Display the date three months before the current date.
```sql
SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AS three_months_before;
```
**OUTPUT:**
```
MariaDB [Archisha]> SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AS three_months_before;
+---------------------+
| three_months_before |
+---------------------+
| 2025-12-29          |
+---------------------+
1 row in set (0.000 sec)
```
## Q10. Display those employees who joined in the month of December.
```sql
SELECT * FROM EMPLOYEE 
WHERE MONTH(HIREDATE) = 12;
```
**OUTPUT:**
```
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7369 | SMITH | CLERK   | 7902 | 1980-12-17 |  968 | NULL |     20 |
|  7788 | SCOTT | ANALYST | 7566 | 1982-12-09 | 3630 | NULL |     40 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 | 1150 | NULL |     30 |
|  7902 | FORD  | ANALYST | 7566 | 1981-12-03 | 3630 | NULL |     20 |
+-------+-------+---------+------+------------+------+------+--------+
4 rows in set (0.001 sec)
```
## Q11. Display those employees whose first 2 characters from hire date = last 2 characters of salary.
```sql
SELECT * FROM EMPLOYEE 
WHERE RIGHT(DATE_FORMAT(HIREDATE,'%Y'),2) = RIGHT(SAL,2);
```
**OUTPUT:**
```
Empty set (0.001 sec)
```

## Q12. Display those employees whose 10% of salary is equal to the year of joining.
```sql
SELECT * FROM EMPLOYEE 
WHERE SAL * 0.10 = YEAR(HIREDATE);
```
**OUTPUT:**
```
Empty set (0.001 sec)
```
## Q13. Display those employees who joined the company before 15th of the month.
```sql
SELECT * FROM EMPLOYEE 
WHERE DAY(HIREDATE) < 15;
```
**OUTPUT:**
```
    -> WHERE DAY(HIREDATE) < 15;
+-------+--------+----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+----------+------+------------+------+------+--------+
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 3600 | NULL |     20 |
|  7698 | BLAKE  | MANAGER  | 7839 | 1981-05-01 | 3449 | NULL |     30 |
|  7782 | CLARK  | MANAGER  | 7839 | 1981-06-09 | 2965 | NULL |     20 |
|  7788 | SCOTT  | ANALYST  | 7566 | 1982-12-09 | 3630 | NULL |     40 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1650 |    0 |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1983-01-12 | 1331 | NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 | 1150 | NULL |     30 |
|  7902 | FORD   | ANALYST  | 7566 | 1981-12-03 | 3630 | NULL |     20 |
+-------+--------+----------+------+------------+------+------+--------+
8 rows in set (0.000 sec)
```
## Q14. Display those employees who joined after 15th of the month
```sql
SELECT * FROM EMPLOYEE
WHERE DAY(HIREDATE) > 15;
```
**OUTPUT:**
```
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  968 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  300 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 6050 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1573 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
6 rows in set (0.001 sec)
```
## 15. Display those employees whose joining DATE is available in deptno.
```sql
SELECT * FROM EMPLOYEE
WHERE HIREDATE IS NOT NULL;
```
**OUTPUT:**
```
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  968 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  300 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 3600 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 3449 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2965 | NULL |     20 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3630 | NULL |     40 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 6050 | NULL |     20 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1650 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1331 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 | 1150 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3630 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1573 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
14 rows in set (0.001 sec)
```