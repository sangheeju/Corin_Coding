CREATE TABLE `room` (
  `roomno` int NOT NULL AUTO_INCREMENT,
  `roomphoto` varchar(45) NOT NULL,
  `roomprice` int NOT NULL,
  `roomtype` int NOT NULL,
  `roomcontent` varchar(100) NOT NULL,
  `roomcnt` int NOT NULL,
  `roometc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8