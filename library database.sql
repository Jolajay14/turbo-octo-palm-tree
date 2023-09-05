CREATE DATABASE LagosLibrary --T-Sql Statement to Create Database LagosLibrary

--USE LagosLibrary; -- Switch to the LagosLibrary database

--CREATE SCHEMA LasLib AUTHORIZATION dbo; -- Create the LasLib schema with dbo as the owner

--CREATE TABLE LasLib.Address (    --Creating the Address table
--AddressID int IDENTITY (1,1) PRIMARY KEY,
--AddressLine1 nvarchar(60) NOT NULL,
--AddressLine2 nvarchar(60) NULL,
--City nvarchar(30) NOT NULL,
--County nvarchar(30) NOT NULL,
--PostCode nvarchar(15) NOT NULL);

--ALTER TABLE LasLib.Address     ---Add the membersID column to the LasLib.Address table
--ADD MembersID INT;

--ALTER TABLE LasLib.Address     --Make the MembersID column a foreign key
--ADD CONSTRAINT FK_Address_MembersID
--FOREIGN KEY (MembersID)
--REFERENCES LasLib.Members (MembersID);

--CREATE TABLE LasLib.Members (   --Creating the Members table
--MembersID int IDENTITY (1,1) PRIMARY KEY,
--FirstName nvarchar(50) NOT NULL,
--MiddleName nvarchar(50) NULL,
--LastName nvarchar(50) NOT NULL,
--DateofBirth date NOT NULL,
--EmailAddress nvarchar(50) NOT NULL CHECK (EmailAddress LIKE '%_@_%'),
--Phone nvarchar(25) NOT NULL,
--DateJoined date NOT NULL,
--DateLeft date NULL,
--MembersGender nvarchar(15) NULL,
--AddressID int FOREIGN KEY (AddressID) REFERENCES LasLib.Address(AddressID)
--);
 
---- Drop foreign key constraint
--ALTER TABLE LasLib.Members DROP CONSTRAINT [FK__Members__Address__276EDEB3];

----Delete column
--ALTER TABLE LasLib.Members DROP COLUMN AddressID;


--CREATE TABLE LasLib.LogInDetails (       --Creating the LogInDetails Table
--    LogInID INT IDENTITY (1,1) PRIMARY KEY,
--    Username NVARCHAR(50) NOT NULL UNIQUE,
--    PasswordHash VARBINARY(64) NOT NULL,
--    Salt UNIQUEIDENTIFIER NOT NULL,
--    MembersID INT UNIQUE,
--    CONSTRAINT FK_LogInDetails_MembersID FOREIGN KEY (MembersID)
--	REFERENCES LasLib.Members(MembersID)
--);

--Add CHECK constraint to ensure only alphanumeric and case sensitive characters, and underscore are allowed in username
--ALTER TABLE LasLib.LogInDetails
--ADD CONSTRAINT CK_LogInDetails_Username
--CHECK (Username COLLATE Latin1_General_BIN LIKE '[a-zA-Z0-9_]%');

-- Add UNIQUE constraint to ensure each salt is unique for each password
--ALTER TABLE LasLib.LogInDetails
--ADD CONSTRAINT CK_LogInDetails_Salt UNIQUE (Salt);

--CREATE TABLE LasLib.ItemCatalogue(            --Creating Item Catalogue table
--ItemID int IDENTITY (1,1) PRIMARY KEY,
--ItemTitle nvarchar(60) NOT NULL,
--ItemType nvarchar(20) NOT NULL,
--Author nvarchar(60) NOT NULL,
--YearofPublication int NOT NULL,
--DateAdded date NOT NULL,
--CurrentStatus nvarchar(20) NOT NULL);

--CREATE TABLE LasLib.LostItem(               --Creating LostItem table
--LostItemID int IDENTITY (1,1) PRIMARY KEY,
--ItemID int FOREIGN KEY REFERENCES LasLib.ItemCatalogue(ItemID),
--IdentificationDate date NOT NULL,
--ISBN varchar(20) NULL);

--CREATE TABLE LasLib.RemovedItem(      --Creating Removed ItemTable
--RemovedItemID int IDENTITY (1,1) PRIMARY KEY,
--IdentificationDate date NOT NULL,
--ItemID int FOREIGN KEY REFERENCES LasLib.ItemCatalogue(ItemID),
--ISBN varchar(20) NULL);

