---First child table

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountType VARCHAR(20),
    Balance DECIMAL(10, 2),
    DateOpened DATE
);

-- Insert data into Accounts table
INSERT INTO Accounts VALUES(AccountId,AccountType, Balance, DateOpened)
insert into accounts values(001,'Savings', 1000.00, '2023-01-01')
,(002,'current',7000.00,'2024-04-05')
,(003,'saving',6005.00,'2024-05-06')
,(004,'current',3303.00,'2023-07-09')	
,(006,'saving',9000.00,'2024-03-04')	
,(005,'current', 500.00, '2023-02-01');

select * from accounts

---second child table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(10, 2),
    TransactionDate DATE,
    Description VARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);


-- Insert data into Transactions table
INSERT INTO Transactions VALUES  (transactionid,AccountID, TransactionType, Amount, TransactionDate, Description)
insert into transactions values(111,001, 'Deposit', 200.00, '2023-03-01', 'Initial deposit')
,(112,002,'deposite',3000.00,'2024-03-01','initial deposit')
,(113,004,'withdrawal',1500.00,'2023-06-07','Cash Withdrawal')
,(114,005,'deposite',2400.00,'2024-02-02','initial deposite')
,(115,003, 'Withdrawal', 50.00, '2023-04-01', 'ATM withdrawal')
,(116,006,'deposite',2299.00,'2024-03-05','initial deposite');		

select * from Transactions
	
--Parent table
	
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    PrimaryAccountID INT,
    MostRecentTransactionID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    FOREIGN KEY (PrimaryAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (MostRecentTransactionID) REFERENCES Transactions(TransactionID)
);
select * from customers


-- Insert data into Customers table
INSERT INTO Customers VALUES (customerid,PrimaryAccountID, MostRecentTransactionID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, Address)
insert into customers values(1,004, 113, 'priti', 'varma', '1989-05-15', 'priti.varma@example.com', '123-456-7890', '123 Main St')
,(3,005,114,'krishna','rao','1990-08-09','krishnarao@example.com','223-455-9807','96,nagar road east')
,(2,001,111,'ramesh','rajan','1982-09-12','ramesh.rajan23@example.com','212-223-334','ravinagar')
,(4,002,112,'ram','kumar','1992-08-03','ramkumar@example.com','333-555-666','krishnanagar')
,(5,003,115,'sharda','devi','1979-09-01','shardadevi@example.com','444-888-999','premnagar')	
,(6,002, 112, 'Jane', 'Smith', '1990-07-20', 'jane.smith@example.com', '098-765-4321', '456 Oak Ave');

select * from customers
