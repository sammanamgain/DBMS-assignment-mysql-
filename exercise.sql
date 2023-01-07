CREATE DATABASE DB_EMPLOYEE;
use DB_EMPLOYEE;
create table employee(
employee_name varchar(255),
street varchar(255),
city varchar(255),
primary key(employee_name)
);
create table manages(
employee_name varchar(255),
manager_name varchar(255),
 FOREIGN KEY (employee_name) REFERENCES employee(employee_name)
);
create table company(
company_name varchar(255),
city varchar(255),
 primary key(company_name)
);
create table works(
employee_name varchar(255),
company_name varchar(255),
salary varchar(255),
 FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
 FOREIGN KEY (company_name) REFERENCES company(company_name)
);

Insert into employee
values('samman amgain','okhle','gorkha'),
('steve jobs','wallstreet','new work'),
('bill gates','watermarket','new work'),
('harry potter','streetlamps','hogwards'),
('wednesday addams','room','nevermore');


Insert into manages
values('samman amgain','hariram pandit'),
('steve jobs','lucifer morningstar'),
('bill gates','thomos shelby'),
('harry potter','albus dumbledore'),
('wednesday addams','gomez addams');


Insert into company
values('first bank corporation','beijing'),
('apple','new work'),
('microsoft','california'),
('magiccompany','hogwards'),
('walmart','senfransico');

Insert into works
values('samman amgain','first bank corporation',8000),
('steve jobs','apple',20000),
('bill gates','microsoft',15000),
('harry potter','first bank corporation',50000),
('wednesday addams','first bank corporation',13000);



-- 1
select employee_name 
from 
works
where (company_name='first bank corporation');

-- 2b
select employee.employee_name ,employee.city
from
employee
where
(employee.employee_name in
(select works.employee_name from works
 where works.company_name =
'first bank corporation' )
 );


-- 2c


select employee.employee_name ,employee.city
from
employee
where
(employee.employee_name in
(select works.employee_name from works
 where works.company_name  =
'first bank corporation' and works.salary>10000 ) 
 );

select employee_name 
from 
works
where (company_name!='first bank corporation');





select wrk.employee_name
from
works as wrk
where wrk.salary  > all (select works.salary
from
works
where                         
works.company_name = 'first bank corporation' );