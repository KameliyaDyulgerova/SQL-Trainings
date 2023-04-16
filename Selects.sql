select a.last_name, a.salary, a.department_id , b.salavg 
from hr.employees a join (select department_id, avg(salary) salavg
from hr.employees group by department_id) b --derived tables 
on a.department_id = b.department_id
and a.salary> b.salavg;

create table emp as sele thct * from hr.employees
insert into (select employee_id, last_name, email, hire_date, job_id, salary from emp where department_id=50
with check option)
values (9999, 'Smith', 'Jsmith', to_date('07-Jun-99','DD-MON-RR'), 'ST_CLERK', 5000);



insert into (select employee_id, last_name, email, hire_date, job_id, salary,department_id
from emp where department_id=50
with check option)
values (9999, 'Smith', 'Jsmith', to_date('07-Jun-99','DD-MON-RR'), 'ST_CLERK', 5000, 10);


insert into (select employee_id, last_name, email, hire_date, job_id, salary,department_id
from emp where department_id=50
with check option)
values (9999, 'Smith', 'Jsmith', to_date('07-Jun-99','DD-MON-RR'), 'ST_CLERK', 5000, 50);
create table emp1
(id int, 
name varchar2(10) default 'Guest',
email varchar2(10))


insert into emp1 (id, name, email) values (10, Default, 'rt')
insert into emp1 (id, name, email) values (20, 'Rahul', default)

select * from emp1;


update emp1
set name = Default 
where id = 20;



/*Types of multitable insert statements 
unconditional insert
conditional all insert
conditional first insert
pivoting insert*/
drop table employee
drop table manager
create table employee as select employee_id, hire_date, salary from hr.employees where 1=2;
create table manager as select employee_id, manager_id, salary from hr.employees where 1=2;


insert all
into employee values (employee_id, hire_date, salary) 
into manager values (employee_id, manager_id, salary)
select employee_id, hire_date, salary, manager_id 
from hr.employees 
where employee_id > 200;

delete from employee;
select * from employee;
delete from manager;
select * from manager;

insert all
when salary > 5000 then 
into employee values (employee_id, hire_date, salary)
when manager_id > 200 then 
into manager values (employee_id, manager_id, salary) 
select employee_id, hire_date, salary, manager_id
from hr.employees where employee_id>200

select * from employee
select * from manager



create table specl_sal  as select department_id, salary from hr.employees where 1=2;
create table hiredate_00  as select department_id, hire_date from hr.employees where 1=2;
create table hiredate_99  as select department_id, hire_date from hr.employees where 1=2;
create table hiredate_hist  as select department_id, hire_date from hr.employees where 1=2;

insert first 
when salary > 25000 then 
    into specl_sal values (department_id, salary)
when hire_date like ('%00%') then 
    into hiredate_00 values (department_id, hire_date)
when hire_date like ('%99%') then 
    into hiredate_99 values (department_id, hire_date)
else 
    into hiredate_hist values (department_id, hire_Date)
    select department_id, sum(salary) salary, max(hire_date) hire_date
    from hr.employees 
    group by department_id;
    
select * from specl_sal;

select * from hiredate_00
select * from hiredate_99

select * from hiredate_hist





create table sales_source_data 
(id int, 
week_id int, 
sales_mon int,
sales_tues int,
sales_wed int,
sales_thus int,
sales_fri int);

insert into sales_source_data values (20,1,5434,3322,2232,2222,3222);
insert into sales_source_data values (20,2,4333,2211,2212,3321,2212);

create table sales_info 
(id int, 
week_id int, 
sales int);

insert all
into sales_info values (id, week_id, sales_mon)
into sales_info values (id, week_id, sales_tues)
into sales_info values (id, week_id, sales_wed)
into sales_info values (id, week_id, sales_thus)
into sales_info values (id, week_id, sales_fri)
select id, week_id, sales_mon, sales_tues, sales_wed, sales_thus, sales_fri
from sales_source_data

select * from sales_source_data


--Merge

create table emp as select employee_id, email, first_name, department_id, salary from hr.employees where 1=2;
create table emp_hist as select employee_id, email, first_name, department_id, salary from hr.employees where 1=2;

