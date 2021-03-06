USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 09/17/2018 17:23:26 ******/
CREATE DATABASE [TestDB] ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 6144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TestDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TestDB] SET  READ_WRITE
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL
GO
ALTER DATABASE [TestDB] SET  MULTI_USER
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09/17/2018 17:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (1, N'Monitor', CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (2, N'CPU', CAST(3500 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (3, N'KeyBoard', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (4, N'Mouse', CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (5, N'HeadPhone', CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (6, N'RAM', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (7, N'Mouse', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (8, N'Mouse', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (9, N'Mouse', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (10, N'Hello', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (11, N'Hello', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (13, N'Hello', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (15, N'aaa', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (16, N'aaa', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (17, N'ddd', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice]) VALUES (18, N'ddd', CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  StoredProcedure [dbo].[Usp_UpdateProduct]    Script Date: 09/17/2018 17:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Usp_UpdateProduct]
@ProductId int,
@ProductPrice decimal(18,0)

as 
--select * from products

begin

update products
set ProductPrice=@ProductPrice 
where ProductId=@ProductId

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertProduct]    Script Date: 09/17/2018 17:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Usp_InsertProduct]
@Name varchar(50),
@Price decimal(18,2)

as 
begin

insert into Products values(@Name,@Price)



end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProduct]    Script Date: 09/17/2018 17:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteProduct]
@ProductId int

as 
--select * from products



begin

delete from  Products where ProductId=@ProductId

end
GO
