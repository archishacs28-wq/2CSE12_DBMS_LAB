# EXPERIMENT 5 – SQL AGGREGATE AND STRING FUNCTIONS 
---
## Q1.Display the total number of employees working in the company.
```sql
MariaDB [Archisha]> SELECT COUNT(*) AS TOTAL_EMPLOYEES
    -> FROM EMPLOYEE;
````
**OUTPUT:**
```
+-----------------+
| TOTAL_EMPLOYEES |
+-----------------+
|              14 |
+-----------------+
1 row in set (0.012 sec)
```
## Q2. Display the total salary being paid to all employees.
``` sql
MariaDB [Archisha]> SELECT SUM(SAL) AS TOTAL_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+--------------+
| TOTAL_SALARY |
+--------------+
|        34096 |
+--------------+
1 row in set (0.013 sec)
```
## Q3.Display the maximum salary from employee table.
``` sql
MariaDB [Archisha]> SELECT MAX(SAL) AS MAXIMUM_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+----------------+
| MAXIMUM_SALARY |
+----------------+
|           6050 |
+----------------+
1 row in set (0.013 sec)
```
## Q4. Display the minimum salary from employee table.
``` sql
MariaDB [Archisha]> SELECT MIN(SAL) AS MINIMUM_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+----------------+
| MINIMUM_SALARY |
+----------------+
|            968 |
+----------------+
1 row in set (0.000 sec)
```
## Q5.Display the average salary from employee table.
``` sql
MariaDB [Archisha]> SELECT AVG(SAL) AS AVERAGE_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+----------------+
| AVERAGE_SALARY |
+----------------+
|      2435.4286 |
+----------------+
1 row in set (0.000 sec)
```
## Q6.Display the maximum salary being paid to clerk.
```sql
MariaDB [Archisha]> SELECT MAX(SAL) AS MAX_CLERK_SALARY
    -> FROM EMPLOYEE
    -> WHERE JOB='CLERK';
```
**OUTPUT:**
```
+------------------+
| MAX_CLERK_SALARY |
+------------------+
|             1573 |
+------------------+
1 row in set (0.016 sec)
```
## Q7.Display the maximum salary being paid in dept no 20.
``` sql
MariaDB [Archisha]> SELECT MAX(SAL) AS MAX_SALARY
    -> FROM EMPLOYEE
    -> WHERE DEPTNO=20;
```
**OUTPUT:**
```
+------------+
| MAX_SALARY |
+------------+
|       6050 |
+------------+
1 row in set (0.015 sec)
```
## Q8.Display the minimum salary paid to any salesman.
```sql
MariaDB [Archisha]> SELECT MIN(SAL) AS MIN_SALESMAN_SALARY
    -> FROM EMPLOYEE
    -> WHERE JOB='SALESMAN';
```
**OUTPUT:**
```
+---------------------+
| MIN_SALESMAN_SALARY |
+---------------------+
|                1250 |
+---------------------+
1 row in set (0.001 sec)
```
## Q9.Display the average salary drawn by managers.
``` sql
MariaDB [Archisha]> SELECT AVG(SAL) AS AVG_MANAGER_SALARY
    -> FROM EMPLOYEE
    -> WHERE JOB='MANAGER';
```
**OUTPUT:**
```
+--------------------+
| AVG_MANAGER_SALARY |
+--------------------+
|          3338.0000 |
+--------------------+
1 row in set (0.001 sec)
```
## Q10.Display the total salary drawn by analysts working in dept no 40.
``` sql
MariaDB [Archisha]> SELECT SUM(SAL) AS TOTAL_ANALYST_SALARY
    -> FROM EMPLOYEE
    -> WHERE JOB= 'ANALYST'
    -> AND
    -> DEPTNO=40;
```
**OUTPUT:**
```
+----------------------+
| TOTAL_ANALYST_SALARY |
+----------------------+
|                 3630 |
+----------------------+
1 row in set (0.017 sec)
```
## Q11.Display the names of the employee in Uppercase.
```sql
MariaDB [Archisha]> SELECT UCASE(ENAME) AS UPPERCASE_EMP_NAMES
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+---------------------+
| UPPERCASE_EMP_NAMES |
+---------------------+
| SMITH               |
| ALLEN               |
| WARD                |
| JONES               |
| MARTIN              |
| BLAKE               |
| CLARK               |
| SCOTT               |
| KING                |
| TURNER              |
| ADAMS               |
| JAMES               |
| FORD                |
| MILLER              |
+---------------------+
14 rows in set (0.001 sec)
```
## Q12.Display the names of the employee in Lowercase.
```sql
MariaDB [Archisha]> SELECT LCASE(ENAME) AS LOWERCASE_EMP_NAMES
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+---------------------+
| LOWERCASE_EMP_NAMES |
+---------------------+
| smith               |
| allen               |
| ward                |
| jones               |
| martin              |
| blake               |
| clark               |
| scott               |
| king                |
| turner              |
| adams               |
| james               |
| ford                |
| miller              |
+---------------------+
14 rows in set (0.001 sec)
```
## Q13. Display the names of the employee in Proper case.
``` sql
MariaDB [Archisha]> SELECT CONCAT(
    -> UPPER(SUBSTR(ENAME,1,1)),
    -> LOWER(SUBSTR(ENAME,2))
    -> )
    -> AS EMP_NAME_ProperCase
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+---------------------+
| EMP_NAME_ProperCase |
+---------------------+
| Smith               |
| Allen               |
| Ward                |
| Jones               |
| Martin              |
| Blake               |
| Clark               |
| Scott               |
| King                |
| Turner              |
| Adams               |
| James               |
| Ford                |
| Miller              |
+---------------------+
14 rows in set (0.015 sec)
```
## Q14.Display the length of your name using appropriate function.
```sql
MariaDB [Archisha]> SELECT LENGTH("ARCHISHA")
    -> ;
```
**OUTPUT:**
```
+--------------------+
| LENGTH("ARCHISHA") |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.011 sec)
```
## Q15. Display the length of all the employee names.
```sql
MariaDB [Archisha]> SELECT ENAME,LENGTH(ENAME) AS NAME_LENGTH
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+--------+-------------+
| ENAME  | NAME_LENGTH |
+--------+-------------+
| SMITH  |           5 |
| ALLEN  |           5 |
| WARD   |           4 |
| JONES  |           5 |
| MARTIN |           6 |
| BLAKE  |           5 |
| CLARK  |           5 |
| SCOTT  |           5 |
| KING   |           4 |
| TURNER |           6 |
| ADAMS  |           5 |
| JAMES  |           5 |
| FORD   |           4 |
| MILLER |           6 |
+--------+-------------+
14 rows in set (0.001 sec)
```






