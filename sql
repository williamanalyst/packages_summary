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
CREATE FUNCTION udf(@var1 date, @var2 numeric)
    RETURNS numeric AS -- set data type that will be returned
BEGIN -- begin function
RETURN (
SELECT SUM(DATEDIFF(second, [col1], [col2]))/ 3600 
FROM [dbname].[dbo].[tbname]
WHERE CONVERT(date, [date1]) = @var1
AND [col3] = @var2
) -- actual function
END; -- end function
-- 

#
BEGIN TRY
END TRY
--
BEGIN CATCH
END CATCH


# triggers in SQL (Data Manipulatio: INSERT/UPDATE/DELETE, Data Definition: CREATE/ALTER/DROP, Logon: LOGON events)
# trigger is a SQL Server Object
-- AFTER trigger
-- INSTEAD OF trigger (prevent from execution)
CREATE TRIGGER
ON [prod_table] -- link to a table
AFTER INSERT -- or INSTEAD OF INSERT (INSTEAD OF an action)
AS -- the beginning of the trigger workflow
PRINT('');

# system error message
SELECT TOP(10) * FROM sys.messages -- shows message id, message content, severity level, etc.
-- (level: error 0-10 are informational messages, 11-16 are errors that can be corrected by the user, such as constraint violation, 
    -- 17-24 are other errors such as software problems)
-- (state: 1 if SQL Server displays error, 0-25 to rasie own errors)
-- (line: indicates in which line did the error occur)

# raise own error
IF NOT EXIST (SELECT * FROM table1 WHERE id = 11)
    RAISEERROR('Insert your own error message here', )





# SQL formatting
-- Use UPPER CASE for all SQL syntax 
-- create a new line for each Major processing syntax such as SELECT, FROM, WHERE
-- indent for sub-queries, ON, AND/OR conditions
-- avoid long single lines of code such as multiple column names
-- complete the query with simi-colon (;)
-- alias with AS
-- use commenting blocks /* you can insert multiple lines here  */ for multiple lines or -- for single line
