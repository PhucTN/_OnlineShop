/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2002)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'OnlineShop')
BEGIN
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 16384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = OFF
GO
USE [OnlineShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DESKTOP-ONUBVRJ\TRAN_NGOC_PHUC]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-ONUBVRJ\TRAN_NGOC_PHUC')
CREATE LOGIN [DESKTOP-ONUBVRJ\TRAN_NGOC_PHUC] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'gZlVvaufHXSTDaveudnfw+HWnHHtwpPftJJ/QSnr9gs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 9/29/2018 11:15:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'GKNYSbJ06lGMdIEXoevPHjhb55VKH04IRK2TaEAar5E=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[OnlineShop] TO [DESKTOP-ONUBVRJ\TRAN_NGOC_PHUC]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-ONUBVRJ\TRAN_NGOC_PHUC]
GO
USE [OnlineShop]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[About]    Script Date: 9/29/2018 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[About]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Image] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Detail] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescriptions] [nchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[About] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescriptions] [nchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Category] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Contact] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Content]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Image] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescriptions] [nchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Content] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentTag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[ContentTag] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedBack]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FeedBack](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Content] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[FeedBack] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Footer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Content] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Footer] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Link] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Menu] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MenuType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[MenuType] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Image] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescriptions] [nchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Product] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescriptions] [nchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[ProductCategory] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Slide]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Slide](
	[ID] [bigint] NOT NULL,
	[Image] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Slide] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Value] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[SystemConfig] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Tag] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/29/2018 11:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[User] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Phuc', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'Phuchieu1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Phuchieu2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'phuc1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:32.190' AS DateTime), NULL, CAST(N'2018-09-29T11:19:32.190' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'phuc2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:45.710' AS DateTime), NULL, CAST(N'2018-09-29T11:19:45.710' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'hieu1', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'hieu2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'phuctn', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'Phuctn1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:28.170' AS DateTime), NULL, CAST(N'2018-09-29T11:19:28.170' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'hanh', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (25, N'hanhphuc', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (26, N'phucduc', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (31, N'phuctho', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (32, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (33, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (34, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (35, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (36, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (38, N'Phuchieu1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (39, N'Phuchieu2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (40, N'phuc1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:32.190' AS DateTime), NULL, CAST(N'2018-09-29T11:19:32.190' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (41, N'phuc2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:45.710' AS DateTime), NULL, CAST(N'2018-09-29T11:19:45.710' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (42, N'hieu1', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (43, N'hieu2', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (44, N'phuctn', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (45, N'Phuctn1', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:28.170' AS DateTime), NULL, CAST(N'2018-09-29T11:19:28.170' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (46, N'hanh', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (47, N'hanhphuc', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, CAST(N'2018-09-29T11:19:12.957' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (48, N'phucduc', N'886d057a091559e2f5dff95d1d01360b', NULL, NULL, NULL, NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, CAST(N'2018-09-29T11:19:20.770' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (49, N'phuctho', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (50, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (51, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (52, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (53, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (54, N'Phuchieu', N'886d057a091559e2f5dff95d1d01360b', N'Phuchieu', N'Ha Noi', N'PhucTN@fpt.com.vn', N'0979801434', CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, CAST(N'2018-09-29T11:02:53.597' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_About_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_About_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_About_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Category_DisplayOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Category_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Category_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Category_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Content_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Content_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Content_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Content_ViewCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FeedBack_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FeedBack_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Footer_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Footer] ADD  CONSTRAINT [DF_Footer_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Menu_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_Price]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_Quantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_ViewCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_DisplayOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_ShowOnHome]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Slide_DisplayOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Slide_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Slide_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Slide_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SystemConfig_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Stutus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Stutus]  DEFAULT ((1)) FOR [Status]
END
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
