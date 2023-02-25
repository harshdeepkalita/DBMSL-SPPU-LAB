mysql> select *from Students;
+------+----------+----------+------+---------+
| s_id | Drive_id | sname | CGPA | sbranch |
+------+----------+----------+------+---------+
| 1 | 102 | Rounak | 8 | CE |
| 2 | 107 | Chinmay | 9 | IT |
| 3 | 101 | Atharva | 7 | ENTC |
| 4 | 102 | Soham | 9 | CE |
| 5 | 107 | Payal | 8 | IT |
| 6 | 101 | Pawar | 6 | ENTC |
| 7 | 103 | Shreya | 9 | ENTC |
| 8 | 105 | Pragya | 7 | IT |
| 9 | 101 | Diksha | 8 | CE |
| 10 | 104 | Shreyal | 8 | CE |
| 11 | 105 | Prashant | 9 | ENTC |
| 12 | 101 | Digvijay | 8 | CE |
+------+----------+----------+------+---------+
12 rows in set (0.01 sec)
mysql> select *from PlacementDrive;
+----------+--------------+---------+----------+
| Drive_id | Company_Name | Package | Location |
+----------+--------------+---------+----------+
| 101 | Mercedes | 200000 | Delhi |
| 102 | Audi | 1000000 | Nagpur |
| 103 | BMW | 250000 | Pune |
| 104 | Google | 100000 | Delhi |
| 105 | Veritas | 250000 | Pune |
| 106 | TATA | 200000 | Mumbai |
| 107 | Apple | 300000 | Nagpur |
+----------+--------------+---------+----------+
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
| 6 | TATA | 52900 | 2019 |
| 7 | Apple | 79350 | 2019 |
+------+--------------+-------+-------+
8 rows in set (0.00 sec)
mysql> select * from Students Natural Join PlacementDrive;
+----------+------+----------+------+---------+--------------+---------+----------+
| Drive_id | s_id | sname | CGPA | sbranch | Company_Name | Package | Location |
+----------+------+----------+------+---------+--------------+---------+----------+
| 102 | 1 | Rounak | 8 | CE | Audi | 1000000 | Nagpur |
| 107 | 2 | Chinmay | 9 | IT | Apple | 300000 | Nagpur |
| 101 | 3 | Atharva | 7 | ENTC | Mercedes | 200000 | Delhi |
| 102 | 4 | Soham | 9 | CE | Audi | 1000000 | Nagpur |
| 107 | 5 | Payal | 8 | IT | Apple | 300000 | Nagpur |
| 101 | 6 | Pawar | 6 | ENTC | Mercedes | 200000 | Delhi |
| 103 | 7 | Shreya | 9 | ENTC | BMW | 250000 | Pune |
| 105 | 8 | Pragya | 7 | IT | Veritas | 250000 | Pune |
| 101 | 9 | Diksha | 8 | CE | Mercedes | 200000 | Delhi |

| 104 | 10 | Shreyal | 8 | CE | Google | 100000 | Delhi |
| 105 | 11 | Prashant | 9 | ENTC | Veritas | 250000 | Pune |
| 101 | 12 | Digvijay | 8 | CE | Mercedes | 200000 | Delhi |
+----------+------+----------+------+---------+--------------+---------+----------+
12 rows in set (0.00 sec)
mysql> select
Students.s_id,Students.Drive_id,Students.sname,Students.CGPA,Students.sbranch,PlacementDrive.Company_Name
from Students JOIN PlacementDrive ON Students.Drive_ID = PlacementDrive.Drive_ID;
+------+----------+----------+------+---------+--------------+
| s_id | Drive_id | sname | CGPA | sbranch | Company_Name |
+------+----------+----------+------+---------+--------------+
| 1 | 102 | Rounak | 8 | CE | Audi |
| 2 | 107 | Chinmay | 9 | IT | Apple |
| 3 | 101 | Atharva | 7 | ENTC | Mercedes |
| 4 | 102 | Soham | 9 | CE | Audi |
| 5 | 107 | Payal | 8 | IT | Apple |
| 6 | 101 | Pawar | 6 | ENTC | Mercedes |
| 7 | 103 | Shreya | 9 | ENTC | BMW |
| 8 | 105 | Pragya | 7 | IT | Veritas |
| 9 | 101 | Diksha | 8 | CE | Mercedes |
| 10 | 104 | Shreyal | 8 | CE | Google |
| 11 | 105 | Prashant | 9 | ENTC | Veritas |
| 12 | 101 | Digvijay | 8 | CE | Mercedes |
+------+----------+----------+------+---------+--------------+
12 rows in set (0.00 sec)
mysql> select Students.sname,Students.sbranch from Students JOIN PlacementDrive ON Students.Drive_ID =
PlacementDrive.Drive_ID WHERE Package>500000;
+--------+---------+
| sname | sbranch |
+--------+---------+
| Rounak | CE |
| Soham | CE |
+--------+---------+
2 rows in set (0.00 sec)

