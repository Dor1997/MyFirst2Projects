--- Create DataBase: ---

create database Animals_Adoption

go
use Animals_Adoption
go


--- Create Tables: ---


/*
Create a veterinarian table that contains details about existing veterinarians.
The table will contain an ID code that will be the primary key,
First name, last name and city of the veterinarian.
*/
CREATE TABLE Veterinarians( 
    VeterinarianId INT PRIMARY KEY, 
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20), 
    City NVARCHAR(20));

/*
Create a Adopters Table that contains details about existing Adopters.
The table will contain an ID code that will be the primary key,
First name, last name, phone and city of the Adopters.
*/
CREATE TABLE Adopters(
    AdopterId INT PRIMARY KEY,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    City NVARCHAR(20),
    Phone NVARCHAR(20));

/*
Create a Branches Table that contains details about existing Branches.
The table will contain an ID code that will be the primary key,
Address, phone and city of the Branches.
*/
CREATE TABLE Branches(
    BranchCode INT PRIMARY KEY,
    Address NVARCHAR(20), 
    City NVARCHAR(20),   
    Phone NVARCHAR(20));

/*
Create a VetBranch table that contains details about veterinarians in branches.
The table will contain a veterinarian ID code and a branch ID code that will be the primary key,
where the veterinarian code is a foreign key from the Veterinarians table
and the branch code is a foreign key from the Branches table.
*/
CREATE TABLE VetBranch(
    VeterinarianId INT, 
    BranchCode INT, 
    PRIMARY KEY (VeterinarianId, BranchCode),
    FOREIGN KEY (VeterinarianId) REFERENCES Veterinarians(VeterinarianId),
    FOREIGN KEY (BranchCode) REFERENCES Branches(BranchCode));

/*
Create a Employees table that contains details about Employeess.
The table will contain a Employees ID code that will be the primary key,
and the branch code is a foreign key from the Branches table.
*/
CREATE TABLE Employees(
    EmployeeId INT PRIMARY KEY, 
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    StartDate NVARCHAR(20),
    BranchCode INT NOT NULL, 
    FOREIGN KEY (BranchCode) REFERENCES Branches(BranchCode));

/*
Create a Animals Table that contains details about existing Animals.
The table will contain an Animals ID code that will be the primary key,
and the branch code is a foreign key from the Branches table
*/
CREATE TABLE Animals(
    AnimalId INT PRIMARY KEY, 
    Kind NVARCHAR(20),
    Gender NVARCHAR(20),
    Status NVARCHAR(20),
    DateOfBirth NVARCHAR(20),
    BranchCode INT NOT NULL, 
    FOREIGN KEY (BranchCode) REFERENCES Branches(BranchCode));

/*
Create a Adoption Table that contains details about Adoption.
The table will contain an Animals ID and Adopter ID code that will be the primary key,
where the AnimalId code is a foreign key from the Animals table
and the AdopterId code is a foreign key from the Adopters table.
*/
CREATE TABLE Adoption(
    AnimalId INT, 
    AdopterId INT, 
	PRIMARY KEY (AnimalId, AdopterId),
    AdoptionDate NVARCHAR(20),
    FOREIGN KEY (AnimalId) REFERENCES Animals(AnimalId), 
    FOREIGN KEY (AdopterId) REFERENCES Adopters(AdopterId)); 

/*
Create a Supervision Table that contains details about Supervision.
The table will contain an Animals ID and Employee ID code that will be the primary key,
where the AnimalId code is a foreign key from the Animals table
and the EmployeeId code is a foreign key from the Employees table.
*/
CREATE TABLE Supervision(
    AnimalId INT,
    EmployeeId INT,
    PRIMARY KEY (AnimalId, EmployeeId), 
    FOREIGN KEY (AnimalId) REFERENCES Animals(AnimalId),  
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId));
---
/*
Create a MedicalCare Table that contains details about Medical Care.
The table will contain an TreatmentId ID code that will be the primary key,
where the AnimalId code is a foreign key from the Animals table
and the VeterinarianId code is a foreign key from the Veterinarians table.
*/
CREATE TABLE MedicalCare(
	TreatmentId INT,
	PRIMARY KEY (TreatmentId),
    TreatmentDate NVARCHAR(20),
    TreatmentType NVARCHAR(20),
	VeterinarianId INT, 
	AnimalId INT
    FOREIGN KEY (AnimalId) REFERENCES Animals(AnimalId), 
    FOREIGN KEY (VeterinarianId) REFERENCES Veterinarians(VeterinarianId));




