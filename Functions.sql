/*
Types of functions 
Single row functions - One input and one output 
Multiple row functions - Multiple input and one output

Single row function - 
Character - It accept character as an input and returns both character or number values 
Number - It accept numeric and gives output also as numeric
Date - Operates on Date datatype 
Conversion - Covert one type of DataType to other 
General - NVL, NVL2, NULLIF, COALESCE, CASE, DECODE

Feature of single row function:
1) Helping me to manipulate the data items 
2) Returns one value 
3) Act on each row which we are passing 
4) Returns one result per row 
5) Modify the datatype as well
6) Can be nested

Character functions 
    1) Case manipulation 
        a) Lower
        b) Upper 
        c) INITCAP
    2) Character manipulation 
        a) Concat
        b) substr
        c) length
        d) instr
        e) Lpad | Rpad
        f) Trim 
        g) Replace 

*/


select LOWER(first_name) from hr.employees;
select upper(first_name) from hr.employees;
select first_name || ' ' || Last_name from hr.employees;

select initcap(first_name || ' how are you ' || Last_name) from hr.employees;


select * from hr.employees
where first_name = initcap('steven');


--Character manipulation 

select employee_id, first_name, last_name, concat(first_name, last_name) name , job_id, length(last_name), 
instr(last_name, 'a') "contains a"
from hr.employees 
where substr(last_name, -1) = 'n';

select substr('Helloworld',-6,-2) from dual;

select 'Helloworld' from dual;

select replace('Jack and Jue', 'J', 'Bl') from dual

select replace(first_name, 'El', 'Bl') from hr.employees;

select trim('H' from 'Helloworld') from dual;

select trim('S' from first_name) from hr.employees;


select lpad('Helloworld',12 , '+') from dual;

select rpad('Helloworld',12 , '+') from dual;

/*--Number functions 
Trunc
Round
Mod
*/

select round(47.3245,2), round(47.3245,0), round(47.3245,-1), round(44.3245,-1) from dual;


select trunc(47.3245,2), trunc(47.3245,0), trunc(47.3245), trunc(47.3245,-1), trunc(44.3245,-1) from dual;

select last_name, salary, mod(salary, 5000)
from hr.employees
where job_id = 'SA_REP'

/*Data functions
months_between 
add_months
next_day
last_day
round
trunc*/


select months_between('01-sep-95', '11-jan-94') from dual;
select * from hr.employees;

select sysdate from dual;


select first_name, (sysdate-hire_date)/7 as weeks from hr.employees;


select first_name, hire_date, job_id, add_months(hire_date ,6) from hr.employees;

select first_name, hire_date, job_id, add_months(hire_date ,6), next_day(hire_date, 'tuesday'), 
last_day(hire_date)
from hr.employees;


select 
employee_id , 
hire_date, 
months_between(sysdate,hire_date) Tenure, 
add_months(hire_date, 6) Review,
next_day(hire_date,'Friday'), 
last_day(hire_date)
from hr.employees 
where months_between (sysdate, hire_date) < 240;



select hire_date, round(hire_date, 'month') from hr.employees;

select hire_date, round(hire_date, 'year') from hr.employees;

select hire_date, trunc(hire_date, 'year') from hr.employees;

select hire_date, trunc(hire_date, 'month') from hr.employees;