mysql> select Students.sname,training.Tcompanyname from Students JOIN training ON Students.s_id =
training.T_id where Tfee > 20000;
+---------+--------------+
| sname | Tcompanyname |
+---------+--------------+
| Rounak | Mercedes |
| Chinmay | Audi |
| Soham | Google |
| Payal | Veritas |
| Pawar | TATA |
| Shreya | Apple |
+---------+--------------+
6 rows in set (0.00 sec)
mysql> select training.T_id,training.Tcompanyname,training.Tfee,training.Tyear from Students JOIN training ON
Students.s_id = training.T_id where sname = 'Shantanu' and Tyear = 2011;
Empty set (0.00 sec)
mysql> select COUNT(*) FROM training where Tyear < 2015;
+----------+

| COUNT(*) |
+----------+
| 0 |
+----------+
1 row in set (0.00 sec)
mysql> select Students.sname from Students JOIN PlacementDrive ON Students.Drive_ID =
PlacementDrive.Drive_ID where Company_Name='Google' AND
Location = 'Delhi';
+---------+
| sname |
+---------+
| Shreyal |
+---------+
1 row in set (0.00 sec)
mysql> select Students.sname from Students JOIN PlacementDrive ON Students.Drive_ID =
PlacementDrive.Drive_ID where Company_Name='Microsoft' AND Location = 'Thane';
Empty set (0.00 sec)
mysql> select Students.sname from Students JOIN training ON Students.s_id = training.T_id where
Tcompanyname = 'Apple' AND Tyear = 2019;
+--------+
| sname |
+--------+
| Shreya |
+--------+
1 row in set (0.00 sec)
mysql> select Students.sname from Students JOIN training ON Students.s_id = training.T_id where
Tcompanyname = 'Microsoft' AND Tyear = 2015;
Empty set (0.00 sec)
mysql> CREATE VIEW yourviews AS (Select * from Students join training ON Students.s_id = training.T_id);
Query OK, 0 rows affected (0.03 sec)
mysql> select * FROM yourviews;
+------+----------+---------+------+---------+------+--------------+-------+-------+
| s_id | Drive_id | sname | CGPA | sbranch | T_id | Tcompanyname | Tfee | Tyear |
+------+----------+---------+------+---------+------+--------------+-------+-------+
| 1 | 102 | Rounak | 8 | CE | 1 | Mercedes | 46000 | 2023 |
| 2 | 107 | Chinmay | 9 | IT | 2 | Audi | 34500 | 2023 |
| 3 | 101 | Atharva | 7 | ENTC | 3 | BMW | 4600 | 2024 |
| 4 | 102 | Soham | 9 | CE | 4 | Google | 40250 | 2023 |
| 5 | 107 | Payal | 8 | IT | 5 | Veritas | 46000 | 2024 |
| 5 | 107 | Payal | 8 | IT | 5 | Wipro | 6900 | 2024 |
| 6 | 101 | Pawar | 6 | ENTC | 6 | TATA | 52900 | 2019 |
| 7 | 103 | Shreya | 9 | ENTC | 7 | Apple | 79350 | 2019 |
+------+----------+---------+------+---------+------+--------------+-------+-------+
8 rows in set (0.00 sec)