--- Insert Into Tables: ---

INSERT INTO Veterinarians(VeterinarianId,FirstName,LastName,City)
VALUES 
(94734,'Ben','Altren','Jerusalem'),
(50369,'Nadav','Berg','Tel-Aviv'),
(74246,'Jenny','Verthaimer','Haifa'),
(35345,'Gal','Cohen ','Beersheba'),
(67899,'Yaakov','Hoshen','Jerusalem'),
(77439,'Nir','Herskovich','Tel-Aviv'),
(89765,'Yael','Shalom','Haifa'),
(32456,'Nurit','Ben-Shimon','Jerusalem'),
(33876,'Gal','Levi','Tel-Aviv'),
(33887, 'Gal', 'Levi', 'Tel-Aviv'),
(33877, 'Dana', 'Cohen', 'Jerusalem'),
(33878, 'Itay', 'Bar', 'Haifa'),
(33879, 'Noa', 'Shiran', 'Eilat'),
(33880, 'Amit', 'Shalev', 'Beer Sheva'),
(33881, 'Roi', 'Ziv', 'Ashdod'),
(33882, 'Liat', 'Aviv', 'Netanya'),
(33883, 'Tomer', 'Shani', 'Rishon LeZion'),
(33884, 'Shira', 'Eli', 'Kfar Saba'),
(33885, 'Eran', 'Mor', 'Holon'),
(33886, 'Alon', 'Yarden', 'Ramat Gan');


