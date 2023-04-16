/*Set operators 
Union - Duplicate will not be considered 
Union all - Duplicates will be considered

Guidelines for Union: 
1) No of columns should be the same and datatypes as well
2) The names of the column need not be identical 
3) Union operates overall of the columns being selected 
4) Null values are ignored during duplicate checking 
5) Default output is sorted in ascending order of the first column of the select clause 

Guidelines for Union all:
1) Unlike Union, duplicate rows are not eliminated and the output is not sorted by default
2) The distinct keyword cannot be used 
*/

select * from hr.employees;
select * from hr.job_history;

select employee_id, job_id , department_id
from hr.employees 
union 
select employee_id, job_id, department_id 
from hr.job_history;



create table abc (
id int , 
name varchar2(10));

drop table xyz
create table xyz (
sid int , 
name varchar2(10));


insert into abc values (1,'A');
insert into abc values (2,'B');
insert into abc values (3,'C');
insert into abc values (4,'D');
insert into abc values (5,'E');
insert into abc values (1,NULL);


insert into xyz values (1,'A');
insert into xyz values (6,'F');
insert into xyz values (7,'G');
insert into xyz values (2,'B');
insert into xyz values (3,'B');
insert into xyz values (1,NULL);


select distinct  id, name from abc 
union 
select distinct sid, name from xyz;

select distinct id, name from abc 
union all
select distinct sid, name from xyz;


/* Intersect - Returns all the rows that are common in the multiple tables

Guidelines for Intersect: 
1) No of columns should be the same and datatypes as well
2) The names of the column need not be identical 
3) Reversing the order of the intersected tables does not alter the result 
4) Intersect does not ignore the NULL values 

select tab1
intersect
select tab2

select tab2
intersect
select tab1
*/

select * from abc
intersect
select * from xyz;

select employee_id , job_id 
from hr.job_history
intersect 
select employee_id, job_id 
from hr.employees;

select * from xyz
intersect
select * from abc;


/*Minus - Minus operator to return rows returned by the first query that are not present in the 2nd query
Guidelines for Minus: 
1) No of columns should be the same and datatypes as well
2) The names of the column need not be identical */

select * from abc 
minus 
select * from xyz;

select * from xyz 
minus 
select * from abc;


select department_id, location, hire_date from 
hr.employees 
union 
select department_id, location_id, hire_date from 
hr.departments;


select department_id, to_number(null) location, hire_date from hr.employees
union 
select department_id, location_id, to_date(null) hire_date from hr.departments;



select employee_id, job_id, salary from hr.employees 
union
select employee_id, job_id, 0 from hr.job_history;



select employee_id, department_id from hr.employees 
union 
select manager_id, department_id from hr.departments 
order by employee_id
