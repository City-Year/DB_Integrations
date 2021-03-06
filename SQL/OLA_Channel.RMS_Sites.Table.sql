USE [Integrations]
GO
/****** Object:  Table [OLA_Channel].[RMS_Sites]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OLA_Channel].[RMS_Sites](
	[AppID] [int] NULL,
	[SiteName] [varchar](250) NULL,
	[CorpYear] [varchar](50) NULL,
	[Offered] [varchar](50) NULL,
	[Confirmed] [varchar](50) NULL,
	[Status] [varchar](250) NULL,
	[FullMidYear] [varchar](250) NULL
) ON [PRIMARY]

GO
