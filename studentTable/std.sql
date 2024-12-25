 create table std (
  regno number,
  name varchar2(20),
  course varchar2(10),
  sem number ,
  dob date
);
--insertion
Insert into std values (1,"Thor","BCA",3,"5-jan-2006");
Insert into std values (2,"Iron Man","BCA",3,"5-apr-2006");
Insert into std values (3,"Spider Man","BCA",3,"10-feb-2006");
Insert into std values (4,"Hulk","BCA",3,"16-nov-2006");

select * from std ;
--alter
alter table std 
add score varchar number(3);

alter table std 
modify(name varchar2(20) , sname varchar2(25));

alter table std 
drop column score ;

--update
update std
set name = "God of thunder : THOR"
where regno = 1

--Delete
delete from std
where name="Hulk";

--Drop
drop table std ;




