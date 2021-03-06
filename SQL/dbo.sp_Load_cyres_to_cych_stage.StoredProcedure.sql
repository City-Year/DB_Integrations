USE [Integrations]
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_cyres_to_cych_stage]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =========================================================================================
-- AUTHOR:		
-- CREATE DATE: 
-- DESCRIPTION:	
-- HISTORY:		
-- ========================================================================================
CREATE PROCEDURE [dbo].[sp_Load_cyres_to_cych_stage]
AS

BEGIN

--Service_Contact_ID's------------------------------

	select distinct Service_Contact
	into  #SERVICE_CONTACT_IDS
	from(
	select Service_Contact
	from integrations.cyres_to_cych.Opportunity_Create
	UNION
	select Service_Contact
	from integrations.cyres_to_cych.Opportunity_Update
	UNION
	select Service_Contact
	from integrations.cyres_to_cych.Opportunity_Close) a


	select a.ID,a.AccountID AS Contact_account_ID, a.Name, b.Service_Contact
	into #IDS_AND_NAMES
	from ODW_Stage.dbo.Contact_Test (nolock) a
	inner join #SERVICE_CONTACT_IDS (nolock) b on a.City_Year_Worker_ID__C = b.Service_Contact

	

--INSERT TO TEMP TABLES WHILE PICKING UP ID's -----------------------------------------------------------------------

--UPDATE

--select * from  #Update
select * from  [Integrations].[cyres_to_cych].[Opportunity_Update]
		

 SELECT DISTINCT  
	   b.Id											AS Service_Contact__c,
	   a.Service_Contact_Name,
	   a.Service_Type								AS Service_Type__c,
	   a.Stage										AS StageName,
	   c.ID											AS Service_Team__c,
	   a.Service_Department							AS Service_Department__c,
	   a.Service_Manager							AS Service_Manager__c,
	   a.Service_Manager_Name						AS Service_Manager_Name,
	   a.Service_Start_Date							AS Service_Start_Date__c,
	   a.Service_Business_Title						AS Service_Business_Title__c,
	   a.Service_Employee_Type						AS Service_Employee_Type__c,
	   a.Service_Time_Type							AS Service_Time_Type__c,
	   a.Service_Physical_Location					AS Service_Physical_Location__c,
	   a.Service_Business_Unit_ID					AS Service_Business_Unit__c,
	   '012U00000001OPCIA2'							AS ReportTypeID,
	   service_type + '-' + convert(varchar,datepart(YYYY,Service_Start_Date)) + '-' + Service_Contact_name AS NAME,
	   b.Contact_Account_ID							AS AccountID,
	   a.Stage										AS Contact_City_Year_Service_Status,
	   a.Stage										AS Account_City_Year_Service_Status
	   

 INTO #UPDATE
 FROM integrations.cyres_to_cych.Opportunity_Update a
 INNER JOIN #IDS_AND_NAMES b on a.Service_Contact = b.service_Contact
 LEFT OUTER JOIN [ODW_Stage].[dbo].[Team_Test] c on a.service_team = c.school_account_ID__c 


----------------------------------------------------------------------------------------------------------------------

--CREATE

 SELECT DISTINCT  
	   b.Id											AS Service_Contact__c,
	   a.Service_Contact_Name,
	   a.Service_Type								AS Service_Type__c,
	   a.Stage										AS StageName,
	   c.ID											AS Service_Team__c,
	   a.Service_Department							AS Service_Department__c,
	   a.Service_Manager							AS Service_Manager__c,
	   a.Service_Manager_Name						AS Service_Manager_Name,
	   a.Service_Start_Date							AS Service_Start_Date__c,
	   a.Service_Start_Date                         AS CloseDate,
	   a.Service_Business_Title						AS Service_Business_Title__c,
	   a.Service_Employee_Type						AS Service_Employee_Type__c,
	   a.Service_Time_Type							AS Service_Time_Type__c,
	   a.Service_Physical_Location					AS Service_Physical_Location__c,
	   a.Service_Business_Unit_ID					AS Service_Business_Unit__c,
	   '012U00000001OPCIA2'							AS ReportTypeID,
	   service_type + '-' + convert(varchar,datepart(YYYY,Service_Start_Date)) + '-' + Service_Contact_name AS NAME,
	   b.Contact_Account_ID							AS AccountID,
	   a.Stage										AS Contact_City_Year_Service_Status,
	   a.Stage										AS Account_City_Year_Service_Status

 INTO #CREATE

 FROM integrations.cyres_to_cych.Opportunity_Create a
 INNER JOIN #IDS_AND_NAMES b on a.Service_Contact = b.service_Contact
 LEFT OUTER JOIN [ODW_Stage].[dbo].[Team_Test] c on a.service_team = c.school_account_ID__c
 
  
