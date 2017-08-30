
-- drop database onecryptor;

-- create a database and use it
create database if not exists onecryptor;
use onecryptor;

-- create the tables for the database
-- user_status table
create table user_status(
	status_id tinyint auto_increment not null,
	status varchar(20),
	description varchar(100),
	primary key (status_id)
) auto_increment = 0;

-- payment_methods table
create table payment_methods(
	payment_method_id int auto_increment not null,
	payment_method_name varchar(30),
	description varchar(100),
	primary key (payment_method_id)
) auto_increment = 1000000;

-- account table
create table accounts(
	account_id int auto_increment not null,
	account_name varchar(64) not null,
	payment_method_id int,
	primary key (account_id),
	foreign key (payment_method_id) references payment_methods (payment_method_id)
) auto_increment = 100000;

-- products table
create table products(
	product_id int auto_increment not null,
	product_name varchar(64) not null,
	price decimal(8,2) not null,
	primary key (product_id)
) auto_increment = 11000000;

-- services table
create table services(
	service_id int auto_increment not null,
	service_name varchar(64) not null,
	description varchar(100),
	primary key (service_id)
) auto_increment = 12000000;

-- product_service table
create table product_service(
	product_service_id int auto_increment not null,
	product_id int not null,
	service_id int not null,
	primary key (product_service_id),
	foreign key (product_id) references products (product_id),
	foreign key (service_id) references services (service_id)
) auto_increment = 100000000;

-- provinces table
create table provinces(
	province_id smallint auto_increment not null,
	privince_code varchar(2) not null,
	privince_name varchar(32),
	primary key (province_id)
) auto_increment = 10000;

-- countries table
create table countries(
	country_code varchar(3) primary key,
    country_name varchar(32) not null
);

-- users table
create table users (
	user_id int auto_increment not null,
	first_name nvarchar(32) not null,
	last_name nvarchar(32) not null,
	email nvarchar(255) not null,
	contact_number nvarchar(32) not null,
	password varbinary(256) not null,
	status_id tinyint not null,
	account_id int,
	product_id int not null,
	password_key varbinary(256) not null,
	rsa_private varbinary(512) not null,
	rsa_public varbinary(512) not null,
	salt varbinary(24),
	wrapping_key varbinary(256),
	iterations int not null,
	created_date date,
	last_updated date,
	primary key (user_id),
	foreign key (status_id) references user_status (status_id),
	foreign key (account_id) references accounts (account_id),
	foreign key (product_id) references products (product_id)
) auto_increment = 100000;

-- companies table
create table companies(
	company_id int auto_increment not null,
	company_name varchar(64) not null,
	address varchar(128) not null,
	city varchar(50),
	province_id smallint,
	zip_code varchar(15),
	country_code varchar(2),
	contact_name varchar(64),
	contact_number varchar(20),
	primary key (company_id),
	foreign key (province_id) references provinces (province_id)
) auto_increment = 1000;

-- groups table
create table groups(
	group_id int auto_increment not null,
	group_name varchar(64) not null,
	company_id int not null,
	rsa_private varbinary(512) not null,
	rsa_public varbinary(512) not null,
	wrapping_key varbinary(256),
	description varchar(100),
	primary key (group_id),
	foreign key (company_id) references companies (company_id)
) auto_increment = 10000;

-- user_group table
create table user_group(
	user_group_id int auto_increment not null,
	user_id int not null,
	group_id int not null,
	group_key varbinary(256) not null,
	primary key (user_group_id),
	foreign key (user_id) references users (user_id),
	foreign key (group_id) references groups(group_id)
) auto_increment = 100000000;

-- user_company table
create table user_company(
	user_company_id int auto_increment not null,
	user_id int not null,
	company_id int not null,
	primary key (user_company_id),
	foreign key (user_id) references users (user_id),
	foreign key (company_id) references companies(company_id)
) auto_increment = 100000000;



-- ********************************Initialize sample data**********************************--
use onecryptor;

-- user_status table
insert into user_status(status, description) values(
	'Active',
	'this is the decription of Active status'
);

select * from user_status;

-- payment_methods table
insert into payment_methods(payment_method_name, description) values(
	'Credit Card',
	'This is the description for Credit Card payment method'
);

select * from payment_methods;

-- account table
insert into accounts(account_name, payment_method_id) values(
	'Sample Account1',
	1000000
);

select * from accounts;

-- products table
insert into products(product_name, price) values(
	'Sample Product1',
    49.99
);

select * from products;

-- services table
insert into services(service_name, description) values(
	'Sample Service1',
    'This is the description of Sample Service1'
);

select * from services;

-- product_service table
insert into product_service(product_id, service_id) values(
	11000000,
    12000000
);

select * from product_service;

-- provinces table
insert into provinces(province_code, province_name) values(
	'11',
    'Beijing'
),
(
	'31',
    'Shanghai'
),
(
	'44',
    'Guangzhou'
),
(
	'32',
    'Jiangsu'
);

select * from provinces;

-- countries table
insert into countries(country_code, country_name) values(
	'CN',
    'China'
);

select * from countries;

create table countries(
	country_code varchar(3) primary key,
    country_name varchar(32) not null
);

-- users table
create table users (
user_id int auto_increment not null,
first_name nvarchar(32) not null,
last_name nvarchar(32) not null,
email nvarchar(255) not null,
contact_number nvarchar(32) not null,
password varbinary(256) not null,
status_id tinyint not null,
account_id int,
product_id int not null,
password_key varbinary(256) not null,
rsa_private varbinary(512) not null,
rsa_public varbinary(512) not null,
salt varbinary(24),
wrapping_key varbinary(256),
iterations int not null,
created_date date,
last_updated date,
primary key (user_id),
foreign key (status_id) references user_status (status_id),
foreign key (account_id) references accounts (account_id),
foreign key (product_id) references products (product_id)
) auto_increment = 100000;

-- companies table
insert into companies(company_name, address, city, province_id, zip_code, country_code, contact_name, contact_number)
values(
	'Sample Company',
    '100 Street Name',
    'Xuzhou',
    10003,
    '221000',
    'CN',
    'FName LName',
    '13812345678'
);

select * from companies;

-- groups table
create table groups(
group_id int auto_increment not null,
group_name varchar(64) not null,
company_id int not null,
rsa_private varbinary(512) not null,
rsa_public varbinary(512) not null,
wrapping_key varbinary(256),
description varchar(100),
primary key (group_id),
foreign key (company_id) references companies (company_id)
) auto_increment = 10000;

-- user_group table
create table user_group(
user_group_id int auto_increment not null,
user_id int not null,
group_id int not null,
group_key varbinary(256) not null,
primary key (user_group_id),
foreign key (user_id) references users (user_id),
foreign key (group_id) references groups(group_id)
) auto_increment = 100000000;

-- user_company table
create table user_company(
user_company_id int auto_increment not null,
user_id int not null,
company_id int not null,
primary key (user_company_id),
foreign key (user_id) references users (user_id),
foreign key (company_id) references companies(company_id)
) auto_increment = 100000000;



