--CREATE TABLE LasLib.LoanHistory(         --Creating LoanHistory table
--LoanHistoryID int IDENTITY (1,1) PRIMARY KEY,
--MembersID  int FOREIGN KEY REFERENCES LasLib.Members(MembersID),
--ItemID int FOREIGN KEY REFERENCES LasLib.ItemCatalogue(ItemID),
--DateTaken date NOT NULL,
--DateDue date NOT NULL,
--DateReturned date NULL);

--CREATE TABLE LasLib.OverdueFines(      --Creating Overdue fines table
--OverdueFinesID int IDENTITY (1,1) PRIMARY KEY,
--MembersID int FOREIGN KEY REFERENCES LasLib.Members(MembersID),
--LoanHistoryID int FOREIGN KEY REFERENCES LasLib.LoanHistory(LoanHistoryID),
--TotalOverdueFines money NULL,
--ItemID int FOREIGN KEY REFERENCES LasLib.ItemCatalogue(ItemID)
--);

--ALTER TABLE LasLib.OverdueFines
--ALTER COLUMN TotalOverdueFines money NULL;

--CREATE TABLE LasLib.FinePayment(      ---Creating Fine Payment table
--FinePaymentID int IDENTITY (1,1) PRIMARY KEY,
--MembersID int FOREIGN KEY REFERENCES LasLib.Members(MembersID),
--AmountPaid money NULL,
--DatePaid date NULL,
--TimePaid time NULL,
--RepaymentMethod nvarchar(10) NULL,
--OutstandingBalance money NULL,
--OverdueFinesID int  FOREIGN KEY REFERENCES LasLib.OverdueFines(OverdueFinesID));

--INSERT INTO LasLib.Members      --Inserting records into the Members table
--VALUES ('Joy', 'Alabi', 'Mila', '1999-08-02', 'Joymila@gmail.com', '0143 987 5643', '2022-12-01', NULL,
--'Female'),
--('Noah', NULL, 'Jason', '1989-10-12', 'Noahjason@gmail.com', '0222 876 5167', '2022-03-14', 
--NULL, 'Male'),
--('Shirley', 'Mara', 'Townsend', '1992-02-14', 'Shirleytownsend@gmail.com', '0876 987 4307', '2022-11-08',
--'2023-02-16', 'Female'),
--('Jane', NULL, 'Beacroft', '1986-05-08', 'Janebea@gmail.com', '0215 435 7154', '2022-10-08', NULL,
--'Female'),
--('Jack', NULL, 'Knowsley', '1999-11-12', 'Jackknowsley@gmail.com', '0298 543 5107', '2023-01-14', 
--NULL, 'Male'),
--('Lara', NULL, 'Moor', '1996-04-12', 'Laramoor@gmail.com', '0216 907 8767', '2022-11-02',
--NULL, 'Female'),
--('Tola', NULL, 'Seun', '1993-01-08', 'Tolaseun@gmail.com', '0432 617 2139', '2022-05-23',
--NULL, 'Female');
--INSERT INTO LasLib.Members      --Inserting records into the Members table
--VALUES ('Tiara', 'Teresa', 'Asake', '1998-08-02', 'tiaraasake@gmail.com', '0943 927 5123', '2022-06-04', NULL,
--'Female');

--INSERT INTO LasLib.Address      --Inserting records into the address table
--VALUES ('flat 16, Shomolu Street, PapaAjao', NULL, 'Mushin', 'Avon', 'M30 0EG', '1'),
--('Apartment 20, Riverbankway, Chorlton', NULL, 'Ikorodu', 'Suffolk', 'M50 1TD', '2'),
--('29, Awanatu Street, Oremeji', 'Lake Grove IL212' , 'Southhampton', 'Bedfordshire', 'B20 5AD', '3'),
--('1, Church Lane, King Court', NULL, 'Eccles', 'Lancashire', 'M25 6AS', '4'),
--('flat 12, Haven Court, Langworthy Avenue', NULL, 'Bolton', 'Lancashire', 'E21 5HD', '5'),
--('50, Market Street, Jackson Drive', NULL, 'Bolton', 'Lancashire', 'BL5 43E', '6'),
--('Apartment 64, Renaissance Block, Carlton', NULL, 'Salford', 'Manchester', 'M45 2WT', '7');
--INSERT INTO LasLib.Address      --Inserting records into the address table
--VALUES ('flat 25, Queen Ave, Kearsely', NULL, 'Bolton', 'Manchester', 'M10 0TG', '8')

