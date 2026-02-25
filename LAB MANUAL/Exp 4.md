# EXPERIMENT 4 – SQL QUERIES USING WHERE, LIKE AND ARITHMETIC OPERATORS
---
## Q1. Display the list of employees who have joined the company before 30th June 1980 or after 31st December 1981.
```sql
MariaDB [Archisha]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE NOT HIREDATE BETWEEN '1980-06-30' AND '1981-12-31';
```
**OUTPUT:**
```
+-------+--------+---------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+---------+------+------------+------+------+--------+
|  7788 | SCOTT  | ANALYST | 7566 | 1982-12-09 | 3000 | NULL |     40 |
|  7876 | ADAMS  | CLERK   | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7934 | MILLER | CLERK   | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+---------+------+------------+------+------+--------+
3 rows in set (0.013 sec)
```
## Q2. Display the names of employees whose names have second alphabet 'A'.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE '_A%';
```
**OUTPUT:**
```
+--------+
| ENAME  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
3 rows in set (0.012 sec)
```
## Q3.Display the names of employees whose name is exactly five characters in length.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE '_____';
```
**OUTPUT:**
```
+-------+
| ENAME |
+-------+
| SMITH |
| ALLEN |
| JONES |
| BLAKE |
| CLARK |
| SCOTT |
| ADAMS |
| JAMES |
+-------+
8 rows in set (0.000 sec)
```
## Q4. Display the names of employees whose names have second last letter 'E'.
```sql
MariaDB [Archisha]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE '%E_';
```
**OUTPUT:**
```
+-------+--------+----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+----------+------+------------+------+------+--------+
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7934 | MILLER | CLERK    | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+----------+------+------------+------+------+--------+
5 rows in set (0.001 sec)
```
## Q5. Display the names of employees who are not working as salesman, clerk or analyst.
```sql
MariaDB [Archisha]> SELECT ENAME, JOB
    -> FROM EMPLOYEE
    -> WHERE JOB NOT IN ('SALESMAN', 'CLERK', 'ANALYST');
```
**OUTPUT:**
```
+-------+-----------+
| ENAME | JOB       |
+-------+-----------+
| JONES | MANAGER   |
| BLAKE | MANAGER   |
| CLARK | MANAGER   |
| KING  | PRESIDENT |
+-------+-----------+
4 rows in set (0.012 sec)
```
## Q6. Display the name of the employee along with their annual salary (SAL * 12).The employee earning the highest salary should appear first.
```sql
MariaDB [Archisha]> SELECT ENAME, (SAL*12) AS "ANNUAL SALARY"
    -> FROM EMPLOYEE
    -> ORDER BY SAL DESC
    -> LIMIT 5;
```
**OUTPUT:**
```
+-------+---------------+
| ENAME | ANNUAL SALARY |
+-------+---------------+
| KING  |         60000 |
| FORD  |         36000 |
| SCOTT |         36000 |
| JONES |         35700 |
| BLAKE |         34200 |
+-------+---------------+
5 rows in set (0.014 sec)
```
## Q7. Display name, sal, hra, pf, da, totalsal for each employee. The output should be in the order of total sal, hra 15% of sal, da 10% of sal, pf 5% of sal. Total salary will be (sal* hra *da)-pf.
```sql
MariaDB [Archisha]> SELECT ENAME,
    -> SAL,
    -> (SAL * 0.15) AS HRA,
    -> (SAL * 0.10) AS DA,
    -> (SAL * 0.05) AS PF,
    -> (SAL + (SAL * 0.15) + (SAL * 0.10) - (SAL * 0.05)) AS TOTAL_SALARY
    -> FROM EMPLOYEE
    -> ORDER BY TOTAL_SALARY;
```
**OUTPUT:**
```
+--------+------+--------+--------+--------+--------------+
| ENAME  | SAL  | HRA    | DA     | PF     | TOTAL_SALARY |
+--------+------+--------+--------+--------+--------------+
| SMITH  |  800 | 120.00 |  80.00 |  40.00 |       960.00 |
| JAMES  |  950 | 142.50 |  95.00 |  47.50 |      1140.00 |
| ADAMS  | 1100 | 165.00 | 110.00 |  55.00 |      1320.00 |
| WARD   | 1250 | 187.50 | 125.00 |  62.50 |      1500.00 |
| MARTIN | 1250 | 187.50 | 125.00 |  62.50 |      1500.00 |
| MILLER | 1300 | 195.00 | 130.00 |  65.00 |      1560.00 |
| TURNER | 1500 | 225.00 | 150.00 |  75.00 |      1800.00 |
| ALLEN  | 1600 | 240.00 | 160.00 |  80.00 |      1920.00 |
| CLARK  | 2450 | 367.50 | 245.00 | 122.50 |      2940.00 |
| BLAKE  | 2850 | 427.50 | 285.00 | 142.50 |      3420.00 |
| JONES  | 2975 | 446.25 | 297.50 | 148.75 |      3570.00 |
| FORD   | 3000 | 450.00 | 300.00 | 150.00 |      3600.00 |
| SCOTT  | 3000 | 450.00 | 300.00 | 150.00 |      3600.00 |
| KING   | 5000 | 750.00 | 500.00 | 250.00 |      6000.00 |
+--------+------+--------+--------+--------+--------------+
14 rows in set (0.015 sec)

```
## Q8.Update the salary of each employee by 10% increment who are not eligible for commission.
```sql
MariaDB [Archisha]> UPDATE EMPLOYEE
    -> SET SAL= SAL+(SAL * 0.10)
    -> WHERE COMM IS NULL
    -> OR
    -> COMM=0;
```
**OUTPUT:**
```
Query OK, 11 rows affected, 0 warnings (0.014 sec)
Rows matched: 11  Changed: 11  Warnings: 0
```
## Q9. Display those employees whose salary is more than 3000 after giving 20% increment.
```sql
MariaDB [Archisha]> SELECT ENAME, SAL, (SAL+(SAL * 0.20)) AS UPDATED_SALARY
    -> FROM EMPLOYEE
    -> WHERE (SAL+(SAL * 0.20)) > 3000;
```
**OUTPUT:**
```
+-------+------+----------------+
| ENAME | SAL  | UPDATED_SALARY |
+-------+------+----------------+
| JONES | 3600 |        4320.00 |
| BLAKE | 3449 |        4138.80 |
| CLARK | 2965 |        3558.00 |
| SCOTT | 3630 |        4356.00 |
| KING  | 6050 |        7260.00 |
| FORD  | 3630 |        4356.00 |
+-------+------+----------------+
6 rows in set (0.001 sec)
```
## Q10. Display those employees whose salary contains at least three digits.
```sql
MariaDB [Archisha]> SELECT ENAME,SAL
    -> FROM EMPLOYEE
    -> WHERE LENGTH(SAL) >= 3;
```
**OUTPUT:**
```
+--------+------+
| ENAME  | SAL  |
+--------+------+
| SMITH  |  968 |
| ALLEN  | 1600 |
| WARD   | 1250 |
| JONES  | 3600 |
| MARTIN | 1250 |
| BLAKE  | 3449 |
| CLARK  | 2965 |
| SCOTT  | 3630 |
| KING   | 6050 |
| TURNER | 1650 |
| ADAMS  | 1331 |
| JAMES  | 1150 |
| FORD   | 3630 |
| MILLER | 1573 |
+--------+------+
14 rows in set (0.012 sec)
```



