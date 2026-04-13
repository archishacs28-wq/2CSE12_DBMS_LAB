# EXPERIMENT-10

## Q1. Display the names of employees from department number 10 with salary greater than that of any employee working in other departments.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = 10
    -> AND SAL > ANY (
    -> SELECT SAL  FROM EMPLOYEE  WHERE DEPTNO <> 10 );
+--------+
| ENAME  |
+--------+
| MILLER |
+--------+
1 row in set (0.094 sec)
```

## Q2. Display the names of employees from department number 10 with salary greater than that of all employees working in other departments.
```sql
MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = 10
    -> AND SAL > ALL (
    -> SELECT SAL  FROM EMPLOYEE  WHERE DEPTNO <> 10 );
Empty set (0.002 sec)
```

## Q3. Display the details of employees who are in sales department and grade is C.
```sql
MariaDB [Archisha]> SELECT E.*
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
    -> JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE D.DNAME = 'SALES'
    -> AND S.GRADE = 'C';
+-------+--------+----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+----------+------+------------+------+------+--------+
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1650 |    0 |     30 |
+-------+--------+----------+------+------------+------+------+--------+
2 rows in set (0.029 sec)
```

## Q4. Display those who are not managers and those who manage anyone.
```sql

MMariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB <> 'MANAGER'
    -> AND EMPNO IN (SELECT MGR FROM EMPLOYEE WHERE MGR IS NOT NULL);
+-------+
| ENAME |
+-------+
| SCOTT |
| KING  |
| FORD  |
+-------+
3 rows in set (0.016 sec)
```

## Q5. Display those employees whose manager name is JONES.
```sql

MariaDB [Archisha]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M ON E.MGR = M.EMPNO
    -> WHERE M.ENAME = 'JONES';
+-------+
| ENAME |
+-------+
| SCOTT |
| FORD  |
+-------+
2 rows in set (0.011 sec)
```

## Q6. Display ename who are working in sales department.
```sql
MariaDB [Archisha]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO = D.DEPTNO
    -> WHERE D.DNAME = "SALES";
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| MARTIN |
| BLAKE  |
| TURNER |
| JAMES  |
+--------+
6 rows in set (0.001 sec)
```

## Q7. Display employee name, deptname, salary and comm for those salary between 2000 to 5000 while location is Chennai.
```sql

MariaDB [Archisha]> SELECT E.ENAME, D.DNAME, E.SAL, E.COMM
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
    -> WHERE E.SAL BETWEEN 2000 AND 5000
    -> AND D.LOCATION = 'CHENNAI';
+-------+------------+------+------+
| ENAME | DNAME      | SAL  | COMM |
+-------+------------+------+------+
| JONES | ACCOUNTING | 3600 | NULL |
| CLARK | ACCOUNTING | 2965 | NULL |
| FORD  | ACCOUNTING | 3630 | NULL |
+-------+------------+------+------+
3 rows in set (0.015 sec)
```

## Q8. Display those employees whose salary is greater than his manager salary.
```sql
MariaDB [Archisha]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M ON E.MGR = M.EMPNO
    -> WHERE E.SAL > M.SAL;
+-------+
| ENAME |
+-------+
| SCOTT |
| FORD  |
+-------+
2 rows in set (0.001 sec)
```

## Q9. Display those employees who are working in the same department where his manager is working.
```sql
MariaDB [Archisha]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M ON E.MGR = M.EMPNO
    -> WHERE E.DEPTNO = M.DEPTNO;
+--------+
| ENAME  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| CLARK  |
| TURNER |
| JAMES  |
| FORD   |
+--------+
9 rows in set (0.010 sec)
```

## Q10. Display grade and employee name for dept no 10 or 30 but grade is not D, while joined before 31-DEC-82.
```sql
MariaDB [Archisha]> SELECT E.ENAME, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.DEPTNO IN (10, 30)
    -> AND S.GRADE <> 'D'
    -> AND E.HIREDATE < '1982-12-31';
+--------+-------+
| ENAME  | GRADE |
+--------+-------+
| ALLEN  | C     |
| WARD   | B     |
| MARTIN | B     |
| BLAKE  | E     |
| TURNER | C     |
| JAMES  | A     |
| MILLER | C     |
+--------+-------+
7 rows in set (0.016 sec)
```