--INSERT INTO LasLib.LogInDetails         --Inserting records into the login details table
--Values ('joy_mila72', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF,
--'E1F53135-7411-41B3-94D5-CE230C9FDAED', '1'),
--('noah_2j',  0x456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123,
--'6B5A2ECD-6A72-4916-B3D3-638A6A51D6C2', '2'),
--('town3_shirley', 0x789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456,
--'2F0A0E78-1D8F-4A3B-9D3C-3E4639E74182', '3'),
--('beajane_4', 0x9ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF01234567,
--'B72C7322-1BAE-4173-8E02-7A6612D76BCA', '4'),
--('jack_knowsley5', 0xCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789AB, 
--'F0FEAF74-F9DE-4EF6-B159-8D10F2C11171', '5'),
--('lara_moor42', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF,
--'A862DCF8-6B5D-4F1A-989A-40C1E8812D36', '6'),
--('seun76_tola', 0x456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123,
--'6F9619FF-8B86-D011-B42D-00C04FC964FF', '7');
--INSERT INTO LasLib.LogInDetails         --Inserting records into the login details table
--Values ('tiara_asake22', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF ,
--'01234567-89AB-CDEF-0123-456789ABCDEF', '8');

--INSERT INTO LasLib.ItemCatalogue   ---inserting records into the item catalogue table
--VALUES ('Philosophy of Education', 'Book', 'Chris Edwin', '1965', '2020-09-11', 'On loan'),
--('Purple Princess of Peanut', 'Book', 'Janice Robert', '1987', '2021-03-22', 'Available'),
--('Principle of Mechanized Farming', 'Book', 'Ajayi Badru', '1978', '2003-09-06', 'Available'),
--('African Journal of Agricultural Research', 'Journal', 'Charles Akin', '2017', '2019-08-13',
--'On Loan'),
--('Dance of the Dragons', 'DVD', 'George Martin', '2001', '2004-02-24', 'Overdue'),
--('Quranic Recitation', 'Other Media', 'Ustaz Moshood', '2009', '2012-03-09', 'Lost'),
--('Purple Hibiscus', 'Book', 'Chima Agnes', '2016', '2018-04-05', 'Removed'),
--('Love by Twilight', 'Book', 'Dora George', '2006', '2004-09-12', 'Overdue');


--INSERT INTO LasLib.LostItem     --inserting records into the lost item table
--VALUES ( '6', '2023-01-25', NULL);

--INSERT INTO LasLib.RemovedItem    --inserting records into the removed item table
--VALUES ( '2023-02-14', '7', '978-3-26-148210-0');

--INSERT INTO LasLib.LoanHistory     --inserting records into the Loan table
--VALUES ('1', '1', '2022-01-29', '2022-04-29', NULL),
--('2', '2', '2023-02-07', '2023-02-28', '2023-02-27'),
--('3', '3', '2023-02-02', '2023-03-30', '2023-03-30'),
--('4', '4', '2023-01-19', '2023-04-30', NULL),
--('5', '5', '2022-12-01', '2023-02-01', NULL),
--('6', '6', '2023-02-17', '2023-02-28', NULL),
--('7', '7', '2023-01-10', '2023-02-10', NULL),
--('8', '8', ' 2023-03-28', '2023-04-12', NULL);
--UPDATE LasLib.LoanHistory
--SET DateDue = '2023-04-20'
--WHERE LoanHistoryID = 9;

--INSERT INTO LasLib.OverdueFines   ----inserting records into the the overdue fines table
--VALUES ( '5', '13' , '7.40', '5'),
--('8', '16', '4.0', '8');

-- Alter the Time paidcolumn data type from TIME(7) to TIME(0)
--ALTER TABLE LasLib.FinePayment
--ALTER COLUMN TimePaid TIME(0);

--INSERT INTO LasLib.FinePayment
--VALUES ('5', '7.40', '2023-04-01', '10:30:20', 'card', Null, '1'),
--('8', '2.0', '2023-04-15', '15:45:00', 'cash', '2.00', '2');

--CREATE PROCEDURE SearchItemCatalogue @ItemTitle nvarchar(60) ---Part 2(a) Stored procedure for seaching item catalogu
--AS
--SELECT * FROM LasLib.ItemCatalogue WHERE ItemTitle LIKE @ItemTitle + '%'
--ORDER BY YearofPublication DESC;

