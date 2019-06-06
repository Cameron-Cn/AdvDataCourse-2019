-- delete database Customers; -- only run this if you are starting over

create database Customers;
-- switch to the customers database (It's case sensitive)
use Customers;

-- import customers.csv into a table called Customer (case-sensitive)
-- Right-click on tables and select import, use the wizard to import the csv file
-- see how many customers are in our table: (use back ticks for strings)
select count(*) as `Customer Count` from Customer;

-- how many unique companies are in our table?
select count(distinct company)as 'Distinct Companies' from Customer;

-- add an Id to the customer table
alter table Customer add CustomerId int not null primary key auto_increment;

-- add a column for the CompanyID to the customers table
alter table Customer add CompanyID int;

-- notice that the companyId is null
select companyID, company from Customer;

-- create a table for the companies
-- this statement will also create a companyID column which will
-- increment when you insert a new record
create table Company (
companyID int NOT NULL AUTO_INCREMENT,
Company varchar(255),
primary key (companyID)
);

-- see what's in your company table now
select * from Company;

-- generate a sql statement which shows which companies will be added to the new customer table
select distinct company from Customer where length(company)>0 and company is not null  order by company;

-- add the above companies from customers to the company table
insert into Company (company) select distinct company from Customer where length(company)>0 and company is not null  order by company;

-- look at what you've done
select * from Company;

-- another way to select is to list the fields
select companyID, Company from Company;

/*
If you get ...
Error Code: 1175. You are using safe update mode and you tried 
to update a table without a WHERE that uses a KEY column 
To disable safe mode, toggle the option in 
Preferences -> SQL Editor and reconnect.

To reconnect: Query Menu -> Reconnect to Server
*/

-- update the compnayId in the customers table
update Customer c set c.companyID = (select t.companyID from
Company t where t.company=c.company);

-- query to check your data
select c.companyID,c.company,t.companyID,t.Company from
Customer c inner join Company t on c.CompanyID=t.CompanyID;

-- remove the company column from the customers table. It is no longer needed
alter table Customer drop column company;

-- also remove fullname, we don't need calculated columns. They're a maintenance headache
alter table Customer drop column fullname;

-- You can generate fullname more efficiently as:
select CONCAT(`FirstName`,' ',`LastName`) as `Full Name` from Customer;

-- notice you won't see the company (or fullname) column
select * from Customer;

-- the company column and the id are in Company
select * from Company;

-- a query to bring it all back together
select CONCAT(`FirstName`,' ',`LastName`) as `Full Name`, company from Customer 
inner join Company on 
customer.companyid=Company.companyid;
