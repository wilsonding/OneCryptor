
-- create a database and use it
create database onecryptor;
use onecryptor;

-- create the tables for the database
create table users (
id int auto_increment not null,
first_name nvarchar(32) not null,
last_name nvarchar(32) not null,
email nvarchar(255) not null,
contact_number nvarchar(32) not null,
password varbinary(256) not null,
status_id int not null,
account_id int,
product_id int not null,
password_key varbinary(256) not null,
rsa_private varbinary(512) not null,
rsa_public varbinary(512) not null,
salt varbinary(24),
wrapping_key ,
iterations,
aes_key,
created_date,
last_updated,
primary key (id),
foreign key (status_id) references status (id),
foreign key (account_id) references account (id),
foreign key (product_id) references product (id)
) auto_increment = 100000;