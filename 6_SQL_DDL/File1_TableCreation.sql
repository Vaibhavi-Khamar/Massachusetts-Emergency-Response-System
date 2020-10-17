
--------- INFO 6210: Database Management & Database Design -----------
-- GROUP:15 : Massachusetts Emergency Response System 
-- Team members:  Aviral Agrawal, Vaibhavi Khamar, Zichun Wang

------------------------------
-- File 1: Table Creation
------------------------------

-- Imported data from CSV files in Emergency, MedicalDepartment ,FireDepartment, PoliceDepartment, Patient, Victim, Suspect, Vehicle & vehicleAssigned tables
-- Populated Department table using INSERT (P4_File1_TableCreation.sql)
-- Populated MedicalOfficer, FireOfficer & PoliceOfficer tables using INSERT (P4_File2_Encryption.sql)



CREATE DATABASE Group_15;

USE Group_15;


select * from dbo.Emergency;
select * from dbo.Vehicle;
select * from dbo.VehicleAssigned;
select * from dbo.MedicalDepartment;
select * from dbo.FireDepartment;
select * from dbo.PoliceDepartment;
select * from dbo.Patient;
select * from dbo.Victim;
select * from dbo.Suspect;
select * from dbo.MedicalOfficer;
select * from dbo.FireOfficer;
select * from dbo.PoliceOfficer;
select * from dbo.Department;


TRUNCATE TABLE dbo.MedicalOfficer; -- removes all rows from table

Drop table dbo.MedicalOfficer;
Drop table dbo.FireOfficer;
Drop table dbo.PoliceOfficer;
Drop table dbo.Patient;
Drop table dbo.Victim;
Drop table dbo.Suspect;
Drop table dbo.VehicleAssigned;
Drop table dbo.Vehicle;
Drop table dbo.Department;
Drop table dbo.MedicalDepartment;
Drop table dbo.FireDepartment;
Drop table dbo.PoliceDepartment;
Drop table dbo.Emergency;


CREATE TABLE dbo.Emergency (
	EID varchar(10) NOT NULL PRIMARY KEY, 
	EmergencyType varchar(20) NOT NULL,
	Street varchar(20),
	County varchar(20),
	ZipCode int NOT NULL,
	Status varchar(20) NOT NULL,
	DateAndTime datetime NOT NULL);
--Import data from CSV

CREATE TABLE dbo.MedicalDepartment (
	HID varchar(10) NOT NULL PRIMARY KEY, 
	HospitalName varchar(60) NOT NULL,
	County varchar(20),
	ZipCode int NOT NULL);
--Import data from CSV

CREATE TABLE dbo.FireDepartment (
	FID varchar(10) NOT NULL PRIMARY KEY, 
	County varchar(20),
	ZipCode int NOT NULL);
--Import data from CSV

CREATE TABLE dbo.PoliceDepartment (
	PID varchar(10) NOT NULL PRIMARY KEY, 
	County varchar(20),
	ZipCode int NOT NULL);
--Import data from CSV
   
CREATE TABLE dbo.Patient (
	PatID varchar(10) NOT NULL PRIMARY KEY, 
	FirstName varchar(20),
	LastName varchar(20),
	DateOfBirth date,
	County varchar(20),
	Contact varchar(20),
	Status varchar(20) NOT NULL,
	HID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.MedicalDepartment(HID),
	EID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Emergency(EID));
--Import data from CSV
	
CREATE TABLE dbo.Victim (
	VicID varchar(10) NOT NULL PRIMARY KEY, 
	FirstName varchar(20),
	LastName varchar(20),
	DateOfBirth date,
	County varchar(20),
	Contact varchar(20),
	Status varchar(20) NOT NULL,
	PID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.PoliceDepartment(PID),  
	EID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Emergency(EID));
--Import data from CSV
	
CREATE TABLE dbo.Suspect (
	SID varchar(10) NOT NULL PRIMARY KEY, 
	FirstName varchar(20),
	LastName varchar(20),
	DateOfBirth date,
	County varchar(20),
	Status varchar(20) NOT NULL,
	PID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.PoliceDepartment(PID),  
	EID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Emergency(EID)); 
--Import data from CSV

CREATE TABLE dbo.Vehicle (
	VID varchar(10) NOT NULL PRIMARY KEY, 
	Department varchar(20) NOT NULL,
	TypeOfVehicle varchar(20) NOT NULL,
	VehicleMileage int NOT NULL);
--Import data from CSV

CREATE TABLE dbo.VehicleAssigned (
	EID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Emergency(EID),
    VID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Vehicle(VID),
	CONSTRAINT PK_VehicleAssigned PRIMARY KEY CLUSTERED (EID,VID));
--Import data from CSV

CREATE TABLE dbo.MedicalOfficer (
	OID varchar(10) NOT NULL, 
	HID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.MedicalDepartment(HID),
	FirstName varchar(20),
	LastName varchar(20),
	Designation varchar(40),
	Contact varchar(20),
	DateOfBirth date,
	IdNumber VARBINARY(250) NOT NULL,
	VID varchar(10) FOREIGN KEY REFERENCES dbo.Vehicle(VID),
	CONSTRAINT PK_MedicalOfficer PRIMARY KEY CLUSTERED (OID,HID)); 