--EXEC SearchItemCatalogue @ItemTitle = 'P_r'    --Executing stored procedure

--CREATE FUNCTION LasLib.GetItemsOnLoan()  ---Part2(b) user defined function to get items on loan with due date less than 5 days from the current date
--RETURNS TABLE
--AS
--RETURN
--(
--SELECT I.ItemID, I.ItemTitle, I.ItemType, I.Author, I.YearofPublication, 
--I.DateAdded, I.CurrentStatus, L.DateDue, L.DateReturned
--FROM LasLib.ItemCatalogue AS I
--INNER JOIN LasLib.LoanHistory AS L on I.ItemID = L.ItemID
--WHERE I.CurrentStatus = 'On loan'
--AND DATEDIFF (day, GETDATE(), L.DateDue) < 5
--);

--SELECT * FROM LasLib.GetItemsOnLoan();

--CREATE PROCEDURE LasLib.InsertNewMember  --Part 2(c)Stored procedure for inserting a new member
--   @FirstName NVARCHAR(50),
--	@MiddleName NVARCHAR(50),
--    @LastName NVARCHAR(50),
--	@DateofBirth DATE,
--    @EmailAddress NVARCHAR(50),
--    @Phone NVARCHAR(25),
--    @DateJoined DATE,
--	@DATELeft DATE,
--	@MembersGender NVARCHAR(15)
--AS
--BEGIN
--    SET NOCOUNT ON;

--    INSERT INTO LasLib.Members (FirstName, MiddleName, LastName, DateofBirth,
--	EmailAddress, Phone, DateJoined, DateLeft, MembersGender)
--   VALUES (@FirstName, @MiddleName, @LastName, @DateofBirth,
--	@EmailAddress, @Phone, @DateJoined, @DateLeft, @MembersGender);
--END;

--EXEC LasLib.InsertNewMember 'Jason', 'Mathew', 'Jones', '1994-09-04', 'Jasonjones@gmail.com',    --executing stored procedure
--'0553 123 8924', '2023-02-12', NULL, 'Male';

--SELECT *          
--FROM LasLib.Members; 

--CREATE PROCEDURE LasLib.UpdateMemberDetails        --Part 2(d)Stored procedure to update member details
--    @MembersID INT,
--    @FirstName NVARCHAR(50),
--	@MiddleName NVARCHAR(50),
--	@LastName NVARCHAR(50),
--	@DateofBirth DATE,
--    @EmailAddress NVARCHAR(50),
--    @Phone NVARCHAR(25),
--	@DateJoined DATE,
--	@DateLeft  DATE,
--	@MembersGender NVARCHAR(15)
--AS
--BEGIN
--    UPDATE LasLib.Members
--    SET FirstName = @FirstName,
--	        MiddleName = @MiddleName,
--            LastName = @LastName,
--		    DateofBirth = @DateofBirth,
--            EmailAddress = @EmailAddress,
--            Phone = @Phone,
--		    DateJoined = @DateJoined,
--		    DateLeft = @DateLeft,
--		    MembersGender = @MembersGender
--    WHERE MembersID = @MembersID
--END;

--EXEC LasLib.UpdateMemberDetails @MembersID = 4, @FirstName = 'Jane',   --Executing the stored procedure for updating a members details
--@MiddleName = NULL, @LastName = 'Beacroft', 
--@DateofBirth = '1989-05-08', @EmailAddress = 'Janebea@gmail.com', 
--@Phone = '0215 435 7154', @DateJoined = '2022-10-08', @DateLeft = NULL,
--@MembersGender = 'Female'

--CREATE VIEW LoanHistoryView AS          ---Part3  LoanHistoryView
--SELECT I.ItemID, I.ItemTitle, I.ItemType, I.Author, I.YearofPublication, I.DateAdded,
--L.DateTaken, L.DateDue, O.TotalOverdueFines
--FROM LasLib.ItemCatalogue AS I
--JOIN LasLib.LoanHistory AS L ON I.ItemID = L.ItemID
--LEFT JOIN LasLib.OverdueFines AS O ON L.LoanHistoryID = O.LoanHistoryID;

--SELECT * 
--FROM LoanHistoryView;

