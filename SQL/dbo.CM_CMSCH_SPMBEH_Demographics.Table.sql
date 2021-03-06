USE [Integrations]
GO
/****** Object:  Table [dbo].[CM_CMSCH_SPMBEH_Demographics]    Script Date: 12/1/2016 9:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_CMSCH_SPMBEH_Demographics](
	[Student_Name] [nvarchar](255) NULL,
	[student_school_name] [nvarchar](255) NULL,
	[cych_Accnt_SF_ID] [nvarchar](255) NULL,
	[Student_SF_ID] [nvarchar](255) NULL,
	[student_ia_att] [float] NULL,
	[Student_IA_Beh] [float] NULL,
	[Student_IA_ELA] [float] NULL,
	[Student_IA_Math] [float] NULL,
	[student_gender] [nvarchar](255) NULL,
	[student_ethnicity] [nvarchar](255) NULL,
	[student_ell] [float] NULL,
	[student_grade] [float] NULL,
	[cy_student_id] [nvarchar](255) NULL,
	[afterschoolpart] [nvarchar](255) NULL,
	[ENROLLED_BEHAVIOR] [float] NULL,
	[Section_Primary_Staff] [nvarchar](255) NULL,
	[Section_Primary_Staff_ID] [nvarchar](255) NULL
) ON [PRIMARY]

GO
