CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `mno` int NOT NULL,
  `bdate` datetime NOT NULL,
  `btitle` varchar(45) NOT NULL,
  `bcon` text NOT NULL,
  `bcnt` int NOT NULL,
  `bscore` int DEFAULT NULL,
  `bsort` int NOT NULL,
  `betc` varchar(45) DEFAULT NULL,
  `refno` int DEFAULT NULL,
  PRIMARY KEY (`bno`,`mno`),
  KEY `fk_board_member1_idx` (`mno`),
  CONSTRAINT `fk_board_member1` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8