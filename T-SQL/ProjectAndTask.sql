
--Database
CREATE DATABASE yon_db;

USE yon_db;

--Table
CREATE TABLE client(
	clientID INT IDENTITY(1,1) PRIMARY KEY,
	clientFname VARCHAR(20),
	clientMname VARCHAR(20),
	clientLname VARCHAR(20),
	clientType VARCHAR(20),
	street VARCHAR(20),
	suburb VARCHAR(20),
	stateName VARCHAR(20),
	postCode VARCHAR(20)
)

/* Table */
CREATE TABLE phone(
	phoneID INT IDENTITY(1, 1)  PRIMARY KEY,
	phoneType VARCHAR(20),
	phoneNumber INT,
	clientID INT,
	CONSTRAINT FK_Phone FOREIGN KEY(clientID)
    REFERENCES client(clientID)
)

--Table
CREATE TABLE staff(
	staffID INT IDENTITY(1,1) PRIMARY KEY,
	staffName VARCHAR(20),
	mobile INT,
	jobTitle VARCHAR(20)
)

--Table
CREATE TABLE project(
	projectID INT IDENTITY(1,1) PRIMARY KEY,
	proDescription VARCHAR,
	estimatePrice FLOAT,
	estimateStartDate DATE,
	estimateFinshDate DATE,
	actualFinisDate DATE,
	actualDuration INT,
	clientID  INT,
	phoneID INT,
	staffID INT,
	CONSTRAINT FK_ProjectClient FOREIGN KEY(clientID)
    REFERENCES client(clientID),
	CONSTRAINT FK_ProjectPhone FOREIGN KEY(phoneID)
    REFERENCES phone(phoneID ),
	CONSTRAINT FK_ProjectStaff FOREIGN KEY(staffID)
    REFERENCES staff(staffID)
)

--Table
CREATE TABLE task(
	taskID INT IDENTITY(1,1) PRIMARY KEY,
	descriptionTask VARCHAR,
	estimatedHour TIME,
	actualStartDate DATE,
	actualFinishDate DATE,
	projectID INT,
	CONSTRAINT FK_task FOREIGN KEY(projectID)
    REFERENCES project(projectID)

)

--Table
CREATE TABLE currentStatus(
	currentStatID INT IDENTITY(1,1) PRIMARY KEY,
	actualDuration FLOAT,
	taskID INT,
	CONSTRAINT FK_currentStatus FOREIGN KEY(taskID)
    REFERENCES task(taskID)
)

--Table
CREATE TABLE timeSheet(
	timeSheet INT IDENTITY(1,1) PRIMARY KEY,
	workData VARCHAR,
	workDescription  VARCHAR,
	hoursWorked TIME,
	taskID INT,
	staffID INT,
	CONSTRAINT FK_timeSheetTask FOREIGN KEY(taskID)
    REFERENCES task(taskID),
	CONSTRAINT FK_timeSheetStaff FOREIGN KEY(staffID)
    REFERENCES staff(staffID)

)