use SP21_ksknema
go

CREATE VIEW BURGERINC
AS 
SELECT [FirstName]
      ,[LastName]
      ,[FullName]
      ,[RestaurantIND]
      ,[CorporationName]
      ,[OwnerName]
      ,[POSSystemName]
      ,[OwnLeaseDesc]
	  ,DI.[Number] AS [ITEMNO]
      ,[ShortDescription]
      ,[LongDescription]
      ,[DefaultPrice]
      ,[ComboPrice]
	  ,[StreetAddress]
      ,[City]
      ,[County]
      ,[Country]
      ,[State]
      ,[PostalZipCode]
      ,[LocationText]
	  ,[Category]
      ,[SubCategory]
      ,[ItemType]
	  ,[Description]
      ,DR.[Number] AS [REST_NUMBER]
      ,[OpenDate]
      ,[Status]
      ,[DriveThruLanesCount]
      ,[ParkingSpaceCount]
      ,[SeatCount]
      ,[PhoneNumber]
	  ,[ReceiptNumber]
      ,[BusinessDate]
      ,[TransactionTime]
	  ,ItemCount
	  ,ItemGrossSale
	  ,ItemNetSale
	  ,ItemTaxAmount 
	  
FROM dbo.FactTransaction FT
JOIN dbo.DimFranchisee DF ON FT.FranchiseeID = DF.FranchiseeID
JOIN dbo.DimRestaurant DR ON FT.RestaurantID = DR.RestaurantID
JOIN dbo.DimLocation DL ON FT.LocationID = DL.LocationID
JOIN dbo.DimItem DI ON FT.ItemID = DI.ItemID
JOIN dbo.DimMenu DM ON FT.MenuID = DM.MenuID
JOIN dbo.DimTransaction DT ON FT.TransactionID = DT.TransactionID


