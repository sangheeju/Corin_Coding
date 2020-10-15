CREATE TABLE `pet` (
  `pno` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `pdiv` int NOT NULL,
  `pname` varchar(45) NOT NULL,
  `pbirth` int DEFAULT NULL,
  `pnum` int DEFAULT NULL,
  `pdel` int NOT NULL,
  `petc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pno`,`mno`),
  KEY `fk_pet_member_idx` (`mno`),
  CONSTRAINT `fk_pet_member` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8