delete from emp;
insert into emp values (1,'RT', 'Rahul', 10, 1000);
insert into emp values (2,'RM', 'Roshan', 20, 2000);
insert into emp values (3,'HC', 'Harshal', 30, 2000);
insert into emp values (4,'KA', 'Khushal', 10, 1500);
insert into emp values (5,'MD', 'Milind', 20, 2500);

insert into emp_hist values (1,'RT', 'Rahul', 20, 900);
insert into emp_hist values (2,'RM', 'Rahul', 10, 1000);
insert into emp_hist values (6,'PR', 'Priyanka', 30, 2000);
insert into emp_hist values (7,'AC', 'Astha', 20, 1500);
insert into emp_hist values (8,'AB', 'Ayushi', 40, 4000);
insert into emp_hist values (3,'HC', 'Harshal', 30, 2000);

select * from emp;

select * from emp_hist;

merge into emp e 
using emp_hist eh
on (e.employee_id = eh.employee_id)
when matched then 
update set 
e.first_name = eh.first_name,
e.department_id = eh.department_id, 
e.salary = eh.salary
when not matched then 
insert values (eh.employee_id, eh.email,  eh.first_name, eh.department_id, eh.salary);

select * from emp


select * from emp where employee_id=1;
select versions_starttime, versions_endtime, salary from emp
versions between scn minvalue and maxvalue
where employee_id=1;

select * from emp;
drop table emp;
select * from emp;
select original_name, operation, droptime from recyclebin;

flashback table emp to before drop;
select * from emp;



select e.employee_id, e.first_name as employee,e.manager_id, m.employee_id, m.First_name as manager
from hr.employees e 
inner join 
hr.employees m
on e.manager_id = m.employee_id
and e.department_id in (90,60);

select e.employee_id, e.first_name as Manager,e.manager_id, m.employee_id, 
m.First_name as Employee, e.department_id
from hr.employees e 
inner join 
hr.employees m
on e.employee_id = m.manager_id
and e.department_id in (90,60);


select e.employee_id, e.first_name as Manager,e.manager_id, m.employee_id, 
m.First_name as Employee, e.department_id
from hr.employees e 
inner join 
hr.employees m
on e.employee_id = m.manager_id
and e.department_id = m.department_id
and e.department_id in (90,60);


select e.employee_id, e.first_name as Manager,e.manager_id, m.employee_id, 
m.First_name as Employee, e.department_id
from hr.employees e 
inner join 
hr.employees m
on e.employee_id = m.manager_id
--and e.department_id = m.department_id
and e.department_id in (90,60)
and m.department_id in (90,60);


select employee_id, last_name, job_id, manager_id,salary
from hr.employees 
start with employee_id = 200
connect by prior manager_id = employee_id;
--and salary>5000

select last_name ||' reports to ' || 
prior last_name "Walk top down"
from hr.employees
start with last_name = 'King'
connect by prior employee_id = manager_id;

select last_name ||' reports to ' || 
prior last_name "Walk top down"
from hr.employees
start with employee_id  = (select employee_id from hr.employees where last_name = 'Kochhar')
connect by prior employee_id = manager_id;

select last_name ||' reports to ' || 
prior last_name "Walk top down", salary
from hr.employees
start with employee_id  = (select employee_id from hr.employees where last_name = 'Kochhar')
connect by prior employee_id = manager_id and salary>5000;

select * from hr.employees order by salary desc;

select department_id, count(*) from hr.employees group by department_id

select department_id, count(*) from hr.employees group by department_id order by 1;

create table employees as select * from hr.employees where department_id in (70,80,90,100,110);
select * from employees order by manager_id;

select last_name ||' reports to ' || 
prior last_name "Walk top down", salary
from employees
start with employee_id  = (select employee_id from employees where last_name = 'Kochhar')
connect by prior employee_id = manager_id and salary>=10000;


select lpad(last_name, length(last_name) + (level*2)-2, '-') as org_chart, level
from hr.employees 
start with first_name ='Steven' and last_name ='King'
connect by prior employee_id = manager_id;


