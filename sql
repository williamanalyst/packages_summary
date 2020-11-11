# Get the current datetime from SQL Server
SELECT GETDATE() 
-- return current datetime

# Declare variables in SQL Server
DECLARE @currentdatetime AS datetime
-- set datatype (can be either single value or table) when declare variable
SET @currentdatetime = GETDATE()
-- assign value to variable
SELECT @currentdatetime

# DATEADD function
SELECT DATEADD(day, 1, '2020-11-12') -- can use day/week/month,etc.
SELECT DATEADD(d, -1, GETDATE())
-- choose unit of days, number of units and the starting date
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) -- get the date of the first day in the current month

# DATEDIFF function
SELECT DATEDIFF(day, '2020-11-12', '2012-12-24')

# CAST function
WHERE CAST([date_string] AS date) = DATEADD(d, -1, GETDATE())
-- date that match yesterday

# user defined function (reduce execution time/ network traffic, allow modular programming)
CREATE FUNCTION udf()
  RETURNS date AS BEGIN













