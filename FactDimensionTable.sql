use SP21_ksknema
go

CREATE TABLE DimFranchisee
(
  FranchiseeID int identity(1,1) not null PRIMARY KEY,
  FirstName varchar(50),
  LastName varchar(50),
  FullName varchar(100) not null,
  RestaurantIND int not null,
  CorporationName varchar(100),
  OwnerName varchar(100),
  POSSystemName varchar(50) not null,
  OwnLeaseDesc varchar(10)
)


CREATE TABLE DimRestaurant
(
  RestaurantID int identity(1,1) not null PRIMARY KEY,
  Description varchar(100) not null,
  Number int not null,
  OpenDate date not null,
  Status varchar(10) not null,
  DriveThruLanesCount int not null,
  ParkingSpaceCount int not null,
  SeatCount int not null,
  PhoneNumber varchar(15)
)



CREATE TABLE DimLocation
(
 LocationID int identity(1,1) not null PRIMARY KEY,
 StreetAddress varchar(100) not null,
 City varchar(30) not null,
 County varchar(20) not null,
 Country varchar(50) not null,
 State varchar(35) not null,
 PostalZipCode varchar(10) not null,
 LocationText varchar(30) not null
)

CREATE TABLE DimItem
(
  ItemID int identity(1,1) not null PRIMARY KEY,
  Number int not null,
  ShortDescription varchar(50) not null,
  LongDescription varchar(70) not null,
  DefaultPrice decimal(18,2),
  ComboPrice decimal (18,2)
)

Select


CREATE TABLE DimMenu
(
  MenuID int identity(1,1) not null PRIMARY KEY,
  Category varchar(20) not null,
  SubCategory varchar(20) not null,
  ItemType varchar(20) not null
)

SELECT * from dbo.DimMenu

CREATE TABLE DimTransaction
(
TransactionID int identity(1,1) not null PRIMARY KEY,
ReceiptNumber int not null,
BusinessDate date not null,
TransactionTime time not null
)
go

SELECT * from dbo.DimTransaction

CREATE TABLE FactTransaction
(
  FranchiseeID int Foreign Key References DimFranchisee(FranchiseeID),
  RestaurantID int Foreign Key References DimRestaurant(RestaurantID),
  LocationID int Foreign Key References DimLocation(LocationID),
  ItemID int Foreign Key References DimItem(ItemID),
  MenuID int Foreign Key References DimMenu(MenuID),
  TransactionID int Foreign Key References DimTransaction(TransactionID),
  ItemCount int not null,
  ItemGrossSale decimal(18,4),
  ItemNetSale decimal(18,4),
  ItemTaxAmount decimal(18,4)
 
)


go

DROP table DimLocation
DROP TABLE FactTransaction
DROP TABLE SSBSource1

ALTER TABLE table_name
ADD column_name datatype;