INSERT INTO Adopters(AdopterId,FirstName,LastName,City,phone)
VALUES
(02660,'Dorothy  ','Schuetz  ','Tel Aviv','0501111111'),
(73733,'Carin  ','Mcewen  ','Afula','0501111112'),
(15080,'Alva  ','Fortune  ','Arad','0501111113'),
(86897,'Shirleen  ','Winborne  ','Haifa','0501111114'),
(56353,'Charlie  ','Breton  ','Rishon LeZion','0501111115'),
(06222,'Savanna  ','Shearer  ','Ashdod','0501111116'),
(01761,'Muoi  ','Quinonez  ','Ashkelon','0501111117'),
(87949,'Diana  ','Vanbeek  ','Tel Aviv','0501111118'),
(99678,'Malik  ','Tester  ','Bat Yam','0501111119'),
(79667,'Marlys  ','Donato  ','Beersheba','0501111120'),
(62088,'Janeen  ','Mcnish  ','Beit Shean','0501111121'),
(37678,'Coralee  ','Ishikawa  ','Beit Shemesh','0501111122'),
(45912,'Woodrow  ','Bilbrey  ','Tel Aviv','0501111123'),
(96454,'Lera  ','Berrett  ','Holon','0501111124'),
(43325,'Carmina  ','Rattler  ','Bnei Brak','0501111125'),
(79647,'Hobert  ','Quick  ','Tiberias','0501111126'),
(93937,'Blondell  ','Bjelland  ','Eilat','0501111127'),
(42520,'Lucio  ','Bryson  ','Ofakim','0501111128'),
(84673,'Latonya  ','Heng  ','Givatayim','0501111129'),
(89209,'Eulah  ','Rick  ','Tiberias','0501111130'),
(92388,'Theola  ','Sappington  ','Hadera','0501111131'),
(96296,'Adelaida  ','Charley  ','Haifa','0501111132'),
(04182,'Reginia  ','Bernett  ','Herzliya','0501111133'),
(65651,'Kate  ','Hobaugh  ','Raanana','0501111134'),
(20126,'Maybelle  ','Robert  ','Holon','0501111135'),
(88960,'Rocky  ','Riggan  ','Jerusalem','0501111136'),
(90331,'Sonja  ','Bickel  ','Karmiel','0501111137'),
(03801,'Signe  ','Gimenez  ','Rishon LeZion','0501111138'),
(20662,'Mitzi  ','Filiault  ','Kfar Saba','0501111139'),
(44146,'Loma  ','Tyus  ','Kiryat Ata','0501111140'),
(02835,'Aja  ','Lepley  ','Rosh HaAyin','0501111141'),
(93410,'Willian  ','Isaman  ','Kiryat Gat','0501111142'),
(22117,'Lyndsey  ','Ragusa  ','Ramla','0501111143'),
(84754,'Merle  ','Culwell  ','Tiberias','0501111144'),
(54054,'Clint  ','Mcglothlin  ','Kiryat Ono','0501111145'),
(11034,'Andera  ','Alligood  ','Jerusalem','0501111146'),
(36065,'Amberly  ','Putz  ','Tel Aviv','0501111147'),
(60294,'Milford  ','Espino  ','Lod','0501111148'),
(30154,'Roland  ','Halterman  ','Maale Adumim','0501111149'),
(97920,'Alphonse  ','Hites  ','Rishon LeZion','0501111150'),
(26990,'Octavio  ','Lampley  ','Jerusalem','0501111151'),
(63938,'Hee  ','Shutt  ','Migdal HaEmek','0501111152'),
(58565,'Felicita  ','Selzer  ','Modiin','0501111153'),
(05730,'Warner  ','Noyola  ','Ashdod','0501111154'),
(02565,'Onita  ','Osterhout  ','Jerusalem','0501111155'),
(93073,'Reginald  ','Marco  ','Nahariya','0501111156'),
(53589,'Janay  ','Wenz  ','Tel Aviv','0501111157'),
(20008,'Kittie  ','Melone  ','Nazareth Illit','0501111158'),
(12210,'Patrick  ','Buis  ','Nesher','0501111159'),
(34604,'Vilma  ','Hurless','Netanya','0501111160');


INSERT INTO Branches(BranchCode,Address,City,Phone)
VALUES
(001,'Aliyho Hacim 33','Jerusalem','025641152'),
(002,'Jaboutinsky 21','Tel-Aviv','034457414'),
(003,'Hezrel 33','Haifa','084474145'),
(004,'Rager 10','Beersheba','075981475'),
(005,'Aliyho Hacim 33','Jerusalem','025641152'),
(006,'Jaboutinsky 21','Tel-Aviv','034457414'),
(007,'Hezrel 33','Haifa','084474145'),
(008,'Rager 10','Beersheba','075981475'),
(009,'Aliyho Hacim 33','Jerusalem','025641152'),
(010,'Jaboutinsky 21','Tel-Aviv','034457414');


