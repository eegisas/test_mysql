INSERT IGNORE INTO ib.tbl_history_count (   
  date, count, underConId, lastTradeDateOrContractMonth,    
  conRight, time, whatToShow, dateLastRunID, barSizeSetting, timeDate 
) 
SELECT 
  rTable.date, rTable.count, rTable.underConId, rTable.lastTradeDateOrContractMonth, 
  rTable.conRight, rTable.time, rTable.whatToShow, rTable.dateLastRunID, 
  rTable.barSizeSetting, STR_TO_DATE(rTable.time, '%Y%m%d') 
FROM (
  SELECT 
    NOW() AS date,
    COUNT(hist.conId) AS count,
    cnt.underConId AS underConId,
    cnt.lastTradeDateOrContractMonth AS lastTradeDateOrContractMonth,
    cnt.conRight AS conRight,
    hist.time AS time,
    hist.whatToShow AS whatToShow,
    hist.dateLastRunID AS dateLastRunID,
    hist.barSizeSetting as barSizeSetting
  FROM 
    (view_contracts_last cnt JOIN opt_history hist) 
  WHERE 
    (hist.conId = cnt.conId) AND (hist.barSizeSetting = "1 hour") 
  GROUP BY 
    cnt.underConId, cnt.lastTradeDateOrContractMonth, cnt.conRight, 
    hist.whatToShow, hist.time, hist.dateLastRunID
) AS rTable 
ON DUPLICATE KEY UPDATE 
  count = rTable.count;
