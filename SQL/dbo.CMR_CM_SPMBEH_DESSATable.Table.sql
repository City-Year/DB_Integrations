USE [Integrations]
GO
/****** Object:  Table [dbo].[CMR_CM_SPMBEH_DESSATable]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_SPMBEH_DESSATable](
	[student__c] [nvarchar](255) NULL,
	[date_administered__c] [datetime] NULL,
	[ASSESSMENT_NAME] [nvarchar](255) NULL,
	[student_name] [nvarchar](255) NULL,
	[Decision_Making_Description__c] [nvarchar](255) NULL,
	[Goal_directed_Behavior_Description__c] [nvarchar](255) NULL,
	[Optimistic_Thinking_Description__c] [nvarchar](255) NULL,
	[Personal_Responsibility_Description__c] [nvarchar](255) NULL,
	[Relationship_Skills_Description__c] [nvarchar](255) NULL,
	[SEL_Composite_Description__c] [nvarchar](255) NULL,
	[Self_Awareness_Description__c] [nvarchar](255) NULL,
	[Self_Management_Description__c] [nvarchar](255) NULL,
	[Social_Awareness_Description__c] [nvarchar](255) NULL,
	[MOSTRECENT] [float] NULL,
	[Section_Primary_Staff_id] [nvarchar](255) NULL,
	[Section_Primary_Staff] [nvarchar](255) NULL,
	[cych_accnt_sf_id] [nvarchar](255) NULL
) ON [PRIMARY]

GO
