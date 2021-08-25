DROP TABLE IF EXISTS `commander_articles`;
CREATE TABLE IF NOT EXISTS `commander_articles` (
  `codart` int(10),
  `qte` int(10),
  `date` datetime,
  PRIMARY KEY (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;