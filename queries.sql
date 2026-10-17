-- Business queries adapted from 2023 coursework Tasks 3–10.
USE fitness_centre;

-- Task 3: Timetable for a particular class, ordered chronologically.
SELECT RoomID, TimetableDate, StartTime
FROM Timetable
WHERE ClassID = 'CLAS2002'
ORDER BY TimetableDate, StartTime;

-- Task 4: Room ID suffixes for level-three rooms with capacity > 9.
SELECT SUBSTRING(RoomID, 5) AS RoomID
FROM Room
WHERE RoomLevel = '3' AND MaxCapacity > 9;

-- Task 5: Gmail members who have made at least one payment.
SELECT m.*
FROM Member AS m
WHERE EXISTS (
    SELECT 1 FROM Payment AS p WHERE p.MemberID = m.MemberID
)
AND m.MemberEmail LIKE '%gmail.com';

-- Task 6: Trainers hired after 2010 who teach a class longer than Lower Body.
SELECT DISTINCT t.*
FROM Trainer AS t
JOIN Class AS c ON c.TrainerID = t.TrainerID
WHERE t.DateEmployed >= '2011-01-01'
  AND c.Duration > (
      SELECT MAX(Duration) FROM Class WHERE WorkoutType = 'Lower Body'
  );

-- Task 7: First names of at least five characters, May payments, phone includes 8.
SELECT SUBSTRING_INDEX(m.MemberName, ' ', 1) AS FirstName, p.DatePaid
FROM Member AS m
JOIN Payment AS p ON m.MemberID = p.MemberID
WHERE CHAR_LENGTH(SUBSTRING_INDEX(m.MemberName, ' ', 1)) >= 5
  AND p.DatePaid BETWEEN '2020-05-01' AND '2020-05-31'
  AND m.MemberPhone LIKE '%8%';

-- Task 8: Payment and account details for members whose names start with A.
SELECT m.MemberName, b.AccountName, p.PaymentID
FROM Member AS m
JOIN Payment AS p ON m.MemberID = p.MemberID
JOIN BankAccount AS b ON p.AccountID = b.AccountID
WHERE m.MemberName LIKE 'A%';

-- Task 9: Rooms hosting at least two timetable entries of classes > 20 minutes.
SELECT r.RoomID, r.RoomNumber, COUNT(*) AS ClassesHosted
FROM Room AS r
JOIN Timetable AS tt ON r.RoomID = tt.RoomID
JOIN Class AS c ON tt.ClassID = c.ClassID
WHERE c.Duration > 20
GROUP BY r.RoomID, r.RoomNumber
HAVING COUNT(*) >= 2;

-- Task 10: Reusable trainer/workout reporting view.
CREATE OR REPLACE VIEW TrainerWorkoutsView AS
SELECT t.TrainerID, t.TrainerName, c.WorkoutType
FROM Trainer AS t
JOIN Class AS c ON t.TrainerID = c.TrainerID;

SELECT * FROM TrainerWorkoutsView ORDER BY TrainerName, WorkoutType;
