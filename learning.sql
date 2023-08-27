SHOW DATABASES;
CREATE DATABASE ORG;
USE ORG;
CREATE TABLE worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(30),
    LAST_NAME CHAR(30),
    SALARY INT(20),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(30)
);
SELECT * FROM worker;
SELECT * FROM bonus;
SELECT * FROM title3;
SHOW TABLES;

-- mongo db
-- mysql


INSERT INTO worker 
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
    (001,'Mohammed','Qureshi',80 '14-02-20 09.00.00'000,, 'Developer'),
    (002,'Abdul','Razzak',100000, '19-02-20 10.00.00', 'Software Engineer'),
    (003,'shoeab','sadiq',70000, '18-02-10 10.23.00', 'Software Developer'),
    (004,'shaik','tabrez',100000, '19-02-20 10.00.00', 'Software Developer'),
    (005,'mohammed','shoeb',2000000, '19-10-20 10.00.00', 'Bussines men'),
    (006,'mohammed','adil',200000, '19-02-20 11.00.00', 'Civil Engineer'),
    (007,'mohammed','abbas',200000, '19-02-20 10.04.00', 'Civil Engineer'),
    (008,'mohammed','ibrahim',150000, '19-02-20 09.00.00', 'Enterpreneur'),
    (009,'Mohammed','adnan',300000, '19-02-20 10.00.00', 'Software Engineer'),
    (010,'Mohammed','muzambil',100000, '19-02-20 10.00.00', 'Data Scientist');
    
CREATE TABLE bonus(
		WORKER_REF_ID INT,
        BONUS_AMOUNT INT(10),
        BONUS_DATE DATETIME,
        FOREIGN KEY (WORKER_REF_ID)
			REFERENCES worker (WORKER_ID)
            ON DELETE CASCADE
);

INSERT INTO bonus 
	(WORKER_REF_ID, BONUS_AMOUNT,BONUS_DATE) VALUES 
		(001,10000, '16-02-20'),
        (004,1000, '19-06-15'),
        (006,7000, '19-02-14'),
        (007,8000, '20-04-10'),
        (003,5000, '21-07-24');

CREATE TABLE title3(
		WORKER_REF_ID INT,
        WORKER_TITLE CHAR(30),
        AFFTECTED_FROM DATETIME,
        FOREIGN KEY (WORKER_REF_ID)
			REFERENCES worker (WORKER_ID)
            ON DELETE CASCADE
);

INSERT INTO title3 
	(WORKER_REF_ID, WORKER_TITLE,AFFTECTED_FROM) VALUES 
		(001,'Developer', '2016-02-20 00:00:00'),
        (002,'Engineer', '2017-03-21 00:00:00'),
        (003,'Developer', '2018-04-22 00:00:00'),
        (004,'Developer', '2019-05-23 00:00:00'),
        (005,'Bussines', '2020-06-25 00:00:00'),
        (006,'Engineer', '2021-06-25 00:00:00'),
        (007,'Engineer', '2021-07-25 00:00:00'),
        (008,'Enterpre', '2021-06-25 00:00:00'),
        (009,'Engineer', '2022-07-25 00:00:00'),
        (010,'Scientist', '2021-03-25 00:00:00');
SELECT * FROM worker;
SELECT * FROM bonus;
SELECT * FROM title3;

SELECT FIRST_NAME,SALARY FROM worker;
SELECT 5*6;
SELECT now();
SELECT ucase('mohammed abdul razzak qureshi');
SELECT lcase('MOHAMMED abdul RAZZAK qureshi');
SELECT * FROM worker;
SELECT * FROM worker WHERE SALARY <200000;
SELECT * FROM worker WHERE DEPARTMENT ='Software Developer';
SELECT * FROM worker WHERE DEPARTMENT ='Software Engineer';
SELECT * FROM worker WHERE SALARY BETWEEN 50000 AND 200000; 
SELECT * FROM worker WHERE FIRST_NAME ='mohammed' OR FIRST_NAME ='Mohammed';
SELECT * FROM worker WHERE FIRST_NAME IN ('mohammed', 'Mohammed','shaik');
SELECT * FROM worker WHERE FIRST_NAME NOT IN ('mohammed','Mohammed');
select * from worker where FIRST_NAME LIKE '_h%';
select* from worker order by SALARY ;
select* from worker order by LAST_NAME ;
select* from worker order by LAST_NAME desc;
select* from worker order by LAST_NAME asc;
select DEPARTMENT from worker;
select distinct DEPARTMENT from worker;
select DEPARTMENT from worker group by DEPARTMENT;
select DEPARTMENT, COUNT(DEPARTMENT) from worker group by DEPARTMENT;
select SALARY, count(SALARY) from worker group by SALARY;
select department ,AVG(salary) from worker group by department;
select department ,min(salary) from worker group by department;
select department ,max(salary) from worker group by department;
select department ,sum(salary) from worker group by department;
select department ,count(salary) from worker group by department having count(department) >1;