select department_id, employee_id, last_name, job_id, salary
from employees 
where last_name !='Higgins'
start with manager_id is null
connect by prior employee_id=manager_id;


select department_id, employee_id, last_name, job_id, salary
from employees 
start with manager_id is null
connect by prior employee_id=manager_id
and last_name !='Higgins';

select * from employees



/*Hierarchical Queries 

*/

create table employees as select * from hr.employees where department_id in (70,80,90,100,110);

select * from employees;


select employee_id, last_name, job_id, manager_id, salary
from employees
start with employee_id = 100
--Specifies the root rows of the hierarchy (where to start) 
connect by prior employee_id = manager_id

select employee_id, last_name, job_id, manager_id, salary
from employees
start with employee_id = 179
--Specifies the root rows of the hierarchy (where to start) 
connect by prior manager_id = employee_id


--What if we have more managers 



select employee_id, last_name, job_id, manager_id, salary
from employees
start with employee_id = 100
--Specifies the root rows of the hierarchy (where to start) 
connect by prior employee_id = manager_id

select employee_id, last_name, job_id, manager_id, salary
from employees
start with employee_id = (select employee_id from employees where last_name ='Kochhar')
--Specifies the root rows of the hierarchy (where to start) 
connect by prior manager_id = employee_id;






select employee_id, last_name, job_id, manager_id, salary, level
from employees
where last_name != 'Higgins'
start with manager_id is null
--Specifies the root rows of the hierarchy (where to start) 
connect by prior employee_id = manager_id;


create table emp as select * from hr.employees;

create or replace view emp_vw as 
select first_name , last_name, email, salary , department_id
from emp where department_id = 80;

create materialized view mv_emp_vw as 
select first_name , last_name, email, salary , department_id
from emp where department_id = 80;

create materialized view mv_emp_vw_1 
refresh complete on Demand
as 
select first_name , last_name, email, salary , department_id
from emp where department_id = 80;

create materialized view mv_emp_vw_2
refresh complete on commit
as 
select department_id, sum(salary) from emp group by department_id;

select * from mv_emp_vw_2

update emp 
set salary = 0
where employee_id = 100
select * from emp


select * from mv_emp_vw_1;




select * from emp_vw;
select * from mv_emp_vw;

select * from emp where department_id = 80

update emp 
set first_name = 'John'
where employee_id = 145


exec dbms_mview.refresh('mv_emp_vw_1')



create materialized view  emp_mv as 
select * from emp

create  view  vw_emp as 
select * from emp



update vw_emp 
set salary = 0
where employee_id = 100;

select * from emp_mv

update emp_mv 
set salary = 0
where employee_id = 100;




create table xyz (
id int primary key,
name varchar2(10),
hire_date date);

insert into xyz values (1,'A',to_date('31-12-2019','DD-MM-RR'));
insert into xyz values (2,'B',to_date('31-01-2020','DD-MM-RR'));
insert into xyz values (3,'C',to_date('29-02-2020','DD-MM-RR'));
insert into xyz values (4,'D',to_date('31-03-2020','DD-MM-RR'));
insert into xyz values (5,'E',to_date('30-04-2020','DD-MM-RR'));

select * from xyz


create materialized view log on xyz with primary key;


create materialized view xyz_vw
refresh fast on demand
as select * from xyz;

select * from xyz;

update xyz 
set name = 'T' where id = 1;

insert into xyz values (6,'F',to_date('31-05-2020','DD-MM-RR'));

select * from xyz;

select * from xyz_vw;

exec dbms_mview.refresh('xyz_vw');

drop materialized view emp_mv_exp
create materialized view emp_mv_exp_mng
refresh complete on commit
enable query rewrite
as
 select manager_id , sum(salary) from hr.employees group by manager_id;




EXPLAIN PLAN for 
select manager_id , sum(salary) from hr.employees group by manager_id;

select plan_table_output from table(dbms_xplan.display('plan_table',null, 'basic'));

select employee_id, last_name, job_id, manager_id, salary
from employees
start with manager_id is null
--Specifies the root rows of the hierarchy (where to start) 
connect by prior employee_id = manager_id
and last_name != 'Higgins';







