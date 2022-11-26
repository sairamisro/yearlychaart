


select * from "SYSTEM"."login" log
where log."username"='a'
and log."password"='a'






CREATE TABLE "login" (
  "username" varchar(45) NOT NULL,
  "password" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("username")
);

CREATE TABLE "barchart" (
  "id" varchar(45) NOT NULL,
  "name" varchar(45) DEFAULT NULL,
 "parent" varchar(45) DEFAULT NULL,
 "y1" varchar(45) DEFAULT NULL,
 "y2" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id")
);


name : 'Grading',
y : [ '06/15/2022', '09/13/2022' ],
id : 'grading',
parent : 'excavation'



create table employee(
  EID varchar(20) primary key,
  Lastname varchar(20),
  Firstname varchar(20),
  Midinitial char(1),
  gender char(1),
  street varchar(20),
  city varchar(20)
);

create table works(
  EID varchar(20) primary key,
  Lastname varchar(20),
  Firstname varchar(20),
  Midinitial char(1),
  company_name varchar(20),
  salary numeric(5,0),
  foreign key(EID) references employee,
  foreign key(company_name) references company
);

create table company(
  company_name varchar(20) primary key,
  city varchar(20)
);

create table manages(
  EID varchar(20) primary key,
  Lastname varchar(20),
  Firstname varchar(20),
  Midinitial char(1),
  ManagerLastname varchar(20),
  MFirstname varchar(20),
  MMidinitial varchar(20),
  start_date date,
  foreign key (EID) references employee
);