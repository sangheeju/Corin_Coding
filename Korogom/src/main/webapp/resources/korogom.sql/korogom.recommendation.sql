CREATE TABLE `recommendation` (
  `recno` int NOT NULL AUTO_INCREMENT,
  `recname` varchar(45) NOT NULL,
  `recphoto` varchar(45) NOT NULL,
  `reccon` varchar(100) NOT NULL,
  `rectime` varchar(45) NOT NULL,
  `recsite` varchar(45) DEFAULT NULL,
  `recetc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8