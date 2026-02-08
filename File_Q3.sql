MariaDB [Archisha]> SELECT ename, job, sal
    -> FROM employee
    -> WHERE deptno = 30
    -> ORDER BY sal DESC;
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

MariaDB [Archisha]> SELECT ENAME, JOB, DEPTNO
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE 'A___N';
+-------+----------+--------+
| ENAME | JOB      | DEPTNO |
+-------+----------+--------+
| ALLEN | SALESMAN |     30 |
+-------+----------+--------+
1 row in set (0.001 sec)

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE 'S%';
+-------+
| ENAME |
+-------+
| SMITH |
| SCOTT |
+-------+
2 rows in set (0.001 sec)

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE ENAME LIKE '%S';
+-------+
| ENAME |
+-------+
| JONES |
| ADAMS |
| JAMES |
+-------+
3 rows in set (0.001 sec)

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO IN (10, 20, 40)
    -> OR JOB IN ('CLERK', 'SALESMAN', 'ANALYST');
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

MariaDB [Archisha]> SELECT EMPNO, ENAME
    -> FROM EMPLOYEE
    -> WHERE COMM IS NOT NULL
    -> AND COMM > 0;
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7499 | ALLEN  |
|  7521 | WARD   |
|  7654 | MARTIN |
+-------+--------+
3 rows in set (0.012 sec)

MariaDB [Archisha]> SELECT EMPNO, (SAL + IFNULL(COMM, 0)) AS TOTAL_SALARY
    -> FROM EMPLOYEE;
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

MariaDB [Archisha]> SELECT EMPNO, SAL * 12 AS ANNUAL_SALARY
    -> FROM EMPLOYEE;
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

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL > 3000;
Empty set (0.001 sec)

MariaDB [Archisha]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB IN ('CLERK', 'SALESMAN', 'ANALYST')
    -> AND SAL > 3000;
Empty set (0.001 sec)

MariaDB [Archisha]> DESC employee;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| EMPNO    | int(11)       | NO   | PRI | NULL    |       |
| ENAME    | varchar(20)   | NO   |     | NULL    |       |
| JOB      | varchar(20)   | YES  |     | NULL    |       |
| MGR      | int(11)       | YES  |     | NULL    |       |
| HIREDATE | date          | YES  |     | NULL    |       |
| SAL      | decimal(10,0) | YES  |     | NULL    |       |
| COMM     | decimal(7,0)  | YES  |     | NULL    |       |
| DEPTNO   | int(11)       | YES  | MUL | NULL    |       |
+----------+---------------+------+-----+---------+-------+
8 rows in set (0.021 sec)

MariaDB [Archisha]> SELECT * FROM employee;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  300 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     20 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     40 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     20 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
14 rows in set (0.001 sec)