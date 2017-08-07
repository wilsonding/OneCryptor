
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























