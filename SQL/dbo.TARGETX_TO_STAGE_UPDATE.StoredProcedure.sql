USE [Integrations]
GO
/****** Object:  StoredProcedure [dbo].[TARGETX_TO_STAGE_UPDATE]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TARGETX_TO_STAGE_UPDATE]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



		TRUNCATE TABLE [targetX_contact_STG2]

	
		UPDATE [targetX_contact_STG1] SET
		TITLE								= 'CM',
		BUSINESS_TITLE						= 'Corps Member',
		JOB_PROFILE							= 'CORPS - N',
		COMPENSATION_GRADE_PROFILE			= 'CORPS_NA',
		DEPARTMENT							= 'CC_ID_009991',
		PROJECT_NUMBER						= '99999',
		GRANT_NUMBER						= '9999',
		BIRTH_DATE                          = CONVERT(DATE,BIRTH_DATE),
		EFFECTIVE_DATE						= b.SiteID_StartDate,
		BIWEEKLY_SALARY						= b.CMPosition_JobPayRate_Corps + '.00',
		PAYROLL_STATE_AUTHORITY_TAX_CODE	= b.SiteID_State1

		FROM [targetX_contact_STG1] a inner join [Site_ID_LKP_UPD] b on a.Contact_Location_ID__c = b.SiteID_LocNumber



		-- INSERT TO STG2 WHERE NOT IN LOG TABLE

		INSERT INTO [targetX_contact_STG2]
		SELECT  
		 a.EFFECTIVE_DATE
		,a.APP_ID
		,a.LAST_NAME
		,a.FIRST_NAME
		,a.MIDDLE_NAME
		,a.ADDRESS_1
		,a.CITY
		,a.STATE
		,a.ZIP
		,a.LOCATION_ID
		,CONVERT(DATE,a.BIRTH_DATE)
		,a.GENDER
		,a.EMAIL_ADDRESS
		,a.PREFERRED_FIRST_NAME
		,a.PREFERRED_MIDDLE_NAME
		,a.PREFERRED_LAST_NAME
		,a.TITLE
		,a.BUSINESS_TITLE
		,a.JOB_PROFILE
		,a.COMPENSATION_GRADE_PROFILE
		,a.SUPERVISORY_ORG
		,a.BIWEEKLY_SALARY
		,a.DEPARTMENT
		,a.PAYROLL_STATE_AUTHORITY_TAX_CODE
		,a.PROJECT_NUMBER
		,a.GRANT_NUMBER
		,a.CONTACT_KEY_TERM__C
		,a.CORPS_YEAR_OF_INTEREST__C
		,a.PREVIOUSLY_SERVED__C
		,a.APPSTATUS
		,a.CONTACT_LOCATION_ID__c 
		,GETDATE()
		
		FROM [targetX_contact_STG1] a LEFT OUTER JOIN [targetX_process_LOG] b ON a.APP_ID = b.APP_ID
		WHERE b.APP_ID IS NULL
		
				
		--INSERT TO LOG FROM STG2

		INSERT INTO [targetX_process_LOG]
		SELECT *  FROM  [targetX_contact_STG2]

    
END







GO
