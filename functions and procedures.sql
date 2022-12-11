CREATE TABLE smarks(
	RollNo INT PRIMARY KEY,
    Sname VARCHAR(20),
    Total_Marks INT
    );

INSERT INTO smarks VALUES 
	(1, 'Vidyut', 995),
	(2, 'Pratap', 828),
	(3, 'Kailash', 945),
	(4, 'Mukund', 1500),
	(5, 'Girish', 900),
	(6, 'Neeraj', 850),
	(7, 'Prashant', 800),
	(8, 'Raj', 899),
	(9, 'Hari', 1300),
	(10, 'Aditya', 920);


CREATE TABLE resmarks(
	RollNo INT REFERENCES Stud_Marks(RollNo),
    Sname VARCHAR(20),
    Marks INT,
    Grade VARCHAR(20)
    );
    
delimiter //
create procedure grading(in roll int,in marks int)
begin
declare student varchar(20);
select sname into student from smarks where RollNo = roll and Total_Marks = marks;
if marks >= 990 AND marks <= 1500 THEN
insert into resmarks values(roll,student,marks,"distinction");
elseif marks >= 900 AND marks <= 989 THEN
INSERT INTO resmarks VALUES(roll, student, marks, "First Class");
elseif marks >= 825 AND marks <= 899 THEN
INSERT INTO resmarks VALUES(roll, student, marks, "Higher Second Class");
ELSE
INSERT INTO resmarks VALUES(roll, student, marks, NULL);
end if;
end //


delimiter //
create function grading(marks int)
returns varchar(20)
deterministic
begin
declare grade varchar(20);
if marks >= 990 AND marks <= 1500 THEN
set grade = "distinction";
elseif marks >= 900 AND marks <= 989 THEN
set grade = "first class";
elseif marks >= 825 AND marks <= 899 THEN
set grade = "higher second class";
ELSE
set grade = "null";
end if;
return (grade);
end //

select RollNo,Sname,Total_Marks,grading(Total_Marks) from smarks;