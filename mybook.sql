drop table if exists book;
drop table if exists category;
drop table if exists user;
drop table if exists admin;
drop table if exists donate;
drop table if exists record;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(32) DEFAULT NULL,
  `caid` int(11) DEFAULT NULL,
  `publish` varchar(32) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `picurl` varchar(100) DEFAULT NULL,
  `deleteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

  CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `cardid` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `donate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `caid` int(11) DEFAULT NULL,
  `publish` varchar(32) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `picurl` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);