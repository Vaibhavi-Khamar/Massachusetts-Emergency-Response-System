
--------- INFO 6210: Database Management & Database Design -----------
-- GROUP:15 : Massachusetts Emergency Response System 
-- Team members:  Aviral Agrawal, Vaibhavi Khamar, Zichun Wang

------------------------------
-- File 3: Views
------------------------------

USE Group_15;

-------------------------------------
-- 1. This view gives the number of emergencies (in each department) county wise
-- combining Emergency & Department

CREATE VIEW vwNoOfEmergencyInCounty
AS
select e.County, count(HID) as NoOfMedicalEmergencies, count(PID) as NoOfPoliceEmergencies, count(FID) as NoOfFireEmergencies
from dbo.Emergency e
INNER JOIN dbo.Department d
ON e.EID = d.EID
GROUP BY e.County;
------
SELECT * FROM vwNoOfEmergencyInCounty;
------
DROP VIEW vwNoOfEmergencyInCounty;

-------------------------------------
-- 2. This view provides patient details and hospital name when given an Emergency ID
-- combining Emergency, Patient & MedicalDepartment (to find out patient is in which hospital using EID) 

CREATE VIEW vwPatientDetails
AS
SELECT e.EID, e.EmergencyType, p.FirstName, p.LastName, p.Status , md.HospitalName 
FROM dbo.Emergency e
INNER JOIN dbo.Patient p
ON e.EID = p.EID
INNER JOIN dbo.MedicalDepartment md
ON p.HID = md.HID;
------
SELECT * FROM vwPatientDetails;
------
DROP VIEW vwPatientDetails;


-------------------------------------
-- 3. This view provides medical officer details when given an Emergency ID
-- combining Emergency, Department & MedicalOfficer

CREATE VIEW vwEmergencyMedicalOfficerDetails
AS
SELECT e.EID, e.EmergencyType, e.Status, mo.FirstName, mo.LastName, mo.Designation 
FROM dbo.Emergency e
INNER JOIN dbo.Department d
ON e.EID = d.EID
INNER JOIN dbo.MedicalOfficer mo
ON d.HID = mo.HID;
------
SELECT * FROM vwEmergencyMedicalOfficerDetails;
------
DROP VIEW vwEmergencyMedicalOfficerDetails;


---------------------------------------------
-- 4. This view is to obtain the vehicleID and Officer's IDs who used that vehicle

CREATE VIEW vwVehicleOfficersDetails
AS
SELECT DISTINCT v.VID,
 ISNULL( STUFF((SELECT DISTINCT ', '+ RTRIM(OID)  
       FROM dbo.MedicalOfficer
       WHERE v.VID = VID
       FOR XML PATH('')) , 1, 2, ''),'Not Applicable') AS [Medical OID], 
 ISNULL( STUFF((SELECT DISTINCT ', '+ RTRIM(OID)  
       FROM dbo.FireOfficer
       WHERE v.VID = VID
       FOR XML PATH('')) , 1, 2, ''),'Not Applicable') AS [Fire OID],
 ISNULL( STUFF((SELECT DISTINCT ', '+ RTRIM(OID)  
       FROM dbo.PoliceOfficer
       WHERE v.VID = VID
       FOR XML PATH('')) , 1, 2, ''),'Not Applicable') AS [Police OID]
FROM dbo.Vehicle v;
------
SELECT * FROM vwVehicleOfficersDetails;
------
DROP VIEW vwVehicleOfficersDetails;










