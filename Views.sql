/*Creating other schema objects 
Tables 
Views - Logically represents the subsets of the data from one or more tables
Advantages of the views:
1) To restrict the data 
2) To make complex queries easy
3) To present the different views of the same data
4) To provide data independence 

        Simple Views    |     Complex Views 
Tables:         One     |     One or more 
Functions:      No      |     Yes
Contain group:  No      |     Yes
DML Operation:  Yes     |     Not Always 

create table emo as select * from hr.employees


Sequence 
Index 
Synonym */

create table emp as
select * from hr.employees where department_id = 90;

select * from emp;

update emp set job_id = 'ST_Clerk' where employee_id =100

create view emp_ankush as select * from emp where job_id like '%VP%';
select * from emp_ankush;



drop table emp


create table emp as 
select * from hr.employees;

select * from emp

create view emp_50_stcl as 
select first_name ||' '|| last_name as Name, email, hire_date, job_id, salary, salary*12 as ann_sal
from emp
where department_id = 50
and job_id = 'ST_CLERK';

update emp_50_stcl
set name = 'Priyanka' 
where name = 'Irene Mikkilineni'

select * from emp_50_stcl;

create view emp_50_stcl_1 as 
select first_name, last_name, email, hire_date, job_id, salary, salary*12 as ann_sal
from emp
where department_id = 50
and job_id = 'ST_CLERK';

select * from emp

select * from emp_50_stcl_1

update emp_50_stcl_1 set first_name = 'Priyanka' 
where last_name = 'Nayer';



select * from emp_50_stcl
select first_name ||' '|| last_name as Name, email, hire_date, job_id, salary, salary*12 as ann_sal
from emp
where department_id = 50
and job_id = 'ST_CLERK';


create or replace view emp_50_stcl as 
select first_name ||' '|| last_name as Name, email, hire_date, job_id, salary, salary*12 as ann_sal
from emp
where department_id = 50
and job_id in ('ST_CLERK', 'ST_MAN');

select * from user_views


select * from emp_50_stcl

create or replace view  emp_50_stcl as
select first_name ||' '|| last_name as Name, email, hire_date, job_id, salary, salary*12 as ann_sal 
from emp 
where department_id in ( 50,60) 
and job_id in ('ST_CLERK', 'ST_MAN');




create or replace view  emp_50_stcl as
select first_name ||' '|| last_name as Name, email, hire_date, job_id, salary, salary*12 as ann_sal 
from emp 
where department_id in ( 50,60) 
and job_id in ('ST_CLERK', 'ST_MAN');


create or replace view emp_50_stcl_1 as 
select first_name, last_name, email, hire_date, job_id, salary, salary*12 as ann_sal
from emp
where department_id = 50
and job_id = 'ST_CLERK'
with read only;


update emp_50_stcl_1
set first_name = 'A'
where last_name='Nayer';

select * from emp_50_stcl_1


create or replace view vps as 
select employee_id, department_id, first_name, job_id  from emp
where job_id like '%VP%'
with check option;

select * from vps

select * from emp
update vps 
set job_id = 'ST_VP' 
where employee_id = 101;


create or replace view dept_sal_vw
as 
select d.department_name, sum(e.salary) as sum_sal, min(e.salary) as min_sal,
max(e.salary) as max_sal, avg(e.salary) as avg_sal
from hr.employees e 
inner join 
hr.departments d 
on e.department_id = d.department_id
group by d.department_name;

select * from dept_sal_vw;


create or replace view dept_sal_vw (name_dept, sum_sal, min_sal,max_sal, avg_sal)
as 
select d.department_name, sum(e.salary) , min(e.salary) ,
max(e.salary) , avg(e.salary) 
from hr.employees e 
inner join 
hr.departments d 
on e.department_id = d.department_id
group by d.department_name;

select * from dept_sal_vw

drop view VPS

select * from user_views

