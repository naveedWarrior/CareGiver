 /* Dropping the database */
 DROP DATABASE NaveedCaregiver;

/* Creating database named NaveedCaregiver */
CREATE DATABASE NaveedCaregiver;

/* Using database NaveedCaregiver */
USE NaveedCaregiver;

CREATE TABLE Roles (ROLE_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ROLE_Desc VARCHAR(25) NOT NULL);

CREATE TABLE UserType (UserType_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
UserType_Desc VARCHAR(25) NOT NULL);

CREATE TABLE ClientType (ClientType_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ClientType_Desc VARCHAR(25) NOT NULL);

CREATE TABLE VisitType (VisitType_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Visit_type  VARCHAR(25) NOT NULL,	
Visit_Desc VARCHAR(50));

CREATE TABLE HCOffice (        /* Major entity */
  User_ID INT Not NULL Primary KEY AUTO_INCREMENT,
  User_name VARCHAR(50) NOT NULL,
  User_Phone VARCHAR(12),
  USER_EMAIL VARCHAR(100) NOT NULL,
  UserType_ID INT ,
  USER_Status VARCHAR(1) NOT NULL,
  FOREIGN KEY (UserType_ID) REFERENCES UserType(UserType_ID));
  
CREATE TABLE CareGiver (Caregiver_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, /* Major entity */
	Caregiver_firstname VARCHAR(30),
    Caregiver_Lastname VARCHAR(30), 
    ROLE_ID INT NOT NULL,
	Caregiver_description VARCHAR(100),
    Caregiver_Address VARCHAR(100),
    Caregiver_City VARCHAR(30),
    Caregiver_State VARCHAR(2),
    Caregiver_Zip VARCHAR(5),
    Caregiver_Phone VARCHAR(12) NOT NULL,
    Caregiver_email VARCHAR(100) NOT NULL ,
    Caregiver_status VARCHAR(1) NOT NULL,
    Caregiver_gender Varchar(1) Not Null, 
    Caregiver_DOB Date Not Null,
  FOREIGN KEY (ROLE_ID) REFERENCES ROLES(role_ID)
	);

CREATE TABLE Client (Client_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Client_firstname VARCHAR(30),
    Client_Lastname VARCHAR(30), 
    ClientType_ID  INT NOT NULL,
	Client_description VARCHAR(100),
    Client_Address VARCHAR(100),
    Client_City VARCHAR(30),
    Client_State VARCHAR(2),
    Client_Zip VARCHAR(5),
    Client_Phone VARCHAR(12) NOT NULL,
    Client_email VARCHAR(100) NOT NULL,
    Client_status Varchar(1) Not Null, 
    Client_DOB Date Not NULL,
    Client_gender Varchar(1) Not Null,
  FOREIGN KEY (ClientType_ID) REFERENCES ClientType(ClientType_ID)
	);
 

CREATE TABLE CheckList_detail (
ChecklistDTL_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CheckListDTL_Desc varchar(100) NOT NULL ,
ChecklistDTL_Input Varchar(100)
); 


CREATE TABLE client_checklist (
ClientCHK_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Client_ID  INT NOT NULL ,
ChecklistDTL_ID INT Not NULL, 
Checklist_Duration_Mins INT ,
Client_schedule Varchar(30) NOT NULL,
Client_CHK_Status Varchar(1) NOT NULL,
FOREIGN KEY(Client_id) REFERENCES Client(Client_id), 
FOREIGN KEY(ChecklistDTL_ID) REFERENCES Checklist_detail(ChecklistDTL_ID)); 

CREATE TABLE client_Caregiver_visit(
ClientCG_AssignID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
User_ID INT NOT NULL,
Caregiver_ID INT NOT NULL,
ClientCHK_ID INT NOT NULL, 
VisitType_id INT NOT NULL,
VisitStartDT Date ,
VisitEndDT Date ,
VisitCheckIN_Time Time,
VisitCheckOut_Time Time ,
ChklistStartTime Time ,
ChklistEndTime Time ,
ChkListPerform VARCHAR(1) ,
Schedule_Status VARCHAR(50),
FOREIGN KEY(User_ID) REFERENCES HCOffice(User_id),
FOREIGN KEY (ClientCHK_ID) REFERENCES Client_Checklist(ClientCHK_ID),
FOREIGN KEY(VisitType_ID) REFERENCES VisitType(VisitType_ID)); 

INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) 
VALUES('Pre-Screen For COVID 19','Incase Fever Cancel Visit');
INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) VALUES('Check the Blood Sugar','Reading should be recorded');
INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) VALUES('Review the insulin Stock','Report back if than 2 days supply');
INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) VALUES('Check The Blood Pressure','Report if readings are above 150 and 90');
INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) VALUES('Give BP-Cholestrol Medicine','As per Prescription');
INSERT INTO CheckList_detail (ChecklistDTL_DESC, ChecklistDTL_Input) VALUES('Help Patient with House Cleaning','Follow the instructions from Client');


INSERT INTO UserType  (UserType_DESC) VALUES('Office Manager');
INSERT INTO UserType  (UserType_DESC) VALUES('Schedule Manager');

INSERT INTO Roles (Role_DESC) VALUES('Certified Nurse');
INSERT INTO Roles (Role_DESC) VALUES('PA');
INSERT INTO Roles (Role_DESC) VALUES('Nurse');
INSERT INTO Roles (Role_DESC) VALUES('Doctor');
INSERT INTO Roles (Role_DESC) VALUES('Caregiver');
INSERT INTO Roles (Role_DESC) VALUES('CPR Certified');


INSERT INTO ClientType (ClientType_DESC) VALUES('Assisted Living');
INSERT INTO ClientType (ClientType_DESC) VALUES('55 Plus Community');
INSERT INTO ClientType (ClientType_DESC) VALUES('Single Family - Elderly');

INSERT INTO VisitType (Visit_Type, Visit_desc) VALUES('In - Person','Show up at Client Provided Location');
INSERT INTO VisitType (Visit_Type, Visit_desc) VALUES('Virtual Visit','Meeting via Zoom');
INSERT INTO VisitType (Visit_Type, Visit_desc) VALUES('Face” to Face','Working with Client');
INSERT INTO VisitType (Visit_Type, Visit_desc) VALUES('Telephonic','Pre COVID 19 Screening');
INSERT INTO VisitType (Visit_Type, Visit_desc) VALUES('Mobile Drop off','Droping off the medicine and groceries at Door');


INSERT INTO HCOffice (User_name,User_Phone,User_email,UserType_ID,User_status) VALUES('John Dilman','484-835-1000','JohnD@gmail.com',1 ,'A');
INSERT INTO HCOffice (User_name,User_Phone,User_email,UserType_ID,User_status) VALUES('Smith Jean','484-837-1100','SmithJ@gmail.com',2 ,'A');
INSERT INTO HCOffice (User_name,User_Phone,User_email,UserType_ID,User_status) VALUES('Smantha Fox','484-935-1999','SmanthaF@gmail.com',2 ,'A');
INSERT INTO HCOffice (User_name,User_Phone,User_email,UserType_ID,User_status) VALUES('Amanda Ross','484-935-2000','AmandaR@gmail.com',2 ,'A');
INSERT INTO HCOffice (User_name,User_Phone,User_email,UserType_ID,User_status) VALUES('Taylor Bush','494-935-3000','TaylorB@gmail.com', 2,'A');

INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,
Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_gender,Caregiver_DOB) 
VALUES('Carol', 'Smith',3 ,'Head Nurse with access to Client and Caregiver Info','100 Main Street','Allentown','PA','18101','484-101-2345','CarolS@gmail.com','A','F','1973-03-12');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,
Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_Gender,Caregiver_DOB) 
VALUES('Stacy', 'Adams',3 ,'Assistant Head Nurse for senior living ','101 Main Street ','Allentown','PA','18101','484-101-3425','StacyA@gmail.com','A','F','1970-07-23');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_gender,Caregiver_DOB) VALUES('Robert', 'Lange',4 ,'Primary care Physician and family care','3551 Penfield Way ','Nazareth','PA','18064','484-123-6543','RobertL@gmail.com','A','M','1979-04-20');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_gender,Caregiver_DOB) VALUES('Pamela', 'Harris',3 ,'Certified Nurse Practitioner for Urgent care','3151 Penn Allen Road','Nazareth','PA','18064','484-768-4321','PamelaH@gmail.com','A','F','1980-06-24');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,caregiver_Gender,Caregiver_DOB) VALUES('Nicole', 'Rogers',5 ,'Provide Assistance in Taking Readings and medicine during visit','100 Penn Allen Road','Bath','PA','18014','484-908-4567','NicoleR@gmail.com','A','F','1978-05-13');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,
Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_Gender,Caregiver_DOB) 
VALUES('Richard', 'Adams',1 ,'RN  Nurse for senior living ','1041 Main Street ','Allentown','PA','18101','484-104-3425','RichardA@gmail.com','A','M','1974-07-23');
INSERT INTO Caregiver (caregiver_Firstname, Caregiver_lastName,ROLE_ID, Caregiver_description,Caregiver_address,Caregiver_city,Caregiver_state,
Caregiver_Zip,Caregiver_Phone,Caregiver_email,Caregiver_status,Caregiver_Gender,Caregiver_DOB) 
VALUES('Julia', 'Atkins',2 ,' Physcian Assistant for Doctors ','1017 Main Street ','Allentown','PA','18101','484-051-3425','JuliaA@gmail.com','A','F','1970-04-23');

INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Robert', 'Senior',1 ,'Diabetic with Blood Pressure','200 Lehigh St','Allentown','PA','18101','484-921-4620','RobertS@gmail.com','A','1942-08-21','M');
INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Lyn', 'Robert',1 ,'Diabetic and Low appetite ','200 Lehigh St','Allentown','PA','18101','484-921-4621','LynR@gmail.com','A','1944-03-20','F');
INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Brandy', 'Nicholas',2 ,'Anemetic and Diabetic','201 E Dell Road','Bath','PA','18014','484-345-9376','BrandyN@gmail.com','A','1956-07-11','F');
INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Nicholas', 'Ken',2 ,'Diabetic only','201 E Dell Road','Bath','PA','18014','484-345-9377','NicholasK@gmail.com','A','1952-08-14','M');
INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Carol', 'Smith',3 ,'Need Assitance','226 Eagle Landing Drive ','Bath','PA','18014','610-456-2345','CarolS@gmail.com','A','1948-04-23','F');
INSERT INTO Client (client_Firstname, Client_lastName,ClientType_ID, Client_description,Client_address,Client_city,Client_state,Client_Zip,Client_Phone,Client_email,Client_status,Client_DOB,Client_gender) 
VALUES('Smith', 'Anderson',3 ,'Need Assistance','226 Eagle Landing Drive ','Bath','PA','18014','610-456-2346','SmithA@gmail.com','D','1942-04-21','M');




INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (1, 1, 5, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (1, 2, 20, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (2, 1, 5, 'Weekly before 10 am','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (2, 2, 20, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (3, 1, 5, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (3,2, 20, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (4, 1, 5, 'Daily before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (4, 3, 30, 'Daily before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (4, 2, 60, 'Daily before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (5, 1, 5, 'Weekly before 9 am','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (5, 2, 50, 'Weekly before 9 am','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (5, 4, 60, 'Weekly before 9 am','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (5, 3, 20, 'Weekly before Noon','A');
INSERT INTO client_checklist (Client_ID,ChecklistDTL_ID,CheckList_duration_mins,Client_schedule,Client_chk_status)  VALUES (5, 5, 120, 'Weekly before Noon','A');


INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (1, 1, 1,4 ,'2020-11-01','2020-11-01','10:00','14:00', '10:00','10:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (1, 1, 2,2 ,'2020-11-01','2020-11-01','10:00','14:00', '10:30','13:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (1, 2, 3,4 ,'2020-11-02','2020-11-02','11:00','15:00', '11:00','11:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (1, 2, 4,2 ,'2020-11-05','2020-11-05','11:00','15:00', '11:30','14:45','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2, 3, 5,4 ,'2020-11-01','2020-11-01','10:00','14:00', '10:00','10:30','N','NO Show');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2, 3, 5,4 ,'2020-11-04','2020-11-04','10:00','14:00', '10:00','10:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2, 3, 6,4 ,'2020-11-10','2020-11-10','10:00','14:00', '10:00','10:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2, 3, 7,3 ,'2020-11-01','2020-11-01','10:00','14:00', '10:30','14:00','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2,4, 8, 4 ,'2020-11-15','2020-11-15','10:00','14:00', '10:00','10:30','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (2, 4, 9,3 ,'2020-11-01','2020-11-01','10:00','14:00', '10:00','13:50','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (3, 6, 9,3 ,'2020-11-01','2020-11-01','10:00','14:00', '10:00','13:50','Y','Completed');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,
VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (3, 6, 9,3 ,'2020-12-20','2020-12-20','','', '','','P','Scheduled');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (4, 7, 9,3 ,'2020-12-20','2020-12-20','','', '','','P','Scheduled');
INSERT INTO client_caregiver_visit (User_ID,caregiver_ID,ClientCHK_ID,VisitType_ID,VisitStartDT,VISITENDDT,VISITCHECKIN_Time,VISITCHECKOUT_Time,CHKLISTStartTime,CHKLISTENDTIME,CHKLISTPERFORM,Schedule_Status)  
VALUES (4, 3, 5,3 ,'2020-12-25','2020-12-25','','', '','','P','Scheduled');