INSERT INTO Animals(AnimalId ,Kind, Gender, Status, DateofBirth ,BranchCode)
VALUES
(621,'dog','male','Not adopted','2005',001),
(481,'dog','female','adopted','2010',002),
(246,'dog','male','Not adopted','2004',003),
(460,'dog','female','Not adopted','2017',004),
(032,'dog','male','adopted','2005',004),
(044,'dog','female','Not adopted','2005',006),
(356,'dog','male','adopted','2006',003),
(438,'dog','female','Not adopted','2008',006),
(226,'dog','female','Not adopted','2009',004),
(391,'dog','female','adopted','2014',001),
(646,'dog','female','adopted','2013',001),
(415,'dog','male','Not adopted','2006',010),
(493,'dog','male','Not adopted','2007',004),
(334,'dog','male','adopted','2012',002),
(876,'dog','female','Not adopted','2011',002),
(286,'dog','female','adopted','2008',003),
(625,'dog','male','adopted','2008',008),
(345,'dog','male','adopted','2016',004),
(211,'dog','male','adopted','2016',003),
(904,'dog','female','adopted','2005',001),
(632,'dog','female','Not adopted','2006',005),
(611,'dog','male','adopted','2008',002),
(686,'dog','male','Not adopted','2009',004),
(538,'dog','male','Not adopted','2014',003),
(860,'dog','female','adopted','2013',002),
(838,'dog','female','Not adopted','2006',002),
(414,'dog','female','Not adopted','2007',002),
(342,'dog','male','adopted','2012',004),
(323,'dog','male','Not adopted','2011',006),
(976,'dog','male','Not adopted','2008',005),
(829,'dog','male','adopted','2008',003),
(153,'dog','male','adopted','2016',010),
(997,'dog','male','Not adopted','2016',003),
(655,'dog','male','Not adopted','2007',003),
(760,'dog','female','adopted','2009',004),
(627,'dog','male','Not adopted','2005',003),
(400,'cat','female','adopted','2006',003),
(288,'cat','male','adopted','2008',008),
(132,'cat','female','Not adopted','2009',004),
(009,'cat','male','Not adopted','2014',002),
(439,'cat','female','Not adopted','2013',002),
(736,'cat','female','adopted','2006',002),
(850,'cat','female','adopted','2011',003),
(581,'cat','female','Not adopted','2008',004),
(447,'cat','male','adopted','2008',005),
(358,'cat','male','Not adopted','2016',003),
(413,'cat','male','adopted','2016',002),
(577,'cat','female','adopted','2010',004),
(958,'cat','female','adopted','2012',001),
(726,'cat','male','Not adopted','2011',003),
(867,'cat','male','adopted','2006',002),
(839,'cat','male','adopted','2007',003),
(835,'cat','female','adopted','2012',004),
(721,'cat','male','Not adopted','2011',010),
(122,'cat','male','Not adopted','2008',003),
(343,'cat','male','adopted','2008',004),
(774,'cat','male','adopted','2016',003),
(869,'cat','female','Not adopted','2016',004),
(450,'cat','female','adopted','2007',005),
(573,'cat','female','adopted','2009',002),
(239,'cat','male','Not adopted','2005',002),
(603,'cat','female','Not adopted','2006',004),
(105,'cat','female','Not adopted','2007',008),
(629,'cat','female','adopted','2011',002),
(210,'cat','female','adopted','2013',004),
(990,'cat','male','Not adopted','2015',002),
(205,'cat','female','adopted','2016',003),
(329,'cat','male','adopted','2017',006),
(180,'cat','male','Not adopted','2017',001),
(209,'cat','male','Not adopted','2013',002),
(807,'cat','female','adopted','2006',002),
(076,'dog','male','Not adopted','2009',001),
(644,'dog','male','adopted','2016',003),
(759,'dog','female','Not adopted','2012',002),
(192,'dog','male','adopted','2007',010),
(290,'dog','male','Not adopted','2012',002),
(664,'dog','male','adopted','2011',004),
(441,'dog','female','Not adopted','2008',005),
(565,'dog','male','adopted','2008',003),
(955,'dog','male','Not adopted','2016',004),
(148,'dog','female','adopted','2016',001),
(871,'dog','male','Not adopted','2010',010),
(182,'dog','male','adopted','2010',010),
(502,'dog','male','Not adopted','2005',008),
(377,'dog','female','adopted','2006',004),
(694,'dog','female','Not adopted','2008',002),
(348,'dog','female','Not adopted','2009',004),
(236,'dog','female','Not adopted','2014',002),
(735,'dog','female','Not adopted','2013',004),
(002,'dog','male','Not adopted','2006',003),
(934,'dog','male','Not adopted','2015',003),
(654,'dog','male','Not adopted','2016',003),
(536,'cat','male','Not adopted','2017',002),
(453,'cat','female','adopted','2017',006),
(492,'cat','male','Not adopted','2013',002),
(130,'cat','male','Not adopted','2006',001),
(276,'cat','female','Not adopted','2013',002),
(563,'cat','male','Not adopted','2010',002),
(551,'cat','male','Not adopted','2012',001),
(147,'cat','female','Not adopted','2013',002),
(872,'cat','male','Not adopted','2010',002),
(003,'cat','male','Not adopted','2015',001),
(300,'cat','female','Not adopted','2016',003),
(914,'cat','male','Not adopted','2017',005),
(936,'cat','male','Not adopted','2017',001),
(267,'cat','male','Not adopted','2013',003),
(570,'cat','male','adopted','2006',004),
(204,'dog','male','Not adopted','2014',001),
(548,'dog','female','Not adopted','2015',006),
(467,'dog','female','Not adopted','2012',004),
(985,'dog','female','Not adopted','2015',001),
(787,'dog','female','Not adopted','2005',002),
(991,'dog','male','Not adopted','2006',003),
(794,'dog','female','Not adopted','2008',004),
(218,'dog','male','Not adopted','2009',001),
(432,'dog','male','Not adopted','2014',002),
(061,'dog','female','adopted','2013',003),
(443,'dog','male','adopted','2006',005),
(259,'dog','female','adopted','2015',008),
(681,'cat','female','adopted','2006',006);


