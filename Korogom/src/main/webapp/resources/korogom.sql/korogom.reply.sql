CREATE TABLE `reply` (
  `reno` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `bno` int NOT NULL,
  `redate` datetime NOT NULL,
  `recon` varchar(100) NOT NULL,
  `betc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reno`,`bno`,`mno`),
  KEY `fk_reply_board1_idx` (`bno`,`mno`),
  CONSTRAINT `fk_reply_board1` FOREIGN KEY (`bno`, `mno`) REFERENCES `board` (`bno`, `mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8