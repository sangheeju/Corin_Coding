CREATE TABLE `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `mpass` varchar(20) NOT NULL,
  `mname` varchar(12) NOT NULL,
  `mmail` varchar(45) NOT NULL,
  `metc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `bdate` timestamp NOT NULL,
  `btitle` varchar(45) NOT NULL,
  `bcon` varchar(45) NOT NULL,
  `bfile1` varchar(45) DEFAULT NULL,
  `bfile2` varchar(45) DEFAULT NULL,
  `bcnt` int NOT NULL,
  `bsort` int NOT NULL,
  `betc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

