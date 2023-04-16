/*Nonpairwise comparison 
Pairwise comparison*/

select first_name, last_name, manager_id, department_id 
from hr.employees 
where manager_id in (select manager_id from hr.employees where first_name = 'Daniel')
and department_id in (select department_id from hr.employees where first_name = 'Daniel');

select first_name, last_name, manager_id, department_id 
from hr.employees 
where manager_id in (select manager_id from hr.employees where first_name = 'John')
and department_id in (select department_id from hr.employees where first_name = 'John');
select * from hr.employees where first_name ='John'

select * from hr.employees where first_name ='John';

/*Manager id
108
100
123

Dept id
100
80
50*/

select first_name, last_name, manager_id, department_id 
from hr.employees 
where manager_id in (108,123,100)
and department_id in (100,80,50);


select first_name, last_name, manager_id, department_id
from hr.employees 
where (manager_id, department_id) in 
(select manager_id, department_id from hr.employees where first_name = 'John')

/* Scalar subqueries expression - That return exactly one column value from one row, it can be used in 
condition and expression part of decode and case. 
All clauses of select except group by*/


select employee_id, last_name, department_id,
(case when department_id = (select department_id from hr.departments where location_id = 1800) then 'Canada'
else 'USA' end) location
from hr.employees
order by department_id;


select employee_id, last_name, department_id,
(case when department_id in (select department_id from hr.departments where location_id in( 1800,1700)) then 'Canada'
else 'USA' end) location
from hr.employees
order by department_id;

select * from hr.departments

select employee_id, last_name, department_id from hr.employees e 
where department_id in (110,10)
order by (select department_name from hr.departments d where department_id = e.department_id)

select department_name, e.department_id from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id
where e.department_id in (110,10)

select e.employee_id, e.last_name, e.department_id, d.department_name from hr.employees e 
inner join hr.departments d
on e.department_id =d.department_id
where e.department_id in (110,10)
order by (select department_name from hr.departments d where department_id = e.department_id);

/*Correlated subqueries

Nested subquery Execution
#1. The inner query executes first and finds a value 
#2. The outer query executes once, using the value/values from the inner query

Correlated subquery execution 
#1. Get a candidate row (Fetched by the outer query)
#2. Execute the inner query using the value of the candidate row
#3. Use the values resulting from the inner query to qualify or disqualify the candidate 
#4. Repeat until no candidate row remains 
*/

select * from hr.emplselect department_id, count(*) from (
select last_name, salary, department_id from hr.employees e
where department_id in (100,80)
and salary > (select avg(salary) from hr.employees where department_id = e.department_id)
) group by department_idoyees where department_id in (100,80)

select * from hr.employees e inner join 
hr.job_history j
on e.employee_id = j.employee_id

select e.employee_id, e.last_name, e.job_id
from hr.employees e 
where 2 <= (select count(*) from hr.job_history where employee_id = e.employee_id)
