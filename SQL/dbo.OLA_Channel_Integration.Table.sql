USE [Integrations]
GO
/****** Object:  Table [dbo].[OLA_Channel_Integration]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLA_Channel_Integration](
	[AppID] [int] NULL,
	[DateEntered] [datetime] NULL,
	[DateWritten] [datetime] NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Sync_To_Marketo] [nvarchar](250) NULL,
	[Company] [nvarchar](250) NULL,
	[Form_Age] [nvarchar](250) NULL,
	[Gender] [nvarchar](250) NULL,
	[Lead_Status] [nvarchar](250) NULL,
	[Inactive_in_OLA] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Source] [nvarchar](250) NULL,
	[Source_Detail] [nvarchar](250) NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](250) NULL,
	[Zip] [nvarchar](250) NULL,
	[Service_Year_Of_Interest] [nvarchar](250) NULL,
	[Service_Location_Of_Interest] [nvarchar](250) NULL,
	[School_Name] [nvarchar](250) NULL,
	[School_City] [nvarchar](250) NULL,
	[School_State] [nvarchar](250) NULL,
	[Ethnicity] [nvarchar](250) NULL,
	[Birthdate] [nvarchar](250) NULL,
	[Offered] [nvarchar](250) NULL,
	[Confirmed] [nvarchar](250) NULL,
	[RMS_OLA_Status] [nvarchar](250) NULL,
	[Education] [nvarchar](250) NULL,
	[Application_Location] [nvarchar](250) NULL,
	[Application_Location_RMS] [nvarchar](250) NULL,
	[Corps_Application_Year__c] [nvarchar](250) NULL,
	[FullMidYear] [nvarchar](250) NULL,
	[Major__c] [varchar](250) NULL,
	[OwnerID] [varchar](250) NULL
) ON [PRIMARY]

GO
