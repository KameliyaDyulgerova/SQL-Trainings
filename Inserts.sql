select * from hr.employees e
inner join 
hr.departments d
on e.department_id = d.department_id;


create table abc 
(id number, 
name varchar2(10));

create table xyz 
(id number, 
location varchar2(10));



insert into abc values (1,'A');
insert into abc values (2,'B');
insert into abc values (3,'C');

insert into xyz values (1, 'N');
insert into xyz values (2, 'G');



select * from abc;

select * from xyz;

select * from abc 
inner join 
xyz 
on abc.id = xyz.id;



select * from abc 
left outer join xyz
on abc.id = xyz.id;



select * from abc 
right outer join xyz
on abc.id = xyz.id;


select * from abc;
select * from xyz;

select * from abc 
full outer join xyz
on abc.id = xyz.id;



select e.employee_id, e.last_name, e.department_id, d.location_id
from hr.employees e 
inner join hr.departments d
on e.department_id = d.department_id
where e.manager_id = 103;

select * from hr.departments ;

select e.employee_id, e.last_name, e.department_id, d.location_id
from hr.employees e 
inner join hr.departments d
on e.department_id = d.department_id
and e.manager_id = 103;

select d.location_id, e.employee_id, e.last_name, e.department_id
from hr.employees e 
inner join hr.departments d
on e.department_id = d.department_id
and e.manager_id = 103;


select d.*, e.* from hr.employees e
inner join 
hr.departments d
on e.department_id = d.department_id;



select e.*, d.*, l.* from hr.employees e 
inner join hr.departments d 
on e.department_id = d.department_id
inner join hr.locations l
on d.location_id = l.location_id



create table emp 
(id number, 
name varchar2(10), 
deptid number);



create table dept 
(deptid number, 
dname varchar2(10), 
locid number);


create table loc
(locid number, 
lname varchar2(10));




insert into emp values (1,'A',10);
insert into emp values (2,'B',10);
insert into emp values (3,'C',20);
insert into emp values (4,'D',30);
insert into emp values (5,'E',NULL);

select * from emp;

insert into dept values (10,'HR', 100);
insert into dept values (20,'IT', 100);
insert into dept values (30,'Mar', 100);
insert into dept values (40,'Fin', 200);

insert into loc values (100, 'N');
insert into loc values (200, 'G');


select e.*, d.*, l.* from 
emp e inner join 
dept d
on e.deptid = d.deptid
inner join 
loc l
on d.locid=l.locid


select e.*, d.*, l.* from 
emp e left outer join 
dept d
on e.deptid = d.deptid
inner join 
loc l
on d.locid=l.locid;


select * from loc;







