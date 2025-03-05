CREATE TABLE `opt_history` (
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conId` int NOT NULL,
  `time` varchar(64) NOT NULL,
  `open` float NOT NULL,
  `high` float NOT NULL,
  `low` float NOT NULL,
  `close` float NOT NULL,
  `barSizeSetting` varchar(16) NOT NULL,
  `whatTo
