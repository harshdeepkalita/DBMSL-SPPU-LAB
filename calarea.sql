-- area
create table area (radius int , area int);
delimiter //
create procedure calarea(in rad int)
begin
declare ar int;
select area into ar from area where radius = rad;
if rad <= 9  and rad >=5 then
set ar = 3.14*rad*rad;
insert into area values(rad,ar);
else 
signal sqlstate '45000' set message_text = 'fuck u';
end if;
end//

call calarea(70);
select * from area;