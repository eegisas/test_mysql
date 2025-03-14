CREATE TABLE `opt_history` (
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conId` int NOT NULL,
  `time` varchar(64) NOT NULL,
  `open` float NOT NULL,
  `high` float NOT NULL,
  `low` float NOT NULL,
  `close` float NOT NULL,
  `barSizeSetting` varchar(16) NOT NULL,
  `whatToShow` varchar(16) NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `conFilter` varchar(32) NOT NULL,
  `wap` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `id` int DEFAULT NULL,
  `intConFilter` int GENERATED ALWAYS AS (cast(left(`conFilter`,8) as unsigned)) VIRTUAL,
  `dateLastRunID` datetime DEFAULT NULL,
  `time_old` varchar(32) DEFAULT NULL,
  `rowNo` varchar(45) DEFAULT '0',
  PRIMARY KEY (`conId`,`time`,`barSizeSetting`,`whatToShow`),
  KEY `IconFilter` (`symbol`,`conFilter`(8),`dateLastRunID`,`barSizeSetting`,`whatToShow`,`conId`,`date`),
  KEY `barSize` (`barSizeSetting`(8)),
  KEY `date` (`date`),
  KEY `idIDX` (`id`),
  KEY `NumConFilter` (`symbol`,`intConFilter`,`dateLastRunID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