INSERT INTO Employees(EmployeeId,FirstName,LastName,StartDate,BranchCode)
VALUES
(60366,'Otelia  ','Adriane','2014-01-31',001),
(43134,'Jamika  ','Shelly','2010-02-02',001),
(39537,'Maira  ','Lynna ','2012-02-06',001),
(78842,'Jarred  ','Rafaela','2012-02-09',001),
(80955,'Celestina  ','Shad ','2015-02-10',001),
(11430,'Christal  ','Enid ','2014-02-13',001),
(32347,'Kayce  ','Carman ','2013-02-14',001),
(31556,'Sherice  ','Lashanda ','2015-02-15',001),
(69005,'Meghann  ','Shan ','2016-02-20',001),
(89022,'Jeffrey  ','Pamila  ','2013-02-21',001),
(50698,'Mui  ','Margaret','2012-02-22',001),
(91924,'Ardelle  ','Corrie ','2013-02-24',002),
(34737,'Roland  ','Katy ','2017-01-12',002),
(74383,'Emmaline  ','Rosena','2017-01-16',002),
(32760,'Arla  ','Donella ','2017-01-20',002),
(88624,'Rod  ','Jessika ','2017-01-23',002),
(62376,'Odelia  ','Loralee','2017-01-24',002),
(10338,'Tom  ','Kaye ','2017-01-26',002),
(33600,'Cordell  ','Vera ','2018-01-03',002),
(60606,'Petronila  ','Leontine ','2018-01-18',002),
(84435,'Tanner  ','Van  ','2018-01-24',002),
(65787,'Elissa  ','Kristi ','2018-01-30',003),
(82560,'Chang  ','Jerilyn ','2018-01-31',003),
(93535,'Lorrie  ','Michal','2018-01-04',003),
(19865,'Ramiro  ','Lavada ','2018-02-13',003),
(20282,'Janita  ','Merlyn','2018-02-14',003),
(42435,'Darrel  ','Rafael ','2014-02-16',003),
(74400,'Bob  ','Tatum ','2014-01-16',003),
(69369,'Celine  ','Vergie ','2014-01-20',003),
(42187,'Tawnya  ','Thanh ','2013-01-23',003),
(10536,'Nestor  ','Laurena ','2012-01-24',003),
(90930,'Mikel  ','Dollie ','2011-01-26',004),
(40672,'Monroe  ','Cleopatra','2010-01-03',004),
(59390,'Janell  ','Cathie ','2011-01-16',004),
(30278,'Annetta  ','Gilberte ','2012-01-20',004),
(80762,'Amparo  ','Cara ','2013-01-23',004),
(31260,'Cedrick  ','Laquanda','2014-01-24',004),
(70245,'Vikki  ','Mack','2015-01-26',004),
(24778,'Gerda  ','Estrella ','2016-01-03',004);