--CREATE TRIGGER Tr_UpdateItemStatus       --- Part 4:Trigger to update status of the item
--ON LasLib.ItemCatalogue
--AFTER UPDATE
--AS
--BEGIN
--    IF UPDATE(CurrentStatus)
--    BEGIN
--        UPDATE LasLib.ItemCatalogue
--        SET CurrentStatus = 'Available'
--        FROM inserted I
--        WHERE LasLib.ItemCatalogue.ItemID = I.ItemID
--        AND I.CurrentStatus = 'Returned'
--    END
--END

--UPDATE LasLib.ItemCatalogue
--SET CurrentStatus = 'Returned'
--WHERE ItemID = 1

--SELECT CurrentStatus
--FROM LasLib.ItemCatalogue
--WHERE ItemID = 1

--CREATE FUNCTION LasLib.IdentifyTotalLoansOnDate       ---Part 5 function to identify total loans made on a specified date
--(
--    @SpecifiedDate DATE
--)
--RETURNS INT
--AS
--BEGIN
--    DECLARE @TotalLoans INT;

--    SELECT @TotalLoans = COUNT(*)
--    FROM LasLib.LoanHistory
--    WHERE CONVERT(DATE, DateTaken) = @SpecifiedDate;

--    RETURN @TotalLoans;
--END;

--DECLARE @SpecifiedDate DATE = '2023-01-19';
--SELECT LasLib.IdentifyTotalLoansOnDate(@SpecifiedDate) AS TotalLoans;

--CREATE VIEW AvailableItems AS             ---Part 7(a) view to check all available items in the catalogue
--SELECT ItemID, ItemTitle, ItemType, Author, YearofPublication, 
--DateAdded, CurrentStatus
--FROM LasLib.ItemCatalogue
--WHERE CurrentStatus = 'Available';

--SELECT *
--FROM AvailableItems;

-- Create the stored procedure for calculating the overdue fines for all overdue loans part 7b
--CREATE PROCEDURE LasLib.CalculateOverdueFines
--AS
--BEGIN
--  DECLARE @CurrentDate DATE;
--  SET @CurrentDate = GETDATE();      -- Get the current date

--  -- Update fines for all overdue loans
--  UPDATE LasLib.OverdueFines
--  SET TotalOverdueFines = DATEDIFF(DAY, DateDue, @CurrentDate) * 0.10 -- Calculate overdue fines as 10p per day
--  FROM LasLib.OverdueFines
--  INNER JOIN LoanHistory ON OverdueFines.LoanHistoryID = LoanHistory.LoanHistoryID
--  INNER JOIN ItemCatalogue ON LoanHistory.ItemID = ItemCatalogue.ItemID
--  WHERE LoanHistory.DateReturned IS NULL    --  to only update loans that are still overdue
--    AND @CurrentDate > LoanHistory.DateDue -- Check if the current date is greater than the due date
--	AND (LoanHistory.DateReturned IS NOT NULL OR ItemCatalogue.CurrentStatus != 'Lost/Removed') -- Exclude lost and removed items
--END
  
--  CREATE FUNCTION LasLib.Verify_LogIn_Details      ---user defined function to verify log in details part 7c
--(
--    @MembersId INT,
--    @username NVARCHAR(50),
--    @password NVARCHAR(50)
--)
--RETURNS BIT
--AS
--BEGIN
--    DECLARE @isValid BIT = 0;     -- Initialize the boolean value to false

--    -- Check if the entered username, password, and MembersId match a row in the LasLib.Logindetails table
--    IF EXISTS (
--        SELECT 1
--        FROM LasLib.LogInDetails
--        WHERE MembersId = @MembersId
--          AND Username = @Username
--          AND passwordhash = HASHBYTES('SHA2_256', @password + CAST(salt AS NVARCHAR(50))) -- To Compare hashed password with salt
--    )
--        SET @isValid = 1;  -- Set the boolean value to true if a match is found

--    RETURN @isValid;  -- Return the boolean value
--END;


--SELECT LasLib.Verify_LogIn_Details(3, 'town3_shirley', 'password')

--CREATE SCHEMA Sensitive_data;    --create a schema called sensitive data Part 7d

--ALTER SCHEMA Sensitive_data TRANSFER LasLib.LogInDetails;   ---move LasLib.LogInDetails to the schema sensitive data

--CREATE ROLE Librarian; --create role called Librarian

--GRANT SELECT, UPDATE ON SCHEMA::Sensitive_data TO Librarian; --Grant write access to Librarian role
