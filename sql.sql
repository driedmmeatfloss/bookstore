user zbiao;
//鐢ㄦ埛琛�
create table user (
username varchar(20),
password varchar(20),
nickname varchar(20),
gender varchar(8)
);

insert into user values ('biao','123','biaoye','mate');

//鍥句功琛�
create table book(
    -> id int primary key auto_increment,
    -> bookname varchar(20),
    -> money varchar(20),
    -> leixing varchar(20)
    -> );

//绠＄悊鍛樿〃
create table manager(
    -> username varchar(20),
    -> password varchar(20),
    -> tel varchar(20),
    -> grade varchar(20)
    -> );
insert into manager value('biao','123','17863955120','NO.1');

set names 'gbk';

//璐拱璁板綍琛�
CREATE table buybook(
id int primary key auto_increment,
name varchar(20),
monry varchar(20),
bookname varchar(20),
zhifu varchar(20),
date varchar(40)
);


//璐墿杞﹁〃
create table shopcar(
id int primary key auto_increment,
name varchar(20),
monry varchar(20),
bookname varchar(20),
date varchar(40)
);
