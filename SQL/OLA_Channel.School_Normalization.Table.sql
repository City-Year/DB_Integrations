USE [Integrations]
GO
/****** Object:  Table [OLA_Channel].[School_Normalization]    Script Date: 12/1/2016 9:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OLA_Channel].[School_Normalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Current] [varchar](250) NULL,
	[Transformed] [varchar](250) NULL,
	[Current_City] [varchar](250) NULL,
	[Current_State] [varchar](250) NULL,
	[Transformed_City] [varchar](250) NULL,
	[Transformed_State] [varchar](250) NULL
) ON [PRIMARY]

GO
