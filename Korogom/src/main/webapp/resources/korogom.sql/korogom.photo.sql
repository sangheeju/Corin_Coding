CREATE TABLE `photo` (
  `phono` int NOT NULL AUTO_INCREMENT,
  `phoname` varchar(45) NOT NULL,
  `phoclass` int NOT NULL,
  `phokey` int NOT NULL,
  `phoetc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8