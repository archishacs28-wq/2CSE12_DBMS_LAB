Microsoft Windows [Version 10.0.26100.7462]
(c) Microsoft Corporation. All rights reserved.

C:\Users\HP>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE Archisha;
Database changed
MariaDB [Archisha]> SELECT DISTINCT job
    -> FROM employee;
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

MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE DEPTNO = 30;
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

MariaDB [Archisha]> SELECT deptno, dname
    -> FROM department
    -> WHERE deptno > 20;
+--------+------------+
| deptno | dname      |
+--------+------------+
|     30 | SALES      |
|     40 | OPERATIONS |
+--------+------------+
2 rows in set (0.011 sec)

MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE deptno = 30
    -> AND job IN ('MANAGER', 'CLERK');
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.011 sec)

MariaDB [Archisha]> SELECT ename, empno, deptno
    -> FROM employee
    -> WHERE job = 'CLERK';
+--------+-------+--------+
| ename  | empno | deptno |
+--------+-------+--------+
| SMITH  |  7369 |     20 |
| ADAMS  |  7876 |     20 |
| JAMES  |  7900 |     30 |
| MILLER |  7934 |     10 |
+--------+-------+--------+
4 rows in set (0.001 sec)

MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE job = 'MANAGER'
    -> AND deptno <> 30;
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7782 | CLARK | MANAGER | 7839 | 1981-06-09 | 2450 | NULL |     20 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.013 sec)

MariaDB [Archisha]> SELECT *
    -> FROM employee
    -> WHERE deptno = 10
    -> AND job NOT IN ('MANAGER', 'CLERK');
Empty set (0.011 sec)

MariaDB [Archisha]> SELECT ename, job, sal
    -> FROM employee
    -> WHERE sal BETWEEN 1200 AND 1400;
+--------+----------+------+
| ename  | job      | sal  |
+--------+----------+------+
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| MILLER | CLERK    | 1300 |
+--------+----------+------+
3 rows in set (0.012 sec)

MariaDB [Archisha]> SELECT ename, deptno
    -> FROM employee
    -> WHERE job IN ('CLERK', 'ANALYST', 'SALESMAN');
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

MariaDB [Archisha]> SELECT ename, deptno
    -> FROM employee
    -> WHERE ename LIKE 'M%';
+--------+--------+
| ename  | deptno |
+--------+--------+
| MARTIN |     30 |
| MILLER |     10 |
+--------+--------+
2 rows in set (0.001 sec)