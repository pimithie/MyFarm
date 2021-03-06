USE [farm]
GO
/****** Object:  Table [dbo].[user_seed_asset]    Script Date: 04/22/2019 15:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_seed_asset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[seedId] [int] NOT NULL,
	[countOfSeed] [int] NOT NULL,
 CONSTRAINT [PK_user_seed_asset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_land_state]    Script Date: 04/22/2019 15:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_land_state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[landId] [int] NOT NULL,
	[currentCropId] [int] NOT NULL,
	[hasInsect] [bit] NOT NULL,
	[currentGrowStageId] [int] NOT NULL,
	[nextStageNeedTime] [bigint] NOT NULL,
	[closeBrowerTime] [bigint] NOT NULL,
 CONSTRAINT [PK_user_land_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 04/22/2019 15:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[userExp] [bigint] NOT NULL,
	[money] [bigint] NOT NULL,
	[headPic] [varchar](50) NOT NULL,
	[currentLevel] [int] NOT NULL,
	[vipLevel] [smallint] NOT NULL,
	[point] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seed]    Script Date: 04/22/2019 15:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seedId] [int] NOT NULL,
	[seedName] [varchar](50) NOT NULL,
	[quarter] [tinyint] NOT NULL,
	[seedLevel] [smallint] NOT NULL,
	[seedType] [varchar](50) NOT NULL,
	[harvestExp] [int] NOT NULL,
	[timePerQuarter] [int] NOT NULL,
	[harvestNum] [tinyint] NOT NULL,
	[seedPrice] [int] NOT NULL,
	[profitPerFruit] [smallint] NOT NULL,
	[landType] [varchar](50) NOT NULL,
	[pointPerQuarter] [int] NOT NULL,
	[tips] [text] NOT NULL,
 CONSTRAINT [PK_seed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[growStage]    Script Date: 04/22/2019 15:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[growStage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seedId] [int] NOT NULL,
	[growStageId] [int] NOT NULL,
	[growStageName] [varchar](50) NOT NULL,
	[stageNeedTime] [int] NOT NULL,
	[InsectProbability] [float] NOT NULL,
	[picWidth] [int] NOT NULL,
	[picHeight] [int] NOT NULL,
	[offsetX] [int] NOT NULL,
	[offsetY] [int] NOT NULL,
	[cropStage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_growStage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
