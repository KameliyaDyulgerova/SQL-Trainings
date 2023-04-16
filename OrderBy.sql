select last_name, salary, department_id 
from hr.employees 
where salary in (select min(salary) from hr.employees group by department_id)
order by salary;


select min(salary) from hr.employees group by department_id order by min(salary);
/*2100
2500
4200
4400
6000
6100
6500
6900
7000
8300
10000
17000*/
--<Any means less than the maximum, >Any means more than the maximum, =Any means equivalent to in
select last_name, salary, department_id 
from hr.employees 
where salary < any (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary < 9000
and job_id<>'IT_PROG'
and department_id in (90,60,50)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary > any (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary > 4200
and job_id<>'IT_PROG'
and department_id in (90,60,50)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary = any (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50,40,20,10,30,70,80,100,110)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary in (9000,
6000,
4800,
4800,
4200)
and job_id<>'IT_PROG'
and department_id in (90,60,50,40,20,10,30,70,80,100,110)
order by salary;


select last_name, salary, department_id 
from hr.employees 
where salary > 4200
and job_id<>'IT_PROG'
and department_id in (90,60,50)
order by salary;


--<All means less than the minimum, >All means more than the maximum

select last_name, salary, department_id 
from hr.employees 
where salary > all (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50,40,20,10,30,70,80,100,110)
order by salary;

select last_name, salary, department_id 
from hr.employees 
where not salary <  all  (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50,40,20,10,30,70,80,100,110)
order by salary;

select last_name, salary, department_id 
from hr.employees 
where not salary >  all  (select salary from hr.employees where job_id='IT_PROG')
and job_id<>'IT_PROG'
and department_id in (90,60,50,40,20,10,30,70,80,100,110)
order by salary;









