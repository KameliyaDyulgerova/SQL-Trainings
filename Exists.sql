/*--Exists - Tests for the existence of rows in the results set of the subquery 
If a subquery row value is found: 
The search does not continue in the inner query
The condition is flagged as True 

If a subquery row value is not found 
The condition is flagged as False 
The search continues in the inner query
*/
select employee_id, last_name, job_id, department_id from hr.employees e 
where exists (select 1 from hr.employees where manager_id = e.employee_id)
order by employee_id;

select distinct manager_id from hr.employees;

select employee_id, last_name, job_id, department_id from hr.employees e 
where not exists (select 'x' from hr.employees where manager_id = e.employee_id)
order by employee_id;

select * from hr.employees where manager_id=104;


select employee_id, last_name, job_id, department_id from hr.employees e 
where exists (select 1 from hr.employees where manager_id = e.employee_id)
order by employee_id;

select employee_id, last_name, job_id, department_id from hr.employees e 
where employee_id in  (select manager_id from hr.employees);

select count(*) from (
select employee_id, last_name, job_id, department_id from hr.employees e 
where not exists (select 'x' from hr.employees where manager_id = e.employee_id)
order by employee_id);

select employee_id, last_name, job_id, department_id from hr.employees e 
where employee_id not in  (select manager_id from hr.employees);
/* NOT IN evaluates to false if any member of the set is a NULL value, therefore, 
your query will not return any rows even if there are rows in the employee table in 
this scenario that satisfy the where condition. */

select department_id,department_name
from hr.departments d 
where not exists 
(select * from hr.employees e 
where d.department_id = e.department_id);

select department_id,department_name
from hr.departments d 
where  exists 
(select * from hr.employees e 
where d.department_id = e.department_id)

select * from hr.employees where department_id = 10;

select department_id, count(*) from 
hr.employees where 
department_id in 
(
select department_id
from hr.departments d 
where not exists 
(select * from hr.employees e 
where d.department_id = e.department_id))
group by department_id;


select department_id, count(*) from 
hr.employees where 
department_id in 
(
select department_id
from hr.departments d 
where  exists 
(select * from hr.employees e 
where d.department_id = e.department_id))
group by department_id;



/*WITH clause/Statement
Using the with clause, you can use the same query block in a select statement when it occurs more that once 
within the query.

The with clause retrives the result of a query block and stores it in the users temporary tablespace. 

The with clause improves the performance 

Benefits: 
1) Easy to read
2) Evaluates the clause only once, even if it appears multiple times in the query
3) Improve the performance of the large queries

Example: Using the with clause , write a query to display the department name and total salaries of those 
whose total salary is greater than the average salary across the departments. 

1) Calculate the total salary for every department , and store the result using the with clause 
2) Calculate the average salary across the departments, and store the result using the with clause 
3) Compare the total salary calculated in the first step with the average salary which was calculated 
in the second step. If the total salary for a particular department is greater than the average salary acoss 
the departments, then display the department name and the total salary for that department. */

with dept_sals as (
select d.department_name, sum(e.salary) as dept_total
from hr.employees e inner join hr.departments d
on e.department_id = d.department_id
group by d.department_name),
avg_cost as (select sum(dept_total)/count(*) as dept_avg from dept_sals)
select * from dept_sals
where dept_total > (select dept_avg from avg_cost)
order by department_name;


with dept_sals as (
select d.department_name, sum(e.salary) as dept_total
from hr.employees e inner join hr.departments d
on e.department_id = d.department_id
group by d.department_name),
avg_cost as (select sum(salary)/count(distinct department_id) as dept_avg from hr.employees)
select * from dept_sals
where dept_total > (select dept_avg from avg_cost)
order by department_name;


create table pilot(
airline varchar2(10),
salary int)

insert into pilot values ('A',1000);
insert into pilot values ('B',500);
insert into pilot values ('C',2000);
insert into pilot values ('D',250);
insert into pilot values ('E',5000);

select * from pilot



with totalsalary(airline,total) as 
(select airline, sum(salary) from pilot group by airline),
airlineaverage(avasal) as 
(select avg(salary) from pilot)
select airline,total
from totalsalary , airlineaverage
where totalsalary.total > airlineaverage.avasal
