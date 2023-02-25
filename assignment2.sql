student@student-OptiPlex-3020:~$ mysql -h 10.10.10.216 -u t31232 -p
Enter password:
Welcome to the MySQL monitor. Commands end with ; or \g.
Your MySQL connection id is 535
Server version: 5.5.43-MariaDB MariaDB Server
Copyright (c) 2000, 2022, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
mysql> show databases;
+--------------------+
| Database |
+--------------------+
| information_schema |
| t31232db |
+--------------------+
2 rows in set (0.00 sec)


mysql> use t31232db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed


mysql> show tables;
+--------------------+
| Tables_in_t31232db |
+--------------------+
| employee |
| payment |
| placementdrive |
| student |
+--------------------+
4 rows in set (0.00 sec)


mysql> select *from student;
+------+----------+---------+------+---------+
| s_id | Drive_id | sname | CGPA | sbranch |
+------+----------+---------+------+---------+
| 7 | 103 | Max | 8 | IT |
| 8 | 103 | Harry | 10 | CE |
| 1 | 104 | Harsh | 9 | IT |
| 2 | 101 | Devand | 9 | CE |
| 3 | 101 | Dennice | 8 | ENTC |
| 6 | 102 | Roger | 8 | CE |
| 5 | 101 | James | 9 | ENTC |
| 4 | 102 | Flesia | 9 | IT |
+------+----------+---------+------+---------+
8 rows in set (0.00 sec)


mysql> select *from placementdrive;
+----------+--------------+---------+----------------+

| Drive_id | Company_Name | Package | Location |
+----------+--------------+---------+----------------+
| 101 | Mercedes | 200000 | Silicon Valley |
| 102 | Audi | 350000 | Bay Area |
| 103 | BMW | 4500000 | Pittsburgh |
| 104 | Google | 270000 | New Jersey |
| 105 | Veritas | 30000 | Pune |
| 107 | Wipro | 500000 | Pune |
| 108 | TATA | 800000 | Mumbai |
+----------+--------------+---------+----------------+
7 rows in set (0.00 sec)


mysql> DELETE from student WHERE Drive_id = 103;
Query OK, 2 rows affected (0.02 sec)


mysql> select *from placementdrive;
+----------+--------------+---------+----------------+
| Drive_id | Company_Name | Package | Location |
+----------+--------------+---------+----------------+
| 101 | Mercedes | 200000 | Silicon Valley |
| 102 | Audi | 350000 | Bay Area |
| 103 | BMW | 4500000 | Pittsburgh |
| 104 | Google | 270000 | New Jersey |
| 105 | Veritas | 30000 | Pune |
| 107 | Wipro | 500000 | Pune |
| 108 | TATA | 800000 | Mumbai |
+----------+--------------+---------+----------------+
7 rows in set (0.00 sec)


mysql> select *from placementdrive;
+----------+--------------+---------+----------------+
| Drive_id | Company_Name | Package | Location |
+----------+--------------+---------+----------------+
| 101 | Mercedes | 200000 | Silicon Valley |
| 102 | Audi | 350000 | Bay Area |
| 103 | BMW | 4500000 | Pittsburgh |
| 104 | Google | 270000 | New Jersey |
| 105 | Veritas | 30000 | Pune |
| 107 | Wipro | 500000 | Pune |
| 108 | TATA | 800000 | Mumbai |
+----------+--------------+---------+----------------+
7 rows in set (0.00 sec)



mysql> select *from student;
+------+----------+---------+------+---------+
| s_id | Drive_id | sname | CGPA | sbranch |
+------+----------+---------+------+---------+
| 1 | 104 | Harsh | 9 | IT |
| 2 | 101 | Devand | 9 | CE |
| 3 | 101 | Dennice | 8 | ENTC |
| 6 | 102 | Roger | 8 | CE |
| 5 | 101 | James | 9 | ENTC |

| 4 | 102 | Flesia | 9 | IT |
+------+----------+---------+------+---------+
6 rows in set (0.00 sec)



mysql> describe student;
+----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| s_id | int(11) | YES | | NULL | |
| Drive_id | int(11) | YES | MUL | NULL | |
| sname | varchar(30) | YES | | NULL | |
| CGPA | float | YES | | NULL | |
| sbranch | varchar(30) | YES | | NULL | |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)



mysql> describe placementdrive;
+--------------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Drive_id | int(11) | NO | PRI | 0 | |
| Company_Name | varchar(30) | YES | | NULL | |
| Package | int(11) | YES | | NULL | |
| Location | varchar(30) | YES | | NULL | |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)



