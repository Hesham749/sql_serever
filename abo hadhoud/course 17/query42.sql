USE VehicleMakesDB


-- Get a table of unique Engine_CC and calculate tax per Engine CC as follows:
-- 0 to 1000    Tax = 100
-- 1001 to 2000 Tax = 200
-- 2001 to 4000 Tax = 300
-- 4001 to 6000 Tax = 400
-- 6001 to 8000 Tax = 500
-- Above 8000   Tax = 600
-- Otherwise    Tax = 0

SELECT DISTINCT v.Engine_CC , CASE WHEN Engine_CC BETWEEN 0 AND 1000 THEN 100
 WHEN  Engine_CC BETWEEN 1001 AND 2000 THEN 200
 WHEN  Engine_CC BETWEEN 2001 AND 4000 THEN 300
 WHEN  Engine_CC BETWEEN 4001 AND 6000 THEN 400
 WHEN  Engine_CC BETWEEN 6001 AND 8000 THEN 500
 WHEN  Engine_CC > 8000 THEN 600
 ELSE 0
 END AS Tax
FROM VehicleDetails AS v
ORDER BY Engine_CC