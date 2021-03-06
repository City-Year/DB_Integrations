USE [Integrations]
GO
/****** Object:  StoredProcedure [dbo].[sp_OLA_Channel_Integrations_BAK]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_OLA_Channel_Integrations_BAK]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	update Integrations.OLA_Channel.RMS_Sites set CorpYear = '2016-2017' where CorpYear = '16-17'
	update Integrations.OLA_Channel.RMS_Sites set CorpYear = '2015-2016' where CorpYear = '15-16'
	update Integrations.OLA_Channel.Integration set Service_Year_Of_Interest = '2016-2017' where Service_Year_Of_Interest = '16-17'
	update Integrations.OLA_Channel.Integration set Service_Year_Of_Interest = '2015-2016' where Service_Year_Of_Interest = '15-16'
	update Integrations.OLA_Channel.Integration set Corps_Application_Year__c = '2016-2017' where Corps_Application_Year__c = '16-17'
	update Integrations.OLA_Channel.Integration set Corps_Application_Year__c = '2015-2016' where Corps_Application_Year__c = '15-16'
	update Integrations.OLA_Channel.Integration set Offered = 0
	update Integrations.OLA_Channel.Integration set Confirmed = 0

	update Integrations.OLA_Channel.Integration
	set Service_Location_Of_Interest = isnull(b.SiteName, 'None')
--	, Service_Year_Of_Interest = isnull(b.CorpYear, '2016-2017')
	, Corps_Application_Year__c = b.CorpYear
	, Offered = isnull(b.Offered, 0)
	, Confirmed = isnull(b.Confirmed, 0)
	, RMS_OLA_Status = isnull(b.Status, null)
	, FullMidYear = b.FullMidYear
	from Integrations.OLA_Channel.Integration (nolock) a 
	left outer join Integrations.OLA_Channel.RMS_Sites (nolock) b on a.AppID = b.AppID

	update Integrations.OLA_Channel.Integration set Service_Year_Of_Interest = '2016-2017' where Service_Year_Of_Interest = '16-17'
	update Integrations.OLA_Channel.Integration set Service_Year_Of_Interest = '2015-2016' where Service_Year_Of_Interest = '15-16'
	update Integrations.OLA_Channel.Integration set Corps_Application_Year__c = '2016-2017' where Corps_Application_Year__c = '16-17'
	update Integrations.OLA_Channel.Integration set Corps_Application_Year__c = '2015-2016' where Corps_Application_Year__c = '15-16'

	truncate table Integrations.OLA_Channel.OLA_Max_App_ID

	insert into Integrations.OLA_Channel.OLA_Max_App_ID(AppID, Email)
	select max(AppID) AppID, Email
	from Integrations.OLA_Channel.Integration (nolock)
	where Service_Year_Of_Interest IN ('2015-2016','2016-2017')-- = '2016-2017' --or Corps_Application_Year__c = '2016-2017'
	group by Email

	truncate table Integrations.OLA_Channel.Integration_Massaged

	insert into Integrations.OLA_Channel.Integration_Massaged(AppID, FirstName, LastName, DateEntered, [DateWritten], Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate, Offered, Confirmed, RMS_OLA_Status, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c, FullMidYear)
	select a.AppID, a.FirstName, a.LastName, DateEntered, DateWritten, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, a.Email, Source, 
	Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, isnull(c.Transformed, a.School_Name) School_Name, 
	isnull(c.Transformed_City, School_City) School_City, isnull(Transformed_State, School_State) School_State, Ethnicity, Birthdate, Offered, Confirmed, RMS_OLA_Status, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c, FullMidYear
	from Integrations.OLA_Channel.Integration (nolock) a
	inner join Integrations.OLA_Channel.OLA_Max_App_ID (nolock) b on a.AppID = b.AppID
	left outer join Integrations.OLA_Channel.School_Normalization (nolock) c on rtrim(a.School_Name) = rtrim(c.[Current]) and rtrim(a.School_City) = rtrim(c.Current_City) and rtrim(a.School_State) = rtrim(c.Current_State)

	update Integrations.OLA_Channel.Integration_Massaged set Street = '352 St. Johns Place ' where email = 'abraham.christelle@gmail.com'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Baton Rouge' where Service_Location_Of_Interest = 'City Year Baton Rouge'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Boston' where Service_Location_Of_Interest = 'City Year Boston'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Chicago' where Service_Location_Of_Interest = 'City Year Chicago'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Cleveland' where Service_Location_Of_Interest = 'City Year Cleveland'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Columbia' where Service_Location_Of_Interest = 'City Year Columbia'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Columbus' where Service_Location_Of_Interest = 'City Year Columbus'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Dallas' where Service_Location_Of_Interest = 'City Year Dallas'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Denver' where Service_Location_Of_Interest = 'City Year Denver'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Detroit' where Service_Location_Of_Interest = 'City Year Detroit'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Florida Region' where Service_Location_Of_Interest = 'City Year Florida Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Jacksonville' where Service_Location_Of_Interest = 'City Year Jacksonville'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Little Rock' where Service_Location_Of_Interest = 'City Year Little Rock/North Little Rock'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Los Angeles' where Service_Location_Of_Interest = 'City Year Los Angeles'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Miami' where Service_Location_Of_Interest = 'City Year Miami'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Mid-West Region' where Service_Location_Of_Interest = 'City Year Mid-West Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Mid-Atlantic Region' where Service_Location_Of_Interest = 'City Year Mid-Atlantic Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Milwaukee' where Service_Location_Of_Interest = 'City Year Milwaukee'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Mountain Central Region' where Service_Location_Of_Interest = 'City Year Mountain Central Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Where I''m most needed' where Service_Location_Of_Interest = 'City Year National'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Where I''m most needed' where Service_Location_Of_Interest = 'City Year NRD'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='New Hampshire' where Service_Location_Of_Interest = 'City Year New Hampshire'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='New Orleans' where Service_Location_Of_Interest = 'City Year New Orleans'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='New York' where Service_Location_Of_Interest = 'City Year New York'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Northeast Region' where Service_Location_Of_Interest = 'City Year Northeast Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Orlando' where Service_Location_Of_Interest = 'City Year Orlando'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Philadelphia' where Service_Location_Of_Interest = 'City Year Philadelphia'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Rhode Island' where Service_Location_Of_Interest = 'City Year Rhode Island'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Sacramento' where Service_Location_Of_Interest = 'City Year Sacramento'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='San Antonio' where Service_Location_Of_Interest = 'City Year San Antonio'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='San Jose' where Service_Location_Of_Interest = 'City Year San Jose/Silicon Valley'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Seattle' where Service_Location_Of_Interest = 'City Year Seattle/King County'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Southern Region' where Service_Location_Of_Interest = 'City Year South Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Tulsa' where Service_Location_Of_Interest = 'City Year Tulsa'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Washington DC' where Service_Location_Of_Interest = 'City Year Washington, DC'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='West Coast Region' where Service_Location_Of_Interest = 'City Year West Coast Region'
	update Integrations.OLA_Channel.Integration_Massaged set Service_Location_Of_Interest ='Kansas City' where Service_Location_Of_Interest = 'City Year Kansas City'

	update Integrations.OLA_Channel.Integration_Massaged
	set Service_Year_Of_Interest = '2016-2017' where Service_Year_Of_Interest = '16-17'

	exec Integrations.dbo.sp_Data_Cleansing

	truncate table Integrations.OLA_Channel.Inserts

	insert into Integrations.OLA_Channel.Inserts(email)
	select a.email
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	left outer join ODW_Stage.dbo.Lead (nolock) b on a.email = b.email
	where b.email is null

	update [Integrations].[OLA_Channel].[Integration_Massaged] set Source = 'OLA Integration'
	update [Integrations].[OLA_Channel].[Integration_Massaged] set Source_Detail = ''

	truncate table Integrations.OLA_Channel.Inserts_Final

	insert into Integrations.OLA_Channel.Inserts_Final(FirstName, LastName, DateEntered, DateWritten, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate, Offered, Confirmed, RMS_OLA_Status, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c, FullMidYear)
	select distinct FirstName, LastName, DateEntered, DateWritten, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, 
	a.Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, 
	School_Name, School_City, School_State, Ethnicity, Birthdate, Offered, Confirmed, RMS_OLA_Status, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c, FullMidYear
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	inner join Integrations.OLA_Channel.Inserts (nolock) b on a.email = b.email

	update Integrations.OLA_Channel.Inserts_Final set Ethnicity = 'Other' where Ethnicity is null

	update Integrations.OLA_Channel.Inserts_Final set IsRecruitementLead__c = 1

	truncate table Integrations.OLA_Channel.Updates

--  Non school
	insert into Integrations.OLA_Channel.Updates(email, id)
	select a.email, min(b.External_ID_SFID__c) External_ID_SFID__c
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.email
	where 
	(a.FirstName <> b.FirstName 
	or a.LastName <> b.LastName
	or a.Gender <> b.Gender__c 
	or a.Lead_Status <> isnull(b.Status, '')
	or a.Inactive_in_OLA <> b.Inactive_in_OLA__c
	or a.Phone <> isnull(b.Phone, '') 
	or isnull(a.DateWritten, 0) <> isnull(b.Submitted_Application_Datetime__c, '')
	or a.Street <>  isnull(b.Street, '') 
	or a.City <> isnull(b.City, '') 
	or a.State <> b.State
	or isnull(a.DateEntered, 0) <> isnull(b.Started_Application_Datetime__c, 0)
	or a.Zip <> isnull(b.PostalCode, '') 
	or a.Service_Year_Of_Interest <> isnull(b.Corps_Service_Year_of_Interest__c, 'N/A')
	or a.Corps_Application_Year__c <> isnull(b.Corps_Application_Year__c, 'N/A')
	or a.Application_Location_RMS <> isnull(b.Corps_Application_RMS_Location__c, 'N/A')
	or a.Ethnicity <> isnull(b.Ethnicity__c, 'N/A')
	or isnull(a.RMS_OLA_Status, 'N/A') <> isnull(b.Corps_Application_Status__c, 'N/A')
	or isnull(a.Education, 'N/A') <> isnull(b.Corps_Application_Education_Level__c, 'N/A')
	or ISNULL(a.FullMidYear,'N/A')<> ISNULL(b.FullMidYear, 'N/A'))
    and isnull(b.Status, 'N/A') <> 'Closed/Lost' 
	group by a.Email
	 
-- school
/*
	insert into Integrations.OLA_Channel.Updates(email, id)
	select a.email, b.External_ID_SFID__c
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.email
	left outer join Integrations.OLA_Channel.Updates (nolock) c on a.Email = c.email
	where a.School_Name <> b.School_Name__c and a.School_Name <> '' and c.email is null
*/

	drop table Integrations.OLA_Channel.Updates_Final

	select distinct FirstName, LastName, DateEntered, DateWritten, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, 
	a.Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, 
	School_Name, School_City, School_State, Ethnicity, Birthdate, b.id External_ID_SFID__c, 1 IsRecruitementLead__c, Offered, Confirmed, RMS_OLA_Status, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c,FullMidYear
	into Integrations.OLA_Channel.Updates_Final
	from Integrations.OLA_Channel.Integration_Massaged (nolock) a
	inner join Integrations.OLA_Channel.Updates (nolock) b on a.email = b.email
	
	update Integrations.OLA_Channel.Updates_Final
	set External_ID_SFID__c = b.Id
	from Integrations.OLA_Channel.Updates_Final (nolock) a 
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.Email
	where a.External_ID_SFID__c is null

	insert into Integrations.OLA_Channel.Insert_Exceptions(FirstName, LastName, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate)
	select FirstName, LastName, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, a.Email, 
	Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, 
	School_City, School_State, Ethnicity, Birthdate
	from Integrations.OLA_Channel.Inserts_Final a
	left outer join (select email from Integrations.OLA_Channel.Insert_Exceptions) b on a.Email = b.email
	where 
	(FirstName like '%á%' or FirstName like '%í%' or FirstName like '%ó%' or FirstName like '%ú%'   
	or LastName like '%á%' or LastName like '%ó%' or LastName like '%í%' or LastName like '%ú%' 
	or Street like '%ó%' or Street like '%á%' or Street like '%í%' or Street like '%ú%' or
	City like '%ó%' or City like '%á%' or City like '%í%' or City like '%ú%' 
	or FirstName like '%ö%' or LastName like '%ö%' or City like '%ö%'
	or FirstName like '%º%' or LastName like '%º%' or City like '%º%'
	or FirstName like '%ä%' or LastName like '%ä%' or City like '%ä%'
	or FirstName like '%é%' or LastName like '%é%' or City like '%é%'
	or FirstName like '%ë%' or LastName like '%ë%' or City like '%ë%'
	or School_Name like '%á%' or School_Name like '%í%' or School_Name like '%ó%' or School_Name like '%ö%' or School_Name like '%º%' or School_Name like '%ä%' or School_Name like '%é%' or School_Name like '%ë%' or School_Name like '%ú%'
	or School_City like '%á%' or School_City like '%í%' or School_City like '%ó%' or School_City like '%ö%' or School_City like '%º%' or School_City like '%ä%' or School_City like '%é%' or School_City like '%ë%' or School_City like '%ú%')
	and b.email is null



	delete from Integrations.OLA_Channel.Inserts_Final 
	where 
	FirstName like '%á%' or FirstName like '%í%' or FirstName like '%ó'  or FirstName like '%ú%'   
	or LastName like '%á%' or LastName like '%ó%' or LastName like '%í%' or LastName like '%ú%' or
	Street like '%ó%' or Street like '%á%' or Street like '%í%' or Street like '%ú%' or
	City like '%ó%' or City like '%á%' or City like '%í%' or City like '%ú%' 
	or FirstName like '%ö%' or LastName like '%ö%' or City like '%ö%'
	or FirstName like '%ä%' or LastName like '%ä%' or City like '%ä%'
	or FirstName like '%ë%' or LastName like '%ë%' or City like '%ë%'
	or FirstName like '%é%' or LastName like '%é%' or City like '%é%'
	or FirstName like '%º%' or LastName like '%º%' or City like '%º%'
	or School_Name like '%á%' or School_Name like '%í%' or School_Name like '%ó%' or School_Name like '%ö%' or School_Name like '%º%' or School_Name like '%ä%' or School_Name like '%é%' or School_Name like '%ë%' or School_Name like '%ú%'
	or School_City like '%á%' or School_City like '%í%' or School_City like '%ó%' or School_City like '%ö%' or School_City like '%º%' or School_City like '%ä%' or School_City like '%é%' or School_City like '%ë%' or School_City like '%ú%'

	insert into Integrations.OLA_Channel.Insert_Exceptions(FirstName, LastName, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate)
	select FirstName, LastName, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, a.Email, 
	Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, 
	School_City, School_State, Ethnicity, Birthdate
	from Integrations.OLA_Channel.Updates_Final a
	left outer join (select email from Integrations.OLA_Channel.Insert_Exceptions) b on a.Email = b.email
	where 
	(FirstName like '%á%' or FirstName like '%í%' or FirstName like '%ó%' or FirstName like '%ú%' 
	or LastName like '%á%' or LastName like '%ó%' or LastName like '%í%' or LastName like '%ú%' or 
	Street like '%ó%' or Street like '%á%' or Street like '%í%' or Street like '%ú%' or
	City like '%ó%' or City like '%á%' or City like '%í%' or City like '%ú%' 
	or FirstName like '%ö%' or LastName like '%ö%' or City like '%ö%'
	or FirstName like '%º%' or LastName like '%º%' or City like '%º%'
	or FirstName like '%ä%' or LastName like '%ä%' or City like '%ä%'
	or FirstName like '%é%' or LastName like '%é%' or City like '%é%'
	or FirstName like '%ë%' or LastName like '%ë%' or City like '%ë%'
	or School_Name like '%á%' or School_Name like '%í%' or School_Name like '%ó%' or School_Name like '%ö%' or School_Name like '%º%' or School_Name like '%ä%' or School_Name like '%é%' or School_Name like '%ë%'  or School_Name like '%ú%'
	or School_City like '%á%' or School_City like '%í%' or School_City like '%ó%' or School_City like '%ö%' or School_City like '%º%' or School_City like '%ä%' or School_City like '%é%' or School_City like '%ë%' or School_City like '%ú%')
	and b.email is null

	delete from Integrations.OLA_Channel.Updates_Final 
	where 
	FirstName like '%á%' or FirstName like '%í%' or FirstName like '%ó'  or FirstName like '%ú%' 
	or LastName like '%á%' or LastName like '%ó%' or LastName like '%í%' or LastName like '%ú%' or 
	Street like '%ó%' or Street like '%á%' or Street like '%í%' or Street like '%ú%' or
	City like '%ó%' or City like '%á%' or City like '%í%' or City like '%ú%'
	or FirstName like '%ö%' or LastName like '%ö%' or City like '%ö%'
	or FirstName like '%é%' or LastName like '%é%' or City like '%é%'
	or FirstName like '%ä%' or LastName like '%ä%' or City like '%ä%'
	or FirstName like '%ë%' or LastName like '%ë%' or City like '%ë%'
	or FirstName like '%º%' or LastName like '%º%' or City like '%º%'
	or School_Name like '%á%' or School_Name like '%í%' or School_Name like '%ó%' or School_Name like '%ö%' or School_Name like '%º%' or School_Name like '%ä%' or School_Name like '%é%' or School_Name like '%ë%' or School_Name like '%ú%'
	or School_City like '%á%' or School_City like '%í%' or School_City like '%ó%' or School_City like '%ö%' or School_City like '%º%' or School_City like '%ä%' or School_City like '%é%' or School_City like '%ë%' or School_City like '%ú%'

	truncate table Integrations.OLA_Channel.Updates_Final_Closed_Lost

	insert into Integrations.OLA_Channel.Updates_Final_Closed_Lost(FirstName, LastName, DateEntered, DateWritten, Sync_To_Marketo, Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, Phone, Email, Source, Source_Detail, Street, City, State, Zip, Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate, External_ID_SFID__c, IsRecruitementLead__c, Offered, Confirmed, Education, Application_Location, Application_Location_RMS, Corps_Application_Year__c, FullMidYear)
	select distinct a.FirstName, a.LastName, DateEntered, DateWritten, Sync_To_Marketo, a.Company, Form_Age, Gender, Lead_Status, Inactive_in_OLA, a.Phone, a.Email, Source, Source_Detail, a.Street, a.City, a.State, Zip, 
	Service_Year_Of_Interest, Service_Location_Of_Interest, School_Name, School_City, School_State, Ethnicity, Birthdate, a.External_ID_SFID__c, IsRecruitementLead__c, Offered, Confirmed, Education, Application_Location, Application_Location_RMS, a.Corps_Application_Year__c, a.FullMidYear
	from Integrations.OLA_Channel.Updates_Final (nolock) a
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.Email
	where b.Status = 'Closed/Lost' or a.Lead_Status = 'Closed/Lost'

	select distinct a.email 
	into #Delete
	from Integrations.OLA_Channel.Updates_Final (nolock) a
	inner join ODW_Stage.dbo.Lead (nolock) b on a.email = b.Email and a.External_ID_SFID__c = b.External_ID_SFID__c
	where b.Status = 'Closed/Lost' or a.Lead_Status = 'Closed/Lost'

	delete from Integrations.OLA_Channel.Updates_Final where email in (select email from #Delete)

END




GO
