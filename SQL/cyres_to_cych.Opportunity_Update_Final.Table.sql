USE [Integrations]
GO
/****** Object:  Table [cyres_to_cych].[Opportunity_Update_Final]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cyres_to_cych].[Opportunity_Update_Final](
	[Service_Contact__c] [varchar](250) NULL,
	[Service_Contact_Name] [varchar](250) NULL,
	[Service_Type__c] [varchar](250) NULL,
	[StageName] [varchar](250) NULL,
	[Service_Team__c] [varchar](250) NULL,
	[Service_Department__c] [varchar](250) NULL,
	[Service_Manager__c] [varchar](250) NULL,
	[Service_Manager_Name] [varchar](250) NULL,
	[Service_Start_Date__c] [varchar](250) NULL,
	[Service_Business_Title__c] [varchar](250) NULL,
	[Service_Employee_Type__c] [varchar](250) NULL,
	[Service_Time_Type__c] [varchar](250) NULL,
	[Service_Physical_Location] [varchar](250) NULL,
	[Service_Business_Unit__c] [varchar](250) NULL,
	[RecordTypeID] [varchar](250) NULL,
	[Name] [varchar](250) NULL,
	[AccountID] [varchar](250) NULL,
	[City_Year_Service_Status_Contact] [varchar](250) NULL,
	[City_Year_Service_Status_Account] [varchar](250) NULL,
	[External_ID_SFID__c] [varchar](250) NULL
) ON [PRIMARY]

GO
