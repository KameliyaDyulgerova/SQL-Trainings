/*Data Manipulation 

Insert*/

create table abc (
id int, 
name varchar2(10),
hire_date date);

insert into abc values (1, 'A', NULL)

select * from abc;

insert into abc (id, name) values (1,'A')


insert into abc values (1,'B', to_date('31-07-20', 'DD-MM-RR'))

insert into abc values (1,'A', to_date('Feb 3, 1999', 'Mon DD, YYYY'))


create table emp as select * from hr.employees where 1<>1;
select * from emp;

insert into emp select * from hr.employees where department_id = 10;

select * from emp;

select * from hr.employees where department_id =10;



create table emp1 as select * from hr.employees where department_id = 10

select * from emp1;



insert into (select employee_id, last_name, email, hire_date, job_id, salary, department_id
from emp where department_id = 50)
values (9999, 'Taylor', 'Dtaylor', to_date('07-jun-99', 'dd-mon-rr'), 'st_clerk', 5000,50);


insert into (select employee_id, last_name, email, hire_date, job_id, salary, department_id
from emp where department_id = 50)
values (NULL, 'Taylor', 'DT', to_date('07-jun-99', 'dd-mon-rr'), 'st_clerk', 5000,50);


select * from emp



/*Update*/
drop table emp 
create table emp as select * from hr.employees;

select * from emp;

update emp 
set department_id = 80;


update emp 
set job_id = (select job_id from emp where employee_id = 205), 
salary = (select salary from emp where employee_id = 205)
where employee_id =110;

select * from emp where employee_id in (205, 110)
rollback



create table emp_copy as select * from emp

select * from emp_copy;
select * from emp;

update emp_copy 
set job_id = 'ST_Clerk',
salary = 0
where employee_id = 101;


update emp_copy 
set  job_id = (select job_id from emp where employee_id = 101), 
salary = (select salary from emp where employee_id = 101)
where employee_id = 101;


select * from emp_copy






select * from emp;

alter table emp 
add(department_name varchar2(25));

select * from hr.departments where department_id in (100,90);

--Homework
update emp 
set salary = (select emp.salary + rewards.pay_raise from rewards 
where employee_id = emp.employee_id
and payraise_date = (select max(payraise_date) from rewards where employee_id = emp.employee_id))
where emp.employee_id  in (select employee_id from rewards);



update emp e 
set department_name = (select department_name from hr.departments d
where e.department_id = d.department_id)


/*Delete */
delete from table where condition;

delete from emp where employee_id = 101

select * from emp where employee_id=101

delete from emp where employee_id in (102,103)

select * from emp;


delete from emp where department_id in (select department_id from hr.departments where department_name like 
'%inance%')

select * from emp where department_name = 'Finance';


delete from emp e 
where employee_id in (select employee_id from hr.job_history where employee_id = e.employee_id );



--Homework 
delete from emp_history JH 
where employee_id = 
      (select employee_id from hr.employees E 
       where jh.employee_id = e.employee_id 
       and start_Date = 
            (select min(start_date) from hr.job_history jh 
             where jh.employee_id = e.employee_id) 
             and 5> (select count(*) from hr.job_history jh 
                    where jh.employee_id = e.employee_id
                    group by employee_id 
                    having count(*) >=4));


Truncate table emp;

select * from emp;

delete from emp 
truncate table emp where employee_id =101

select * from emp