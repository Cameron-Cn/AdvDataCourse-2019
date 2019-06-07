drop database customers;

CREATE DATABASE Customers;
USE Customers;

select count(*) from customer;
SELECT * from customer;

select count(*) as 'Customer Count' from customer;

select count(distinct company)as 'Distinct Companies' from customer;

alter table Customer add CustomerId int not null primary key auto_increment;

alter table customer add CompanyID int;

select CompanyID, company from customer;

create table Company (
CompanyId int NOT NULL AUTO_INCREMENT,
Company VARCHAR(255),
primary key (CompanyID)
);

select * from company;

select distinct company from Customer where length(company) > 0 AND company is not null order by company;

-- NULL and EMPTY (0 length string) are not the same thing; Empty can be "" as a string, NULL is a total absence
insert into Company (company) select distinct company from Customer where length(company)>0 and company is not null order by company;

select * from Company;

select companyID, company from Company;

-- a correlated sub-query(!) 
update Customer c set c.companyID = (select t.companyID from Company t where t.company = c.company);

-- for example:
-- select c.email from customer c where c.customerID = 22;
-- table aliases are only defined per run, and then disappear, not like python

select c.companyID, c.company, t.companyID, t.company from Customer c inner join Company t on c.CompanyId = t.CompanyID;

alter table Customer drop column company;

select * from customer;

SELECT CONCAT(`FirstName`,`LastName`) as `Full Name` from Customer;

select CONCAT(`FirstName`,' ',`LastName`) as `Full Name`, company from Customer 
inner join Company on 
customer.companyid=Company.companyid;



-- trying this on my own now, looking for unique states and adding splicing joining to there
create table state (
stateid VARCHAR(5),
Company VARCHAR(255),
primary key (state)
);

-- starting off
select * from customer;

select * from company;

select * from state;
-- there is NULL in state;

select * from boogle;
-- making sure the commands above do not create tables! (as 'cd' will with directories)

CREATE TABLE city (
city VARCHAR(50),
Company VARCHAR(255),
primary key (city)
);

CREATE TABLE jobTitle (
jobID INT NOT NULL AUTO_INCREMENT,
jobName VARCHAR(255),
primary key (jobID)
);

alter table state DROP column company;



CREATE TABLE state (
stateID INT NOT NULL AUTO_INCREMENT,
stateName VARCHAR(5),
primary key (stateID)
);

select distinct state from customer where length(state)>0 and state is not null order by state;

select * from state;

insert into state (stateName) select distinct State from Customer where length(State)>0 and state is not null order by state;
-- insert into state (company) select distinct state from company where length(company)>0 and company is not null order by company;

-- now the tricky part: joining the State to customer (and replacing the state in customer)
update Customer c set c.state = (select st.stateID from state st where st.stateName=c.state);

Select * from customer;
select * from state;

alter table customer change state stateID VARCHAR(255) NOT NULL;

select * from jobTitle;
-- made the table up above, we have CustomerID, Customer fullName, and Company jobTitle
-- customer.CustomerID ; customer CONCAT FULLNAME; customer.position




