/*create database report*//*at first*/

/*designing tables and giving a values for the first question*/
/*create table employee(
employee_name char(25) NOT NULL,
street char(25) NOT NULL,
city char(25) NOT NULL
);
create table works(
employee_name char(25) NOT NULL,
company_name char(25) NOT NULL,
salary int NOT NULL
);
create table company(
company_name char(25) NOT NULL,
city char(25) NOT NULL
);
create table manages(
employee_name char(25) NOT NULL,
manager_name char(25) NOT NULL
);
insert into employee (employee_name,street,city)
values ('abdallah elgendi','tahrir','doki')
insert into employee (employee_name,street,city)
values ('mohamed rashad','ashraf','tanta')
insert into employee (employee_name,street,city)
values ('ahmed elgendi','elbahr','giza')
insert into employee (employee_name,street,city)
values ('ahmed amer','elgesh','basuon')
insert into employee (employee_name,street,city)
values ('samir rashar mohamed','tahrir','doki')
insert into works (employee_name,company_name,salary)
values ('abdallah elgendi','Small Bank Corporation',4000)
insert into works (employee_name,company_name,salary)
values ('mohamed rashad','First Bank Corporation',9000)
insert into works (employee_name,company_name,salary)
values ('ahmed elgendi','First Bank Corporation',13000)
insert into works (employee_name,company_name,salary)
values ('ahmed amer','tronx',17200)
insert into works (employee_name,company_name,salary)
values ('samir rashad mohamed','Small Bank Corporation',1500)
insert into company (company_name,city)
values ('Small Bank Corporation','doki')
insert into company (company_name,city)
values ('tronx','giza')
insert into company (company_name,city)
values ('First Bank Corporation','tanta')
insert into company (company_name,city)
values ('hp','basuon')/*any company name will not use it*/

insert into manages (employee_name,manager_name)
values ('abdallah elgendi','samir rashad mohamed')

insert into manages (employee_name,manager_name)
values ('samir rashad mohamed','ahmed amer')

insert into manages (employee_name,manager_name)
values ('ahmed amer','abdallah elgendi')

insert into manages (employee_name,manager_name)
values ('mohamed rashad','ahmed amer')

insert into manages (employee_name,manager_name)
values ('ahmed elgendi','samir rashad mohamed')

update employee set employee_name='samir rashad mohamed' where employee_name='samir rashar mohamed'*/ /*should be done because of an wrong input*/




use report

/* question1 */
select employee_name from works
where company_name!='First Bank Corporation'

/*question2 */
select employee.employee_name, street ,city  from employee
JOIN works on employee.employee_name=works.employee_name 
where salary > 10000 and company_name='First Bank Corporation'


/* question3 */
select works.employee_name
from works
inner join employee on employee.employee_name=works.employee_name
inner join company on works.company_name=company.company_name
where employee.city=company.city

/* question4*/

select manages.employee_name
from manages 
inner join employee as A on manages.employee_name=A.employee_name
inner join employee as B on manages.manager_name=B.employee_name
where A.city=B.city and A.street=B.street

/* question5 */
declare @maxi int = 0
set @maxi =(select max(salary) from works where company_name='Small Bank Corporation' group by company_name)
select employee_name
from works
where company_name!='Small Bank Corporation' and salary>@maxi

/* question6  */
/*there are only three companies*/
/* for small bank corporation */
declare @avg int = 0
set @avg = (select avg(salary) from works where company_name='Small Bank Corporation' group by company_name);
select employee_name
from works
where company_name='Small Bank Corporation' and salary > @avg

/* for first bank corporation*/
/*declare @avg int = 0*//*if you will execute all the commands leave as a comment if you will execute this section only make it as an ordinary command not a comment*/
set @avg = (select avg(salary) from works where company_name='First Bank Corporation' group by company_name);
select employee_name
from works
where company_name='First Bank Corporation' and salary > @avg

/*for tronx company*/
/*declare @avg int = 0*//*if you will execute all the commands leave as a comment if you will execute this section only make it as an ordinary command not a comment*/
set @avg = (select avg(salary) from works where company_name='tronx' group by company_name);
select employee_name
from works
where company_name='tronx' and salary > @avg /*there is only one employee in this company so no one > salary but one=salarry*/


/* -----------------------2222222222222222------------------------*/
/*designing tables and giving values for question2*/
/*create table mountain(
mountain_name char(20),
elevation decimal
)
insert into mountain values('everst',8848),
('k2',8611),
('kangchen',8568),
('lhotse',8516),
('makalu',8485),
('cho oyu',8188),
('dhaullagiri',8167),
('manaslu',8163),
('nanga barbat',8126),
('annapurna',8091),
('gasrbrum',8080),
('broad beak',8051)*/

select top 10 * from Mountain order by elevation desc



/*------------------33333333333------------------------*/
/*designing table and giving values for question 3*/
/*create table employee2(
id int not null,
name char(20) not null,
recuitedby int
)
insert into employee2 values(1,'jean grayson',NULL),
(2,'paul smith',1),
(3,'john do',NULL),
(4,'alex lee',3),
(5,'lisa kim',3),
(6,'bob thompnon',NULL)
create table recuit(
id int not NULL,
name2 char(20)
)
insert into recuit values(1,'bob smith'),
(2,'paul alien'),
(3,'john do')*/

select name from employee2 inner join recuit on employee2.recuitedby=recuit.id and recuit.name2='john do';
select name from employee2 where recuitedby is null;
