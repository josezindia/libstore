CREATE TABLE Books (
    BookID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50),
    ISBN VARCHAR(30),
    Genre VARCHAR(30),
    Authors VARCHAR(100),
    BranchID INT,
    PRIMARY KEY (BookID)
    FOREIGN KEY(BranchID) REFERENCES Branch(BranchID)
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
    StateName VARCHAR(3),
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

CREATE TABLE Job (
    JobID INT NOT NULL AUTO_INCREMENT,
    JobTitle VARCHAR(30),
    JobDescription VARCHAR(100),
    PRIMARY KEY(JobID)
);

CREATE TABLE Employees (
	EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    JobID INT,
    Street VARCHAR(50),
    City VARCHAR(50),
    StateName VARCHAR(3),
    Zip VARCHAR(20),
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY(JobID) REFERENCES Job(JobID)
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

CREATE TABLE WorksAt (
    EmployeeID INT,
    BranchID INT,
    PRIMARY KEY(EmployeeID, BranchID),
    FOREIGN KEY(EmployeeID) REFERENCE Employee(EmployeeID),
    FOREIGN KEY(BranchID) REFERENCES Branch(BranchID),
);

CREATE TABLE Region (
	RegionID INT NOT NULL AUTO_INCREMENT,
    RegionName VARCHAR(50),
    RegionManager INT,
    PRIMARY KEY(RegionID),
    FOREIGN KEY(RegionManager) REFERENCES Employees(EmployeeID)
);