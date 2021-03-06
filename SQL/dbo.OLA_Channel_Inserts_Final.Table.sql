USE [Integrations]
GO
/****** Object:  Table [dbo].[OLA_Channel_Inserts_Final]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLA_Channel_Inserts_Final](
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[DateEntered] [datetime] NULL,
	[DateWritten] [datetime] NULL,
	[Sync_To_Marketo] [varchar](250) NULL,
	[Company] [varchar](250) NULL,
	[Form_Age] [varchar](250) NULL,
	[Gender] [varchar](250) NULL,
	[Lead_Status] [varchar](250) NULL,
	[Inactive_in_OLA] [varchar](250) NULL,
	[Phone] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Source] [varchar](250) NULL,
	[Source_Detail] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[City] [varchar](250) NULL,
	[State] [varchar](250) NULL,
	[Zip] [varchar](250) NULL,
	[Service_Year_Of_Interest] [varchar](250) NULL,
	[Service_Location_Of_Interest] [varchar](250) NULL,
	[School_Name] [varchar](250) NULL,
	[School_City] [varchar](250) NULL,
	[School_State] [varchar](250) NULL,
	[Ethnicity] [varchar](250) NULL,
	[Birthdate] [datetime] NULL,
	[IsRecruitementLead__c] [varchar](250) NULL,
	[Offered] [varchar](250) NULL,
	[Confirmed] [varchar](250) NULL,
	[RMS_OLA_Status] [varchar](250) NULL,
	[Education] [varchar](250) NULL,
	[Application_Location] [varchar](250) NULL,
	[Application_Location_RMS] [varchar](250) NULL,
	[Corps_Application_Year__c] [varchar](250) NULL,
	[FullMidYear] [nvarchar](250) NULL,
	[OwnerID] [varchar](250) NULL,
	[Major__c] [varchar](250) NULL
) ON [PRIMARY]

GO
