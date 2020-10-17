
--------- INFO 6210: Database Management & Database Design -----------
-- GROUP:15 : Massachusetts Emergency Response System 
-- Team members:  Aviral Agrawal, Vaibhavi Khamar, Zichun Wang

------------------------------
-- File 2: Table Encryption
------------------------------



USE Group_15;

											-------- Column Data Encryption --------
											
-- Encrypting Identification Numbers of Officers and Insering Data into the FireOfficer, MedicalOfficer & PoliceOfficer.

-- DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

-- certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Officer Test Certificate',
EXPIRY_DATE = '2026-10-31';

-- symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

/*
-- Create/alter a table
-- VARBINARY as the data type for the encrypted column
ALTER TABLE dbo.FireOfficer 
ALTER COLUMN IdNumber VARBINARY(250);
*/

-- INSERT into FireOfficer table :
-- CONVERT to convert the plain data to VARBINARY
 	
insert into dbo.FireOfficer (OID, FID, FirstName, LastName, Designation, Contact, DateOfBirth, IdNumber, VID) 
values ('OF29339', 'F29004', 'Danny', 'Scurman', 'Fire Chief', '743-220-8860', '11/21/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R45637')), 'V23508'),
('OF79987', 'F08927', 'Wynn', 'McKirton', 'Driver Engineer', '718-678-8570', '11/17/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C57637')), 'V49762'),
('OF60823', 'F14181', 'Rufe', 'Lowden', 'Paramedic', '855-248-0282', '12/27/1994', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D76589')), 'V49762'),
('OF19712', 'F61701', 'Lennard', 'Coonan', 'Fire Chief', '331-938-6591', '1/14/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G76889')), 'V79709'),
('OF79301', 'F78729', 'Georgie', 'Stiegar', 'Fire Chief', '722-548-9233', '9/27/1970', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H76589')), 'V49762'),
('OF80968', 'F61701', 'Brennen', 'Livard', 'Fire Chief', '882-530-1715', '5/18/2000', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y78589')), 'V99791'),
('OF73108', 'F29004', 'Marchall', 'Winwood', 'Captain', '590-306-7534', '6/17/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H67589')), 'V99791'),
('OF15367', 'F38809', 'Dasya', 'Hulkes', 'Captain', '797-262-3261', '6/20/1984', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U76789')), 'V77541'),
('OF77669', 'F07200', 'Hansiain', 'Tother', 'Volunteer firefighter', '452-932-3669', '12/24/1964', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U67589')), 'V96036'),
('OF00551', 'F51693', 'Prent', 'Allred', 'Captain', '230-503-2523', '7/4/1968', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O89589')), 'V54205'),
('OF42573', 'F97684', 'Merrily', 'Caddick', 'Probationary firefighter', '219-239-0299', '7/8/1974', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D43589')), 'V49762'),
('OF89661', 'F30361', 'Lucina', 'Mulleary', 'Paramedic', '384-592-4243', '6/24/1965', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D87589')), 'V99791'),
('OF83452', 'F08927', 'Solomon', 'Treanor', 'Assistant Chief', '701-615-5511', '9/2/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G34589')), 'V79709'),
('OF75659', 'F14181', 'Artie', 'Rotherham', 'Volunteer firefighter', '394-182-5172', '5/10/1972', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U10589')), 'V32244'),
('OF26381', 'F30361', 'Dickie', 'Mattheeuw', 'Paramedic', '430-632-6490', '11/19/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D76545')), 'V79709'),
('OF48174', 'F78729', 'Isadore', 'Gaspar', 'Captain', '857-399-3859', '10/25/1983', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y76560')), 'V92077'),
('OF37250', 'F93476', 'Ronni', 'Bernardoux', 'Probationary firefighter', '739-356-2788', '1/29/1988', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'A76669')), 'V23508'),
('OF36569', 'F39770', 'Meredeth', 'Mallalieu', 'Driver Engineer', '868-826-6724', '10/26/1974', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'W76389')), 'V92077'),
('OF67339', 'F51693', 'Hort', 'Juggins', 'EMT', '327-338-6661', '2/2/1966', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'A76589')), 'V77541'),
('OF02081', 'F50336', 'Garvin', 'Weedall', 'Volunteer firefighter', '236-476-6989', '9/8/1999', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'F45678')), 'V23508'),
('OF24986', 'F14181', 'Yul', 'Hegarty', 'Probationary firefighter', '365-941-0222', '2/7/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K75634')), 'V62029'),
('OF13835', 'F14181', 'Gwenni', 'Hucke', 'Captain', '401-476-7192', '6/6/1973', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L64574')), 'V79709'),
('OF45075', 'F97684', 'Roosevelt', 'Searson', 'Volunteer firefighter', '700-795-6042', '9/11/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C34165')), 'V49762'),
('OF78049', 'F38809', 'Elladine', 'Ewols', 'Battalion Chief', '345-992-0892', '5/7/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54702')), 'V49762'),
('OF52078', 'F09054', 'Rufe', 'Feldberg', 'Assistant Chief', '824-685-4939', '11/28/1967', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'N89567')), 'V62029'),
('OF68234', 'F14181', 'Ronny', 'Sibbet', 'Captain', '117-442-8729', '8/4/1981', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J34500')), 'V70948'),
('OF69448', 'F07200', 'Ethelyn', 'Sutliff', 'Captain', '908-557-6172', '5/11/1970', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Q23156')), 'V77541'),
('OF99724', 'F50336', 'Elvis', 'Wurz', 'Driver Engineer', '799-114-3223', '9/4/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H67458')), 'V92077'),
('OF72191', 'F29004', 'Tasha', 'Tiddeman', 'Assistant Chief', '127-852-1438', '3/1/1972', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K86593')), 'V96036'),
('OF85512', 'F61701', 'Curry', 'Dimberline', 'Probationary firefighter', '541-479-2528', '2/8/1990', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L96784')), 'V54205'),
('OF05388', 'F51693', 'Corri', 'Frenchum', 'Driver Engineer', '843-251-1650', '3/24/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O84699')), 'V54205'),
('OF58261', 'F78729', 'Berty', 'Ryle', 'Assistant Chief', '107-764-3534', '8/26/1987', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G35467')), 'V70948'),
('OF10291', 'F50336', 'Denney', 'Gaskin', 'EMT', '511-216-9108', '4/11/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'M65748')), 'V23508'),
('OF72687', 'F36066', 'Ofella', 'Madrell', 'Driver Engineer', '750-237-8837', '2/14/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L75638')), 'V75974'),
('OF47299', 'F38809', 'Ardine', 'Frohock', 'Lieutenant', '197-928-9681', '11/8/1967', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D24564')), 'V62029'),
('OF36452', 'F36066', 'Ferd', 'Parysiak', 'Fire Chief', '539-911-9206', '11/17/1974', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y64904')), 'V49762'),
('OF73870', 'F61701', 'Inge', 'Swithenby', 'Battalion Chief', '560-333-2302', '4/30/1963', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'I65808')), 'V32244'),
('OF94183', 'F30361', 'Meggy', 'Matkin', 'Paramedic', '730-327-7608', '11/3/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J46290')), 'V92077'),
('OF15099', 'F97684', 'Mohammed', 'McPeck', 'Probationary firefighter', '419-806-8488', '1/3/1966', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L64830')), 'V99791'),
('OF86011', 'F97684', 'Coleman', 'Brumham', 'Lieutenant', '692-453-6855', '10/29/1996', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K57809')), 'V96036'),
('OF79175', 'F50336', 'Thom', 'Duley', 'Captain', '608-707-9836', '8/18/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S23574')), 'V77541'),
('OF82805', 'F82210', 'Doy', 'O''Donoghue', 'Driver Engineer', '718-699-3375', '8/26/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'F43687')), 'V62029'),
('OF65419', 'F36066', 'Felicdad', 'Giacoppoli', 'Driver Engineer', '134-614-2802', '3/30/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J55643')), 'V32244'),
('OF24137', 'F07200', 'Wyatan', 'Bovis', 'Battalion Chief', '558-253-0582', '12/6/1966', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T67008')), 'V62029'),
('OF26724', 'F82210', 'Lilyan', 'Scarsbrick', 'Probationary firefighter', '462-905-3992', '3/17/1961', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O63743')), 'V62029'),
('OF37455', 'F97684', 'Essie', 'Clutton', 'Paramedic', '783-577-6874', '7/4/1997', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J73600')), 'V99791'),
('OF08429', 'F93476', 'Trudy', 'Feenan', 'Battalion Chief', '640-788-9262', '3/28/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K80444')), 'V54205'),
('OF96160', 'F93476', 'Hervey', 'Ilyunin', 'Driver Engineer', '408-696-6241', '4/17/1993', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L53738')), 'V75974'),
('OF05781', 'F08927', 'Tobias', 'Simonutti', 'Volunteer firefighter', '922-675-5899', '12/29/1996', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S32452')), 'V32244'),
('OF61175', 'F09054', 'Baron', 'Laurentino', 'Driver Engineer', '635-197-0494', '8/8/1974', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G65775')), 'V23508');


-- 
select * from dbo.FireOfficer;

-- DecryptByKey to decrypt the encrypted data
select OID, FID, FirstName, LastName, Designation, DecryptByKey(IdNumber) from FireOfficer;

-- Also use CONVERT to convert the decrypted data to VARCHAR so that we can see the plain passwords
select OID, FID, FirstName, LastName, Designation, convert(varchar, DecryptByKey(IdNumber)) from FireOfficer;

----------------------------------------------------------------------------------------------------- 

--INSERT into MedicalOfficer table :

insert into dbo.MedicalOfficer (OID, HID, FirstName, LastName, Designation, Contact, DateOfBirth, IdNumber, VID) 
values ('OH21270', 'H90512', 'Iseabal', 'Chaffey', 'Physician', '799-781-9633', '4/23/1961', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R45637')), null),
('OH68074', 'H16048', 'Artemas', 'Bagworth', 'Surgeon', '155-887-2768', '3/5/1988', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G46573')), null),
('OH61408', 'H17451', 'Adolf', 'Stamp', 'Genetic Counselor', '848-784-0456', '11/9/1984', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T54633')), null),
('OH28647', 'H33881', 'Zane', 'Mullen', 'Nurse', '227-403-7365', '6/23/2000', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y35221')), 'V77115'),
('OH78431', 'H90512', 'Brenden', 'Jeacock', 'Orthopedic', '722-595-7178', '8/9/1973', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H65744')), 'V13550'),
('OH34755', 'H07687', 'Whitney', 'Poleykett', 'Surgeon', '516-683-8790', '5/20/1993', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J78966')), null),
('OH29519', 'H90512', 'Moss', 'Ghelarducci', 'Cardiovascular Technologist', '927-510-2787', '1/20/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K75644')), null),
('OH58147', 'H16048', 'Prescott', 'Kaaskooper', 'Physician', '912-288-3626', '2/13/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L75644')), null),
('OH87924', 'H96358', 'Tobit', 'Gelletly', 'Surgeon', '826-968-4632', '5/7/1982', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H65777')), 'V01023'),
('OH89549', 'H70607', 'Leela', 'Bothams', 'Genetic Counselor', '119-473-8348', '1/29/1987', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S43522')), null),
('OH98085', 'H17095', 'Val', 'Ouldcott', 'Nurse', '339-573-7464', '6/2/1969', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'A32411')), null),
('OH67197', 'H08529', 'Corny', 'Aldam', 'Cardiovascular Technologist', '768-545-3662', '6/10/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J75900')), 'V01023'),
('OH16035', 'H70607', 'Steward', 'Collimore', 'Genetic Counselor', '589-117-3592', '8/6/1995', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L54632')), 'V25273'),
('OH75689', 'H07687', 'Hyman', 'Belcham', 'Physician', '358-365-1722', '11/12/1995', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B65734')), null),
('OH46278', 'H32139', 'Cchaddie', 'Sawfoot', 'Orthopedic', '365-961-3563', '11/27/1963', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C43523')), 'V77115'),
('OH70974', 'H32139', 'Lind', 'Woolen', 'Orthopedic', '624-190-6332', '7/8/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54632')), null),
('OH56041', 'H49053', 'Justis', 'Robic', 'Nurse', '126-638-8891', '9/29/1966', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'X32455')), null),
('OH77537', 'H78113', 'Almeta', 'Sneaker', 'Audiologist', '632-973-5556', '7/17/1996', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S23443')), 'V60993'),
('OH40772', 'H78113', 'Tulley', 'Myner', 'Cardiovascular Technologist', '674-105-7303', '12/22/1997', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'M65455')), 'V50384'),
('OH73911', 'H17095', 'Florrie', 'Humblestone', 'Genetic Counselor', '642-347-7844', '2/15/1968', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '786554')), 'V21994'),
('OH61516', 'H77456', 'Phillis', 'Seyfart', 'Audiologist', '682-705-5316', '11/23/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'K86453')), null),
('OH45918', 'H32139', 'Alana', 'Swaile', 'Nurse', '640-640-0329', '8/26/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y54609')), null),
('OH23887', 'H33881', 'Ron', 'Hastelow', 'Genetic Counselor', '555-889-0535', '11/11/1994', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D53443')), 'V98237'),
('OH56096', 'H08317', 'Nissy', 'Barhams', 'Audiologist', '301-440-1574', '9/18/1962', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54632')), null),
('OH39371', 'H90512', 'Stephie', 'Haslewood', 'Physician', '992-433-0291', '9/27/1968', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'W21322')), 'V60993'),
('OH11453', 'H32139', 'Callida', 'Brandacci', 'Audiologist', '719-683-4484', '7/12/1982', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'M75644')), 'V07117'),
('OH75749', 'H08317', 'Valry', 'Stronge', 'Nurse', '295-696-5779', '8/23/1983', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B746758')), 'V50384'),
('OH91428', 'H96358', 'Florri', 'Kahan', 'Genetic Counselor', '595-194-6572', '1/17/1998', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T21446')), null),
('OH61464', 'H57360', 'Lucine', 'Christou', 'Cardiovascular Technologist', '848-845-1177', '12/9/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L75885')), 'V98237'),
('OH43654', 'H17451', 'Melitta', 'Sawday', 'Audiologist', '125-579-4011', '7/14/1962', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O65750')), 'V60993'),
('OH07537', 'H19634', 'Etta', 'Howarth', 'Physician', '791-379-4264', '6/11/1998', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'E32433')), null),
('OH01043', 'H07687', 'Katherina', 'Sarsfield', 'Audiologist', '539-144-9947', '3/22/1970', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'F64567')), 'V07117'),
('OH15139', 'H41348', 'Mohandis', 'Chetter', 'Physician', '367-344-7368', '5/25/1995', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54765')), 'V13550'),
('OH30993', 'H08317', 'Aura', 'Simoens', 'Orthopedic', '176-161-3631', '5/25/1984', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G65766')), null),
('OH63911', 'H19634', 'Aldon', 'McAlindon', 'Nurse', '364-273-2769', '11/29/1961', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'E43566')), null),
('OH57267', 'H60660', 'Winifred', 'Renac', 'Physician', '566-848-0541', '1/31/1968', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O85760')), null),
('OH69425', 'H08529', 'Holmes', 'Birtle', 'Surgeon', '762-527-6234', '11/25/1965', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Z32433')), null),
('OH26597', 'H17451', 'Aldin', 'Raulstone', 'Nurse', '316-706-8610', '7/13/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R53466')), 'V52356'),
('OH90362', 'H17451', 'Napoleon', 'Gynn', 'Nurse', '214-249-6557', '9/4/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L87363')), null),
('OH20711', 'H17451', 'Ricki', 'Walewski', 'Audiologist', '873-727-2959', '11/11/1965', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C43555')), 'V95969'),
('OH79585', 'H17451', 'Maybelle', 'Dade', 'Physician', '741-372-8298', '2/25/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'H65799')), null),
('OH98230', 'H70607', 'Otho', 'Deschelle', 'Physician', '205-693-9296', '3/22/1999', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L90877')), 'V25273'),
('OH89628', 'H96358', 'Jarrett', 'Piddlesden', 'Surgeon', '836-163-9030', '4/28/1995', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Z43544')), null),
('OH27840', 'H60660', 'Tracie', 'Glashby', 'Orthopedic', '145-523-9504', '4/15/1969', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'R54655')), 'V50384'),
('OH94232', 'H17095', 'Barrie', 'Gini', 'Genetic Counselor', '289-425-3761', '7/31/1982', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J65743')), null),
('OH53624', 'H49053', 'Sada', 'Yanyshev', 'Physician', '117-913-7166', '12/30/1982', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Q64476')), null),
('OH98039', 'H17451', 'Adelice', 'Vallens', 'Audiologist', '880-980-4289', '10/21/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'I87123')), null),
('OH37779', 'H43387', 'Binny', 'Braybrooks', 'Nurse', '865-187-8174', '9/14/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'M78088')), null),
('OH55934', 'H60660', 'Tannie', 'Playfoot', 'Audiologist', '241-983-4083', '3/15/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T54643')), 'V07377'),
('OH09152', 'H70607', 'Kit', 'MacCard', 'Surgeon', '880-213-2640', '2/9/1990', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U65732')), null);

-- 
select * from dbo.MedicalOfficer;
select OID, HID, FirstName, LastName, Designation, convert(varchar, DecryptByKey(IdNumber)) from MedicalOfficer;


-----------------------------------------------------------------------------------------------------

--INSERT into PoliceOfficer table :

insert into dbo.PoliceOfficer (OID, PID, FirstName, LastName, Designation, Contact, DateOfBirth, IdNumber, VID) 
values ('OP04315', 'P74541', 'Heath', 'St Ledger', 'Assistant commissioner', '442-952-7718', '5/16/1965', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S76599')), 'V06845'),
('OP99677', 'P83723', 'Zared', 'Peppard', 'Inspector-general of police', '932-680-5038', '7/22/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J75688')), null),
('OP95975', 'P93753', 'Madelon', 'Stoute', 'Inspector', '404-455-8048', '5/18/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O87094')), 'V16159'),
('OP01468', 'P93753', 'Rriocard', 'Courage', 'Corporal', '472-931-5429', '6/7/1999', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T34232')), 'V27814'),
('OP97703', 'P61193', 'Josey', 'Bielefeld', 'Inspector-general of police', '975-302-1405', '3/6/1998', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G54633')), null),
('OP20176', 'P75955', 'Carolyn', 'Gilstoun', 'Sergeant', '130-332-4762', '8/7/1974', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T54633')), 'V61447'),
('OP55244', 'P37542', 'Rustin', 'Londors', 'Deputy superintendent of police', '984-440-0209', '2/4/1981', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C45211')), 'V36509'),
('OP30756', 'P78513', 'Nevsa', 'Banaszczyk', 'Director general of police', '612-920-2859', '10/17/1970', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Z35477')), null),
('OP64558', 'P48280', 'Heall', 'Witherdon', 'Assistant commissioner', '484-239-9453', '8/30/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'N78506')), null),
('OP52303', 'P92890', 'Dougie', 'Ivanovic', 'captain', '298-136-1805', '7/27/1989', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L75098')), 'V55462'),
('OP24527', 'P06404', 'Carrissa', 'Vyse', 'Inspector', '886-701-1121', '4/26/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J70042')), 'V16938'),
('OP54330', 'P30624', 'Cherey', 'Gallo', 'Inspector', '451-281-0959', '8/9/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y64874')), null),
('OP37411', 'P06404', 'Hannis', 'Bromilow', 'Deputy superintendent of police', '933-304-1098', '11/27/1991', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O75322')), null),
('OP25259', 'P83723', 'Valida', 'Archbould', 'Corporal', '152-633-6494', '1/16/1979', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'I98211')), null),
('OP74387', 'P30624', 'Maisey', 'McRorie', 'Corporal', '608-530-9300', '12/24/1967', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D43564')), 'V61006'),
('OP33582', 'P75955', 'Kinsley', 'Erricker', 'Deputy superintendent of police', '288-983-8367', '12/10/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'F54655')), 'V22231'),
('OP19939', 'P20262', 'Townsend', 'Dengate', 'Corporal', '505-609-7151', '11/3/1969', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'I75890')), 'V27814'),
('OP01801', 'P18995', 'Anderson', 'Aisman', 'Deputy inspector general of police', '881-184-3842', '12/19/1993', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'P90644')), null),
('OP05259', 'P92558', 'Parker', 'Lyddyard', 'Director general of police', '493-921-7146', '10/25/1992', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'E24212')), null),
('OP04319', 'P64645', 'Cari', 'Buxsy', 'Chief inspector', '535-643-9963', '1/21/1989', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'E45632')), null),
('OP66500', 'P75955', 'Rolland', 'Dreakin', 'Deputy inspector general of police', '229-694-9998', '9/6/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U78065')), 'V06018'),
('OP38618', 'P79655', 'Pernell', 'Porcher', 'captain', '797-667-4883', '12/17/1983', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54621')), null),
('OP81856', 'P19679', 'Urbain', 'Kolinsky', 'Deputy superintendent of police', '424-206-1358', '5/18/1989', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L90877')), 'V55462'),
('OP65088', 'P78513', 'Elsey', 'Sibbald', 'Sergeant', '762-956-5314', '4/5/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'X43522')), null),
('OP51901', 'P64645', 'Faunie', 'Jacox', 'Director general of police', '112-702-3476', '4/29/1979', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'V43509')), 'V90967'),
('OP78933', 'P20262', 'Karlyn', 'Tomet', 'Deputy superintendent of police', '121-911-1801', '3/7/1994', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T54611')), 'V98276'),
('OP20836', 'P92890', 'Kendell', 'Gladstone', 'captain', '392-540-3505', '4/8/1990', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'S43522')), null),
('OP99319', 'P61193', 'Cherilyn', 'Somes', 'Deputy superintendent of police', '761-292-8004', '7/20/1961', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'I87034')), 'V06018'),
('OP23568', 'P43965', 'Kenna', 'McMurtyr', 'Inspector-general of police', '699-190-9457', '12/26/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'C64770')), 'V19861'),
('OP21056', 'P48280', 'Doti', 'Putten', 'Inspector-general of police', '704-860-8431', '4/12/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'P90123')), 'V22231'),
('OP27538', 'P06404', 'Cosimo', 'Vazquez', 'Corporal', '833-960-9958', '12/6/1999', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T56444')), null),
('OP34781', 'P74541', 'Conn', 'Towlson', 'Inspector', '830-685-0356', '1/12/1979', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Y76143')), 'V22231'),
('OP12858', 'P64645', 'Matilde', 'Taber', 'captain', '179-118-8877', '1/3/1993', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'P50078')), null),
('OP27075', 'P17107', 'Gunther', 'Peeke-Vout', 'Assistant commissioner', '304-963-5856', '4/24/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'V43511')), 'V98276'),
('OP03868', 'P79655', 'Megen', 'Cornels', 'Chief inspector', '996-836-3780', '11/20/1986', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B54608')), 'V61447'),
('OP24811', 'P74541', 'Bree', 'Awton', 'Corporal', '938-925-4962', '11/14/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'W23411')), 'V52237'),
('OP76052', 'P19679', 'Abbe', 'Hay', 'Assistant commissioner', '110-920-0798', '6/25/1988', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G54633')), 'V36509'),
('OP80025', 'P79655', 'Fredric', 'Rowe', 'Deputy superintendent of police', '323-454-3879', '1/17/1978', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'A20845')), null),
('OP39658', 'P74541', 'Fidel', 'Coll', 'Assistant commissioner', '223-118-9032', '8/31/1999', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'U87644')), null),
('OP91786', 'P79655', 'Che', 'Byron', 'Chief inspector', '207-826-6371', '4/9/1973', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'G65709')), 'V36509'),
('OP40703', 'P37542', 'Brunhilda', 'Gapper', 'Deputy superintendent of police', '277-123-1557', '12/14/1976', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'D34211')), null),
('OP10172', 'P43965', 'Melania', 'Hayfield', 'Inspector', '505-875-8221', '6/21/1980', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'B65709')), 'V55462'),
('OP80238', 'P17107', 'Edithe', 'Avramovsky', 'Corporal', '407-280-5170', '3/21/1968', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'J47809')), null),
('OP63028', 'P93753', 'Jilli', 'Ockleshaw', 'captain', '646-144-2990', '9/22/1990', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'W32422')), 'V27408'),
('OP84473', 'P61193', 'Ashleigh', 'Patridge', 'Deputy inspector general of police', '974-764-3416', '4/20/1981', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'L76409')), null),
('OP26567', 'P61193', 'Candace', 'Snookes', 'Assistant commissioner', '863-410-4679', '4/29/1975', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'X43522')), 'V61006'),
('OP23136', 'P48280', 'Halsey', 'Matteo', 'Director general of police', '305-132-9871', '2/5/1964', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T65709')), 'V22231'),
('OP23508', 'P79655', 'Fredericka', 'Seiter', 'Deputy superintendent of police', '628-708-8615', '3/24/1966', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'O70988')), 'V36509'),
('OP19676', 'P30624', 'Abramo', 'Blakebrough', 'Sergeant', '717-346-2696', '7/28/1971', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'T43564')), 'V22231'),
('OP09622', 'P64645', 'Dall', 'Ivashinnikov', 'captain', '573-364-9662', '6/4/1985', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'Q23114')), 'V22231');


--
select * from dbo.PoliceOfficer;
select OID, PID, FirstName, LastName, Designation, convert(varchar, DecryptByKey(IdNumber)) from PoliceOfficer;


-----------------------------------------------------------------------------------------------------


---- Housekeeping ----
-- Close the symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate
DROP CERTIFICATE TestCertificate;

-- Drop the DMK
DROP MASTER KEY;


