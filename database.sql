
CREATE DATABASE roomBookingSystem;

/* 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
:: 'sysadmn' in uRole refers to the "super user" role
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

CREATE TABLE users (
uId INT UNSIGNED PRIMARY KEY,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(20) NOT NULL,
uRole VARCHAR(10) NOT NULL,
email VARCHAR(30) NOT NULL,
uPw VARCHAR(128) NOT NULL,
CONSTRAINT users_ckey UNIQUE(uRole, email),
CONSTRAINT users_ch1 CHECK(LENGTH(uID)<=6),
CONSTRAINT users_ch2 CHECK(uRole IN ('student', 'staff', 'sysadmn')),
CONSTRAINT users_ch3 CHECK(email LIKE '%@mymail.com')
);

/* 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:: Fractional values past 2 decimal places will be truncated.
:: e.g. 010.099 becomes 010.10, i.e. rounded up.
:: For 'isLaunched', 0 = Unlaunched, 1 = Launched.
:: For 'isApproved', 0 = Pending Approval, 1 = Approved.
:: For 'isPromoUsed', 0 = No, 1 = Yes, hence calculate the discount.
:: For 'promoCode', discount applied is strictly in percentages only.
:: e.g. a promocode with the name "Easy10" is 10% off, "Easy00" is 100% off.
:: e.g. 10% off is expressed as '0.1' in the equation.
:: For 'bookedBy', Students MUST clear payments to successfully book a room.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

CREATE TABLE rooms (
rId INT UNSIGNED AUTO_INCREMENT NOT NULL,
rName VARCHAR(20) NOT NULL,
capacity INT UNSIGNED NOT NULL,
rBookStart DATETIME NOT NULL,
rBookEnd DATETIME NOT NULL,
price DEC(5,2) DEFAULT '000.00',
promoCode CHAR(6),
isPromoUsed TINYINT UNSIGNED DEFAULT '0',
isLaunched TINYINT UNSIGNED DEFAULT '0',
isApproved TINYINT UNSIGNED DEFAULT '0',
bookedBy INT UNSIGNED,
CONSTRAINT rooms_pk PRIMARY KEY(rId),
CONSTRAINT rooms_fk1 FOREIGN KEY(bookedBy) REFERENCES users(uId) ON DELETE SET NULL,
CONSTRAINT rooms_ck1 UNIQUE(rName, rBookStart, rBookEnd),
CONSTRAINT rooms_ch1 CHECK(rName IN ('Amber', 'Diamond', 'Emerald', 'Jade', 'Opal', 'Quartz', 'Ruby', 'Sapphire')),
CONSTRAINT rooms_ch2 CHECK(capacity BETWEEN 000 AND 999 AND LENGTH(capacity)<=3),
CONSTRAINT rooms_ch3 CHECK(SUBSTRING(promoCode, 5, 1) BETWEEN 0 AND 9 AND SUBSTRING(promoCode, 6, 1) BETWEEN 0 AND 9 AND LENGTH(promoCode)=6),
CONSTRAINT rooms_ch4 CHECK(isPromoUsed IN ('0', '1') AND LENGTH(isApproved)=1),
CONSTRAINT rooms_ch5 CHECK(isLaunched IN ('0', '1') AND LENGTH(isLaunched)=1),
CONSTRAINT rooms_ch6 CHECK(isApproved IN ('0', '1') AND LENGTH(isApproved)=1)
);

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
This inserts the users (of different roles) in our prototype system.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

INSERT INTO users(uId, fName, lName, uRole, email, uPw) VALUES
(1, 'James', 'Cook', 'sysadmn', 'sysadmn@mymail.com', 'sysadmnpassword'),
(2, 'John', 'Cook', 'staff', 'staffid@mymail.com', 'staffpassword'),
(3, 'George', 'Lai', 'student', 'studentacc@mymail.com', 'studentpassword');

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
This section of the script verifies that changes have been applied to the
database after the associated functions were executed in the iOS Application.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
Staff Functions

Login As Staff: No verification needed.
(1) Create New Room: Verification needed. (
    Adjust Booking Capacity
    Adjust Booking Date & Time
    Set Booking Price
    Set Promotional Codes
    Launch Room
    )
(2) View Rooms Pending Approval: Verification needed.
(3) View Approved Rooms: Verification needed.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

-- (1) Run the query before and after function on iOS application is executed.
SELECT rName, capacity,
rBookStart 'From:', rBookEnd 'To:',
TIME_FORMAT(TIMEDIFF(rBookEnd, rBookStart), '%H hours') AS 'timeAllocated',
price, promoCode,
IF (SUBSTRING(promoCode, 5, 2) = '00', 0, (
price * (
	(100 - SUBSTRING(promoCode, 5, 2))
		/100)
 
)) AS 'promoValue', isLaunched, isApproved
FROM rooms
WHERE rId = 1;


-- (2) Verifies that the results obtained are the same as on the iOS application's 'Pending' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=0, 'No', 'Yes') AS 'Approved?'
FROM rooms WHERE isApproved = 0;

-- (3) Verifies that the results obtained are the same as on the iOS application's 'Approved' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=1, 'Yes', 'No') AS 'Approved?'
FROM rooms WHERE isApproved = 1;

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
Sysadmn Functions

Login As System Admin: No verification needed.
(4) View Pending Approval Requests: Verification needed.
(5) Approve Pending Room Requests: Verification needed.
(6) View Approved Room Requests: Verification needed.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

-- (4) Verifies that the results obtained are the same as on the iOS application's 'Requests' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=0, 'No', 'Yes') AS 'Approved?'
FROM rooms WHERE isApproved = 0;

-- (5) Verifies that the results obtained are the same as on the iOS application's 'Requests' tab - BEFORE running (5)
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=1, 'Yes', 'No') AS 'Approved?'
FROM rooms WHERE isApproved = 1;

SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=1, 'Yes', 'No') AS 'Approved?'
FROM rooms WHERE isApproved = 0;

-- (6) Verifies that the results obtained are the same as on the iOS application's 'View All' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=1, 'Yes', 'No') AS 'Approved?'
FROM rooms WHERE isApproved = 1;

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
Student Functions

Login As Student: No verification needed.
(7) View Existing Bookings
(8) View Available Rooms: Verification needed.
(9) Book An Available Room: Verification needed. (
    Adjust Room Booking Time
    Enter Promotional Code
    Pay Booking Reservation Fee
    )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

-- (7) Verifies that the results obtained are the same as on the iOS application's 'My Bookings' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:'
FROM rooms WHERE bookedBy = 3; /* signed-in student's uId is 3. */

-- (8) Verifies that the results obtained are the same as on the iOS application's 'View Rooms' tab.
SELECT rName AS 'Name', DATE_FORMAT(rBookStart, '%e %M %Y') AS 'Date', capacity AS 'Qty:',
IF(isApproved=1, 'Yes', 'No') AS 'Approved?', bookedBy
FROM rooms WHERE isLaunched = 1 AND isApproved = 1 AND bookedBy = NULL;


-- (9) Run the query before and after function on iOS application is executed.
SELECT rName, capacity,
rBookStart 'From:', rBookEnd 'To:',
TIME_FORMAT(TIMEDIFF(rBookEnd, rBookStart), '%H hours') AS 'timeAllocated',
price, promoCode,
IF (isPromoUsed = '0', price,
    IF (SUBSTRING(promoCode, 5, 2) = '00', 0,
        (price * ((100 - SUBSTRING(promoCode, 5, 2))/100))
    )) AS 'amountPaid', isLaunched, isApproved
FROM rooms
WHERE bookedBy = 3;