INSERT INTO Adoption(AnimalId ,AdopterId ,AdoptionDate )
VALUES
(481,02660,'2017-01-02'),
(581,02660,'2017-01-02'),
(032,73733,'2017-01-04'),
(356,15080,'2017-01-05'),
(358,15080,'2017-01-05'),
(391,86897,'2017-01-17'),
(439,86897,'2017-01-17'),
(646,56353,'2017-01-19'),
(334,06222,'2017-01-20'),
(286,01761,'2017-01-25'),
(625,87949,'2017-01-26'),
(603,87949,'2017-01-26'),
(345,99678,'2017-01-27'),
(211,79667,'2017-01-30'),
(904,62088,'2017-01-31'),
(611,37678,'2017-02-01'),
(860,45912,'2017-02-02'),
(342,96454,'2017-02-03'),
(829,43325,'2017-02-09'),
(153,79647,'2017-02-13'),
(760,93937,'2017-02-14'),
(400,42520,'2017-02-15'),
(288,84673,'2017-02-16'),
(736,89209,'2017-02-17'),
(850,92388,'2017-02-20'),
(447,96296,'2017-02-21'),
(413,04182,'2017-02-24'),
(577,65651,'2017-02-27'),
(958,20126,'2017-02-28'),
(867,88960,'2017-01-04'),
(839,90331,'2017-01-06'),
(835,03801,'2017-01-09'),
(343,20662,'2017-01-10'),
(774,44146,'2017-01-11'),
(450,02835,'2017-01-13'),
(573,93410,'2017-01-17'),
(629,22117,'2017-01-18'),
(210,84754,'2017-01-19'),
(205,54054,'2017-01-26'),
(329,11034,'2017-01-31'),
(807,36065,'2017-02-01'),
(644,60294,'2017-02-02'),
(192,30154,'2017-02-03'),
(664,97920,'2017-02-06'),
(565,26990,'2017-02-07'),
(148,63938,'2017-02-13'),
(182,58565,'2017-02-14'),
(377,05730,'2017-02-16'),
(453,02565,'2017-02-20'),
(570,93073,'2017-02-21'),
(061,53589,'2017-02-23'),
(443,20008,'2017-02-24'),
(259,12210,'2017-02-27'),
(681,34604,'2017-02-28');



-- לבדוק פה מה השגיאה - לדעתי חסרה לי עמודה כלשהי שלא הוספתי לפקודת אינסרט
INSERT INTO MedicalCare(TreatmentId,TreatmentDate,TreatmentType ,VeterinarianId ,AnimalId)
VALUES
(10001,'2017-01-05','Vaccination',94734,447),
(10002,'2017-01-06','Sterilization',94734,481),
(10003,'2017-01-09','Castration',94734,621),
(10004,'2017-01-16','Dental care',94734,450),
(10005,'2017-01-18','Review',94734,329),
(10006,'2017-01-23','Vaccination',94734,180),
(10007,'2017-01-25','Sterilization',94734,044),
(10008,'2017-01-27','Castration',94734,538),
(10009,'2017-01-30','Dental care',94734,130),
(100010,'2017-02-01','Review',94734,551),
(100011,'2017-02-02','Vaccination',50369,003),
(100012,'2017-02-03','Sterilization',50369,226),
(100013,'2017-02-07','Castration',50369,153),
(100014,'2017-02-08','Dental care',50369,736),
(100015,'2017-02-10','Review',50369,413),
(100016,'2017-02-13','Vaccination',50369,867),
(100017,'2017-02-14','Sterilization',50369,876),
(100018,'2017-02-15','Vaccination',50369,573),
(100019,'2017-02-16','Sterilization',50369,904),
(100020,'2017-02-17','Castration',50369,976),
(100021,'2017-02-21','Dental care',74246,629),
(100022,'2017-02-22','Review',74246,502),
(100023,'2017-02-23','Vaccination',74246,002),
(100024,'2017-02-24','Sterilization',74246,838),
(100025,'2017-02-28','Castration',74246,655),
(100026,'2017-01-02','Dental care',74246,300),
(100027,'2017-01-04','Review',74246,267),
(100028,'2017-01-09','Vaccination',74246,548),
(100029,'2017-01-10','Sterilization',74246,760),
(100030,'2017-01-18','Castration',74246,211),
(100031,'2017-01-20','Dental care',35345,443),
(100032,'2017-01-23','Review',35345,625),
(100033,'2017-01-24','Vaccination',35345,345),
(100034,'2017-01-25','Sterilization',35345,400),
(100035,'2017-01-27','Vaccination',35345,342),
(100036,'2017-01-30','Sterilization',35345,132),
(100037,'2017-01-31','Castration',35345,415),
(100038,'2017-02-01','Dental care',35345,581),
(100039,'2017-02-02','Review',35345,577),
(100040,'2017-02-03','Review',35345,835);


