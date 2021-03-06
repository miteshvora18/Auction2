USE [master]
GO
/****** Object:  Database [auction]    Script Date: 02/14/2015 21:13:18 ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 02/14/2015 21:13:19 ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 02/14/2015 21:13:19 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 02/14/2015 21:13:19 ******/
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
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (1, 2, N'none', N'none', N'none', 0)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (2, 1, N'admin', N'admin', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (6, 2, N'test', N'test', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (7, 2, N'test2', N'test2', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (8, 2, N'test3', N'test3', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (9, 2, N'test4', N'test4', N'miteshvora18@gmail.com', 1)
INSERT [dbo].[Users] ([uid], [rid], [username], [password], [email], [uvalid]) VALUES (13, 2, N'mitesh', N'mitesh', N'miteshvora18@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[products]    Script Date: 02/14/2015 21:13:19 ******/
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
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (2, 6, 4, N'College Bag', N'College Bag with 2005 make', N'04092012278.jpg', 800.0000, 30, CAST(0x0000A2FE00E57EC8 AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (3, 6, 4, N'Bike Yamaha', N'Yamaha Bike with 2006 make', N'yamaha-r1-05-bikepic.jpg', 30000.0000, 1000, CAST(0x0000A31B00E57F2C AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (4, 7, 1, N'T-Shirt Cricketer', N'T-Shirt Cricketer ', N'107777127.jpg', 10000.0000, 10000, CAST(0x0000A2FF017A5252 AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (5, 7, 2, N'ff', N'xdff', N'167951_177007042334229_100000748031341_443102_6805351_n.jpg', 2000.0000, 50, CAST(0x0000A2FA0005E0B1 AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (6, 7, 1, N'ff', N'fvdxgvdxgv', N'162796_1719556024247_1098665310_31882547_3213800_n.jpg', 1223.0000, 10, CAST(0x0000A2F9018B3C33 AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (7, 7, 2, N'fhghfh', N'hfghfgh', N'162796_1719556024247_1098665310_31882547_3213800_n.jpg', 11.0000, 556, CAST(0x0000A3190096ADDB AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (8, 7, 1, N'jgj', N'ghjghj', N'162796_1719556024247_1098665310_31882547_3213800_n.jpg', 121.0000, 21321, CAST(0x0000A308013DB89F AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (9, 8, 1, N'gjhjghj', N'hgjghj', N'162796_1719556024247_1098665310_31882547_3213800_n.jpg', 54654.0000, 45544, CAST(0x0000A2FA00F8685D AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (10, 8, 1, N'tghfgh', N'fghfh', N'2887047640099936546S600x600Q85.jpg', 1456.0000, 454, CAST(0x0000A2FA007DA17E AS DateTime), 0)
INSERT [dbo].[products] ([pid], [uid], [cid], [pname], [pdesc], [pimage], [minBid], [atime], [bidEndtime], [pvalid]) VALUES (11, 13, 4, N'Range Rover', N'Range Rover 2008 make', N'L405_15_EXT_LOC30_AUTOBIOG_BLK_ms_1_281-82710_450x259.jpg', 400000.0000, 40000, CAST(0x0000A45B0104886D AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[products] OFF
/****** Object:  Table [dbo].[feedback]    Script Date: 02/14/2015 21:13:19 ******/
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
INSERT [dbo].[feedback] ([fid], [uid], [subject], [description], [fdate]) VALUES (2, 6, N'Delay in service', N'Delay in service for products user and less products', CAST(0x0000A2FA00125580 AS DateTime))
INSERT [dbo].[feedback] ([fid], [uid], [subject], [description], [fdate]) VALUES (3, 6, N'fgsef', N'jklgjdfg', CAST(0x0000A2FE00020121 AS DateTime))
INSERT [dbo].[feedback] ([fid], [uid], [subject], [description], [fdate]) VALUES (4, 6, N'efsehfo', N'ijhoiefgigjog', CAST(0x0000A2FE000206D8 AS DateTime))
SET IDENTITY_INSERT [dbo].[feedback] OFF
/****** Object:  Table [dbo].[BidsOrder]    Script Date: 02/14/2015 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidsOrder](
	[bOrder] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[buyuser] [int] NULL,
	[selluser] [int] NULL,
	[bidamount] [money] NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[bOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BidsOrder] ON
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (1, 10, 1, 8, 0.0000, CAST(0x0000A2FC018474B0 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (2, 10, 1, 8, 0.0000, CAST(0x0000A2FC0184F9C4 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (3, 10, 1, 8, 0.0000, CAST(0x0000A2FC01854373 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (4, 5, 1, 7, 0.0000, CAST(0x0000A2FC018593B1 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (5, 3, 1, 6, 0.0000, CAST(0x0000A2FC0187F4AA AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (6, 3, 1, 6, 0.0000, CAST(0x0000A2FC0189F8BA AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (7, 3, 1, 6, 0.0000, CAST(0x0000A2FC018A469E AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (8, 3, 6, 6, 35000.0000, CAST(0x0000A2FC018B59F7 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (9, 10, 1, 8, 0.0000, CAST(0x0000A2FD0000666C AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (10, 9, 1, 8, 0.0000, CAST(0x0000A2FD000074B9 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (11, 9, 1, 8, 0.0000, CAST(0x0000A2FD00022272 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (12, 3, 6, 6, 35000.0000, CAST(0x0000A2FD00023A3A AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (13, 3, 6, 6, 35000.0000, CAST(0x0000A2FD0002F669 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (14, 3, 6, 6, 35000.0000, CAST(0x0000A2FD0004E867 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (15, 6, 1, 7, 0.0000, CAST(0x0000A2FD0004EE5C AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (16, 7, 1, 7, 0.0000, CAST(0x0000A2FD0004F399 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (17, 9, 1, 8, 0.0000, CAST(0x0000A2FD0004F8E3 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (18, 3, 6, 6, 35000.0000, CAST(0x0000A2FD0005DB06 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (19, 6, 1, 7, 0.0000, CAST(0x0000A2FD0005E10A AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (20, 7, 1, 7, 0.0000, CAST(0x0000A2FD0005E6D6 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (21, 9, 1, 8, 0.0000, CAST(0x0000A2FD0005ED38 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (22, 2, 6, 6, 1000.0000, CAST(0x0000A2FE00FCA7B6 AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (23, 4, 1, 7, 0.0000, CAST(0x0000A2FF017AD1CC AS DateTime))
INSERT [dbo].[BidsOrder] ([bOrder], [pid], [buyuser], [selluser], [bidamount], [date]) VALUES (24, 3, 6, 6, 35000.0000, CAST(0x0000A43F0156719B AS DateTime))
SET IDENTITY_INSERT [dbo].[BidsOrder] OFF
/****** Object:  Table [dbo].[selling]    Script Date: 02/14/2015 21:13:19 ******/
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
SET IDENTITY_INSERT [dbo].[selling] ON
INSERT [dbo].[selling] ([sid], [pid], [sellUser], [buyUser], [bidAmount]) VALUES (1, 3, 1, 7, 35000.0000)
INSERT [dbo].[selling] ([sid], [pid], [sellUser], [buyUser], [bidAmount]) VALUES (2, 2, 1, 7, 1000.0000)
INSERT [dbo].[selling] ([sid], [pid], [sellUser], [buyUser], [bidAmount]) VALUES (3, 3, 1, 8, 33000.0000)
SET IDENTITY_INSERT [dbo].[selling] OFF
/****** Object:  ForeignKey [FK__Users__rid__1367E606]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([rid])
REFERENCES [dbo].[roles] ([rid])
GO
/****** Object:  ForeignKey [FK__products__cid__239E4DCF]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[categories] ([cid])
GO
/****** Object:  ForeignKey [FK__products__uid__22AA2996]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__feedback__uid__2F10007B]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__BidsOrder__buyus__34C8D9D1]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[BidsOrder]  WITH CHECK ADD FOREIGN KEY([buyuser])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__BidsOrder__pid__33D4B598]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[BidsOrder]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[products] ([pid])
GO
/****** Object:  ForeignKey [FK__BidsOrder__sellu__35BCFE0A]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[BidsOrder]  WITH CHECK ADD FOREIGN KEY([selluser])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__selling__buyUser__2A4B4B5E]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([buyUser])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__selling__pid__286302EC]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[products] ([pid])
GO
/****** Object:  ForeignKey [FK__selling__sellUse__29572725]    Script Date: 02/14/2015 21:13:19 ******/
ALTER TABLE [dbo].[selling]  WITH CHECK ADD FOREIGN KEY([sellUser])
REFERENCES [dbo].[Users] ([uid])
GO
