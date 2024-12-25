--Implementation of different types of Constraints
create table dept (
  deptno number(2) primary key ,
  dname varchar2(20),
  loc varchar2(15)
);

insert into dept values (10,"Accounting","India");
insert into dept values (20,"research","Japan");
insert into dept values (30,"sales","florida");
insert into dept values (40,"operation","scot land");

select * from dept ;

--employee table 

create table emp(
  empno number(1) primary key ,
  ename varchar2(20) not null ,
  job varchar(20)  not null ,
  mgr number(4) ,
  hiredate date,
  sal number(7,2) check (sal > 500),
  comm number(7,2),
  deptno number(2) references dept(deptno) 
  );
  
  insert into  emp values(1,"stive","president",null,"17-nov-2000",5000,null,10);
insert into  emp values(2,"smith","manager",1,"16-nov-2006",2850,null,30);
insert into  emp values(3,"hemswarth","analyst",2,"15-nov-2001",3000,null,20);
insert into  emp values(4,"ana de armas","clerk",3,"13-nov-2005",800,null,20);
insert into  emp values(5,"tony","salesman",4,"17-nov-1999",1250,1400,30);



select * from emp

--Implementation of different types of joins

-- inner join 
select emp.empno , emp.ename , dept.dname from emp 
inner join dept
on emp.deptno = dept.deptno

-- outer join
select ename , dname from emp 
full outer join dept 
on emp.deptno = dept.deptno ;

--left outer join 
select ename , dname from emp 
left outer join dept
on emp.deptno = dept.deptno ;

--right outer join
select ename , dname from emp 
right outer join dept
on emp.deptno = dept.deptno ;

--natural join

select * from emp 
natural join dept

--4 Implementation of (a) Group by and having clause (b) Order by clause

--Find the employee details in ascending of their name and descending order of their Salary 


SELECT * FROM  emp order by ename ;
SELECT * FROM  emp order by sal desc ;
SELECT * FROM  emp order by ename ,sal desc ;

--Count the numbers of Employee in each Department
select dname , count(*) from emp join dept
where emp.deptno = dept.deptno 
group by dname ;

  --Find the Department name having a number of Employees 

  SELECT dname , count(*) from emp join dept
   where emp.deptno = dept.deptno
   group by dname 
   having count(*) = (select MIN(count(*)) from emp group by deptno );
   

SELECT dname, COUNT(*)
FROM emp
JOIN dept where emp.deptno = dept.deptno
GROUP BY dname
HAVING COUNT(*) = (
    SELECT MIN(emp_count)
    FROM (
        SELECT COUNT(*) AS emp_count
        FROM emp
        GROUP BY deptno
    ) 
);


--Implementation views 

create view dvsemployee as
select * from emp 
where ename = "tony" ;

select * from dvsemployee

