USE [master]
GO
/****** Object:  Database [auction]    Script Date: 03/23/2014 23:21:59 ******/
CREATE DATABASE [auction] ON  PRIMARY 
( NAME = N'auction', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\auction.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'auction_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\auction_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [auction] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [auction].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [auction] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [auction] SET ANSI_NULLS OFF
GO
ALTER DATABASE [auction] SET ANSI_PADDING OFF
GO
ALTER DATABASE [auction] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [auction] SET ARITHABORT OFF
GO
ALTER DATABASE [auction] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [auction] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [auction] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [auction] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [auction] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [auction] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [auction] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [auction] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [auction] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [auction] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [auction] SET  ENABLE_BROKER
GO
ALTER DATABASE [auction] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [auction] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [auction] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [auction] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [auction] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [auction] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [auction] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [auction] SET  READ_WRITE
GO
ALTER DATABASE [auction] SET RECOVERY FULL
GO
ALTER DATABASE [auction] SET  MULTI_USER
GO
ALTER DATABASE [auction] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [auction] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'auction', N'ON'
GO
USE [auction]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON
INSERT [dbo].[categories] ([cid], [cname]) VALUES (1, N'Clothing')
INSERT [dbo].[categories] ([cid], [cname]) VALUES (2, N'Electronics')
INSERT [dbo].[categories] ([cid], [cname]) VALUES (3, N'Furniture')
INSERT [dbo].[categories] ([cid], [cname]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[categories] OFF
/****** Object:  Table [dbo].[roles]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rname] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON
INSERT [dbo].[roles] ([rid], [rname]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (2, N'users')
SET IDENTITY_INSERT [dbo].[roles] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[rid] [int] NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[uvalid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (1, 2, N'none', N'none', N'none', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (2, 1, N'admin', N'admin', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (6, 2, N'test', N'test', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (7, 2, N'test2', N'test2', N'miteshvora18@gmail.com', 0)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (8, 2, N'test3', N'test3', N'miteshvora18@gmail.com', 0)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (9, 2, N'test4', N'test4', N'miteshvora18@gmail.com', 0)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (13, 2, N'mitesh', N'mitesh', N'miteshvora18@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[products]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[cid] [int] NULL,
	[pname] [varchar](60) NULL,
	[pdesc] [varchar](500) NULL,
	[pimage] [varchar](200) NULL,
	[minBid] [money] NULL,
	[atime] [int] NULL,
	[bidEndtime] [datetime] NULL,
	[pvalid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (2, 6, 4, N'College Bag', N'College Bag with 2005 make', N'04092012278.jpg', 800.0000, 30, CAST(0x0000A2F800E57EC8 AS DateTime), 1)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (3, 6, 4, N'Bike Yamaha', N'Yamaha Bike with 2006 make', N'yamaha-r1-05-bikepic.jpg', 30000.0000, 1000, CAST(0x0000A2F800E57F2C AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[products] OFF
/****** Object:  Table [dbo].[feedback]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedback](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[subject] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[fdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON
INSERT [dbo].[feedback] ([fid], [uid], [subject], [description], [fdate]) VALUES (1, 6, N'Get users feedback', N'Get users feedback regularly', CAST(0x0000A2F7016997B1 AS DateTime))
SET IDENTITY_INSERT [dbo].[feedback] OFF
/****** Object:  Table [dbo].[selling]    Script Date: 03/23/2014 23:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[selling](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[sellUser] [int] NULL,
	[buyUser] [int] NULL,
	[bidAmount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__Users__rid__1367E606]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([rid])
REFERENCES [dbo].[roles] ([rid])
GO
/****** Object:  ForeignKey [FK__products__cid__239E4DCF]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[categories] ([cid])
GO
/****** Object:  ForeignKey [FK__products__uid__22AA2996]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__feedback__uid__2F10007B]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__selling__buyUser__2A4B4B5E]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([buyUser])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__selling__pid__286302EC]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[products] ([pid])
GO
/****** Object:  ForeignKey [FK__selling__sellUse__29572725]    Script Date: 03/23/2014 23:22:01 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([sellUser])
REFERENCES [dbo].[Users] ([uid])
GO
