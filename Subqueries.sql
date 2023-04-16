--Sub queries 

select * from hr.employees;

select * from hr.employees where salary > (
select salary from hr.employees where first_name = 'Den');


select * from hr.employees where salary > (
select min(salary) from hr.employees group by department_id);


select * from hr.employees;
select first_name, email, phone_number, job_id from hr.employees 
where job_id = (
select job_id from hr.employees where employee_id = 141);



select * from hr.employees;

employee_id = 125
employee_id = 132

select first_name, job_id, salary
from hr.employees 
where job_id = (select job_id from hr.employees where employee_id = 125)
and salary > (select salary from hr.employees where employee_id = 132);

select * from hr.employees where salary = (
select min(salary) from hr.employees) ;



select department_id, min(salary) 
from hr.employees 
group by department_id 
having min(salary) > (select min(salary) from hr.employees where department_id = 50);

select department_id, min(salary) 
from hr.employees 
group by department_id 
having min(salary) > 2100;


select * from hr.employees where department_id = 50 order by salary asc;

--Find the job id with the lowest avg salary

select job_id, avg(salary) 
from hr.employees group by job_id 
having avg(salary) = (select  min(avg(salary)) from hr.employees group by job_id);

select  job_id, avg(salary) from hr.employees group by job_id

create table employee as select * from hr.employees where department_id in (60,90)



select * from employee;

select  min(avg(salary)) from employee group by job_id;



select employee_id, last_name
from hr.employees 
where salary = (select min(salary) from hr.employees group by department_id);

select * from hr.employees where department_id is null;


select * from hr.employees where department_id is (select department_id from hr.employees where employee_id =178)

select * from hr.employees where department_id = (select department_id from hr.employees where employee_id =178)
select * from hr.employees where department_id = (select department_id from hr.employees where first_name ='Rahul')



