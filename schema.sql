-- Fitness Centre Management Database
-- Portfolio adaptation of independently completed 2023 SQL coursework.
-- Target: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS fitness_centre;
USE fitness_centre;

-- Re-running these scripts resets the demonstration tables.
DROP VIEW IF EXISTS TrainerWorkoutsView;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Timetable;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS BankAccount;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Member;

CREATE TABLE Member (
    MemberID CHAR(8) PRIMARY KEY,
    MemberName VARCHAR(25) NOT NULL,
    MemberEmail VARCHAR(50) NOT NULL UNIQUE,
    MemberPhone VARCHAR(15)
);

CREATE TABLE Trainer (
    TrainerID CHAR(8) PRIMARY KEY,
    TrainerName VARCHAR(25) NOT NULL,
    TrainerPhone VARCHAR(15),
    DateEmployed DATE NOT NULL
);

CREATE TABLE Room (
    RoomID CHAR(8) PRIMARY KEY,
    BuildingName VARCHAR(25) NOT NULL,
    RoomLevel CHAR(2) NOT NULL,
    RoomNumber CHAR(3) NOT NULL,
    MaxCapacity INTEGER NOT NULL,
    CONSTRAINT chk_room_capacity CHECK (MaxCapacity > 0)
);

CREATE TABLE BankAccount (
    AccountID CHAR(8) PRIMARY KEY,
    AccountName VARCHAR(50) NOT NULL,
    Balance DECIMAL(10,2) NOT NULL DEFAULT 0,
    BankName VARCHAR(25) NOT NULL
);

CREATE TABLE Class (
    ClassID CHAR(8) PRIMARY KEY,
    TrainerID CHAR(8) NOT NULL,
    Duration INTEGER NOT NULL,
    WorkoutType VARCHAR(25) NOT NULL,
    CONSTRAINT Class_FK1 FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    CONSTRAINT chk_class_duration CHECK (Duration > 0)
);

CREATE TABLE Timetable (
    ClassID CHAR(8) NOT NULL,
    RoomID CHAR(8) NOT NULL,
    TimetableDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    CONSTRAINT Timetable_PK PRIMARY KEY (ClassID, RoomID, TimetableDate, StartTime),
    CONSTRAINT Timetable_FK1 FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    CONSTRAINT Timetable_FK2 FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE Payment (
    PaymentID CHAR(8) PRIMARY KEY,
    MemberID CHAR(8) NOT NULL,
    AccountID CHAR(8) NOT NULL,
    ClassID CHAR(8) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    DatePaid DATE NOT NULL,
    CONSTRAINT Payment_FK1 FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    CONSTRAINT Payment_FK2 FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID),
    CONSTRAINT Payment_FK3 FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    CONSTRAINT chk_payment_amount CHECK (Amount > 0)
);
