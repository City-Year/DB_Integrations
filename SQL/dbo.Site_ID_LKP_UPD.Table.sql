USE [Integrations]
GO
/****** Object:  Table [dbo].[Site_ID_LKP_UPD]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_ID_LKP_UPD](
	[SiteID_LocNumber] [varchar](20) NOT NULL,
	[SiteID_LocName] [varchar](100) NULL,
	[Site_ID] [int] NULL,
	[SiteID_ManagerID] [varchar](20) NULL,
	[SiteID_ManagerName] [varchar](100) NULL,
	[SiteID_ManagerEmail] [varchar](100) NULL,
	[SiteID_DistrictCode] [varchar](20) NULL,
	[SiteID_JobLocationText] [varchar](100) NULL,
	[SiteID_State1] [varchar](20) NULL,
	[SiteID_GrantName] [varchar](100) NULL,
	[SiteID_SourceOfFunding] [varchar](20) NULL,
	[Clock1] [varchar](20) NULL,
	[Clock2] [varchar](20) NULL,
	[Clock3] [varchar](20) NULL,
	[Clock4] [varchar](20) NULL,
	[SiteID_Location] [varchar](20) NULL,
	[SiteID_WorkLocation] [varchar](20) NULL,
	[SiteID_SUICode] [varchar](20) NULL,
	[State_Code] [varchar](10) NULL,
	[Department_code] [varchar](20) NULL,
	[Company] [varchar](20) NULL,
	[Division] [varchar](20) NULL,
	[Project_code] [varchar](10) NULL,
	[Department_Name] [varchar](100) NULL,
	[SiteID_OrientationDate] [varchar](20) NULL,
	[CMPosition_JobPayRate_Corps] [varchar](30) NULL,
	[CMPosition_JobPayRate_SrCorps] [varchar](30) NULL,
	[CMPosition_JobPayRate_Secondyear_RMS] [varchar](30) NULL,
	[Title] [varchar](10) NULL,
	[Rate_Per] [varchar](10) NULL,
	[Class] [varchar](10) NULL,
	[siteid_payroll_hrs] [decimal](10, 2) NULL,
	[Type] [varchar](10) NULL,
	[emp_job_code_corps] [varchar](50) NULL,
	[emp_job_code_scorps] [varchar](50) NULL,
	[job_desc_corps] [varchar](50) NULL,
	[job_des_scorps] [varchar](50) NULL,
	[job_des_scorps_sl] [varchar](50) NULL,
	[Perm_Temp] [varchar](10) NULL,
	[Business_Title] [varchar](100) NULL,
	[SiteID_StartDate] [varchar](20) NULL,
	[SiteID_StartDate_SecondYear] [varchar](20) NULL,
	[SiteID_Orientationdate_SecondYear] [varchar](20) NULL,
	[Job_Profile_corps] [varchar](20) NULL,
	[Comsensation_Grade_Profile_corps] [varchar](20) NULL,
	[job_profile_senior_Corps] [varchar](20) NULL,
	[Comsensation_Grade_Profile_senior_corps] [varchar](20) NULL,
	[job_profile_Second_year] [varchar](20) NULL,
	[Comsensation_Grade_Profile_second_year] [varchar](20) NULL,
	[emp_job_code_second_years] [varchar](20) NULL,
	[Site_ID_Start_Date_Second_Years] [varchar](20) NULL
) ON [PRIMARY]

GO
