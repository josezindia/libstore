CREATE TABLE Books (
    BookID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50),
    ISBN VARCHAR(30),
    GENRE VARCHAR(30),
    Authors VARCHAR(100),
    PRIMARY KEY (BookID)
);

CREATE TABLE Members(
	MemberID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    MemberSince DATE,
    Age INT,
    Gender VARCHAR(30),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(3),
    Zip VARCHAR(20),
    PRIMARY KEY (MemberID)
);

CREATE TABLE CheckOut (
    CheckOutID INT NOT NULL AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    CheckOutDate DATE,
    DueDate DATE,
    PRIMARY KEY(CheckOutID),
    FOREIGN KEY(BookID) REFERENCES Books(BookID),
    FOREIGN KEY(MemberID) REFERENCES Members(BookID)
);

CREATE TABLE CheckIn (
    CheckInID INT NOT NULL AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    CheckInDate DATE,
    PRIMARY KEY(CheckInID),
    FOREIGN KEY(BookID) REFERENCES Books(BookID),
    FOREIGN KEY(MemberID) REFERENCES Members(BookID)
);

CREATE TABLE Employees (
	EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    JobTitle VARCHAR(50),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(3),
    Zip VARCHAR(20),
    BranchID INT,
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(BranchID) REFERENCES Branch(BranchID)
    );
    
CREATE TABLE Branch (
	BranchID INT NOT NULL AUTO_INCREMENT,
    BranchName VARCHAR(50),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(3),
    Zip VARCHAR(20),
    BranchManager INT,
    RegionID INT,
    PRIMARY KEY(BranchID),
    FOREIGN KEY(BranchManager) REFERENCES Employees(EmployeeID),
    FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Region (
	RegionID INT NOT NULL AUTO_INCREMENT,
    RegionName VARCHAR(50),
    RegionManager INT,
    PRIMARY KEY(RegionID),
    FOREIGN KEY(RegionManager) REFERENCES Employees(EmployeeID)
);