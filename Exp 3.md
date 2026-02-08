# Experiment 3 – Retrieving Data using EMPLOYEE Table
## Q1. List all employees and jobs in Department 30 in descending order by salary.
```sql
MariaDB [Archisha]> SELECT ename, job, sal
    -> FROM employee
    -> WHERE deptno = 30
    -> ORDER BY sal DESC;
```
**OUTPUT:**
```
+--------+----------+------+
| ename  | job      | sal  |
+--------+----------+------+
| BLAKE  | MANAGER  | 2850 |
| ALLEN  | SALESMAN | 1600 |
| TURNER | SALESMAN | 1500 |
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| JAMES  | CLERK    |  950 |
+--------+----------+------+
6 rows in set (0.013 sec)

```
## Q2. List job and department number of employees whose name are five letters long beginning with "A" and end with "N".
```sql
MariaDB [Archisha]> SELECT ENAME, JOB, DEPTNO
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE 'A___N';
```
**OUTPUT:**
```
+-------+----------+--------+
| ENAME | JOB      | DEPTNO |
+-------+----------+--------+
| ALLEN | SALESMAN |     30 |
+-------+----------+--------+
1 row in set (0.001 sec)
```
## Q3. Display the name of employees whose name start with alphabet S.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE 'S%';
```
**OUTPUT:**
```
+-------+
| ENAME |
+-------+
| SMITH |
| SCOTT |
+-------+
2 rows in set (0.001 sec)
```
## Q4. Display the names of employees whose name ends with alphabet S.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE '%S';
```
**OUTPUT:**
```
+-------+
| ENAME |
+-------+
| JONES |
| ADAMS |
| JAMES |
+-------+
3 rows in set (0.001 sec)
```
## Q5. Display the names of employees working in department number 10 or 20 or 40 or employees working as clerks, salesman or analyst.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO IN (10, 20, 40)
    -> OR JOB IN ('CLERK', 'SALESMAN', 'ANALYST');
```
**OUTPUT:**
```
+--------+
| ENAME  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
13 rows in set (0.000 sec)
```
## Q6. Display employee number and names for employees who earn commission.
```sql
MariaDB [Archisha]> SELECT EMPNO, ENAME
    -> FROM EMPLOYEE
    -> WHERE COMM IS NOT NULL
    -> AND COMM > 0;
```
**OUTPUT:**
```
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7499 | ALLEN  |
|  7521 | WARD   |
|  7654 | MARTIN |
+-------+--------+
3 rows in set (0.012 sec)
```
## Q7. Display employee number and total salary for each employee.
```sql
MariaDB [Archisha]> SELECT EMPNO, (SAL + IFNULL(COMM, 0)) AS TOTAL_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+-------+--------------+
| EMPNO | TOTAL_SALARY |
+-------+--------------+
|  7369 |          800 |
|  7499 |         1900 |
|  7521 |         1550 |
|  7566 |         2975 |
|  7654 |         2650 |
|  7698 |         2850 |
|  7782 |         2450 |
|  7788 |         3000 |
|  7839 |         5000 |
|  7844 |         1500 |
|  7876 |         1100 |
|  7900 |          950 |
|  7902 |         3000 |
|  7934 |         1300 |
+-------+--------------+
14 rows in set (0.015 sec)
```
## Q8. Display employee number and annual salary for each employee.
```sql
MariaDB [Archisha]> SELECT EMPNO, SAL * 12 AS ANNUAL_SALARY
    -> FROM EMPLOYEE;
```
**OUTPUT:**
```
+-------+---------------+
| EMPNO | ANNUAL_SALARY |
+-------+---------------+
|  7369 |          9600 |
|  7499 |         19200 |
|  7521 |         15000 |
|  7566 |         35700 |
|  7654 |         15000 |
|  7698 |         34200 |
|  7782 |         29400 |
|  7788 |         36000 |
|  7839 |         60000 |
|  7844 |         18000 |
|  7876 |         13200 |
|  7900 |         11400 |
|  7902 |         36000 |
|  7934 |         15600 |
+-------+---------------+
14 rows in set (0.001 sec)
```
## Q9. Display the names of all employees working as clerks and drawing a salary more than 3,000.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL > 3000;
```
**OUTPUT:**
```
Empty set (0.001 sec)
```
## Q10. Display the names of employees who are working as clerk, salesman or analyst and drawing a salary more than 3,000.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB IN ('CLERK', 'SALESMAN', 'ANALYST')
    -> AND SAL > 3000;
```
**OUTPUT:**
```
Empty set (0.001 sec)
```

