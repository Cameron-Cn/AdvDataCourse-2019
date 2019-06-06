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

insert into Company (company) select distinct company from Customer where length(company)>0 and company is not null order by company;

select * from Company;

select companyID, company from Company;

update Customer c set c.companyID = (select t.companyID from Company t where t.company = c.company);

select c.companyID,c.company,t.companyID,t.company from Customer c inner join Company t on c.CompanyId=t.CompanyID;

alter table Customer drop column company;

select * from customer;

SELECT CONCAT(`FirstName`,`LastName`) as `Full Name` from Customer;

select CONCAT(`FirstName`,' ',`LastName`) as `Full Name`, company from Customer 
inner join Company on 
customer.companyid=Company.companyid;



-- trying this on my own now, looking for unique states and adding splicing joining to there
create table state (
state VARCHAR(5),
Company VARCHAR(255),
primary key (state)
);

-- starting off





