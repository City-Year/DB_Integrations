USE [Integrations]
GO
/****** Object:  Table [OLA_Channel].[Insert_Exceptions]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OLA_Channel].[Insert_Exceptions](
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
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
	[Birthdate] [datetime] NULL
) ON [PRIMARY]

GO
