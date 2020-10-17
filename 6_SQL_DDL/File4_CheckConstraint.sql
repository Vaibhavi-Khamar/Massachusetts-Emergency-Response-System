
--------- INFO 6210: Database Management & Database Design -----------
-- GROUP:15 : Massachusetts Emergency Response System 
-- Team members:  Aviral Agrawal, Vaibhavi Khamar, Zichun Wang

------------------------------
-- File 4: Table-level CHECK constraint
------------------------------

USE Group_15;

                          ------- Table-level CHECK constraint based on function --------
                          
-- Create a function to check whether an emergency has been responded by any department
-- Function will return 1 if emergency has been responded by any department else 0 

CREATE FUNCTION CheckResponse (@EID varchar(30),@HID varchar(30),@FID varchar(30), @PID varchar(30))
RETURNS smallint
AS
BEGIN
   DECLARE @EmergencyCount smallint = 0;
   SELECT @EmergencyCount = COUNT(1) 
          FROM dbo.Emergency
          WHERE EID = @EID;
         
   /*
   DECLARE @EmergencyCount smallint = 0;
   SELECT @EmergencyCount = COUNT(EID) 
          FROM dbo.Emergency
          WHERE EID = @EID;
    */
         
   DECLARE @MedicalDepartmentCount smallint = 0;
   SELECT @MedicalDepartmentCount = COUNT(1) 
          FROM dbo.MedicalDepartment
          WHERE HID = @HID;
   DECLARE @FireDepartmentCount smallint = 0;
   SELECT @FireDepartmentCount = COUNT(1) 
          FROM dbo.FireDepartment
          WHERE FID = @FID;
   DECLARE @PoliceDepartmentCount smallint = 0;
   SELECT @PoliceDepartmentCount = COUNT(1) 
          FROM dbo.PoliceDepartment
          WHERE PID = @PID;
          
   RETURN (
  	CASE
  		when @EmergencyCount > 0
  		and @MedicalDepartmentCount > 0 or @FireDepartmentCount > 0 or @PoliceDepartmentCount > 0
  		then 0
  		else 1
  	END);
END;

-- alter table
ALTER TABLE dbo.Department ADD CONSTRAINT check_department_response CHECK (dbo.CheckResponse(EID,HID,FID,PID) = 0); 

-- insert into table
------ Will throw error Because passing null values to HID, FID, PID columns
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) 
values ('E99999', null, null, null, null, null, null, null, null, null);

---- Housekeeping ----
drop function CheckResponse;
drop table dbo.Department;



