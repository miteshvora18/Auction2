create database auction

create table roles
(
rid int primary key identity(1,1),
rname varchar(20)
)

insert into roles values('admin')
insert into roles values('users')

create table Users 
(
uid int primary key identity(1,1),
rid int foreign key(rid) references roles(rid),
username varchar(100),
password varchar(50),
email varchar(100),
uvalid bit
)

insert into Users values(2,'none','none','none',0)
insert into Users values(1,'admin','admin','miteshvora18@gmail.com',1)

create table categories
(
cid int primary key identity(1,1),
cname varchar(50)
)

insert into categories values('Clothing')
insert into categories values('Electronics')
insert into categories values('Furniture')
insert into categories values('Other')

create table products
(
pid int primary key identity(1,1),
uid int foreign key(uid) references users(uid),
cid int foreign key(cid) references categories(cid),
pname varchar(60),
pdesc varchar(500),
pimage varchar(200),
minBid money,
atime int,
bidEndtime datetime,
pvalid bit,
)

--insert into products values(3,4,'College Bag','College Bag with 2005 make','04092012278.jpg',800,30,'2014-03-22 22:22',1)

create table selling 
(
sid int primary key identity(1,1),
pid int foreign key(pid) references products(pid),
sellUser int foreign key(sellUser) references Users(uid),
buyUser int foreign key(buyUser) references Users(uid),
bidAmount money
)

create table feedback
(
fid int primary key identity(1,1),
uid int foreign key(uid) references users(uid),
subject varchar(100),
description varchar(100),
fdate datetime
)

create table BidsOrder
(
bOrder int primary key identity(1,1),
pid int foreign key(pid) references products(pid),
buyuser int foreign key(buyuser) references users(uid),
selluser int foreign key(selluser) references users(uid),
bidamount money,
date datetime
)

