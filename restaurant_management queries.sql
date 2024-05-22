create database restaurant_management;
use restaurant_management;
create table users (
userId varchar(5) unique not null,
fname varchar(255) not null,
lname varchar(255) not null,
password varchar(5) not null,
email varchar(255) unique not null,
phone varchar(255) unique not null,
primary key (userId)
);

create table restaurants (
restId varchar(5) unique not null,
restName varchar(255) not null,
restAddress varchar(255) not null,
primary key (restId)
);

create table menu (
foodId varchar(5) unique not null,
restId varchar(5),
name varchar(255),
price numeric(8,0) not null,
primary key (foodId),
foreign key (restId) references restaurants (restId)
on delete set null
);

create table shoppingCart (
transactionId int unique not null,
userId varchar(5),
restId varchar(5),
foodId varchar(5),
price numeric(8,0) not null,
foodCount int not null,
date varchar(255) not null,
primary key (transactionId),
foreign key (userId) references users (userId) on delete set null,
foreign key (restId) references restaurants (restId) on delete set null,
foreign key (foodId) references menu (foodId) on delete set null
)

