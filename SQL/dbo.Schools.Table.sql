USE [Integrations]
GO
/****** Object:  Table [dbo].[Schools]    Script Date: 12/1/2016 9:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools](
	[Current] [nvarchar](250) NULL,
	[Current_City] [nvarchar](250) NULL,
	[Current_State] [nvarchar](250) NULL,
	[Transformed] [nvarchar](250) NULL,
	[Transformed_City] [nvarchar](250) NULL,
	[Transformed_State] [nvarchar](250) NULL
) ON [PRIMARY]

GO
