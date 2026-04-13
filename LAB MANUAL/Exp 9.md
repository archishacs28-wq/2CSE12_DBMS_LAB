# EXPERIMENT-9

## Q1. Display the name of employee who earns highest salary.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL = (SELECT MAX(SAL) FROM EMPLOYEE);
+-------+
| ENAME |
+-------+
| KING  |
+-------+
1 row in set (0.070 sec)
```

## Q2. Display the employee number and name of employee working as clerk and earning highest salary among clerks.
```sql
MariaDB [Archisha]> SELECT EMPNO, ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL = (
    -> SELECT MAX(SAL) FROM EMPLOYEE WHERE JOB = 'CLERK' );
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7934 | MILLER |
+-------+--------+
1 row in set (0.011 sec)
```

## Q3. Display the names of the salesman who earns a salary more than the highest salary of any clerk.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'SALESMAN'
    -> AND SAL > (
    -> SELECT MAX(SAL)  FROM EMPLOYEE  WHERE JOB = 'CLERK' );
+--------+
| ENAME  |
+--------+
| ALLEN  |
| TURNER |
+--------+
2 rows in set (0.001 sec)
```

## Q4. Display the names of clerks who earn salary more than that of JAMES and salary less than that of SCOTT.
```sql

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL > (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'JAMES')
    -> AND SAL < (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'SCOTT');
+--------+
| ENAME  |
+--------+
| ADAMS  |
| MILLER |
+--------+
2 rows in set (0.001 sec)
```

## Q5. Display the names of employees who earn a salary more than that of JAMES or salary greater than that of SCOTT.
```sql

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL > (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'JAMES')
    -> OR SAL > (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'SCOTT');
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| FORD   |
| MILLER |
+--------+
12 rows in set (0.001 sec)
```

## Q6. Display the names of the employees who earn highest salary in their respective departments.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE E
    -> WHERE SAL = ( SELECT MAX(SAL)  FROM EMPLOYEE  WHERE DEPTNO = E.DEPTNO );
+--------+
| ENAME  |
+--------+
| BLAKE  |
| SCOTT  |
| KING   |
| MILLER |
+--------+
4 rows in set (0.023 sec)
```

## Q7. Display the names of employees who earn highest salaries in their respective job groups.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE E
    -> WHERE SAL = (
    -> SELECT MAX(SAL)  FROM EMPLOYEE  WHERE JOB = E.JOB);
+--------+
| ENAME  |
+--------+
| JONES  |
| SCOTT  |
| KING   |
| TURNER |
| FORD   |
| MILLER |
+--------+
6 rows in set (0.001 sec)
```

## Q8. Display the employee names who are working in accounting dept.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = (
    -> SELECT DEPTNO FROM DEPARTMENT  WHERE DNAME = 'ACCOUNTING' );
+-------+
| ENAME |
+-------+
| SMITH |
| JONES |
| CLARK |
| KING  |
| ADAMS |
| FORD  |
+-------+
6 rows in set (0.020 sec)
```

## Q9. Display the employee names who are working in MUMBAI.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = (
    -> SELECT DEPTNO FROM DEPARTMENT  WHERE LOCATION = 'MUMBAI' );
+--------+
| ENAME  |
+--------+
| MILLER |
+--------+
1 row in set (0.012 sec)
```

## Q10. Display the job groups having total salary greater than the maximum salary for managers.
```sql
MariaDB [Archisha]> SELECT JOB, SUM(SAL) AS TOTAL_SALARY
    -> FROM EMPLOYEE
    -> GROUP BY JOB
    -> HAVING SUM(SAL) > (
    -> SELECT MAX(SAL) FROM EMPLOYEE  WHERE JOB = 'MANAGER' );
+-----------+--------------+
| JOB       | TOTAL_SALARY |
+-----------+--------------+
| ANALYST   |         7260 |
| CLERK     |         5022 |
| MANAGER   |        10014 |
| PRESIDENT |         6050 |
| SALESMAN  |         5750 |
+-----------+--------------+
5 rows in set (0.015 sec)
```