----------------------------------------------------------------------------------------------------------------

-- CLOSE 

 SELECT DISTINCT 
		
	   b.Id											AS Service_Contact__c,
	   a.Service_Contact_Name,
	   a.Work_Email,
	   a.Service_Type								AS Service_Type__c,
	   c.ID											AS Service_Team__c,
	   a.Service_Department							AS Service_Department__c,
	   a.Service_Manager							AS Service_Manager__c,
	   a.Service_Manager_Name						AS Service_Manager_Name,
	   a.Service_Start_Date							AS Service_Start_Date__c,
	   a.Service_End_Date                           AS Service_End_Date__c,
	   a.Service_Business_Title						AS Service_Business_Title__c,
	   a.Service_Employee_Type						AS Service_Employee_Type__c,
	   a.Service_Time_Type							AS Service_Time_Type__c,
	   a.Stage										AS StageName,
	   a.Service_Physical_Location					AS Service_Physical_Location__c,
	   a.Service_Business_Unit_ID					AS Service_Business_Unit__c,
	   '012U00000001OPCIA2'							AS ReportTypeID,
	   service_type + '-' + convert(varchar,datepart(YYYY,Service_Start_Date)) + '-' + Service_Contact_name AS NAME,
	   b.Contact_Account_ID							AS AccountID,
	   a.Stage										AS Contact_City_Year_Service_Status,
	   a.Stage										AS Account_City_Year_Service_Status

 INTO #CLOSE

 FROM integrations.cyres_to_cych.Opportunity_Close a
 INNER JOIN #IDS_AND_NAMES b ON a.Service_Contact = b.service_Contact
 LEFT OUTER JOIN [ODW_Stage].[dbo].[Team_Test] c on a.service_team = c.school_account_ID__c


 
		

------------------------------------------------------------------------------------------------------------------------------

--LINK POUND TABLES TO OPPORTUNITY FULL TO PICK UP External_ID_SFID__c AND LOAD TO WORK TABLES

 TRUNCATE TABLE [Integrations].[cyres_to_cych].[Opportunity_Create_Final]

 INSERT INTO [Integrations].[cyres_to_cych].[Opportunity_Create_Final]
		SELECT a.*,b.External_ID_SFID__c 
		FROM #Create a 
		left outer join ODW_Stage_DEV.[dbo].[Opportunity_Full] b
		ON a.Service_Contact__c = b.Service_Contact__c
		--AND a.Service_Start_Date__c = b.CloseDate
		AND b.RecordTypeId = '012U00000001OPCIA2'
		WHERE b.Service_Contact__c IS NULL



 TRUNCATE TABLE [Integrations].[cyres_to_cych].[Opportunity_Close_Final]

 INSERT INTO [Integrations].[cyres_to_cych].[Opportunity_Close_Final]
		SELECT  a.*,b.External_ID_SFID__c 
		FROM #CLOSE a 
		left outer join ODW_Stage_DEV.[dbo].[Opportunity_Full] b
		ON  a.Service_Contact__c = b.Service_Contact__c
		--AND a.Service_Start_Date__c = b.CloseDate
		AND b.RecordTypeId = '012U00000001OPCIA2'
		where b.Service_Contact__c is not null



 TRUNCATE TABLE [Integrations].[cyres_to_cych].[Opportunity_Update_Final]

 INSERT INTO [Integrations].[cyres_to_cych].[Opportunity_Update_Final]
		SELECT a.*,b.External_ID_SFID__c 
		FROM #Update a 
		inner join ODW_Stage_DEV.[dbo].[Opportunity_Full] b
		ON  a.Service_Contact__c = b.Service_Contact__c
		--AND a.Service_Start_Date__c = b.CloseDate
		AND b.RecordTypeId = '012U00000001OPCIA2'


		

----INSERT TO ODW_Stage_DEV.[dbo].[Opportunity_Full] FROM CREATE FINAL TABLE---------------------------------------------------------------


-- INSERT INTO ODW_Stage_DEV.[dbo].[Opportunity_Full] 

--			   (service_contact__c,
--				service_type__c,
--				StageName,
--				Service_Team__c,
--				Service_Department__c,
--				Service_Manager__c,
--				Service_Start_Date__c,
--				CloseDate,
--				Service_Business_Title__c,
--				Service_Employee_type__c,
--				Service_Time_Type__c,
--				Service_Physical_Location__c,
--				Service_Business_Unit__c,
--				RecordTypeID,
--				Name,
--				AccountID)

