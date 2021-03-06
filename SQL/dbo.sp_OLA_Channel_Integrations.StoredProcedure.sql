USE [Integrations]
GO
/****** Object:  StoredProcedure [dbo].[sp_OLA_Channel_Integrations]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_OLA_Channel_Integrations]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	UPDATE Integrations.OLA_Channel.RMS_Sites SET CorpYear = '2016-2017' WHERE CorpYear = '16-17'
	UPDATE Integrations.OLA_Channel.RMS_Sites SET CorpYear = '2015-2016' WHERE CorpYear = '15-16'
	UPDATE Integrations.OLA_Channel.Integration SET Service_Year_Of_Interest = '2016-2017' WHERE Service_Year_Of_Interest = '16-17'
	UPDATE Integrations.OLA_Channel.Integration SET Service_Year_Of_Interest = '2015-2016' WHERE Service_Year_Of_Interest = '15-16'
	UPDATE Integrations.OLA_Channel.Integration SET Corps_Application_Year__c = '2016-2017' WHERE Corps_Application_Year__c = '16-17'
	UPDATE Integrations.OLA_Channel.Integration SET Corps_Application_Year__c = '2015-2016' WHERE Corps_Application_Year__c = '15-16'
	UPDATE Integrations.OLA_Channel.Integration SET Offered = 0
	UPDATE Integrations.OLA_Channel.Integration SET Confirmed = 0

	UPDATE Integrations.OLA_Channel.Integration
	SET Service_Location_Of_Interest = isnull(b.SiteName, 'None')
--	, Service_Year_Of_Interest = isnull(b.CorpYear, '2016-2017')
	, Corps_Application_Year__c = b.CorpYear
	, Offered = isnull(b.Offered, 0)
	, Confirmed = isnull(b.Confirmed, 0)
	, RMS_OLA_Status = isnull(b.Status, null)
	, FullMidYear = b.FullMidYear
	FROM Integrations.OLA_Channel.Integration (nolock) a 
	left outer join Integrations.OLA_Channel.RMS_Sites (nolock) b on a.AppID = b.AppID

	UPDATE Integrations.OLA_Channel.Integration SET Service_Year_Of_Interest = '2016-2017' WHERE Service_Year_Of_Interest = '16-17'
	UPDATE Integrations.OLA_Channel.Integration SET Service_Year_Of_Interest = '2015-2016' WHERE Service_Year_Of_Interest = '15-16'
	UPDATE Integrations.OLA_Channel.Integration SET Corps_Application_Year__c = '2016-2017' WHERE Corps_Application_Year__c = '16-17'
	UPDATE Integrations.OLA_Channel.Integration SET Corps_Application_Year__c = '2015-2016' WHERE Corps_Application_Year__c = '15-16'

	TRUNCATE TABLE Integrations.OLA_Channel.OLA_Max_App_ID

	INSERT INTO Integrations.OLA_Channel.OLA_Max_App_ID(AppID, Email)
	SELECT MAX(AppID) AppID, Email
	FROM Integrations.OLA_Channel.Integration (nolock)
	WHERE Service_Year_Of_Interest IN ('2015-2016','2016-2017')-- = '2016-2017' --or Corps_Application_Year__c = '2016-2017'
	GROUP BY Email

	TRUNCATE TABLE Integrations.OLA_Channel.Integration_Massaged

	INSERT INTO Integrations.OLA_Channel.Integration_Massaged(AppID
		, FirstName
		, LastName
		, DateEntered
		, [DateWritten]
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
		, Offered
		, Confirmed
		, RMS_OLA_Status
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear
		, OwnerID
		, Major__c)
	SELECT a.AppID
		, a.FirstName
		, a.LastName
		, DateEntered
		, DateWritten
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, a.Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, isnull(c.Transformed, a.School_Name) School_Name
		, isnull(c.Transformed_City, School_City) School_City
		, isnull(Transformed_State, School_State) School_State
		, Ethnicity
		, Birthdate
		, Offered
		, Confirmed
		, RMS_OLA_Status
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear
		, OwnerID
		, Major__c
	FROM Integrations.OLA_Channel.Integration (nolock) a
	INNER JOIN 
		Integrations.OLA_Channel.OLA_Max_App_ID (nolock) b ON 
			a.AppID = b.AppID LEFT OUTER JOIN 
		Integrations.OLA_Channel.School_Normalization (nolock) c ON 
			rtrim(a.School_Name) = rtrim(c.[Current]) AND 
			rtrim(a.School_City) = rtrim(c.Current_City) AND 
			rtrim(a.School_State) = rtrim(c.Current_State)
	
	UPDATE Integrations.OLA_Channel.Integration_Massaged set Major__c = 'Psychology - Neuroscience & Medical Anthro. Minors' where Major__c = 'Psychology – Neuroscience & Medical Anthro. Minors'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Street = '352 St. Johns Place ' WHERE email = 'abraham.christelle@gmail.com'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Baton Rouge' WHERE Service_Location_Of_Interest = 'City Year Baton Rouge'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Boston' WHERE Service_Location_Of_Interest = 'City Year Boston'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Chicago' WHERE Service_Location_Of_Interest = 'City Year Chicago'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Cleveland' WHERE Service_Location_Of_Interest = 'City Year Cleveland'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Columbia' WHERE Service_Location_Of_Interest = 'City Year Columbia'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Columbus' WHERE Service_Location_Of_Interest = 'City Year Columbus'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Dallas' WHERE Service_Location_Of_Interest = 'City Year Dallas'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Denver' WHERE Service_Location_Of_Interest = 'City Year Denver'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Detroit' WHERE Service_Location_Of_Interest = 'City Year Detroit'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Florida Region' WHERE Service_Location_Of_Interest = 'City Year Florida Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Jacksonville' WHERE Service_Location_Of_Interest = 'City Year Jacksonville'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Little Rock' WHERE Service_Location_Of_Interest = 'City Year Little Rock/North Little Rock'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Los Angeles' WHERE Service_Location_Of_Interest = 'City Year Los Angeles'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Miami' WHERE Service_Location_Of_Interest = 'City Year Miami'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Mid-West Region' WHERE Service_Location_Of_Interest = 'City Year Mid-West Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Mid-Atlantic Region' WHERE Service_Location_Of_Interest = 'City Year Mid-Atlantic Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Milwaukee' WHERE Service_Location_Of_Interest = 'City Year Milwaukee'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Mountain Central Region' WHERE Service_Location_Of_Interest = 'City Year Mountain Central Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Where I''m most needed' WHERE Service_Location_Of_Interest = 'City Year National'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Where I''m most needed' WHERE Service_Location_Of_Interest = 'City Year NRD'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='New Hampshire' WHERE Service_Location_Of_Interest = 'City Year New Hampshire'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='New Orleans' WHERE Service_Location_Of_Interest = 'City Year New Orleans'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='New York' WHERE Service_Location_Of_Interest = 'City Year New York'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Northeast Region' WHERE Service_Location_Of_Interest = 'City Year Northeast Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Orlando' WHERE Service_Location_Of_Interest = 'City Year Orlando'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Philadelphia' WHERE Service_Location_Of_Interest = 'City Year Philadelphia'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Rhode Island' WHERE Service_Location_Of_Interest = 'City Year Rhode Island'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Sacramento' WHERE Service_Location_Of_Interest = 'City Year Sacramento'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='San Antonio' WHERE Service_Location_Of_Interest = 'City Year San Antonio'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='San Jose' WHERE Service_Location_Of_Interest = 'City Year San Jose/Silicon Valley'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Seattle' WHERE Service_Location_Of_Interest = 'City Year Seattle/King County'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Southern Region' WHERE Service_Location_Of_Interest = 'City Year South Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Tulsa' WHERE Service_Location_Of_Interest = 'City Year Tulsa'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Washington DC' WHERE Service_Location_Of_Interest = 'City Year Washington, DC'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='West Coast Region' WHERE Service_Location_Of_Interest = 'City Year West Coast Region'
	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Location_Of_Interest ='Kansas City' WHERE Service_Location_Of_Interest = 'City Year Kansas City'

	UPDATE Integrations.OLA_Channel.Integration_Massaged SET Service_Year_Of_Interest = '2016-2017' WHERE Service_Year_Of_Interest = '16-17'

	EXEC Integrations.dbo.sp_Data_Cleansing

	TRUNCATE TABLE Integrations.OLA_Channel.Inserts

	INSERT INTO Integrations.OLA_Channel.Inserts(email)
	SELECT a.email
	FROM Integrations.OLA_Channel.Integration_Massaged (nolock) a LEFT OUTER JOIN 
	ODW_Stage.dbo.Lead (nolock) b ON 
		a.email = b.email
	WHERE b.email IS NULL

	UPDATE [Integrations].[OLA_Channel].[Integration_Massaged] SET Source = 'OLA Integration'
	UPDATE [Integrations].[OLA_Channel].[Integration_Massaged] SET Source_Detail = ''

	TRUNCATE TABLE Integrations.OLA_Channel.Inserts_Final

	INSERT INTO Integrations.OLA_Channel.Inserts_Final(FirstName
		, LastName
		, DateEntered
		, DateWritten
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, Email
		, Source
		, Source_Detail
		, Street, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
		, Offered
		, Confirmed
		, RMS_OLA_Status
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear
		, OwnerID
		, Major__c)
	SELECT DISTINCT FirstName
		, LastName
		, DateEntered
		, DateWritten
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, a.Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
		, Offered
		, Confirmed
		, RMS_OLA_Status
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear
		, OwnerID
		, Major__c
	FROM Integrations.OLA_Channel.Integration_Massaged (nolock) a INNER JOIN 
	Integrations.OLA_Channel.Inserts (nolock) b ON 
		a.email = b.email

	UPDATE Integrations.OLA_Channel.Inserts_Final SET Ethnicity = 'Other' 
	WHERE Ethnicity IS NULL

	UPDATE Integrations.OLA_Channel.Inserts_Final SET IsRecruitementLead__c = 1

	TRUNCATE TABLE Integrations.OLA_Channel.Updates

--  Non school
	INSERT INTO Integrations.OLA_Channel.Updates(email
		, id)
	SELECT a.email
		, min(b.External_ID_SFID__c) External_ID_SFID__c
	FROM Integrations.OLA_Channel.Integration_Massaged (nolock) a INNER JOIN 
	ODW_Stage.dbo.Lead (nolock) b ON 
		a.email = b.email
	WHERE (a.FirstName <> b.FirstName OR 
		a.LastName <> b.LastName OR 
		a.Gender <> b.Gender__c OR 
		a.Lead_Status <> isnull(b.Status, '') OR 
		a.Inactive_in_OLA <> b.Inactive_in_OLA__c OR 
		a.Phone <> isnull(b.Phone, '') OR 
		isnull(a.DateWritten, 0) <> isnull(b.Submitted_Application_Datetime__c, '') OR 
		a.Street <>  isnull(b.Street, '') OR 
		a.City <> isnull(b.City, '') OR 
		a.State <> b.State OR 
		isnull(a.DateEntered, 0) <> isnull(b.Started_Application_Datetime__c, 0) OR 
		a.Zip <> isnull(b.PostalCode, '') OR 
		a.Service_Year_Of_Interest <> isnull(b.Corps_Service_Year_of_Interest__c, 'N/A') OR 
		a.Corps_Application_Year__c <> isnull(b.Corps_Application_Year__c, 'N/A') OR 
		a.Application_Location_RMS <> isnull(b.Corps_Application_RMS_Location__c, 'N/A') OR 
		a.Ethnicity <> isnull(b.Ethnicity__c, 'N/A') OR 
		isnull(a.RMS_OLA_Status, 'N/A') <> isnull(b.Corps_Application_Status__c, 'N/A') OR 
		isnull(a.Education, 'N/A') <> isnull(b.Corps_Application_Education_Level__c, 'N/A') OR 
		ISNULL(a.FullMidYear,'N/A')<> ISNULL(b.FullMidYear, 'N/A')) AND 
		isnull(b.Status, 'N/A') <> 'Closed/Lost' 
	GROUP BY a.Email
	 
-- school
/*
	insert into Integrations.OLA_Channel.Updates(email, id)
	select a.email, b.External_ID_SFID__c
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.email
	left outer join Integrations.OLA_Channel.Updates (nolock) c on a.Email = c.email
	where a.School_Name <> b.School_Name__c and a.School_Name <> '' and c.email is null
*/

	DROP TABLE Integrations.OLA_Channel.Updates_Final

	SELECT DISTINCT FirstName
		, LastName
		, DateEntered
		, DateWritten
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, a.Email
		, Source
		, Source_Detail
		, Street, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
		, b.id External_ID_SFID__c
		, 1 IsRecruitementLead__c
		, Offered
		, Confirmed
		, RMS_OLA_Status
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear
		, OwnerID
		, Major__c
	INTO Integrations.OLA_Channel.Updates_Final
	FROM Integrations.OLA_Channel.Integration_Massaged (nolock) a INNER JOIN 
	Integrations.OLA_Channel.Updates (nolock) b ON 
		a.email = b.email
	
	UPDATE Integrations.OLA_Channel.Updates_Final
	SET External_ID_SFID__c = b.Id
	FROM Integrations.OLA_Channel.Updates_Final (nolock) a INNER JOIN 
	ODW_Stage.dbo.Lead (nolock) b ON 
		a.email = b.Email
	WHERE a.External_ID_SFID__c IS NULL

	INSERT INTO Integrations.OLA_Channel.Insert_Exceptions(FirstName
		, LastName
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate)
	SELECT FirstName
		, LastName
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, a.Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
	FROM Integrations.OLA_Channel.Inserts_Final a LEFT OUTER JOIN (SELECT EMAIL 
		FROM Integrations.OLA_Channel.Insert_Exceptions) b ON 
			a.Email = b.email
		WHERE (FirstName LIKE '%á%' OR 
		FirstName LIKE '%í%' OR 
		FirstName LIKE '%ó%' OR 
		FirstName LIKE '%ú%' OR
		 
		LastName LIKE '%á%' OR 
		LastName LIKE '%ó%' OR 
		LastName LIKE '%í%' OR 
		LastName LIKE '%ú%' OR
		 
		Street LIKE '%ó%' OR 
		Street LIKE '%á%' OR 
		Street LIKE '%í%' OR 
		Street LIKE '%ú%' OR
		
	    City LIKE '%ó%' OR 
	    City LIKE '%á%' OR 
	    City LIKE '%í%' OR 
	    City LIKE '%ú%' OR
	     
	    FirstName LIKE '%ö%' OR 
	    LastName LIKE '%ö%' OR 
	    City LIKE '%ö%' OR
	     
	    FirstName LIKE '%º%' OR 
	    LastName LIKE '%º%' OR 
	    City LIKE '%º%' OR
	     
	    FirstName LIKE '%ä%' OR 
	    LastName LIKE '%ä%' OR 
	    City LIKE '%ä%' OR
	     
	    FirstName LIKE '%é%' OR 
	    LastName LIKE '%é%' OR 
	    City LIKE '%é%' OR
	     
	    FirstName LIKE '%ë%' OR 
	    LastName LIKE '%ë%' OR 
	    City LIKE '%ë%' OR
	     
	    School_Name LIKE '%á%' OR 
	    School_Name LIKE '%í%' OR 
	    School_Name LIKE '%ó%' OR 
	    School_Name LIKE '%ö%' OR 
	    School_Name LIKE '%º%' OR 
	    School_Name LIKE '%ä%' OR 
	    School_Name LIKE '%é%' OR 
	    School_Name LIKE '%ë%' OR 
	    School_Name LIKE '%ú%' OR
	     
	    School_City LIKE '%á%' OR 
	    School_City lIKE '%í%' OR 
	    School_City LIKE '%ó%' OR 
	    School_City LIKE '%ö%' OR 
	    School_City LIKE '%º%' OR 
	    School_City LIKE '%ä%' OR 
	    School_City LIKE '%é%' OR 
	    School_City LIKE '%ë%' OR 
	    School_City LIKE '%ú%')AND 
	    b.email IS NULL
	DELETE FROM Integrations.OLA_Channel.Inserts_Final 
	WHERE FirstName LIKE '%á%' OR 
		FirstName LIKE '%í%' OR 
		FirstName LIKE '%ó'  OR 
		FirstName LIKE '%ú%' OR
		 
		LastName LIKE '%á%' OR 
		LastName LIKE '%ó%' OR 
		LastName LIKE '%í%' OR 
		LastName LIKE '%ú%' OR
		
		Street LIKE '%ó%' OR 
		Street LIKE '%á%' OR 
		Street LIKE '%í%' OR 
		Street LIKE '%ú%' OR
		
		City LIKE '%ó%' OR 
		City LIKE '%á%' OR 
		City LIKE '%í%' OR 
		City LIKE '%ú%' OR
		 
		FirstName LIKE '%ö%' OR 
		LastName LIKE '%ö%' OR 
		City LIKE '%ö%' OR
		 
		FirstName LIKE '%ä%' OR 
		LastName LIKE '%ä%' OR 
		City LIKE '%ä%' OR
		 
		FirstName LIKE '%ë%' OR 
		LastName LIKE '%ë%' OR 
		City LIKE '%ë%' OR 
		
		FirstName LIKE '%é%' OR 
		LastName LIKE '%é%' OR 
		City LIKE '%é%' OR 
		
		FirstName LIKE '%º%' OR 
		LastName LIKE '%º%' OR 
		City LIKE '%º%' OR
		 
		School_Name LIKE '%á%' OR 
		School_Name LIKE '%í%' OR 
		School_Name LIKE '%ó%' OR 
		School_Name LIKE '%ö%' OR 
		School_Name LIKE '%º%' OR 
		School_Name LIKE '%ä%' OR 
		School_Name LIKE '%é%' OR  
		School_Name LIKE '%ë%' OR 
		School_Name LIKE '%ú%' OR 
		
		School_City LIKE '%á%' OR 
		School_City LIKE '%í%' OR 
		School_City LIKE '%ó%' OR 
		School_City LIKE '%ö%' OR 
		School_City LIKE '%º%' OR 
		School_City LIKE '%ä%' OR 
		School_City LIKE '%é%' OR 
		School_City LIKE '%ë%' OR 
		School_City LIKE '%ú%'

	INSERT INTO Integrations.OLA_Channel.Insert_Exceptions(FirstName
		, LastName
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate)
	SELECT FirstName
		, LastName
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, a.Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
	FROM Integrations.OLA_Channel.Updates_Final a LEFT OUTER JOIN 
	(SELECT email 
	FROM Integrations.OLA_Channel.Insert_Exceptions) b ON 
		a.Email = b.email
	WHERE (FirstName LIKE '%á%' OR 
		FirstName LIKE '%í%' OR 
		FirstName LIKE '%ó%' OR 
		FirstName LIKE '%ú%' OR 
		LastName LIKE '%á%' OR 
		LastName LIKE '%ó%' OR 
		LastName LIKE '%í%' OR 
		LastName LIKE '%ú%' OR 
	
		Street LIKE '%ó%' OR 
		Street LIKE '%á%' OR 
		Street LIKE '%í%' OR 
		Street LIKE '%ú%' or
	
		City LIKE '%ó%' OR 
		City LIKE '%á%' OR 
		City LIKE '%í%' OR 
		City LIKE '%ú%' OR 
		
		FirstName LIKE '%ö%' OR 
		LastName LIKE '%ö%' OR 
		City LIKE '%ö%' OR
		
		FirstName LIKE '%º%' OR 
		LastName LIKE '%º%' OR 
		City LIKE '%º%' OR 
		
		FirstName LIKE '%ä%' OR 
		LastName LIKE '%ä%' OR 
		City LIKE '%ä%' OR 
		
		FirstName LIKE '%é%' OR 
		LastName LIKE '%é%' OR 
		City LIKE '%é%' OR 
		
		FirstName LIKE '%ë%' OR 
		LastName LIKE '%ë%' OR 
		City LIKE '%ë%' OR 
		
		School_Name LIKE '%á%' OR 
		School_Name LIKE '%í%' OR 
		School_Name LIKE '%ó%' OR 
		School_Name LIKE '%ö%' OR 
		School_Name LIKE '%º%' OR 
		School_Name LIKE '%ä%' OR 
		School_Name LIKE '%é%' OR 
		School_Name LIKE '%ë%' OR 
		School_Name LIKE '%ú%' OR 
		
		School_City LIKE '%á%' OR 
		School_City LIKE '%í%' OR 
		School_City LIKE '%ó%' OR 
		School_City LIKE '%ö%' OR 
		School_City LIKE '%º%' OR 
		School_City LIKE '%ä%' OR 
		School_City LIKE '%é%' OR 
		School_City LIKE '%ë%' OR 
		School_City LIKE '%ú%') AND 
		b.email IS NULL

	DELETE FROM Integrations.OLA_Channel.Updates_Final 
	WHERE  FirstName LIKE '%á%' OR 
		FirstName LIKE '%í%' OR 
		FirstName LIKE '%ó'  OR 
		FirstName LIKE '%ú%' OR
		 
		LastName LIKE '%á%' OR 
		LastName LIKE '%ó%' OR 
		LastName LIKE '%í%' OR 
		LastName LIKE '%ú%' OR 
	
		Street LIKE '%ó%' OR 
		Street LIKE '%á%' OR 
		Street LIKE '%í%' OR 
		Street LIKE '%ú%' OR
	    
	    City LIKE '%ó%' OR 
	    City LIKE '%á%' OR 
	    City LIKE '%í%' OR 
	    City LIKE '%ú%' OR
	     
	    FirstName LIKE '%ö%' OR 
	    LastName LIKE '%ö%' OR 
	    City LIKE '%ö%' OR 
	    
	    FirstName LIKE '%é%' OR 
	    LastName LIKE '%é%' OR
	    City LIKE '%é%' OR
	     
	    FirstName LIKE '%ä%' OR 
	    LastName LIKE '%ä%' OR 
	    City LIKE '%ä%' OR
	     
	    FirstName LIKE '%ë%' OR 
	    LastName LIKE '%ë%' OR 
	    City LIKE '%ë%' OR
	     
	    FirstName LIKE '%º%' OR 
	    LastName LIKE '%º%' OR 
	    City LIKE '%º%' OR
	     
	    School_Name LIKE '%á%' OR 
	    School_Name LIKE '%í%' OR 
	    School_Name LIKE '%ó%' OR 
	    School_Name LIKE '%ö%' OR 
	    School_Name LIKE '%º%' OR 
	    School_Name LIKE '%ä%' OR
	    School_Name LIKE '%é%' OR 
	    School_Name LIKE '%ë%' OR 
	    School_Name LIKE '%ú%' OR 
	    
	    School_City LIKE '%á%' OR
	    School_City LIKE '%í%' OR
	    School_City LIKE '%ó%' OR
	    School_City LIKE '%ö%' OR
	    School_City LIKE '%º%' OR
	    School_City LIKE '%ä%' OR
	    School_City LIKE '%é%' OR
	    School_City LIKE '%ë%' OR
	    School_City LIKE '%ú%'

	TRUNCATE TABLE Integrations.OLA_Channel.Updates_Final_Closed_Lost

	INSERT INTO Integrations.OLA_Channel.Updates_Final_Closed_Lost(FirstName
		, LastName
		, DateEntered
		, DateWritten
		, Sync_To_Marketo
		, Company
		, Form_Age
		, Gender
		, Lead_Status
		, Inactive_in_OLA
		, Phone
		, Email
		, Source
		, Source_Detail
		, Street
		, City
		, State
		, Zip
		, Service_Year_Of_Interest
		, Service_Location_Of_Interest
		, School_Name
		, School_City
		, School_State
		, Ethnicity
		, Birthdate
		, External_ID_SFID__c
		, IsRecruitementLead__c
		, Offered
		, Confirmed
		, Education
		, Application_Location
		, Application_Location_RMS
		, Corps_Application_Year__c
		, FullMidYear)
	SELECT DISTINCT a.FirstName
	, a.LastName
	, DateEntered
	, DateWritten
	, Sync_To_Marketo
	, a.Company
	, Form_Age
	, Gender
	, Lead_Status
	, Inactive_in_OLA
	, a.Phone
	, a.Email
	, Source
	, Source_Detail
	, a.Street
	, a.City
	, a.State
	, Zip
	, Service_Year_Of_Interest
	, Service_Location_Of_Interest
	, School_Name
	, School_City
	, School_State
	, Ethnicity
	, Birthdate
	, a.External_ID_SFID__c
	, IsRecruitementLead__c
	, Offered, Confirmed
	, Education
	, Application_Location
	, Application_Location_RMS
	, a.Corps_Application_Year__c
	, a.FullMidYear
	FROM Integrations.OLA_Channel.Updates_Final (nolock) a INNER JOIN 
	ODW_Stage.dbo.Lead (nolock) b ON 
		a.email = b.Email
	WHERE b.Status = 'Closed/Lost' OR 
		a.Lead_Status = 'Closed/Lost'

	SELECT DISTINCT a.email 
	INTO #Delete
	FROM Integrations.OLA_Channel.Updates_Final (nolock) a INNER JOIN 
	ODW_Stage.dbo.Lead (nolock) b ON 
		a.email = b.Email AND 
		a.External_ID_SFID__c = b.External_ID_SFID__c
	WHERE b.Status = 'Closed/Lost' OR 
		a.Lead_Status = 'Closed/Lost'

	DELETE FROM Integrations.OLA_Channel.Updates_Final 
	WHERE email in (SELECT email FROM #Delete)

END




GO
