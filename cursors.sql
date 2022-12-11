-- cursor assignment
CREATE TABLE OldRollNumber(
    RollNumber INT UNIQUE NOT NULL,
    Name VARCHAR(50),
    Addr VARCHAR(50),
    PRIMARY KEY (RollNumber)
);

CREATE TABLE NewRollNumber(
    RollNumber INT UNIQUE NOT NULL,
    Name VARCHAR(50),
    Addr VARCHAR(50),
    PRIMARY KEY (RollNumber)
);

delimiter //
create procedure n1(in rno1 int)
begin
declare rno2 int;
declare exit_cond boolean ;

declare c1 cursor for select RollNumber from OldRollNumber WHERE RollNumber>rno1;
declare continue handler for not found set exit_cond = TRUE;
open c1;
l1 : loop
fetch c1 into rno2;
IF( NOT EXISTS(SELECT * FROM NewRollNumber WHERE RollNumber=rno2)) THEN
INSERT INTO NewRollNumber SELECT * FROM OldRollNumber WHERE RollNumber=rno2;
END IF;
if exit_cond then
close c1 ;
leave l1;
end if;
end loop l1;
end //

call n1(2);

select * from NewRollNumber;

