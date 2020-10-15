CREATE TABLE `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `mnick` varchar(20) NOT NULL,
  `mpass` varchar(150) NOT NULL,
  `mmail` varchar(45) NOT NULL,
  `mphone` int NOT NULL,
  `mbirth` varchar(45) NOT NULL,
  `mdel` int NOT NULL,
  `mcnt` int NOT NULL,
  `mdate` datetime NOT NULL,
  `mpet` int NOT NULL,
  `mclass` int NOT NULL DEFAULT '1',
  `metc` varchar(45) DEFAULT NULL,
  `membercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8