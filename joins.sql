show databases;
use org;
show tables;
use temp;
create database joins;
use joins;
create table employee(
	id int primary key,
	fname char(50),
	lname char(50),
	age int,
	email_id char(50),
	phone_no int,
	city char(40)
);
insert into employee(id,fname,lname,age,email_id,phone_no,city) values 
				(1,'abdul','razzak',21,'abdul@gmail.com',3046,'hyderabad'),
                (2,'shoeab','sadiq',22,'shoeab@gmail.com',3050,'andhra pradesh'),
                (3,'junaid','ahmed',21,'junaid@gmail.com',3044,'secunderabad'),
                (4,'mohammed','adnan',22,'mohammed@gmail.com',3027,'mumbai'),
                (5,'ali','qadri',21,'ali@gmail.com',3029,'bangolore');
select * from employee;
create table clients(
	id int primary key,
	fname char(50),
	lname char(50),
	age int,
	email_id char(50),
	phone_no int,
	city char(40),
    emp_id int ,
    foreign key(emp_id) references employee(id)
);

insert into clients(id,fname,lname,age,email_id,phone_no,city,emp_id) values 
				(1,'abdul2','razzak2',21,'abdul2@gmail.com',30462,'hyderabad2',3),
                (2,'shoeab2','sadiq2',22,'shoeab2@gmail.com',30502,'andhra pradesh2',4),
                (3,'junaid2','ahmed2',21,'junaid2@gmail.com',30442,'secunderabad2',2),
                (4,'mohammed2','adnan2',22,'mohammed2@gmail.com',30272,'mumbai2',2),
                (5,'ali2','qadri2',21,'ali2@gmail.com',30292,'bangolore2',1);
select * from clients;
create table projects(
	id int primary key,
    emp_id int,
    name char(40),
    start_date DATE,
    client_id int,
    foreign key(emp_id) references employee(id),
    foreign key(client_id) references clients(id)
);
 
 insert into projects(id,emp_id,name,start_date,client_id) values
					(1,1,'ai','2023-01-02',3),
                    (2,2,'ml','2023-02-12',1),
                    (3,3,'blockchain','2023-03-20',5),
                    (4,3,'web','2023-07-23',2),
                    (5,5,'android','2023-10-02',4);
select * from employee;
select * from clients;
select * from projects;

select c.*, o.* from employee as c INNER JOIN clients as o ON c.id = o.emp_id;
select c.*, o.* from employee as c LEFT JOIN clients as o ON c.id = o.emp_id;
-- INNER JOIN -- 
select e.id,e.fname,e.lname,p.id,p.name from employee as e 
		INNER JOIN projects as p ON e.id=p.emp_id ;
select e.id,e.fname,e.lname,e.email_id,e.phone_no,c.id,c.fname,c.lname from employee as e 
		INNER JOIN clients as c ON e.id=c.emp_id 
        where e.city='secunderabad' and c.city='hyderabad2';
-- LEFT JOIN -- 
select e.id,e.fname,e.email_id,p.id,p.name,p.start_date from employee as e
			LEFT JOIN projects as p ON e.id=p.emp_id;
-- RIGHT JOIN --  
select p.id,p.name,p.start_date,e.id,e.email_id,e.fname from projects as p
			RIGHT JOIN employee as e ON e.id=p.emp_id;
select e.id,e.fname,e.lname,p.id,p.name from employee as e 
		INNER JOIN projects as p ON e.id=p.emp_id;
        
-- cross join -- 
select p.id,p.name,p.start_date,e.id,e.email_id,e.fname from projects as p
			CROSS JOIN employee as e ;

select * from employee,clients where employee.id=clients.emp_id;
