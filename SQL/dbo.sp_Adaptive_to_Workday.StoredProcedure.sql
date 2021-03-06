USE [Integrations]
GO
/****** Object:  StoredProcedure [dbo].[sp_Adaptive_to_Workday]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Adaptive_to_Workday]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1200-6000 - PRV-RI - Site Operations'
	where [Level Name] = '1200-6000-PRV-RI - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '2300-6000 - WSH-DC - Site Operations'
	where [Level Name] = '2300-6000- WSH-DC - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5100-6000 - SNA-TX - Site Operations'
	where [Level Name] = '5100-6000-SNA-TX - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8100-6000 - SNJ-CA - Site Operations'
	where [Level Name] = '8100-6000-SNJ-CA - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8200-6000 - SEA-WA - Site Operations'
	where [Level Name] = '8200-6000-SEA-WA - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8400-6000 - SAC-CA - Site Operations'
	where [Level Name] = '8400-6000-SAC-CA - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5200-6000 - TUL-OK - Site Operations'
	where [Level Name] = '5200-6000-TUL-OK - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5400-8201 - DAL-TX - Civic Engagement'
	where [Level Name] = '5400 - 8201 - DAL-TX - Civic Engagement'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5400-6000 - DAL-TX - Site Operations'
	where [Level Name] = '5400 - 6000 - DAL-TX - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5400-8000 - DAL-TX - Development/Fundraising'
	where [Level Name] = '5400 - 8000 - DAL-TX - Development/Fundraising'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5400-9991 - DAL-TX - School Service/Impact'
	where [Level Name] = '5400 - 9991 - DAL-TX - School Service/Impact'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1000-1502 - Start ups - HQ'
	where [Level Name] = '1000 - 1502 - Start ups - HQ'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1000-1502 - Start Ups - Other'
	where [Level Name] = '1000 - 1502 - Start Ups - Other'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1100 - Boston'
	where [Level Name] = '1100-6000 - BOS-MA - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1200-6000-PRV-RI - Site Operations'
	where [Level Name] = '1200 - Rhode Island'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1300-6000 - COL-OH - Site Operations'
	where [Level Name] = '1300 - Columbus'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1400-6000 - MAN-NH - Site Operations'
	where [Level Name] = '1400 - New Hampshire'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1500-6000 - CLE-OH - Site Operations'
	where [Level Name] = '1500 - Cleveland'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1600-6000 - DET-MI - Site Operations'
	where [Level Name] = '1600 - Detroit'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1700-6000 - NYC-NY - Site Operations'
	where [Level Name] = '1700 - New York City'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '2100-6000 - PHL-PA - Site Operations'
	where [Level Name] = '2100 - Philadelphia'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '2300-6000- WSH-DC - Site Operations'
	where [Level Name] = '2300 - Washington DC'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '3100-6000 - COL-SC - Site Operations'
	where [Level Name] = '3100 - Columbia'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '3500-6000 - MIA-FL - Site Operations'
	where [Level Name] = '3500 - Miami'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '3600-6000 - ORL-FL - Site Operations'
	where [Level Name] = '3600 - Orlando'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '3700-6000 - JAC-FL - Site Operations'
	where [Level Name] = '3700 - Jacksonville'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '4200-6000 - EBR-LA - Site Operations'
	where [Level Name] = '4200 - Baton Rouge'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '4300-6000 - NOL-LA - Site Operations'
	where [Level Name] = '4300 - New Orleans'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5100-6000-SNA-TX - Site Operations'
	where [Level Name] = '5100 - San Antonio'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5200-6000-TUL-OK - Site Operations'
	where [Level Name] = '5200 - Tulsa'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '5300-6000 - LTR-AR - Site Operations'
	where [Level Name] = '5300 - Little Rock'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '6100-6000 - DEN-CO - Site Operations'
	where [Level Name] = '6100 - Denver'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '7100-6000 - CHI-IL - Site Operations'
	where [Level Name] = '7100 - Chicago'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '7200-6000 - MWK-WI - Site Operations'
	where [Level Name] = '7200 - Milwaukee'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8100-6000-SNJ-CA - Site Operations'
	where [Level Name] = '8100 - San Jose'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8200-6000-SEA-WA - Site Operations'
	where [Level Name] = '8200 - Seattle'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8300-6000 - LOS-CA - Site Operations'
	where [Level Name] = '8300 - Los Angeles'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '8400-6000-SAC-CA - Site Operations'
	where [Level Name] = '8400 - Sacramento'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8007'
	,[Ledger] = '8000'
	where [Account Code] = 'Communications_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8102'
	,[Ledger] = '8100'
	where [Account Code] = ' Support_Services_Allocation_Offset_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8005'
	,[Ledger] = '8000'
	where [Account Code] = 'Development_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8008'
	,[Ledger] = '8000'
	where [Account Code] = 'Facilities_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8009'
	,[Ledger] = '8000'
	where [Account Code] = 'Finance_and_Administration_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8010'
	,[Ledger] = '8000'
	where [Account Code] = 'Government_Relations_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8011'
	,[Ledger] = '8000'
	where [Account Code] = 'Human_Potential_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8012'
	,[Ledger] = '8000'
	where [Account Code] = 'Impact_Delivery_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8013'
	,[Ledger] = '8000'
	where [Account Code] = 'Impact_Design_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8014'
	,[Ledger] = '8000'
	where [Account Code] = 'Evaluation_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8015'
	,[Ledger] = '8000'
	where [Account Code] = 'ITS_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8016'
	,[Ledger] = '8000'
	where [Account Code] = 'Leadership_Development_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8017'
	,[Ledger] = '8000'
	where [Account Code] = 'Marketing_and_Branding_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8004'
	,[Ledger] = '8000'
	where [Account Code] = 'Recruitment_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8018'
	,[Ledger] = '8000'
	where [Account Code] = 'Regional_Site_Operations_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8019'
	,[Ledger] = '8000'
	where [Account Code] = 'Growth_and_Strategy_SS'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '7300-6000 - KAN-MO - Site Operations'
	where [Level Name] = 'xxxx-6000 - KAN-MO - Site Operations'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '7300-8000 - KAN-MO - Development/Fundraising'
	where [Level Name] = 'xxxx-8000 - KAN-MO - Development/Fundraising'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '7300-9991 - KAN-MO - School Service/Impact'
	where [Level Name] = 'xxxx-9991 - KAN-MO - School Service/Impact'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8102'
	,[Ledger] = '8100'
	where [Account Code] = 'Corporate_Allocation_Offset_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8101'
	,[Ledger] = '8100'
	where [Account Code] = 'Corporate_Services_SS'

	update Integrations.dbo.AtoWFY17
	set [Account Code] = '8201'
	,[Ledger] = '8200'
	where [Account Code] = 'Support_Services_Allocation_Offset_SS'

	update Integrations.dbo.AtoWFY17
	set [Level Name] = '1100-6000 - BOS-MA - Site Operations'
	where [Level Name] = '1100 - Boston'

	delete
	from Integrations.dbo.AtoWFY17
	where 
	[Account Name] like '%8001%-%Stone%Soup%Contribution%'
	or [Account Name] like '%8003%-%Academy%Fees%'
	or [Account Name] like '%8004%-%Recruitment%Allocation%'
	or [Account Name] like '%8005%-%Development%Allocation%'

END

GO
