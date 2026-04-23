# EXPERIMENT-12

## Q1. Q1. Display those employees whose salary is less than his manager but more than salary of any other managers.
```sql
MariaDB [Archisha]> SELECT E.ENAME FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR=M.EMPNO
    -> WHERE E.SAL<M.SAL
    -> AND E.SAL> ANY(SELECT SAL FROM EMPLOYEE);
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| TURNER |
| JAMES  |
| FORD   |
+--------+
9 rows in set (0.100 sec)
```

## Q2. Find out the number of employees whose salary is greater than their manager salary.
```sql
MariaDB [Archisha]> SELECT COUNT(*) AS COUNT
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR=M.EMPNO
    -> WHERE E.SAL>M.SAL;
+-------+
| COUNT |
+-------+
|     0 |
+-------+
1 row in set (0.013 sec)
```

## Q3. Q3. Display those managers who are not working under president but they are working under any other manager.
```sql
MariaDB [Archisha]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR=M.EMPNO
    -> WHERE E.JOB='Manager'
    -> AND M.JOB!= ' President';
Empty set (0.012 sec)
```

## Q4. Delete those department where no employee is working.
```sql
MariaDB [Archisha]> DELETE FROM DEPARTMENT
    -> WHERE DEPTNO NOT IN(SELECT DISTINCT(DEPTNO) FROM EMPLOYEE);
Query OK, 2 rows affected (0.019 sec)
```

## Q5. Delete those records from emp table whose deptno not available in dept table.
```sql

MariaDB [Archisha]> DELETE FROM EMPLOYEE
    -> WHERE DEPTNO NOT IN(SELECT DISTINCT(DEPTNO) FROM EMPLOYEE);
Query OK, 0 rows affected (0.018 sec)
```

## Q6. Display those earners whose salary is out of the grade available in salgrade table.
```sql

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL NOT BETWEEN (
    -> SELECT MIN(LOSAL) FROM SALGRADE
    -> ) AND (
    -> SELECT MAX(HISAL) FROM SALGRADE
    -> );
Empty set (0.018 sec)
```

## Q7. Display employee name, sal, comm and whose net pay is greater than any other in the company.
```sql


MariaDB [Archisha]> SELECT ENAME, SAL, COMM,
    -> (SAL+ IFNULL(COMM,0)) AS NET_PAY
    -> FROM EMPLOYEE
    -> WHERE (SAL + IFNULL(COMM,0))> ANY(SELECT SAL FROM EMPLOYEE);
+--------+---------+---------+---------+
| ENAME  | SAL     | COMM    | NET_PAY |
+--------+---------+---------+---------+
| ALLEN  | 1600.00 |  300.00 | 1900.00 |
| WARD   | 1250.00 |  300.00 | 1550.00 |
| JONES  | 2975.00 |    NULL | 2975.00 |
| MARTIN | 1250.00 | 1400.00 | 2650.00 |
| BLAKE  | 2850.00 |    NULL | 2850.00 |
| CLARK  | 2450.00 |    NULL | 2450.00 |
| SCOTT  | 3000.00 |    NULL | 3000.00 |
| KING   | 5000.00 |    NULL | 5000.00 |
| TURNER | 1500.00 |    0.00 | 1500.00 |
| ADAMS  | 1100.00 |    NULL | 1100.00 |
| JAMES  |  950.00 |    NULL |  950.00 |
| FORD   | 3000.00 |    NULL | 3000.00 |
| MILLER | 1300.00 |    NULL | 1300.00 |
+--------+---------+---------+---------+
13 rows in set (0.011 sec)
```

## Q8. Display those employees who are working in sales or research.
```sql
MariaDB [Archisha]> SELECT ENAME  FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO=D.DEPTNO
    -> WHERE DNAME IN ('SALES','RESEARCH') ;
+--------+
| ENAME  |
+--------+
| SMITH  |
| JONES  |
| CLARK  |
| KING   |
| ADAMS  |
| FORD   |
| ALLEN  |
| WARD   |
| MARTIN |
| BLAKE  |
| TURNER |
| JAMES  |
+--------+
12 rows in set (0.001 sec)
```

## Q9. Display the grade of JONES.
```sql
MariaDB [Archisha]> SELECT S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.ENAME = 'JONES';
+-------+
| GRADE |
+-------+
| D     |
+-------+
1 row in set (0.015 sec)
```

## Q10. Display the department name the number of characters of which is equal to number of employees in any other department.
```sql
MariaDB [Archisha]> SELECT D.DNAME
    -> FROM DEPARTMENT D
    -> WHERE LENGTH(D.DNAME) IN (
    -> SELECT COUNT(*)
    -> FROM EMPLOYEE
    -> GROUP BY DEPTNO);
Empty set (0.016 sec)
```

