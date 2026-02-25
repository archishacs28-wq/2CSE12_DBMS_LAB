# Experiment 2 – Retrieving Data (Employee Table)
## Q1. List all distinct jobs in Employee
```sql
MariaDB [Archisha]> SELECT DISTINCT job
    -> FROM employee;
```
**OUTPUT:**
```
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.014 sec)
```
## Q2. List all information about employee in Department No. 30
```sql
MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE DEPTNO = 30;
```
**OUTPUT:**
```
+-------+--------+----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+----------+------+------------+------+------+--------+
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250 |  300 |     30 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER  | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+--------+----------+------+------------+------+------+--------+
6 rows in set (0.017 sec)
```
## Q3. Find all department numbers with department names greater than 20
```sql
MariaDB [Archisha]> SELECT deptno, dname
    -> FROM department
    -> WHERE deptno > 20;
```
**OUTPUT:**
```
+--------+------------+
| deptno | dname      |
+--------+------------+
|     30 | SALES      |
|     40 | OPERATIONS |
+--------+------------+
2 rows in set (0.011 sec)
```
## Q4. Find all information about managers as well as clerks in department number 30.
```sql
MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE deptno = 30
    -> AND job IN ('MANAGER', 'CLERK');
```
**OUTPUT:**
```
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.011 sec)
```
## Q5. List employee name, employee number and department of all clerks
```sql
MariaDB [Archisha]> SELECT ename, empno, deptno
    -> FROM employee
    -> WHERE job = 'CLERK';
```
**OUTPUT:**
```
+--------+-------+--------+
| ename  | empno | deptno |
+--------+-------+--------+
| SMITH  |  7369 |     20 |
| ADAMS  |  7876 |     20 |
| JAMES  |  7900 |     30 |
| MILLER |  7934 |     10 |
+--------+-------+--------+
4 rows in set (0.001 sec)
```
## Q6. Find all managers not in department 30.
```sql
MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE job = 'MANAGER'
    -> AND deptno <> 30;
```
**OUTPUT:**
```
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7782 | CLARK | MANAGER | 7839 | 1981-06-09 | 2450 | NULL |     20 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.013 sec)
```
## Q7. List information about all employees in department 10 who are not managers or clerks.
```sql
MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE deptno = 10
    -> AND job NOT IN ('MANAGER', 'CLERK');
```
**OUTPUT:**
```
Empty set (0.011 sec)
```
## Q8. Find employees and jobs earning between 1200 and 1400.
```sql
MariaDB [Archisha]> SELECT ename, job, sal
    -> FROM employee
    -> WHERE sal BETWEEN 1200 AND 1400;
```
**OUTPUT:**
```
+--------+----------+------+
| ename  | job      | sal  |
+--------+----------+------+
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| MILLER | CLERK    | 1300 |
+--------+----------+------+
3 rows in set (0.012 sec)
```
## Q9. List name and department number of employees who are clerks, analysts or salesman.
```sql
MariaDB [Archisha]> SELECT ename, deptno
    -> FROM employee
    -> WHERE job IN ('CLERK', 'ANALYST', 'SALESMAN');
```
**OUTPUT:**
```
+--------+--------+
| ename  | deptno |
+--------+--------+
| SMITH  |     20 |
| ALLEN  |     30 |
| WARD   |     30 |
| MARTIN |     30 |
| SCOTT  |     40 |
| TURNER |     30 |
| ADAMS  |     20 |
| JAMES  |     30 |
| FORD   |     20 |
| MILLER |     10 |
+--------+--------+
10 rows in set (0.001 sec)
```
## Q10. List name and department number of employees whose names begin with the letter 'M'.

```sql
MariaDB [Archisha]> SELECT ename, deptno
    -> FROM employee
    -> WHERE ename LIKE 'M%';
```
**OUTPUT:**
```
+--------+--------+
| ename  | deptno |
+--------+--------+
| MARTIN |     30 |
| MILLER |     10 |
+--------+--------+
2 rows in set (0.001 sec)
```

