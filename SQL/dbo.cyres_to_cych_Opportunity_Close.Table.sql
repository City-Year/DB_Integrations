USE [Integrations]
GO
/****** Object:  Table [dbo].[cyres_to_cych_Opportunity_Close]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cyres_to_cych_Opportunity_Close](
	[Service_Contact] [varchar](250) NULL,
	[Service_Contact_Name] [varchar](250) NULL,
	[Work_Email] [varchar](250) NULL,
	[Service_Type] [varchar](250) NULL,
	[Service_Team] [varchar](250) NULL,
	[Service_Department] [varchar](250) NULL,
	[Service_Manager] [varchar](250) NULL,
	[Service_Manager_Name] [varchar](250) NULL,
	[Service_Start_Date] [varchar](250) NULL,
	[Service_End_Date] [varchar](250) NULL,
	[Service_Business_Title] [varchar](250) NULL,
	[Service_Business_Unit_ID] [varchar](250) NULL,
	[Service_Business_Unit] [varchar](250) NULL,
	[Service_Employee_Type] [varchar](250) NULL,
	[Service_Time_Type] [varchar](250) NULL,
	[Stage] [varchar](250) NULL,
	[Service_Physical_Location_ID] [varchar](250) NULL,
	[Service_Physical_Location] [varchar](250) NULL
) ON [PRIMARY]

GO
