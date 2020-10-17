
--------- INFO 6210: Database Management & Database Design -----------
-- GROUP:15 : Massachusetts Emergency Response System 
-- Team members:  Aviral Agrawal, Vaibhavi Khamar, Zichun Wang

------------------------------
-- File 5: Computed Columns
------------------------------

USE Group_15;

											------ METHOD - 1 ------

								------- Computed Columns based on Trigger --------

-- Trigger to get response time of each department using department and emergency table

CREATE TRIGGER responsetime
ON dbo.department
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT on;
        UPDATE dbo.Department
        SET M_responseTime = d.MedicalResponseDateTime -  e.DateAndTime
        FROM dbo.department d JOIN dbo.emergency e ON d.EID = e.EID
        where d.MedicalResponseDateTime IS NOT NULL
        
        UPDATE dbo.Department
        SET F_responseTime = d.FireResponseDateTime -  e.DateAndTime
        FROM dbo.department d JOIN dbo.emergency e ON d.EID = e.EID
        where d.FireResponseDateTime IS NOT NULL

        UPDATE dbo.Department
        SET P_responseTime = d.PoliceResponseDateTime -  e.DateAndTime
        FROM dbo.department d JOIN dbo.emergency e ON d.EID = e.EID
        where d.PoliceResponseDateTime IS NOT NULL
END;


--test trigger
update dbo.Department
SET MedicalResponseDateTime =DATEADD(MINUTE,1,MedicalResponseDateTime)
WHERE EID = 'E01686';

select * from dbo.Department;

---- Housekeeping ----
DROP TRIGGER responsetime;

ALTER TABLE dbo.Department
DROP COLUMN M_responseTime, F_responseTime, P_responseTime;



									  ------ METHOD - 2 ------
									  
                          ------- Computed Columns based on Functions --------
                          
-- To get response time based on calculated columns using functions 

CREATE FUNCTION mresponse(@eid VARCHAR(10))
RETURNS TIME   
AS 
    BEGIN
    DECLARE @response DATETIME = (select d.MedicalResponseDateTime - e.DateAndTime
                        from dbo.Department d JOIN dbo.Emergency e on   d.EID=e.EID
                        where d.EID=@eid);
    --SET @response = ISNULL(@response, 0)
    RETURN @response;
    END;

--
CREATE FUNCTION fresponse(@eid VARCHAR(10))
RETURNS TIME   
AS 
    BEGIN
    DECLARE @response DATETIME = (select d.FireResponseDateTime - e.DateAndTime
                        from dbo.Department d JOIN dbo.Emergency e on   d.EID=e.EID
                        where d.EID=@eid);
    --SET @response = ISNULL(@response, 0)
    RETURN @response;
    END;
   
--
CREATE FUNCTION presponse(@eid VARCHAR(10))
RETURNS TIME   
AS 
    BEGIN
    DECLARE @response DATETIME = (select d.PoliceResponseDateTime - e.DateAndTime
                        from dbo.Department d JOIN dbo.Emergency e on   d.EID=e.EID
                        where d.EID=@eid);
    --SET @response = ISNULL(@response, 0)
    RETURN @response;
    END;

    
---- alter tables ----
ALTER TABLE dbo.Department
ADD mresponsetime AS (dbo.mresponse(EID));


ALTER TABLE dbo.Department
ADD fresponsetime AS (dbo.fresponse(EID));


ALTER TABLE dbo.Department
ADD presponsetime AS (dbo.presponse(EID));

select * from dbo.Department;


---- Housekeeping ----
ALTER TABLE dbo.Department
drop COLUMN mresponsetime, fresponsetime, presponsetime;

DROP FUNCTION mresponse;
DROP FUNCTION presponse;
DROP FUNCTION fresponse;

drop table dbo.Department;



