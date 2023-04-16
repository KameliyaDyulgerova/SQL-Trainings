--Managing Objects 
--Alter
create table emp
(id int, 
name varchar2(20));

alter table emp 
add (job_id varchar2(9));

alter table emp 
modify (job_id varchar2(15))

insert into emp values (1,'A');

alter table emp 
drop column job_id
select * from emp;


alter table emp 
set unused (job_id);

alter table emp 
drop unused columns

select * from emp

select * from user_objects

select * from user_tab_columns;
select * from user_constraints

select * from emp

alter table emp 
modify id primary key

alter table emp 
drop primary key

alter table emp 
modify id primary key

alter table emp 
add constraint emp_id_pk
primary key (id)



alter table dept 
drop constraint dept_nm_pk


select * from emp

alter table emp 
add (dept_id int);

create table dept
(dept_id int, 
dept_name varchar2(10))

alter table emp 
add constraint emp_id_pk
primary key (id)

alter table dept 
add constraint dept_id_pk
primary key (dept_id)

delete from dept
insert into dept values (20,'IT');
select * from dept

insert into emp values (3,NULL,20);
select * from emp
alter table emp 
add constraint dept_id_fk
foreign key (dept_id)
references dept(dept_id);

alter table emp 
drop constraint dept_id_fk



alter table emp 
add constraint dept_id_fk
foreign key (dept_id)
references dept on delete cascade;


select * from dept
delete from dept where dept_id = 20

select * from emp

alter table emp 
modify name not null


create table emp
(id int, 
name varchar2(20));

alter table emp 
add (dept_id int);


alter table emp 
modify id primary key

create table dept
(dept_id int, 
dept_name varchar2(10))
alter table dept 
add constraint dept_id_pk
primary key (dept_id)

alter table emp 
add constraint dept_id_fk
foreign key (dept_id)
references dept(dept_id);

alter table emp 
disable constraint dept_id_fk;

alter table emp 
enable constraint dept_id_fk

insert into emp values (1,'A',10);
insert into emp values (2,'B',20);
insert into emp values (3,'C',30);
insert into emp values (4,'D',40);
insert into emp values (5,'E',50);

select * from emp
select * from dept
insert into dept values (10,'IT')
insert into dept values (20,'HR');
insert into dept values (30,'FIN');
insert into dept values (40,'MAR');
insert into dept values (50,'SALE');


drop table emp
drop table dept







create table emp
(id int, 
name varchar2(20));
alter table emp 
modify id primary key


select * from user_indexes

select * from user_indexes where index_name like '%_IDX%'



create table emp
(id int primary key using index 
(create index emp_id_idx on emp(id)), 
name varchar2(20));


create table emp2
(id int primary key , 
name varchar2(20));



drop table emp purge