mysql> select sname,sbranch from student WHERE (sbranch = 'CE' OR sbranch = 'IT') AND( sname
LIKE 'a%' OR sname LIKE 'd%');
+--------+---------+
| sname | sbranch |
+--------+---------+
| Devand | CE |
| Adam | IT |
| David | CE |
+--------+---------+
3 rows in set (0.00 sec)


mysql> select Company_name from placementdrive;
+--------------+
| Company_name |
+--------------+
| Mercedes |
| Audi |
| BMW |
| Google |
| Veritas |
| Wipro |
| TATA |
+--------------+
7 rows in set (0.00 sec)



mysql> select *from training;
+------+--------------+-------+-------+
| T_id | Tcompanyname | Tfee | Tyear |
+------+--------------+-------+-------+
| 1 | Mercedes | 46000 | 2023 |
| 2 | Audi | 34500 | 2023 |
| 3 | BMW | 4600 | 2024 |
| 4 | Google | 40250 | 2023 |
| 5 | Veritas | 46000 | 2024 |
| 5 | Wipro | 6900 | 2024 |
| 6 | TATA | 46000 | 2019 |
| 7 | Apple | 69000 | 2019 |
+------+--------------+-------+-------+
8 rows in set (0.00 sec)


mysql> update training set Tfee = Tfee*1.15 where Tyear = 2019;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2 Changed: 2 Warnings: 0



mysql> select *from training;
+------+--------------+-------+-------+
| T_id | Tcompanyname | Tfee | Tyear |
+------+--------------+-------+-------+
| 1 | Mercedes | 46000 | 2023 |
| 2 | Audi | 34500 | 2023 |
| 3 | BMW | 4600 | 2024 |
| 4 | Google | 40250 | 2023 |
| 5 | Veritas | 46000 | 2024 |
| 5 | Wipro | 6900 | 2024 |
| 6 | TATA | 52900 | 2019 |
| 7 | Apple | 79350 | 2019 |
+------+--------------+-------+-------+
8 rows in set (0.00 sec)



mysql> select Company_Name from placementdrive where Location = 'Pune' OR Company_Name =
'Mumbai';
+--------------+
| Company_Name |
+--------------+
| Veritas |
| Wipro |
+--------------+
2 rows in set (0.00 sec)



mysql> select AVG(package) from placementdrive;
+--------------+
| AVG(package) |
+--------------+
| 950000.0000 |
+--------------+
1 row in set (0.00 sec)



mysql> select * from training ORDER BY Tfee desc;
+------+--------------+-------+-------+
| T_id | Tcompanyname | Tfee | Tyear |
+------+--------------+-------+-------+
| 7 | Apple | 79350 | 2019 |
| 6 | TATA | 52900 | 2019 |
| 1 | Mercedes | 46000 | 2023 |
| 5 | Veritas | 46000 | 2024 |
| 4 | Google | 40250 | 2023 |
| 2 | Audi | 34500 | 2023 |
| 5 | Wipro | 6900 | 2024 |
| 3 | BMW | 4600 | 2024 |
+------+--------------+-------+-------+
8 rows in set (0.00 sec)



mysql> select MAX(CGPA),sname from student;
+-----------+-------+
| MAX(CGPA) | sname |
+-----------+-------+
| 9 | Harsh |
+-----------+-------+
1 row in set (0.00 sec)



mysql> select sname from student where CGPA between 7 and 9;
+---------+
| sname |
+---------+
| Harsh |
| Devand |
| Dennice |
| Roger |
| James |
| Flesia |
| Adam |
| David |
+---------+
8 rows in set (0.00 sec)



mysql> select sname, Drive_id from student;

+---------+----------+
| sname | Drive_id |
+---------+----------+
| Harsh | 104 |
| Devand | 101 |
| Dennice | 101 |
| Roger | 102 |
| James | 101 |
| Flesia | 102 |
| Adam | 101 |
| David | 102 |
+---------+----------+
8 rows in set (0.00 sec)



mysql> select p.Company_Name,S.sname,p.location,p.package from placementdrive as p left join
student as S on S.Drive_id = p.Drive_id Where package = 30000 or package = 40000 or package =
50000;
+--------------+-------+----------+---------+
| Company_Name | sname | location | package |
+--------------+-------+----------+---------+
| Veritas | NULL | Pune | 30000 |
+--------------+-------+----------+---------+
1 row in set (0.00 sec)



mysql> DELETE from placementdrive where package<500000;
Query OK, 4 rows affected (0.02 sec)



mysql> select *from placementdrive;
+----------+--------------+---------+------------+
| Drive_id | Company_Name | Package | Location |
+----------+--------------+---------+------------+
| 103 | BMW | 4500000 | Pittsburgh |
| 107 | Wipro | 500000 | Pune |
| 108 | TATA | 800000 | Mumbai |
+----------+--------------+---------+------------+
3 rows in set (0.00 sec)