CREATE TABLE dbo.FireOfficer (
	OID varchar(10) NOT NULL, 
	FID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.FireDepartment(FID),
	FirstName varchar(20),
	LastName varchar(20),
	Designation varchar(40),
	Contact varchar(20),
	DateOfBirth date,
	IdNumber VARBINARY(250) NOT NULL,
	VID varchar(10) FOREIGN KEY REFERENCES dbo.Vehicle(VID),
	CONSTRAINT PK_FireOfficer PRIMARY KEY CLUSTERED (OID,FID));  

CREATE TABLE dbo.PoliceOfficer (
	OID varchar(10) NOT NULL, 
	PID varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.PoliceDepartment(PID),
	FirstName varchar(20),
	LastName varchar(20),
	Designation varchar(40),
	Contact varchar(20),
	DateOfBirth date,
	IdNumber VARBINARY(250) NOT NULL,
	VID varchar(10) FOREIGN KEY REFERENCES dbo.Vehicle(VID),
	CONSTRAINT PK_PoliceOfficer PRIMARY KEY CLUSTERED (OID,PID)); 
       
CREATE TABLE dbo.Department (
	 EID varchar(10) FOREIGN KEY REFERENCES dbo.Emergency(EID),
	 HID varchar(10) FOREIGN KEY REFERENCES dbo.MedicalDepartment(HID),
	 FID varchar(10) FOREIGN KEY REFERENCES dbo.FireDepartment(FID),
	 PID varchar(10) FOREIGN KEY REFERENCES dbo.PoliceDepartment(PID),
	 MedicalResponseDateTime datetime,
	 M_responseTime TIME,
	 FireResponseDateTime datetime,
	 F_responseTime TIME,
	 PoliceResponseDateTime datetime,
	 P_responseTime TIME,
	 CONSTRAINT PK_Department PRIMARY KEY CLUSTERED (EID));
	
	
-- INSERT into Department table
-- (insert data into Department table after inserting data into Emergency, MedicalDepartment, FireDepartment & PoliceDepartment tables)
																					  
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E50995', 'H49053', 'F61701', 'P64645', '9/21/19 20:29', null, '9/21/19 20:24', null, '9/21/19 20:28', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E73070', null, 'F36066', null, null, null, '8/5/19 17:06', null, null, null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E30949', 'H96358', null, 'P20262', '12/3/19 11:13', null, null, null, '12/3/19 11:20', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E91202', null, 'F50336', 'P75955', null, null, '12/23/19 16:22', null, '12/23/19 16:31', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E79195', 'H96358', null, null, '3/12/20 19:38', null, null, null, null, null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E91050', null, null, 'P06404', null, null, null, null, '1/7/20 21:16', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E39260', null, null, 'P18995', null, null, null, null, '12/15/19 17:32', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E08935', 'H77456', null, 'P06404', '5/23/20 23:39', null, null, null, '5/23/20 23:46', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E53868', 'H08529', null, 'P20262', '9/15/19 22:13', null, null, null, '9/15/19 22:20', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E42405', 'H57360', null, 'P74541', '6/21/20 4:26', null, null, null, '6/21/20 4:21', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E27804', 'H32139', null, 'P37542', '9/7/19 15:09', null, null, null, '9/7/19 15:11', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E02841', null, null, 'P48280', null, null, null, null, '1/25/20 14:00', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E12243', null, null, 'P92890', null, null, null, null, '10/17/19 1:59', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E44334', 'H77456', null, 'P18995', '7/24/20 17:42', null, null, null, '7/24/20 17:23', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E47086', 'H16048', 'F51693', null, '5/15/20 9:35', null, '5/15/20 9:26', null, null, null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E02517', 'H43387', null, 'P17107', '4/1/20 17:27', null, null, null, '4/1/20 17:29', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E22958', 'H57360', null, 'P83723', '2/27/20 19:11', null, null, null, '2/27/20 19:07', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E01686', 'H32139', null, 'P78513', '5/18/20 12:03', null, null, null, '5/18/20 12:04', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E48944', 'H17095', null, 'P61193', '8/15/19 7:35', null, null, null, '8/15/19 7:35', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E49841', null, 'F39770', 'P48280', null, null, '12/22/19 23:44', null, '12/22/19 23:38', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E32140', 'H78113', 'F93476', 'P37542', '1/28/20 19:56', null, '1/28/20 19:48', null, '1/28/20 19:59', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E99087', null, null, 'P93753', null, null, null, null, '9/2/19 13:32', null);
insert into dbo.Department (EID, HID, FID, PID, MedicalResponseDateTime, M_responseTime, FireResponseDateTime, F_responseTime, PoliceResponseDateTime, P_responseTime) values ('E34909', 'H60660', null, null, '10/20/19 2:33', null, null, null, null, null);
											  