-- SELECT 
--				a.service_contact__c,
--				a.service_type__c,
--				a.StageName,
--				a.Service_Team,
--				a.Service_Department,
--				a.Service_Manager__c,
--				a.Service_Start_Date,
--				a.CloseDate,
--				a.Service_Business_Title__c,
--				a.Service_Employee_type__c,
--				a.Service_Time_Type__c,a.Service_Physical_Location,
--				a.Service_Business_Unit__c,
--				a.RecordTypeID,
--				a.Name,
--				a.AccountID 
-- FROM [Integrations].[cyres_to_cych].[Opportunity_Create_Final] a 
-- LEFT OUTER JOIN ODW_Stage_DEV.[dbo].[Opportunity_Full]		   b
-- ON a.External_ID_SFID__c = b.External_ID_SFID__c
-- WHERE b.External_ID_SFID__c IS NULL



-- --UPDATE ODW_Stage_DEV.[dbo].[Opportunity_Full] FROM UPDATE FINAL TABLE-------------------------------------------------------
 
-- UPDATE ODW_Stage_DEV.[dbo].[Opportunity_Full] SET
--			 service_contact__c				= a.service_contact__c,
--			 service_type__c				= a.service_type__c,
--			 StageName						= a.StageName,
--			 Service_Team__c				= a.Service_Team__c,
--			 Service_Department__c			= a.Service_Department__c,
--			 Service_Manager__c				= a.Service_Manager__c,
--			 Service_Start_Date__c			= a.Service_Start_Date__c,
--			-- CloseDate						= a.CloseDate,
--			 Service_Business_Title__c		= a.Service_Business_Title__c,
--			 Service_Employee_type__c		= a.Service_Employee_type__c,
--			 Service_Time_Type__c			= a.Service_Time_Type__c,
--			 Service_Physical_Location__c	= a.Service_Physical_Location,
--			 Service_Business_Unit__c		= a.Service_Business_Unit__c,
--			 RecordTypeID					= a.RecordTypeID,
--			 Name							= a.Name,
--			 AccountID						= a.AccountID
  
-- FROM [Integrations].[cyres_to_cych].[Opportunity_Update_Final] a 
--		 LEFT OUTER JOIN ODW_Stage_DEV.[dbo].[Opportunity_Full]	b
-- ON a.External_ID_SFID__c = b.External_ID_SFID__c
-- WHERE 
--			ISNULL(a.service_contact__c,1)				<> ISNULL(b.service_contact__c,1)
--		 OR ISNULL(a.service_type__c,1)					<> ISNULL(b.service_type__c,1)
--		 OR ISNULL(a.StageName,1)						<> ISNULL(b.StageName,1)
--		 OR ISNULL(a.Service_Team__c,1)					<> ISNULL(b.Service_Team__c,1)
--		 OR ISNULL(a.Service_Department__c,1)			<> ISNULL(b.Service_Department__c,1)
--		 OR ISNULL(a.Service_MAnager__c,1)				<> ISNULL(b.Service_MAnager__c,1)
--		 OR ISNULL(a.Service_Manager__c,1)				<> ISNULL(b.Service_Manager__c,1)
--		 OR ISNULL(a.Service_Start_Date__c,1)			<> ISNULL(b.Service_Start_Date__c,1)
--		 --OR a.CloseDate					<> b.CloseDate
--		 OR ISNULL(a.Service_Business_Title__c,1)		<> ISNULL(b.Service_Business_Title__c,1)
--		 OR ISNULL(a.Service_Employee_type__c,1)		<> ISNULL(b.Service_Employee_type__c,1)
--		 OR ISNULL(a.Service_Time_Type__c,1)			<> ISNULL(b.Service_Time_Type__c,1)
--		 OR ISNULL(a.Service_Physical_Location,1)	    <> ISNULL(b.Service_Physical_Location__c,1)
--		 OR ISNULL(a.Service_Business_Unit__c,1)		<> ISNULL(b.Service_Business_Unit__c,1)
--		 OR ISNULL(a.RecordTypeID,1)					<> ISNULL(b.RecordTypeID,1)
--		 OR ISNULL(a.Name,1)							<> ISNULL(b.Name,1)
--		 OR ISNULL(a.AccountID,1)						<> ISNULL(b.AccountID,1)


----UPDATE ODW_Stage_DEV.[dbo].[Opportunity_Full] FROM CLOSE FINAL TABLE


-- UPDATE ODW_Stage_DEV.[dbo].[Opportunity_Full] SET
 
-- 		CloseDate =  a.Service_End_Date__c

--		FROM [Integrations].[cyres_to_cych].[Opportunity_Close_Final]	a 
--				   JOIN ODW_Stage_DEV.[dbo].[Opportunity_Full]			b
--		ON a.External_ID_SFID__c = b.External_ID_SFID__c
--		WHERE ISNULL(a.Service_End_Date__c,1) <> ISNULL(b.CloseDate,1)





	
END




GO
