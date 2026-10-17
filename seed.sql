-- Fictional sample data for MySQL 8.0+
USE fitness_centre;

INSERT INTO Member (MemberID, MemberName, MemberEmail, MemberPhone) VALUES
('MEMB1001', 'Alex Morgan', 'alex.morgan@example.com', '0400000008'),
('MEMB1002', 'Amelia Chen', 'amelia.chen@gmail.com', '0400000018'),
('MEMB1003', 'Jordan Patel', 'jordan.patel@example.com', '0400000023'),
('MEMB1004', 'Aaron Wilson', 'aaron.wilson@gmail.com', '0400000038'),
('MEMB1005', 'Sophia Lee', 'sophia.lee@gmail.com', '0400000045');

INSERT INTO Trainer (TrainerID, TrainerName, TrainerPhone, DateEmployed) VALUES
('TRNR1000', 'Taylor Smith', '0400000101', '2015-03-12'),
('TRNR2000', 'Morgan Davis', '0400000102', '2009-08-20'),
('TRNR4000', 'Casey Brown', '0400000103', '2018-02-01'),
('TRNR5000', 'Jamie Parker', '0400000104', '2019-06-15'),
('TRNR6000', 'Riley Evans', '0400000105', '2020-01-10');

INSERT INTO Room (RoomID, BuildingName, RoomLevel, RoomNumber, MaxCapacity) VALUES
('ROOM0001', 'Wellness Centre', '3', '301', 12),
('ROOM0002', 'Wellness Centre', '3', '302', 18),
('ROOM0003', 'Fitness Annex', '2', '201', 8),
('ROOM0004', 'Fitness Annex', '3', '303', 20);

INSERT INTO BankAccount (AccountID, AccountName, Balance, BankName) VALUES
('ACCT0001', 'Fitness Centre Operating', 12500.00, 'Demo Bank'),
('ACCT0002', 'Fitness Centre Classes', 6200.00, 'Demo Bank');

INSERT INTO Class (ClassID, TrainerID, Duration, WorkoutType) VALUES
('CLAS2001', 'TRNR1000', 30, 'Lower Body'),
('CLAS2002', 'TRNR1000', 45, 'Cross Fit'),
('CLAS2003', 'TRNR1000', 30, 'Upper Body'),
('CLAS2004', 'TRNR2000', 120, 'Cardio'),
('CLAS2005', 'TRNR2000', 120, 'Cardio'),
('CLAS2006', 'TRNR5000', 60, 'Body Attack'),
('CLAS2007', 'TRNR4000', 60, 'Zumba'),
('CLAS2008', 'TRNR6000', 45, 'F45');

-- Original class timetable records retained.
INSERT INTO Timetable (ClassID, RoomID, TimetableDate, StartTime) VALUES
('CLAS2001', 'ROOM0001', '2020-05-01', '14:00'),
('CLAS2001', 'ROOM0002', '2020-05-03', '14:00'),
('CLAS2001', 'ROOM0003', '2020-05-05', '14:00'),
('CLAS2002', 'ROOM0003', '2020-07-01', '08:00'),
('CLAS2002', 'ROOM0001', '2020-07-08', '08:00'),
('CLAS2002', 'ROOM0002', '2020-07-15', '08:00'),
('CLAS2003', 'ROOM0001', '2020-05-02', '14:00'),
('CLAS2003', 'ROOM0002', '2020-05-04', '14:00'),
('CLAS2003', 'ROOM0003', '2020-05-06', '14:00'),
('CLAS2004', 'ROOM0002', '2020-07-01', '09:00'),
('CLAS2004', 'ROOM0003', '2020-07-08', '09:00'),
('CLAS2005', 'ROOM0001', '2020-05-06', '11:00'),
('CLAS2005', 'ROOM0002', '2020-05-13', '11:00'),
('CLAS2005', 'ROOM0003', '2020-05-20', '11:00');

INSERT INTO Payment (PaymentID, MemberID, AccountID, ClassID, Amount, DatePaid) VALUES
('PAYM0001', 'MEMB1001', 'ACCT0001', 'CLAS2001', 25.00, '2020-05-02'),
('PAYM0002', 'MEMB1002', 'ACCT0002', 'CLAS2003', 30.00, '2020-05-10'),
('PAYM0003', 'MEMB1004', 'ACCT0001', 'CLAS2005', 45.00, '2020-05-15'),
('PAYM0004', 'MEMB1005', 'ACCT0002', 'CLAS2001', 25.00, '2020-05-22'),
('PAYM0005', 'MEMB1002', 'ACCT0001', 'CLAS2002', 35.00, '2020-07-01');
