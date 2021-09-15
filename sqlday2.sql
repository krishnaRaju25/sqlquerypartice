create table regions(region_id int unsigned NOT NULL,region_name varchar(30),PRIMARY KEY(region_id));
create table countries(country_id char(50) NOT NULL,country_name varchar(50),region_id int unsigned not null, 
primary key(country_id));
create table location(location_id int unsigned not null auto_increment,street_address varchar(50),
postal_code varchar(50),city varchar(50) not null,state_province varchar(50),country_id char(10) not null,
primary key(location_id));
create table department(department_id int unsigned not null auto_increment,department_name varchar(50) not
null,manager_id int unsigned,location_id int unsigned not null,primary key(department_id));
create table jobs(job_id varchar(30) not null primary key,job_title varchar(30) not null,min_salary dec unsigned,
max_salary dec unsigned);
create table employee(employee_id int unsigned not null,first_name varchar(40),last_name varchar(40) not null,
email varchar(40) not null,phone_number varchar(40) not null,hire_date date not null,job_id varchar(40) not null,
salary dec not null,commision_pct decimal,manager_id int unsigned not null,department_id int unsigned);
alter table employee add primary key(employee_id);
create table job_history(employee_id int unsigned not null,start_date date not null,end_date date not null,
job_id varchar(40) not null,department_id int unsigned not null,CONSTRAINT pk_job_his primary key (employee_id,start_date));

insert into regions values (1,"europe");
insert into countries values ('ind',"india",1);
insert into location values (1,'2017-shshshsh','1689',"Tokyo","tokyo-province",'jp');
insert into department values(10,"admiistrator",1,1);
insert into jobs values("AD_vp","Administrator vice predient",15000,30000);
insert into employee values(1,"steve","king","515.123.4567","9892222",
str_to_date('12-jun-2017','%d-%M-%Y'),"123",23000,null,1,1);
set foreign_key_checks=0;
insert into job_history values(1,str_to_date('17-sep-1987','%d-%M-%Y'),str_to_date('17-jun-1993','%d-%M-%Y'),
"AD-ASST",1);
select* from regions;

select* from countries;
alter table countries
 add foreign key(region_id) references regions(region_id);

alter table location
 add foreign key(region_id) references countries(region_id);
 update location set location_id=1 where location_id=1200;
 truncate location;
select* from location;
select* from countries;

alter table department
 add foreign key(location_id) references location(location_id);

 alter table location
   rename column region_id to location_id;
 
 desc department;
   desc location;
   desc countries;
 
 alter table employee
 add foreign key(job_id) references jobs(job_id);
 alter table employee
 add foreign key(department_id) references department(department_id);
 alter table employee
 add foreign key(manager_id) references department(manager_id);
desc employee;
 select* from employee;

alter table department
 add foreign key(manager_id) references employee(manager_id);
 truncate department;
 desc department;
select* from department;

 alter table job_history
 add foreign key(employee_id) references employee(employee_id);
 alter table job_history
 add foreign key(job_id) references job(job_id);
 alter table job_history
 add foreign key(department_id) references department(department_id);
 desc job_history;
 