INSERT INTO Supervision(AnimalId ,EmployeeId )
VALUES
(621,60366),
(391,43134),
(646,39537),
(904,78842),
(153,80955),
(288,11430),
(447,32347),
(958,31556),
(450,69005),
(329,89022),
(180,60366),
(076,43134),
(148,39537),
(130,78842),
(551,80955),
(003,11430),
(936,32347),
(204,31556),
(985,69005),
(218,89022),
(259,69005),
(481,50698),
(438,91924),
(334,34737),
(876,74383),
(632,32760),
(611,88624),
(860,62376),
(838,10338),
(414,33600),
(009,60606),
(439,50698),
(736,91924),
(413,34737),
(867,74383),
(721,32760),
(573,88624),
(239,62376),
(105,10338),
(629,33600),
(990,60606),
(209,50698),
(807,91924),
(759,34737),
(290,74383),
(182,32760),
(694,88624),
(236,62376),
(536,10338),
(453,33600),
(492,60606),
(276,50698),
(563,91924),
(147,34737),
(872,74383),
(787,32760),
(432,88624),
(681,62376),
(246,84435),
(044,65787),
(356,82560),
(415,93535),
(286,19865),
(211,20282),
(538,42435),
(323,74400),
(976,69369),
(829,42187),
(997,84435),
(655,65787),
(627,82560),
(400,93535),
(850,19865),
(358,20282),
(726,42435),
(839,74400),
(122,69369),
(774,42187),
(205,84435),
(644,65787),
(441,82560),
(565,93535),
(502,19865),
(002,20282),
(934,42435),
(654,74400),
(300,69369),
(267,42187),
(548,84435),
(991,65787),
(061,82560),
(443,93535),
(460,10536),
(032,90930),
(226,40672),
(493,59390),
(625,30278),
(345,80762),
(686,31260),
(342,70245),
(760,24778),
(132,10536),
(581,90930),
(577,40672),
(835,59390),
(343,30278),
(869,80762),
(603,31260),
(210,70245),
(192,24778),
(664,10536),
(955,90930),
(871,40672),
(377,59390),
(348,30278),
(735,80762),
(914,31260),
(570,70245),
(467,24778),
(794,40672);


INSERT INTO VetBranch(VeterinarianId ,BranchCode )
VALUES
(94734,001),
(50369,002),
(74246,003),
(35345,004),
(67899,001),
(77439,002),
(89765,003),
(32456,001),
(33876,002),
(94734,002),
(67899,002),
(77439,001),
(32456,002),
(33881,005),
(33882,005),
(33883,007),
(33884,007),
(33885,009),
(33887,005),
(33886,010);
