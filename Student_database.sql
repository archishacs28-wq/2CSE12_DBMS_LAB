Microsoft Windows [Version 10.0.26100.7462]
(c) Microsoft Corporation. All rights reserved.

C:\Users\HP>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE iilm;
ERROR 1007 (HY000): Can't create database 'iilm'; database exists
MariaDB [(none)]> USE iilm;
Database changed
MariaDB [iilm]> CREATE TABLE Student(
    -> student_id INT PRIMARY KEY,
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL,
    -> email VARCHAR(100) UNIQUE,NOT NULL,
    -> dob DATE NOT NULL,
    -> course VARCHAR(50) NOT NULL,
    -> fees DECIMAL(8,2) CHECK(fees>0));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'NOT NULL,
dob DATE NOT NULL,
course VARCHAR(50) NOT NULL,
fees DECIMAL(8,2) C...' at line 5
MariaDB [iilm]> CREATE TABLE Student(
    -> student_id INT PRIMARY KEY,
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL,
    -> email VARCHAR(100) NOT NULL UNIQUE,
    -> dob DATE NOT NULL,
    -> course VARCHAR(50) NOT NULL,
    -> fees DECIMAL(8,2) CHECK(fees>0));
Query OK, 0 rows affected (0.055 sec)

MariaDB [iilm]> SHOW TABLES;
+----------------+
| Tables_in_iilm |
+----------------+
| student        |
+----------------+
1 row in set (0.016 sec)

MariaDB [iilm]> INSERT INTO Student
    -> (student_id, first_name, last_name, email, dob, course, fees)
    -> VALUES
    -> (1, 'Archisha', 'Sethi', 'archisha05@gmail.com', '2005-01-24', 'BTech', 92000),
    -> (2, 'Samiya', 'Whiting', 'samiyakelsangw@gmail.com'. '2005-06-14', 'BTech', 92000),
    -> (3, 'Nimesh', 'Rana', 'rananimesh@gmail.com', '2004-02-18', 'BBA', 89000),
    -> (4, 'Swati', 'Gupta', 'sgupta2611@gmail.com', '2005-11-21', 'BTech', 92000),
    -> (4, 'Ayaan', 'Akhtar', 'ayaanakhtar2006@gmail.com', '2006-03-07', 'BBA', 89000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '. '2005-06-14', 'BTech', 92000),
(3, 'Nimesh', 'Rana', 'rananimesh@gmail.com'...' at line 5
MariaDB [iilm]> INSERT INTO Student
    -> (student_id, first_name, last_name, email, dob, course, fees)
    -> VALUES
    -> (1, 'Archisha', 'Sethi', 'archisha05@gmail.com', '2005-01-24', 'BTech', 92000),
    -> (2, 'Samiya', 'Whiting', 'samiyakelsangw@gmail.com'. '2005-06-14', 'BTech', 92000),
    ->  (3, 'Nimesh', 'Rana', 'rananimesh@gmail.com', '2004-02-18', 'BBA', 89000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '. '2005-06-14', 'BTech', 92000),
 (3, 'Nimesh', 'Rana', 'rananimesh@gmail.com...' at line 5
MariaDB [iilm]> INSERT INTO Student
    -> (student_id, first_name, last_name, email, dob, course, fees)
    -> VALUES
    -> (1, 'Archisha', 'Sethi', 'archisha05@gmail.com', '2005-01-24', 'BTech', 92000),
    ->  (2, 'Samiya', 'Whiting', 'samiyakelsangw@gmail.com', '2005-06-14', 'BTech', 92000),
    -> (3, 'Nimesh', 'Rana', 'rananimesh@gmail.com', '2004-02-18', 'BBA', 89000),
    -> (4, 'Swati', 'Gupta', 'sgupta2611@gmail.com', '2005-11-21', 'BTech', 92000),
    -> (5, 'Ayaan', 'Akhtar', 'ayaanakhtar2006@gmail.com', '2006-03-07', 'BBA', 89000);
Query OK, 5 rows affected (0.057 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [iilm]> SELECT * FROM Student;
+------------+------------+-----------+---------------------------+------------+--------+----------+
| student_id | first_name | last_name | email                     | dob        | course | fees     |
+------------+------------+-----------+---------------------------+------------+--------+----------+
|          1 | Archisha   | Sethi     | archisha05@gmail.com      | 2005-01-24 | BTech  | 92000.00 |
|          2 | Samiya     | Whiting   | samiyakelsangw@gmail.com  | 2005-06-14 | BTech  | 92000.00 |
|          3 | Nimesh     | Rana      | rananimesh@gmail.com      | 2004-02-18 | BBA    | 89000.00 |
|          4 | Swati      | Gupta     | sgupta2611@gmail.com      | 2005-11-21 | BTech  | 92000.00 |
|          5 | Ayaan      | Akhtar    | ayaanakhtar2006@gmail.com | 2006-03-07 | BBA    | 89000.00 |
+------------+------------+-----------+---------------------------+------------+--------+----------+
5 rows in set (0.026 sec)

MariaDB [iilm]>