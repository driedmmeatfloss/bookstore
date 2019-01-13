drop table if exists book;
drop table if exists category;
drop table if exists user;
drop table if exists admin;
drop table if exists donate;
drop table if exists record;
create table book(
  id int primary key auto_increment,
  name varchar(32),
  caid int,
  publish varchar(32),
  author varchar(32),
  number int,
  picurl varchar(100)
);

  create table category(
    id int primary key auto_increment,
    category varchar(32)
  );

create table user(
  id int primary key  auto_increment,
  name varchar(32),
  password varchar(32),
  sex int,
  age int,
  realname varchar(32),
  cardid varchar(32),
  status int

);
create table admin(
  id int primary key auto_increment,
  name varchar(32),
  password varchar(32)
);

create table donate(
  id int primary key auto_increment,
  name varchar(32),
  caid int,
  publish varchar(32),
  author varchar(32),
  picurl varchar(100),
  uid int,
  status int
);
create table record(
  id int primary key auto_increment,
  uid int ,
  bid int,
  indate date,
  outdate date
)