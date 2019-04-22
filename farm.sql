USE [master]
GO
/****** Object:  Database [farm]    Script Date: 04/22/2019 11:52:59 ******/
CREATE DATABASE [farm] ON  PRIMARY 
( NAME = N'farm', FILENAME = N'C:\Users\Administrator\Desktop\log\farm.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'farm_log', FILENAME = N'C:\Users\Administrator\Desktop\log\farm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [farm] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farm] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [farm] SET ANSI_NULLS OFF
GO
ALTER DATABASE [farm] SET ANSI_PADDING OFF
GO
ALTER DATABASE [farm] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [farm] SET ARITHABORT OFF
GO
ALTER DATABASE [farm] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [farm] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [farm] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [farm] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [farm] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [farm] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [farm] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [farm] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [farm] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [farm] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [farm] SET  DISABLE_BROKER
GO
ALTER DATABASE [farm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [farm] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [farm] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [farm] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [farm] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [farm] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [farm] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [farm] SET  READ_WRITE
GO
ALTER DATABASE [farm] SET RECOVERY FULL
GO
ALTER DATABASE [farm] SET  MULTI_USER
GO
ALTER DATABASE [farm] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [farm] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'farm', N'ON'
GO
USE [farm]
GO
/****** Object:  Table [dbo].[user_seed_asset]    Script Date: 04/22/2019 11:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_seed_asset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[seedId] [int] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_user_seed_asset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_land_state]    Script Date: 04/22/2019 11:53:00 ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 04/22/2019 11:53:00 ******/
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
	[exp] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[seed]    Script Date: 04/22/2019 11:53:00 ******/
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
/****** Object:  Table [dbo].[growStage]    Script Date: 04/22/2019 11:53:00 ******/
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
