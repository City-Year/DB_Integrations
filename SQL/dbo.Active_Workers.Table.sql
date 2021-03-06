USE [Integrations]
GO
/****** Object:  Table [dbo].[Active_Workers]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active_Workers](
	[Employee_ID] [varchar](6) NULL,
	[First_Name] [varchar](255) NULL,
	[Last_Name] [varchar](255) NULL,
	[Work_Email] [varchar](255) NULL,
	[Title] [varchar](255) NULL,
	[Start_Date] [varchar](255) NULL,
	[Site] [varchar](255) NULL,
	[Site_ID] [numeric](4, 0) NULL,
	[Team_Name] [varchar](255) NULL,
	[External_Team_ID] [varchar](255) NULL,
	[Internal_Team_ID] [varchar](255) NULL,
	[Manager] [varchar](255) NULL,
	[Manager_ID] [numeric](6, 0) NULL
) ON [PRIMARY]

GO
