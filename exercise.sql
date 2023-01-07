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



-- 2a queries
select employee_name 
from 
works
where (company_name='first bank corporation');

-- 2ajoin
select employee_name 
from 
employee natural join works
where (company_name='first bank corporation');

-- 2b queries
select employee.employee_name ,employee.city
from
employee
where
(employee.employee_name in
(select works.employee_name from works
 where works.company_name =
'first bank corporation' )
 );

-- 2b join
select employee.employee_name ,employee.city
from
employee natural join works

 where works.company_name =
'first bank corporation' ;
 


-- 2c  queries


select employee.employee_name ,employee.city
from
employee
where
(employee.employee_name in
(select works.employee_name from works
 where works.company_name  =
'first bank corporation' and works.salary>10000 ) 
 );


-- 2c join
select employee.employee_name ,employee.city,employee.street
from
employee
natural join
works
where
 works.company_name  =
'first bank corporation' and works.salary>10000 ;
 

-- 2d subqueries
select employee_name
from
employee
where
employee.city in 
(
select city
from 
company
where 
company.company_name in 
(select company_name
from
works
where
works.employee_name=employee.employee_name
));

-- 2d join

select employee.employee_name
from
employee
natural join 
works
natural join
company
;


-- 2 e regular
select employee
from




-- 2f queries
select employee_name 
from 
works
where (company_name!='first bank corporation');


-- 2f join
select employee_name 
from 
employee
natural join
works
where (company_name!='first bank corporation');


select * from works;

-- 2g subqueries
select employee_name
from 
works
where
salary >( select max(salary) from works
where
company_name='first bank corporation')
;
-- OR
select wrk.employee_name
from
works as wrk
where wrk.salary  > all (select works.salary
from
works
where                         
works.company_name = 'first bank corporation' );


-- 2G JOIN
select employee_name
from 
employee
natural join
works
where
salary >( select max(salary) from works
where
company_name='first bank corporation')
;


-- 2h subqueries
select company_name
from 
company
where
city=
(
select  city
from 
company
where
company_name='first bank corporation'
);

-- 2h join

select company_name
from 
company
natural join
works
where
city = 
(select
city
from 
company
where
company.company_name='first bank company');



 -- 2i
 select employee_name
 from 
 works
 where
 salary > (
 select
 AVG(salary)
 from
 works);
 
 
 -- 2j
 

















-- 3 prerequ

Insert into employee
values('jones','okfse','los angolos');


Insert into manages
values('jones','hariram pandit');

Insert into works
values('jones','first bank corporation',90000);


-- 3a
update 
employee
set 
city='newtown'
where
employee_name='jones';



-- 3b
update 
works
set 
salary = salary *1.1
where
company_name='first bank corporation';


-- 3c
 update 
works
set 
salary = salary *1.1
where
employee_name in (
select manager_name
from
manages);



-- 3d










-- 3e
DELETE 
FROM
 works
 WHERE company_name='first bank corporation';

