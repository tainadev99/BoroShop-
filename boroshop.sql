USE [master]
GO
/****** Object:  Database [BoroShop]    Script Date: 10/28/2020 1:52:28 AM ******/
CREATE DATABASE [BoroShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoroShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AT\MSSQL\DATA\BoroShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoroShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AT\MSSQL\DATA\BoroShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BoroShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoroShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoroShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoroShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoroShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoroShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoroShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoroShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BoroShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoroShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoroShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoroShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoroShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoroShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoroShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoroShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoroShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BoroShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoroShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoroShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoroShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoroShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoroShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoroShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoroShop] SET RECOVERY FULL 
GO
ALTER DATABASE [BoroShop] SET  MULTI_USER 
GO
ALTER DATABASE [BoroShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoroShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoroShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoroShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoroShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BoroShop', N'ON'
GO
ALTER DATABASE [BoroShop] SET QUERY_STORE = OFF
GO
USE [BoroShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_raw](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[balls_size]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[balls_size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clothes_size]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clothes_size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size] [nchar](10) NOT NULL,
	[height] [float] NOT NULL,
	[weight] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[content] [text] NOT NULL,
	[createdate] [datetime] NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_raw](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[content] [text] NULL,
	[createdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdate] [datetime] NULL,
	[status] [bit] NOT NULL,
	[wallet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_cart]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[sizeid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_cart_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_cart_raw](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_raw](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[phone] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdate] [datetime] NULL,
	[status] [bit] NOT NULL,
	[wallet] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foot_size]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foot_size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size_UK] [float] NOT NULL,
	[size_US] [float] NOT NULL,
	[size_VN] [float] NOT NULL,
	[cm] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[img1] [nvarchar](50) NULL,
	[img2] [nvarchar](50) NULL,
	[img3] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Raw](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img1] [varchar](100) NULL,
	[img2] [varchar](100) NULL,
	[img3] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[createdate] [datetime] NULL,
	[shipdate] [datetime] NULL,
	[status] [bit] NOT NULL,
	[total] [float] NOT NULL,
	[ShipNote] [text] NULL,
	[address] [nvarchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[sizeid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[short_description] [text] NULL,
	[description] [text] NULL,
	[price] [float] NOT NULL,
	[sale] [int] NOT NULL,
	[subcateid] [int] NOT NULL,
	[brandid] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[image] [varchar](100) NULL,
	[isHot] [bit] NOT NULL,
	[createdate] [datetime] NULL,
	[isOutofStock] [bit] NOT NULL,
	[isSale] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Raw](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[short_descript] [text] NULL,
	[descript] [text] NULL,
	[price] [float] NOT NULL,
	[sale] [float] NOT NULL,
	[subcateid] [int] NOT NULL,
	[brandid] [int] NOT NULL,
	[status] [bit] NULL,
	[image] [varchar](100) NULL,
	[isHot] [bit] NOT NULL,
	[createdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_raw1]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_raw1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[short_description] [text] NOT NULL,
	[descript] [text] NOT NULL,
	[price] [float] NOT NULL,
	[sale] [float] NOT NULL,
	[subcateid] [int] NOT NULL,
	[brandid] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[image] [varchar](100) NULL,
	[isHot] [bit] NOT NULL,
	[createdate] [datetime] NULL,
	[isOutOfStock] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size] [nchar](10) NOT NULL,
	[categoryid] [int] NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size_product]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size_product](
	[pid] [int] NOT NULL,
	[sizeid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size_product_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size_product_raw](
	[pid] [int] NOT NULL,
	[sizeid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[cateid] [int] NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory_raw]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory_raw](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[categoryid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 10/28/2020 1:52:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dob] [datetime] NULL,
	[name] [nchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password], [status]) VALUES (N'anhtai', N'1234', 1)
INSERT [dbo].[Admin] ([username], [password], [status]) VALUES (N'anhtai1', N'12345', 1)
INSERT [dbo].[Admin] ([username], [password], [status]) VALUES (N'anhtuan', N'1234', 1)
INSERT [dbo].[Admin] ([username], [password], [status]) VALUES (N'anhtoan', N'1234', 1)
INSERT [dbo].[admin_raw] ([username], [password]) VALUES (N'anhtai', N'123')
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (1, N'Nike                                              ', 1)
INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (2, N'Adidas                                            ', 1)
INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (3, N'Lightning                                         ', 1)
INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (4, N'Anta                                              ', 1)
INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (5, N'Peak                                              ', 1)
INSERT [dbo].[Brand] ([id], [name], [status]) VALUES (9, N'Other                                             ', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [status]) VALUES (1, N'Basketball Shoes                                  ', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (2, N'Basketball Balls                                  ', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (4, N'Basketball Clothes                                ', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (5, N'Basketball Accessories                            ', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (1, N'usertai', N'1234', N'Nguyễn Anh Tài', N'123456', CAST(N'1999-01-30' AS Date), 1, N'Kí túc xá FPT', CAST(N'2019-11-11T04:42:38.917' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (2, N'anhtai1', N'1234', N'Nguyễn Dân Chơi', N'12345', CAST(N'1999-01-30' AS Date), 1, N'abcxyz', CAST(N'2019-11-13T13:15:06.090' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (3, N'anhtai1abcxyz', N'1234', N'anhtai', N'0123456789', CAST(N'1999-12-16' AS Date), 0, N'asdasda', CAST(N'2020-03-28T04:17:36.083' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (4, N'abcxyz123', N'anhtai', N'anhtai', N'123456789', CAST(N'1999-02-25' AS Date), 1, N'asdsadsad', CAST(N'2020-03-28T04:26:10.307' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (5, N'a1234', N'anhtai', N'anhtai', N'12355656', CAST(N'2016-03-27' AS Date), 1, N'anhtai', CAST(N'2020-03-28T04:42:34.440' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (6, N'anh1', N'anh1', N'anh1', N'123456789', CAST(N'2020-05-28' AS Date), 1, N'anh1', CAST(N'2020-03-28T08:06:52.757' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (7, N'anh2', N'anh2', N'anh2', N'123456789', CAST(N'2020-03-28' AS Date), 1, N'anh1', CAST(N'2020-03-28T08:12:48.723' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (8, N'anhtai4', N'anhtai4', N'anhtai4', N'123456789', CAST(N'1999-02-02' AS Date), 1, N'anhtai4', CAST(N'2020-03-28T08:35:22.157' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (9, N'anhtai5', N'anhtai5', N'anhtai5', N'123456789', CAST(N'1999-02-02' AS Date), 1, N'anhtai5', CAST(N'2020-03-28T08:37:21.670' AS DateTime), 1, 0)
INSERT [dbo].[Customer] ([cid], [username], [password], [fullname], [phone], [dob], [gender], [address], [createdate], [status], [wallet]) VALUES (10, N'anhtai6', N'anhtai6', N'anhtai6', N'12345678', CAST(N'1999-02-02' AS Date), 1, N'anhtai6', CAST(N'2020-03-28T09:01:12.137' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Customer_cart] ON 

INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (22, 2, 6, 6, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (24, 1, 6, 7, 3)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (3, 0, 8, 4, 5)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (4, 0, 6, 6, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (5, 0, 6, 7, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (25, 3, 6, 6, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (26, 3, 22, 12, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (28, 4, 6, 6, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (34, 10, 19, 12, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (23, 1, 6, 6, 3)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (29, 7, 9, 3, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (32, 9, 10, 6, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (27, 4, 15, 17, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (30, 7, 19, 12, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (31, 9, 9, 3, 1)
INSERT [dbo].[Customer_cart] ([id], [cid], [pid], [sizeid], [quantity]) VALUES (33, 10, 9, 3, 1)
SET IDENTITY_INSERT [dbo].[Customer_cart] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (1, 3, N'3312_n.jpg', N'17992312_0.jpg', N'22281681_n.jpg')
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (2, 4, N'3312_n.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (3, 5, N'01_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (4, 6, N'02_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (5, 7, N'03_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (6, 8, N'04_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (7, 9, N'05_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (8, 10, N'06_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (9, 11, N'07_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (11, 13, N'11_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (17, 19, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (20, 22, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (21, 23, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (22, 24, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (10, 12, N'09_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (13, 15, N'13_2.jpg', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (15, 17, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (18, 20, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (19, 21, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (12, 14, N'12_2.jpeg', N'12_3.jpeg', NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (16, 18, N'', NULL, NULL)
INSERT [dbo].[Image] ([id], [pid], [img1], [img2], [img3]) VALUES (14, 16, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (4, 1, CAST(N'2019-11-13T08:53:34.963' AS DateTime), NULL, 0, 925, N'', N'KÃ­ tÃºc xÃ¡ FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (5, 1, CAST(N'2019-11-13T09:57:33.163' AS DateTime), NULL, 0, 1430, N'', N'KÃ­ tÃºc xÃ¡ FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (8, 1, CAST(N'2019-11-13T12:33:50.310' AS DateTime), NULL, 0, 1200, N'', N'Kí túc xá FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (10, 1, CAST(N'2019-11-13T13:00:20.300' AS DateTime), NULL, 0, 1930, N'', N'Kí túc xá FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (13, 3, CAST(N'2020-03-28T04:18:37.380' AS DateTime), NULL, 0, 174, N'zxczxcxzcz', N'asdasda')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (14, 4, CAST(N'2020-03-28T04:26:58.090' AS DateTime), NULL, 0, 180, N'zxczxcxzcz', N'asdsadsad')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (15, 7, CAST(N'2020-03-28T08:14:00.343' AS DateTime), NULL, 0, 183, N'aaaaaaaaaa', N'anh1')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (6, 1, CAST(N'2019-11-13T09:57:52.393' AS DateTime), NULL, 0, 900, N'', N'KÃ­ tÃºc xÃ¡ FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (7, 1, CAST(N'2019-11-13T12:17:27.857' AS DateTime), NULL, 0, 2200, N'', N'KÃ­ tÃºc xÃ¡ FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (9, 1, CAST(N'2019-11-13T12:39:48.233' AS DateTime), NULL, 0, 1320, N'', N'Kí túc xá FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (11, 2, CAST(N'2019-11-13T13:15:52.023' AS DateTime), NULL, 0, 130, N'', N'abcxyz')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (12, 1, CAST(N'2019-11-13T13:21:46.750' AS DateTime), NULL, 0, 780, N'', N'Kí túc xá FPT')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (17, 10, CAST(N'2020-03-28T09:01:59.853' AS DateTime), NULL, 0, 183, N'aaaaaa', N'anhtai6')
INSERT [dbo].[Order] ([id], [cid], [createdate], [shipdate], [status], [total], [ShipNote], [address]) VALUES (16, 9, CAST(N'2020-03-28T08:38:31.987' AS DateTime), NULL, 0, 270, N'aaaaa', N'anhtai5')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (2, 4, 8, 5, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (3, 4, 9, 3, 4)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (4, 4, 8, 4, 4)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (5, 5, 6, 6, 11)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (6, 6, 10, 6, 6)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (7, 7, 10, 6, 10)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (10, 8, 9, 3, 10)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (12, 10, 9, 3, 2)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (13, 10, 6, 7, 10)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (14, 10, 6, 6, 3)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (18, 13, 6, 6, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (19, 13, 22, 12, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (20, 14, 15, 17, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (21, 14, 6, 6, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (8, 7, 15, 17, 4)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (9, 7, 15, 15, 10)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (15, 11, 6, 6, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (26, 17, 9, 3, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (27, 17, 19, 12, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (11, 9, 9, 3, 11)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (16, 12, 6, 6, 3)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (17, 12, 6, 7, 3)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (22, 15, 9, 3, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (23, 15, 19, 12, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (24, 16, 9, 3, 1)
INSERT [dbo].[Order_Detail] ([id], [oid], [pid], [sizeid], [quantity]) VALUES (25, 16, 10, 6, 1)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (3, N'asdasd', N'asdasdas', N'dasdasdasdasd', 0, 3, 1, 3, 0, N'17992312_0.jpg', 0, CAST(N'2019-11-11T08:14:31.227' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (4, N'Other', N'asdasdasd', N'asdasdasd', 0, 10, 1, 1, 1, N'0836812800_n.jpg', 1, CAST(N'2019-11-11T08:19:04.490' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (5, N'adidas D.O.N. Issue #1 ', N'FREAKISH SPEED, POWER AND CONTROL. Get your freak on in Giannis Antetokounmpo''s debut signature shoe, Nike''s first ever for the international basketball sensation. The Zoom Freak 1 has the extra-responsive cushioning, forefoot lockdown, and multidirectional traction needed to complement his freakishly athletic game.', N'Zoom Freak 1 Basketball Shoe FREAKISH SPEED, POWER AND CONTROL. Get your freak on in Giannis Antetokounmpo''s debut signature shoe, Nike''s first ever for the international basketball sensation. The Zoom Freak 1 has the extra-responsive cushioning, forefoot lockdown, and multidirectional traction needed to complement his freakishly athletic game. Double-Stacked Cushioning 2 Zoom Air units under the heel stacked on top of each other provide extra cushioning for hard impacts and extra responsiveness for getting back down court. Forefoot Lockdown Internal bands lock down over the forefoot when you lace up, helping to keep you stable and fully contained. Multidirectional Traction The geometric traction pattern provides grip for quick stops, starts, and changes of directions on court. A section of the outsole is inspired by roses in remembrance of Giannis'' late father. Family First Family is what''s most important to Giannis. Design details on the midsole and outsole honor his parents and 4 brothers. A rubber clip extends from the outsole up the side for lateral support. The padded collar helps lock you in at the heel. More Details Signature details Soft, resilient foam midsole "I AM MY FATHER''S LEGACY" is molded into outsole Rubber outsole', 120, 1, 2, 4, 1, N'a1.jpg', 1, CAST(N'2019-11-11T09:05:44.873' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (6, N'Nike PG 3 Basketball Shoe', N'Paul George''s moon shot took him from Palmdale to basketball stardom, and now he''s heading to new heights with clouds under his feet. Built on an outsole inspired by moon craters, the PG 3 combines sensational traction with responsive Zoom Air cushioning that helps you move seamlessly between offence and defence.', N'BEYOND COMFORTABLE.
Paul George''s moon shot took him from Palmdale to basketball stardom, and now he''s heading to new heights with clouds under his feet. Built on an outsole inspired by moon craters, the PG 3 combines sensational traction with responsive Zoom Air cushioning that helps you move seamlessly between offence and defence.

Pure Comfort
1/2-bootie construction creates a snug, secure fit. The padded collar finished with smooth, durable fabric hugs the ankle without sacrificing agility.

Moon-Inspired Traction
An outsole pattern inspired by craters on the Moon provides excellent multi-directional traction with a distinct aesthetic.

Responsive Cushioning
Zoom Air unit offers a springy, responsive feel that provides a little extra oomph on the court.

Product Details
Paul George storytelling details
Mesh and synthetic upper
Foam midsole
Rubber outsole', 130, 10, 1, 1, 1, N'a2.jpg', 1, CAST(N'2019-11-11T09:13:30.743' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (7, N'Nike Zoom Freak 1 Basketball Boot/Shoe', N'FREAKISH SPEED, POWER AND CONTROL.
Get your freak on in Giannis Antetokounmpo''s debut signature shoe, Nike''s first ever for the international basketball sensation. The Zoom Freak 1 has the extra-responsive cushioning, forefoot lockdown, and multidirectional traction needed to complement his freakishly athletic game.', N'Zoom Freak 1
Basketball Shoe
FREAKISH SPEED, POWER AND CONTROL.
Get your freak on in Giannis Antetokounmpo''s debut signature shoe, Nike''s first ever for the international basketball sensation. The Zoom Freak 1 has the extra-responsive cushioning, forefoot lockdown, and multidirectional traction needed to complement his freakishly athletic game.

Double-Stacked Cushioning
2 Zoom Air units under the heel stacked on top of each other provide extra cushioning for hard impacts and extra responsiveness for getting back down court.
Forefoot Lockdown
Internal bands lock down over the forefoot when you lace up, helping to keep you stable and fully contained.
Multidirectional Traction
The geometric traction pattern provides grip for quick stops, starts, and changes of directions on court. A section of the outsole is inspired by roses in remembrance of Giannis'' late father.
Family First
Family is what''s most important to Giannis. Design details on the midsole and outsole honor his parents and 4 brothers.
A rubber clip extends from the outsole up the side for lateral support.
The padded collar helps lock you in at the heel.

More Details

Signature details
Soft, resilient foam midsole
"I AM MY FATHER''S LEGACY" is molded into outsole
Rubber outsole', 100, 10, 2, 1, 1, N'03_1.jpg', 1, CAST(N'2019-11-11T09:18:31.653' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (8, N'Nike Paul George 2 Basketball Shoe', N'FULL-COURT FEROCITY.
Delivers on-court comfort and responsiveness for the game''s best 2-way player, Paul George. Its build is light yet strong, with a forefoot strap and band system that locks you in, and Zoom Air cushioning that responds to e', N'Men''s PG 2 Shoe
FULL-COURT FEROCITY.
Men''s PG 2 Shoe delivers on-court comfort and responsiveness for the game''s best 2-way player, Paul George. Its build is light yet strong, with a forefoot strap and band system that locks you in, and Zoom Air cushioning that responds to every fast, focused step.

Zoom Air cushioning delivers continuous on-court responsiveness.
1/2 bootie construction delivers a snug, secure fit.
Mesh band system integrates with the laces to lock you in.
Soft, foam midsole provides a plush, cushioned ride.
Rubber outsole provides durability and traction.
', 99, 1, 3, 1, 1, N'a5.jpg', 1, CAST(N'2019-11-11T09:19:48.953' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (9, N'Nike Jordan Why Not Zer0.2 Basketball Boot/Shoe', N'CALCULATED CHAOS.


The Jordan "Why Not?" Zer0.2 Men''s Basketball Shoe celebrates Russell Westbrook''s calculated chaos by combining materials that work in perfect harmonyâ??because, well, why not?', N'Jordan "Why Not?" Zer0.2
Men''s Basketball Shoe
CALCULATED CHAOS.
Why not take the shot?
Why not attack the full length of the court?
Why not crash the boards, and steal every ball and rain assists like water?
The Jordan "Why Not?" Zer0.2 Men''s Basketball Shoe celebrates Russell Westbrook''s calculated chaos by combining materials that work in perfect harmonyâ??because, well, why not?

Mixed-material upper provides optimal support and breathability for dynamic play.
Forefoot Zoom Air unit provides lightweight, responsive cushioning.
Midfoot strap helps secure your foot for added stability and a snug fit.
Rubber outsole with an aggressive traction pattern gives you optimal grip for the court.', 150, 2, 3, 1, 1, N'a4.jpg', 1, CAST(N'2019-11-11T09:21:06.507' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (10, N'Nike Kyrie 5 Basketball Boot/Shoe', N'The combination of looks and performance are driven from who Kyrie is, With innovative Air Zoom Turbo, Flytrap inspired containment system and geometric tread this shoe is an evolution from earlier versions', N'Kyrie Irving has spoken about the Kyrie 5.
In His Own Words:
"I try to integrate who I am and the principles I live by into my signature line and make a great, great shoe."
He comments on how far the shoes have developed since the start of his signature range, incuding the remarkable use of technology that is beneficial for the player.

"The performance evolution from a KYRIE 1 to a KYRIE 5 is incredible."

He believes the combination of looks and performance are driven from who he is, a normal person with a vision, and he wants all to have a share in this.

He feels the colorways, and the stories they relay are more honest and relatable, so supporting others in sharing their stories.

How the KYRIE 5 Work
The shoe''s technologies are engineered to help the All-Star guard play quicker and sharper. There are three innovations included...
1. An articulated forefoot zoom bag. This is a huge technological unlock for supporting guard play. Why? Because of its shape. The Air Zoom Turbo unit curves to wrap the bottom and sides of the foot. Cushioning is distributed across the entire forefoot footbed, working with quick-change-of-direction styles of play for engaging the foot when banking, cutting, or attacking.

2. A new containment system Inspired by the Venus Flytrap plant. The Flywire is arranged so that it locks the foot into the shoes with optimal containment above the Air Zoom Turbo unit, and this amplifies the responsiveness for improved fit and feel.â??

3. A new traction pattern drawn from direct inspiration from Irving. The pattern creates stability through discreet geometries, inspired by the Hamsa hand tattoo on his left arm. A symbol of protection, he feels shielded from bad juju. The design has been integrated into the outsole patterns, so applying more of his spirit throughout the shoe.

Inside the New Nike Air Zoom Turbo
Specifically designed for quick start-and-stop play, the Nike Air Zoom Turbo is engineered to follow the curved shape of the KYRIE 5 outsole. This means that as a player rolls toward the basket, the cushioning responds with rapid energy return for all angles of attack. It works because of a game-changing new manufacturing method that creates flexibility in the Air unit via a series of welded channels. This allowed designers to manipulate the bag and form it to the foot and the contour of the shoe''s banked tooling.

The KYRIE 5 launches November 22 2018.', 150, 10, 1, 1, 1, N'a6.jpg', 1, CAST(N'2019-11-11T09:25:21.007' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (11, N'Adidas D Lillard 2.0 Primeknit Basketball Boots/Shoes', N'Speed, agility and split-second decisions make Damian Lillard unstoppable anywhere on the court. These men''s basketball shoes are inspired by his unmistakable style. With BOUNCEâ?¢ cushioning to energize your game, they have a seamless adidas Primeknit upper and premium Dame details.', N'D LILLARD 2.0 PRIMEKNIT SHOES
DAME-INSPIRED SHOES FOR GAME-CHANGING QUICKNESS.
Speed, agility and split-second decisions make Damian Lillard unstoppable anywhere on the court. These men''s basketball shoes are inspired by his unmistakable style. With BOUNCEâ?¢ cushioning to energize your game, they have a seamless adidas Primeknit upper and premium Dame details.

BOUNCEâ?¢ provides energized comfort for all sports, all day
Breathable and flexible adidas Primeknit upper for an enhanced fit; techfitÂ® upper is engineered for natural, flexible support and a seamless, sock-like fit
TPU forefoot webbing for secure lockdown
TORSIONÂ® SYSTEM for midfoot integrity
TPU heel for stability; Heel pull tab for easy on and off
Continentalâ?¢ Rubber outsole for extraordinary grip in wet and dry conditions; NON MARKING rubber outsole', 75, 1, 2, 2, 1, N'a7.jpg', 0, CAST(N'2019-11-11T09:27:09.250' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (13, N'Men''s Black Curry 1 ''dark Matter'' Shoes', N'The under armor curry 1 "dark matter" is the 2015 nba all - star edition of steph curry''s first signature shoe. The performance sneaker is as innovative as curry is on the court, with an anafoam upper and charged midsole. Purple and black camouflage cover much of the shoe, while volt - colored green handles the under armor branding, midsole speckling, and sole. The fully - mesh tongue is solid purple, with black on the two - tone laces and inner lining. Color: black', N'The under armor curry 1 "dark matter" is the 2015 nba all - star edition of steph curry''s first signature shoe. The performance sneaker is as innovative as curry is on the court, with an anafoam upper and charged midsole. Purple and black camouflage cover much of the shoe, while volt - colored green handles the under armor branding, midsole speckling, and sole. The fully - mesh tongue is solid purple, with black on the two - tone laces and inner lining. Color: black', 140, 10, 2, 3, 1, N'a9.jpg', 1, CAST(N'2019-11-11T09:32:35.283' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (19, N'Baden Basketball Skilcoach Learner', N'Baden rubber basketball with markings remiding of good hand positioning for juniors', N'Marked with left and right handed shooting grips, this is a unique training aid sized for junior or youth ballers.', 90, 3, 4, 2, 1, N'a13.jpg', 1, CAST(N'2019-11-11T09:44:09.247' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (22, N'Baden Basketball Lexum Elite Matchball EBL Logo (Indoor)', N'The top level Match Ball from Baden for local or national league match play.', N'The official mach ball for EBL National League games

Introducing the new, top of the range matchball from Baden, the Baden Lexum Elite-TM, endorsed by FIBA and England Basketball. The EliteTM ball is the best basketball Baden has ever produced and is a culmination of years of research and development. All of Badens new technologies have been combined to produce the EliteTM ball which is used by all teams in English and Scottish Basketball National Leagues.

Top of the range Matchball
CCTM carcass
2 ply butyl bladder
PerfectionTM Design
Featuring Cushion Control Technology-TM
Uses Badens Stealth Soft Valve System for a better bounce off the valve panel
Wide Channels
Advanced breathable micro fibre cover
Total Feel Technology-TM

Indoor use only
FIBA Approved
Approved by England Basketball and Basketball Scotland

Double panel design', 44, 10, 32, 3, 1, N'21.jpg', 1, CAST(N'2019-11-12T01:13:43.350' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (23, N'Nike Pro Combat Basketball Players Shooting Sleeve (Boxed)', N'With a lightweight, compression fit, here is the Nike Pro Men''s Basketball Sleeve', N'With a lightweight, compression fit, the Nike Pro Men''s Basketball Sleeve features strategically placed ventilation zones and textured rib fabric to give you the comfort, mobility, support and durability that your game demands.

Benefits

Dri-FIT fabric to wick sweat away and help keep you dry and comfortable
Swoosh design trademark at wrist
Fabric: Dri-FIT 84% polyester/16% spandex
Machine wash
Boxed (1 Sleeve)', 15, 10, 11, 9, 1, N'a16.jpg', 1, CAST(N'2019-11-12T01:15:14.287' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (24, N'Nike Pack of 2 Arm Warmers / Basketball Shooting Sleeves', N'The accessory for keeping your shooting arm(s) warm and supported', N'A pair of lycra sleeves - the popular accessory for keeping your shooting arm(s) warm and supported. Dri-FIT fabric / Lightweight fabric, fits from wrist to lower bicep.

Two sizes available, the sleeves are quite stretchy so will fit smaller but the stitching limits the maximum size they will stretch to: Size XS/S, Maximum Bicep Size 28cm (10inches), Length Guide 35 (14inches), Size M/L, Maximum Bicep Size 32cm (12inches), Length Guide 40cm (16inches)

Contents: 35% Polyester, 28% Neoprene, 25% Nylon, 7% EVA 5% Rubber
High contrast logo
Pack size: 1 pair', 20, 10, 11, 9, 1, N'a17.jpg', 0, CAST(N'2019-11-12T01:16:35.190' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (12, N'Adidas Amplify', N'These men''s basketball shoes are built to move you around your opponents and straight to the basket. With a perforated leather and synthetic upper, they feature ADIPRENEÂ®+ for an extra push.', N'These men''s basketball shoes are built to move you around your opponents and straight to the basket. With a perforated leather and synthetic upper, they feature ADIPRENEÂ®+ for an extra push.

Perforated leather and synthetic upper for comfort and light weight
Air mesh tongue for maximum breathability
ADIPRENEÂ®+ in the forefoot maintains propulsion and efficiency
Comfortable textile lining
Mesh eyestay and webbing 3-Stripes for unique look
NON MARKING rubber outsole', 120, 10, 1, 2, 1, N'a8.jpg', 0, CAST(N'2019-11-11T09:29:18.653' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (15, N'Nike Basketball League Reversible Kit - White/Royal Blue', N'This is a two-in-one fully reversible design that''s ready to get up and down the court.', N'Keep top performance and top style on the court with Nike Team League Reversible Men''s Basketball Jersey and Shorts.
This is a two-in-one fully reversible design that''s ready to get up and down the court.

Benefits

11 Inch inseam (based on size L)
Internal elastic and draw cord at waistband for secure and comfortable fit
Embroidered swoosh logo trademark at left hem and centre chest
115g mesh fabric reversing to 115g warp knit mesh 100% polyester
Dri-FIT wicks sweat away and helps keep you dry and comfortable.
Side panel and shoulder welt design in reverse colour
Machine wash', 50, 10, 6, 5, 1, N'13_1.jpg', 0, CAST(N'2019-11-11T09:38:28.443' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (17, N'Spalding TF 33 Outdoor Basketball - Multicolour - Size 3x3 Gameball', N'The TF 33 from Spalding is a durable rubber ball designed for outdoor use and with 3 on 3 play on mind.', N'The TF 33 from Spalding is a durable rubber ball designed for outdoor use and with 3 on 3 play on mind.', 45, 10, 4, 1, 1, N'a11.jpg', 1, CAST(N'2019-11-11T09:41:36.567' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (20, N'Nike Jordan Jumpman Wristbands', N'Essential sweat control, Nike''s Jordan Jumpman Wristbands are one size fits all, with soft stretchy towelling to absorb moisture as the game heats up.', N'Essential sweat control, Nike''s Jordan Jumpman Wristbands are one size fits all, with soft stretchy towelling to absorb moisture as the game heats up.

CONTENTS: 70% COTTON, 19% NYLON, 7% POLYESTER, 4% RUBBER

Embroidered Jumpman logo
Sold in pairs
Machine washable / Easy care
Width: 4.5 in, 11 cm approx.', 20, 1, 11, 1, 1, N'a14.jpg', 1, CAST(N'2019-11-11T09:46:29.943' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (21, N'Wilson Basketball England Solution Official Game Ball - Tan', N'The highest level competition demands the highest quality of craftsmanship. The FIBA-approved Solution Game Ball is no exception.



With a revolutionary aqua-grip composite leather cover, pebbled channel and Cushion Core Technology, this is the ideal choice for the world’s best players — and the ones in the making.



Official Game Ball of Basketball England National League from 2018', N'The highest level competition demands the highest quality of craftsmanship. The FIBA-approved Solution Game Ball is no exception.

With a revolutionary aqua-grip composite leather cover, pebbled channel and Cushion Core Technology, this is the ideal choice for the world’s best players — and the ones in the making.

Official Game Ball of Basketball England National League from 2018

DETAILS
Available in size 7 (Men''s) and 6 (Women''s and Youths'')
Channel Construction - Laid In
Cover Construction - Moisture Absorbing
Playing Surface - Suitable for Indoor use', 60, 1, 32, 1, 1, N'a15.jpg', 0, CAST(N'2019-11-12T01:10:33.900' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (14, N'Nike Basketball Team National Varsity Stock Kit - Dark Navy/White', N'Top quality game kit made with breathable Dri-FIT fabric and a slim cut that''s tailored to reduce bulk during play.', N'LIGHTWEIGHT PERFORMANCE FIT

The Nike National Varsity Stock Men''s Basketball Kit is made with breathable Dri-FIT fabric, an 11" inseam for airflow and range of motion during play in the shorts and a slim cut top that''s tailored to reduce bulk during play.

Top has Dri-FIT mesh back panel for ventilation. It''s slim cut reduces bulk and has a tailored feel for zero distractions on the court. Nike Team Sports jock tag at lower left hem. Swoosh design trademark on right chest.

SIZING GUIDE - Slim / Tailored Fit

Body width: 20.75-inches, body length 30.5-inches (size large). Made of 100% Polyester.

 

BENEFITS

Slimmer cut top for a lightweight feel
Dri-FIT fabric helps keep you dry and comfortable
Flat seams move smoothly against your skin
Taping at back V-neck and armholes for durability and a clean finish
Rubber elastic waistband provides a secure, comfortable fit
PRODUCT DETAILS

11Ã¢Â?Â? inseam based on size medium
Complies with NCAA and NFHS uniform requirements
Fabric: Dri-FIT 100% polyester
Machine wash', 50, 10, 6, 1, 1, N'12_1.jpg', 0, CAST(N'2019-11-11T09:35:05.323' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (18, N'Molten Basketball All Surface GR Series', N'A high quality rubber basketball featuring the distinctive Molten design. Incredibly durable for plenty of outdoor action.', N'A high quality rubber basketball featuring the distinctive Molten design. Incredibly durable for plenty of outdoor action.

- FIBA approved

- New Official 12-PANEL design

- Rubber cover

- Special rubber compound to give great feel and durability

- Deep-pebble surface

- Nylon wound to maintain shape

- Butyl bladder for superior air retention

- Official size and weight

- Available in four different sizes

- Recommended for all surfaces', 35, 1, 32, 1, 1, N'a12.jpg', 1, CAST(N'2019-11-11T09:42:42.227' AS DateTime), 0, 1)
INSERT [dbo].[Product] ([id], [name], [short_description], [description], [price], [sale], [subcateid], [brandid], [status], [image], [isHot], [createdate], [isOutofStock], [isSale]) VALUES (16, N'Nike Dominate 8 Panel Basketball - Size 7', N'Get a grip on the outdoor game that helps you command the court with the Nike Dominate Basketball , featuring easier hand alignment and ball control features.

', N'Get a grip on the outdoor game that helps you command the court with the Nike Dominate Basketball , featuring easier hand alignment and ball control features.

Soft-touch cushioned rubber with aggressive pebbled texture cover
Moulded deep-channel design
Rotational wound butyl carcass
Superior shape retention
ID panel for name, number or team colour
Swoosh design trademark at front
Recommended for outdoor use', 50, 1, 32, 1, 1, N'a10.jpg', 1, CAST(N'2019-11-11T09:40:19.820' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (1, N'10%', 0.10000000149011612)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (2, N'20%', 0.20000000298023224)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (3, N'30%', 0.30000001192092896)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (4, N'40%', 0.40000000596046448)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (7, N'70%', 0.699999988079071)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (5, N'50%', 0.5)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (6, N'60%', 0.60000002384185791)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (8, N'80%', 0.800000011920929)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (9, N'90%', 0.89999997615814209)
INSERT [dbo].[Sale] ([id], [name], [value]) VALUES (10, N'0', 0)
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (1, N'35        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (2, N'36        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (3, N'37        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (4, N'38        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (8, N'42        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (9, N'43        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (10, N'44        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (11, N'45        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (12, N'5         ', 2, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (13, N'6         ', 2, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (14, N'7         ', 2, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (15, N'S         ', 4, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (5, N'39        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (6, N'40        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (7, N'41        ', 1, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (17, N'L         ', 4, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (18, N'XL        ', 4, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (19, N'XXL       ', 4, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (20, N'Other     ', 5, 1)
INSERT [dbo].[Size] ([id], [size], [categoryid], [status]) VALUES (16, N'M         ', 4, 1)
SET IDENTITY_INSERT [dbo].[Size] OFF
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 1, 30)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 3, 50)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 4, 60)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 5, 90)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 6, 100)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 7, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 8, 112)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 9, 113)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 10, 141)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (5, 11, 151)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 4, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 6, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 7, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 8, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 9, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 10, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (11, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (19, 12, 220)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (19, 13, 223)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (19, 14, 123)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (15, 17, 320)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (15, 16, 231)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (15, 15, 112)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (15, 18, 113)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (15, 19, 114)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (17, 12, 123)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (17, 13, 234)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (17, 14, 345)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (20, 20, 212)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (18, 12, 141)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (18, 13, 231)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (18, 14, 234)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (23, 20, 55)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (24, 20, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 4, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 6, 41)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 7, 31)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 8, 50)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 9, 23)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 10, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (6, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 4, 40)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 6, 20)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 7, 17)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 8, 13)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 9, 113)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 10, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (7, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 4, 223)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 5, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 6, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 7, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 8, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 9, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 10, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (8, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 3, 34)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 4, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 5, 221)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 6, 112)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 7, 321)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 8, 322)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 9, 113)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 10, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (9, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (22, 12, 9)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (22, 13, 10)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (22, 14, 10)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 4, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 6, 211)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 7, 212)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 8, 213)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 9, 321)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 10, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (10, 11, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 3, 0)
GO
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 4, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 6, 60)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 7, 80)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 8, 40)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 9, 42)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 10, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (13, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 1, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 2, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 3, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 4, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 5, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 6, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 7, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 8, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 9, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 10, 44)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (12, 11, 0)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (14, 17, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (14, 16, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (14, 15, 90)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (14, 18, 123)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (14, 19, 45)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (16, 12, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (16, 13, 222)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (16, 14, 333)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (21, 12, 10)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (21, 13, 111)
INSERT [dbo].[size_product] ([pid], [sizeid], [quantity]) VALUES (21, 14, 111)
INSERT [dbo].[size_product_raw] ([pid], [sizeid]) VALUES (1, 1)
INSERT [dbo].[size_product_raw] ([pid], [sizeid]) VALUES (2, 1)
INSERT [dbo].[size_product_raw] ([pid], [sizeid]) VALUES (1, 2)
INSERT [dbo].[size_product_raw] ([pid], [sizeid]) VALUES (1, 3)
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (1, N'Indoor', 1, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (2, N'Outdoor', 1, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (3, N'NBA''s Shoe', 1, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (4, N'Rubber', 2, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (5, N'Spalding', 2, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (6, N'NBA''s clothes', 4, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (7, N'Hoodies', 4, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (8, N'Training', 4, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (32, N'Leather', 2, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (9, N'Socks', 5, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (10, N'Basketball Hat', 5, 1)
INSERT [dbo].[SubCategory] ([id], [name], [cateid], [status]) VALUES (11, N'Other', 5, 1)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Table1] ON 

INSERT [dbo].[Table1] ([id], [dob], [name]) VALUES (1, CAST(N'2019-11-08T21:24:36.107' AS DateTime), N'abc       ')
SET IDENTITY_INSERT [dbo].[Table1] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__F3DBC572FE0E2A49]    Script Date: 10/28/2020 1:52:29 AM ******/
ALTER TABLE [dbo].[Customer_raw] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table1] ADD  CONSTRAINT [DF_Table1_dob]  DEFAULT (getdate()) FOR [dob]
GO
USE [master]
GO
ALTER DATABASE [BoroShop] SET  READ_WRITE 
GO
