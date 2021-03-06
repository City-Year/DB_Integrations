USE [Integrations]
GO
/****** Object:  Table [dbo].[CMR_CM_SPMBEH_DESSAChart]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_SPMBEH_DESSAChart](
	[STUDENT__C] [nvarchar](255) NULL,
	[Student_Name] [nvarchar](255) NULL,
	[ASSESSMENT_NAME] [nvarchar](255) NULL,
	[DATE_ADMINISTERED__C] [datetime] NULL,
	[SEL_Composite_T_Score__c] [float] NULL,
	[Section_Primary_Staff_ID] [nvarchar](255) NULL,
	[Section_Primary_Staff] [nvarchar](255) NULL,
	[cych_Accnt_SF_ID] [nvarchar](255) NULL,
	[Month_Administered] [datetime] NULL
) ON [PRIMARY]

GO
