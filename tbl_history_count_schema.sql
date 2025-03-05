CREATE TABLE `tbl_history_count` (
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` int NOT NULL,
  `underConId` int NOT NULL,
  `lastTradeDateOrContractMonth` int NOT NULL,
  `conRight` varchar(24) NOT NULL,
  `time` varchar(32) NOT NULL,
  `whatToShow` varchar(16) NOT NULL,
  `dateLastRunID` datetime NOT NULL,
  `barSizeSetting` varchar(16) DEFAULT NULL,
  `timeDate` date DEFAULT NULL,
  PRIMARY KEY (`underConId`, `lastTradeDateOrContractMonth`, `conRight`, `time`, `whatToShow`, `dateLastRunID`),
  KEY `timeDateIDX` (`timeDate`) /*!80000 INVISIBLE */,
  KEY `timeIDX` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
