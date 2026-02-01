Microsoft Windows [Version 10.0.26100.7462]
(c) Microsoft Corporation. All rights reserved.

C:\Users\HP>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE movies;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE movies;
Database changed
MariaDB [movies]> CREATE TABLE Film(
    -> MovieID INT PRIMARY KEY,
    -> MovieName VARCHAR(100) NOT NULL,
    -> Category VARCHAR(20) NOT NULL,
    -> ReleaseDate DATE,
    -> ProductionCost DECIMAL(10,2) CHECK(ProductionCost>0),
    -> BusinessCost DECIMAL(10,2) DEFAULT 0)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 8
MariaDB [movies]> CREATE TABLE Film(
    ->  MovieID INT PRIMARY KEY,
    ->  MovieName VARCHAR(100) NOT NULL,
    -> Category VARCHAR(20) NOT NULL,
    ->  ReleaseDate DATE,
    -> ProductionCost DECIMAL(10,2) CHECK(ProductionCost>0),
    -> BusinessCost DECIMAL(10,2) DEFAULT 0);
Query OK, 0 rows affected (0.024 sec)

MariaDB [movies]> SHOW TABLES;
+------------------+
| Tables_in_movies |
+------------------+
| film             |
+------------------+
1 row in set (0.006 sec)

MariaDB [movies]> INSERT INTO Film
    -> VALUES
    -> (001, 'Hindi_Movie', 'Musical', '2018-04-23', 124500, 130000),
    -> (002, 'Tamil_Movie', 'Action', '2016-05-17', 112000, 118000),
    -> (003, 'English_Movie', 'Horror', '2017-08-06', 245000, 360000),
    -> (004, 'Bengali_Movie', 'Adventure', '2017-01-04', 72000, 100000),
    -> (005, 'Telugu_Movie', 'Action', '2019-03-10', 100000, DEFAULT),
    -> (006, 'Punjabi_Movie', 'Comedy', NULL, 30500, DEFAULT);
Query OK, 6 rows affected (0.019 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [movies]> SELECT * FROM Film;
+---------+---------------+-----------+-------------+----------------+--------------+
| MovieID | MovieName     | Category  | ReleaseDate | ProductionCost | BusinessCost |
+---------+---------------+-----------+-------------+----------------+--------------+
|       1 | Hindi_Movie   | Musical   | 2018-04-23  |      124500.00 |    130000.00 |
|       2 | Tamil_Movie   | Action    | 2016-05-17  |      112000.00 |    118000.00 |
|       3 | English_Movie | Horror    | 2017-08-06  |      245000.00 |    360000.00 |
|       4 | Bengali_Movie | Adventure | 2017-01-04  |       72000.00 |    100000.00 |
|       5 | Telugu_Movie  | Action    | 2019-03-10  |      100000.00 |         0.00 |
|       6 | Punjabi_Movie | Comedy    | NULL        |       30500.00 |         0.00 |
+---------+---------------+-----------+-------------+----------------+--------------+
6 rows in set (0.013 sec)

MariaDB [movies]> SELECT MovieID, MovieName, BusinessCost
    -> FROM Film;
+---------+---------------+--------------+
| MovieID | MovieName     | BusinessCost |
+---------+---------------+--------------+
|       1 | Hindi_Movie   |    130000.00 |
|       2 | Tamil_Movie   |    118000.00 |
|       3 | English_Movie |    360000.00 |
|       4 | Bengali_Movie |    100000.00 |
|       5 | Telugu_Movie  |         0.00 |
|       6 | Punjabi_Movie |         0.00 |
+---------+---------------+--------------+
6 rows in set (0.000 sec)

MariaDB [movies]> SELECT DISTINCT Category
    -> FROM Film;
+-----------+
| Category  |
+-----------+
| Musical   |
| Action    |
| Horror    |
| Adventure |
| Comedy    |
+-----------+
5 rows in set (0.012 sec)

MariaDB [movies]> SELECT MovieID, MovieName,
    ->        (BusinessCost - ProductionCost) AS NetProfit
    -> FROM Film;
+---------+---------------+------------+
| MovieID | MovieName     | NetProfit  |
+---------+---------------+------------+
|       1 | Hindi_Movie   |    5500.00 |
|       2 | Tamil_Movie   |    6000.00 |
|       3 | English_Movie |  115000.00 |
|       4 | Bengali_Movie |   28000.00 |
|       5 | Telugu_Movie  | -100000.00 |
|       6 | Punjabi_Movie |  -30500.00 |
+---------+---------------+------------+
6 rows in set (0.014 sec)

MariaDB [movies]> SELECT MovieID, MovieName, ProductionCost
    -> FROM Movie
    -> WHERE ProductionCost > 80000
    -> ;
ERROR 1146 (42S02): Table 'movies.movie' doesn't exist
MariaDB [movies]> SELECT MovieID, MovieName, ProductionCost
    -> FROM Film
    -> WHERE ProductionCost > 80000
    -> AND ProductionCost < 125000;
+---------+--------------+----------------+
| MovieID | MovieName    | ProductionCost |
+---------+--------------+----------------+
|       1 | Hindi_Movie  |      124500.00 |
|       2 | Tamil_Movie  |      112000.00 |
|       5 | Telugu_Movie |      100000.00 |
+---------+--------------+----------------+
3 rows in set (0.013 sec)

MariaDB [movies]> SELECT *
    -> FROM Film
    -> WHERE Category IN ('Comedy', 'Action');
+---------+---------------+----------+-------------+----------------+--------------+
| MovieID | MovieName     | Category | ReleaseDate | ProductionCost | BusinessCost |
+---------+---------------+----------+-------------+----------------+--------------+
|       2 | Tamil_Movie   | Action   | 2016-05-17  |      112000.00 |    118000.00 |
|       5 | Telugu_Movie  | Action   | 2019-03-10  |      100000.00 |         0.00 |
|       6 | Punjabi_Movie | Comedy   | NULL        |       30500.00 |         0.00 |
+---------+---------------+----------+-------------+----------------+--------------+
3 rows in set (0.011 sec)

MariaDB [movies]> SELECT *
    -> FROM Film
    -> WHERE ReleaseDate IS NULL;
+---------+---------------+----------+-------------+----------------+--------------+
| MovieID | MovieName     | Category | ReleaseDate | ProductionCost | BusinessCost |
+---------+---------------+----------+-------------+----------------+--------------+
|       6 | Punjabi_Movie | Comedy   | NULL        |       30500.00 |         0.00 |
+---------+---------------+----------+-------------+----------------+--------------+
1 row in set (0.001 sec)