/*
Multi row functions 
Avg
Count 
Max 
Min 
Stddev
Sum
Variance
*/

select * from hr.employees;

select avg(salary), max(salary), min(salary), sum(salary) from hr.employees;


select min(hire_date) , max(hire_date) from hr.employees;

select min(last_name) , max(last_name) from hr.employees;


select * from hr.employees;

select count(*) from hr.employees;

select * from hr.employees;

select count(commission_pct) from hr.employees;


create table pqr(id number, name varchar2(10))

insert into pqr values (1,'Rahul');
insert into pqr values (1,'Sneha');
insert into pqr values (2,'Rahul');

select * from pqr;

select count(*) from pqr;


select count(id) from pqr;

select count(distinct id, name) from pqr;

select * from pqr;


select id, name, count(*) from pqr 
group by id, name;

select id, name from pqr 
group by id, name;

select id  from pqr
group by name, id;


select * from pqr;

select id, name, count(*) from pqr 
having count(*)>1
group by id, name
;




select id, name, count(*) from pqr
having count(*)>1
group by name, id;


select sum(commission_pct), count(commission_pct), avg(commission_pct), 
avg(nvl(commission_pct),0), count(*) from hr.employees;

select sum(commission_pct), count(commission_pct), avg(commission_pct), 
avg(nvl(commission_pct,0)), count(*)  from hr.employees;



select * from hr.employees;

select job_id, avg(salary)
from hr.employees 
group by job_id
having job_id in ('AD_PRES','AD_VP','ST_CLERK')


select * from hr.employees
where job_id in ('AD_PRES','AD_VP','ST_CLERK');

select job_id, avg(salary)
from hr.employees 
group by job_id
having job_id in ('AD_PRES','AD_VP','ST_CLERK')
order by avg(salary) desc;

select * from hr.employees 
where job_id in ('AD_PRES','AD_VP','ST_CLERK');



select department_id, job_id , avg(salary)
from hr.employees 
group by department_id, job_id
having job_id in ('AD_PRES','AD_VP','ST_CLERK');

select sum(salary) from hr.employees;

select count(*) from hr.employees;


select department_id, max(salary)
from hr.employees 
group by department_id
having max(salary)>10000;


select job_id, sum(salary) payroll 
from hr.employees 
where job_id not like '%REP%'
group by 
job_id
having sum(salary) > 13000
order by sum(salary);




select job_id, sum(salary) payroll 
from hr.employees 
where job_id not like '%REP%'
group by 
job_id
having sum(salary) > 13000
order by sum(salary);


select job_id, sum(salary) payroll 
from hr.employees 
where sum(salary)>13000
group by 
job_id
--having sum(salary) > 13000
order by sum(salary);


select job_id, sum(salary) payroll 
from hr.employees 
where job_id  in ('AD_ASST')
group by 
job_id
--having sum(salary) > 13000
order by sum(salary);

select * from hr.employees where job_id = 'AD_ASST';


select job_id, avg(salary)
from hr.employees 
group by job_id
where job_id in ('AD_PRES','AD_VP','ST_CLERK');


select job_id, avg(salary)
from hr.employees 
where job_id in ('AD_PRES','AD_VP','ST_CLERK')
group by job_id;



select  max(avg(salary))
from hr.employees 
group by job_id


select max(avg(salary))
from hr.employees 
group by job_id, department_id
having department_id in (90,50)