USE temp;
show tables;
select * from student;
create table accounter(
	id int primary key,
	name char(100) UNIQUE,
	balance int,
	CONSTRAINT acc_balance_chck CHECK(balance>1000),
    age int not null default 18
);
insert into accounter(id,name,balance) values(1,'razzak',10000);
insert into accounter(id,name,balance) values(2,'shoeb',5000);
insert into accounter(id,name,balance) values(3,'tabrez',3000);
select * from accounter;
-- DROP table accounter;



-- ALTER OPERATIONS 
-- ADD
ALTER TABLE accounter ADD marks FLOAT NOT NULL DEFAULT 0;
ALTER TABLE accounter ADD goal FLOAT NOT NULL ;
desc accounter;
-- MODIFY
ALTER TABLE accounter MODIFY marks DOUBLE NOT NULL DEFAULT 0;
-- CHANGE COLUMN -- 
ALTER TABLE accounter CHANGE COLUMN marks cs_marks FLOAT NOT NULL DEFAULT 45;
-- RENAME TABLE - TABLE NAME CHANGE --  
alter table accounter RENAME TO account_details;
desc account_details;
select * from account_details; 

-- DROP COLUMN -- 
alter table account_details DROP column cs_marks; 
alter table account_details DROP column goal; 
 
 -- DML -- 
 create table myprofile(
	id int primary key,
    name varchar(100),
    goal varchar(100),
    current_lrng varchar(100)
);
select * from myprofile;
SET SQL_SAFE_UPDATES=1;
insert into myprofile values(1,'razzak','developer','mysql');
insert into myprofile values(2,'shoeb','bussiness men','bootstrap');
insert into myprofile values(3,'tabrez','teacher','phd');
insert into myprofile values(4,'adil','engineer','rivit');
 insert into myprofile values(5,'abbas','enterprener','franchise');
 UPDATE myprofile SET current_lrng='teaching',name='junaid'  WHERE id=2;
 alter table myprofile add education varchar(50) not null default '';
 UPDATE myprofile SET education='graduated';
 
 UPDATE account_details SET age='20',name='ghouse'  WHERE id=1;
 select*from account_details;
 
 -- DELETE --
 delete from myprofile where id=3;
 select*from myprofile;
 insert into myprofile(id,name) values(3,'adil');
 update myprofile SET current_lrng='enterprener', goal='franchise',name='abbas',education='graduated' where id=3;
 
create table customer(
	id int primary key,
    name varchar(20),
    salary int
    );
    insert into customer values (1,'raju',30000);
    insert into customer values (2,'shaam',40000);
    insert into customer values (3,'babu',20000),(4,'totla','4000000'),(5,'kachra_set','5000');
    select * from customer;
    drop table customer;
    
    create table order_details(
		order_id int primary key,
        order_date DATE,
        cust_id int,
        foreign key(cust_id) references customer(id) ON DELETE CASCADE
        );
 create table order_on_delete_set_null(
		order_id int primary key,
        order_date DATE,
        cust_id int,
        foreign key(cust_id) references customer(id)ON DELETE SET NULL
        );
insert into order_on_delete_set_null(order_id,order_date,cust_id) values(23,'2019-03-13',2);
select * from order_on_delete_set_null;
DELETE FROM order_on_delete_set_null where cust_id=1;
DELETE FROM customer where id=2;
show tables;
-- delete from customer;
DROP table customer;
DROP table order_details;
DROP table order_details2;
 
 select * from customer;
 -- REPLACE -- 
REPLACE INTO customer(id,name) values(2,'tabrez');
REPLACE INTO customer(id,name,salary) values(2,'shaik',1000);
  REPLACE INTO customer(id,name,salary) values(10,'abbas',500);
  REPLACE INTO customer SET id=11,name='abdul',salary=100000;
   REPLACE INTO customer SET id=11,name='razzak',salary=100000;
    REPLACE INTO customer SET id=11,salary=200;
 

