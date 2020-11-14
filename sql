# LEN() function
SELECT LEN(column1) AS len_of_string_in_a_column
-- returns the length of the string

# CHARINDEX() function
SELECT CHARNDEX('string to find', 'The whole sentence or column', [start index of in the whole sentence that you want to search])
SELECT CHARINDEX('apple', 'There are 2 apples on the apple tree', 20) -- returns the index of the 2nd apple

# PATINDEX() funtion 
-- deals with pattern, similar to regular expression
SELECT PATINDEX('%pattern%', expression, [location])
-- % = match any string of any length
-- _ = match a single character
-- [] = match on any character in the [] bracket, e.g. [abc] means match with either a or b or c
-- Example: PATINDEX('%chocolate%', column1) PATINDEX('%ch_c%', column1)

# LOWER() and UPPER() function

# LEFT() and RIGHT() function
SELECT LEFT(column1, 3) FROM table1

# LTRIM() and RTRIM() function
-- removes the leading blanks in the string

# REPLACE() function
SELECT REPLACE('This is a sample stirng to replace', 'replace', 'be replaced.') AS replace_example

# SUBSTRING() function
SELECT SUBSTRING('1234567', 5, 3) -- returns '567'

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

# SWITCHOFFSET function
SELECT
SWITCHOFFSET(@var, '-03:00') AS new_colume

# TODATETIMEOFFSET function
SELECT
TODATETIMEOFFSET(@datetime, '-07:00') AS new_col 
-- nominate new timezone, for datetime object without timezone

# DATENAME function
SELECT 
DATENAME(month, @datevar) AS month_name;
-- month, weekday, etc.

# ISDATE function
SELECT
ISDATE(@datevar1) AS valid_date;
-- return 1 if @datevar = date, time, datetime, return 0 if datetime2 or other non-datetime format

# SET DATEFORMAT function
SET DATEFORMAT {dmy} -- can also use SET LANGUAGE {Engligh/ French} (which implies datet format)
-- valid formats include: mdy, dmy, ymd, ydm, myd, dym
SELECT ISDATE(@datevar2) AS evaluate_valid;

# TRY_CONVERT funtion
SELECT
TRY_CONVERT(datetime2(3), @var) AS new_col

# CAST function
WHERE CAST([date_string] AS date) = DATEADD(d, -1, GETDATE())
-- date that match yesterday

# TRY_PARSE function
SELECT
TRY_PARSE(@var AS date USING 'fr-fr')
--

# user-defined function (reduce execution time/ network traffic, allow modular programming)
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

# execute user-defined function
EXEC @variablename = dbo.FunctionName @param = ''
SELECT
    '',
    @variablename

# alter function
ALTER FUNCTION FunctionName (@VariableName AS datetime = '1/01/2017')
-- CREATE OR ALTER FUNCTION FunctionName (@VariableName AS datetime = '1/01/2017')
RETURN TABLE AS RETURN
SELECT
    colname1 as col1
    , measurement2 as col2
    , measurement3 as col3
FROM tablename
WHERE CAST(colname4 AS date) = @VariableName
GROUP BY colname1

# drop function
DROP FUNCTION dbo.FunctionName

# stored procedures (reduce execution time, network traffic, allow modular programming, improve security)
-- 
CREATE PROCEDURE dbo.UniqueProcedureName(
    @var1 date,
    @var2 numeric(18, 0),
    @var3 numeric OUTPUT ) -- can be any data type (except table), can have multiple outputs per stored procedure
        -- output parameters should not be used to communicate errors
AS 
-- SET NOCOUNT ON
BEGIN
INSERT INTO dbo.TableName() -- UPDATE dbo.TableName SET ColName = @var1
VALUES (@var1, @var2)
--
-- RETURN -- return values can only return integer data types, only 1 return value is allowed
END;

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


# check datatype of a column
USE [dbname]
SELECT data_type
FROM information_schema.columns
WHERE table_name = ''
    AND column_name = ''
-- returns data type

# SQL formatting
-- Use UPPER CASE for all SQL syntax 
-- create a new line for each Major processing syntax such as SELECT, FROM, WHERE
-- indent for sub-queries, ON, AND/OR conditions
-- avoid long single lines of code such as multiple column names
-- complete the query with simi-colon (;)
-- alias with AS
-- use commenting blocks /* you can insert multiple lines here  */ for multiple lines or -- for single line

# SSMS shortcut
-- Ctrl + K & Ctrl + C (make a line to be a comment)
-- Ctrl + K & Ctrl + U (make a line to be a command)
-- Ctrl + E (execute only sections selected)

