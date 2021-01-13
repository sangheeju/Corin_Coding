CREATE TABLE `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `mpass` varchar(20) NOT NULL,
  `mname` varchar(12) NOT NULL,
  `mmail` varchar(45) NOT NULL,
  `metc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

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
  `mid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8


CREATE TABLE `dalpage`.`reply` (
  `reno` INT NOT NULL AUTO_INCREMENT,
  `mid` VARCHAR(20) NOT NULL,
  `rememo` VARCHAR(100) NOT NULL,
  `redate` DATETIME NOT NULL,
  `bno` INT NOT NULL,
  PRIMARY KEY (`reno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
