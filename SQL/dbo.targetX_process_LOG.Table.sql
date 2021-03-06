USE [Integrations]
GO
/****** Object:  Table [dbo].[targetX_process_LOG]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[targetX_process_LOG](
	[EFFECTIVE_DATE] [varchar](200) NULL,
	[APP_ID] [varchar](200) NULL,
	[LAST_NAME] [varchar](200) NULL,
	[FIRST_NAME] [varchar](200) NULL,
	[MIDDLE_NAME] [varchar](200) NULL,
	[ADDRESS_1] [varchar](200) NULL,
	[CITY] [varchar](200) NULL,
	[STATE] [varchar](200) NULL,
	[ZIP] [varchar](200) NULL,
	[LOCATION_ID] [varchar](200) NULL,
	[BIRTH_DATE] [varchar](200) NULL,
	[GENDER] [varchar](200) NULL,
	[EMAIL_ADDRESS] [varchar](200) NULL,
	[PREFERRED_FIRST_NAME] [varchar](200) NULL,
	[PREFERRED_MIDDLE_NAME] [varchar](200) NULL,
	[PREFERRED_LAST_NAME] [varchar](200) NULL,
	[TITLE] [varchar](200) NULL,
	[BUSINESS_TITLE] [varchar](200) NULL,
	[JOB_PROFILE] [varchar](200) NULL,
	[COMPENSATION_GRADE_PROFILE] [varchar](200) NULL,
	[SUPERVISORY_ORG] [varchar](200) NULL,
	[BIWEEKLY_SALARY] [varchar](200) NULL,
	[DEPARTMENT] [varchar](200) NULL,
	[PAYROLL_STATE_AUTHORITY_TAX_CODE] [varchar](200) NULL,
	[PROJECT_NUMBER] [varchar](200) NULL,
	[GRANT_NUMBER] [varchar](200) NULL,
	[CONTACT_KEY_TERM__C] [varchar](200) NULL,
	[CORPS_YEAR_OF_INTEREST__C] [varchar](200) NULL,
	[PREVIOUSLY_SERVED__C] [varchar](200) NULL,
	[APPSTATUS] [varchar](200) NULL,
	[CONTACT_LOCATION_ID__c] [varchar](200) NULL,
	[LOAD_DATE] [varchar](50) NULL
) ON [PRIMARY]

GO
