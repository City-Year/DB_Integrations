USE [Integrations]
GO
/****** Object:  Table [dbo].[CMR_CM_Attendance_Suspensions]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_Attendance_Suspensions](
	[AVG_AVERAGE_DAILY_ATTENDANCE] [float] NULL,
	[PERC_SUSPENSION] [float] NULL,
	[PERC_DETENTION] [nvarchar](255) NULL,
	[PERC_OFFICEREFERRAL] [nvarchar](255) NULL,
	[cych_accnt_sf_id] [nvarchar](255) NULL,
	[Section_Primary_Staff] [nvarchar](255) NULL,
	[Section_Primary_Staff_ID] [nvarchar](255) NULL,
	[QUARTER] [nvarchar](255) NULL
) ON [PRIMARY]

GO
