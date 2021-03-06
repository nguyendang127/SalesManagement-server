USE [master]
GO
/****** Object:  Database [SalesManagement]    Script Date: 4/16/2022 11:54:46 AM ******/
CREATE DATABASE [SalesManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SalesManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalesManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SalesManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SalesManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalesManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SalesManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SalesManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalesManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SalesManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SalesManagement] SET QUERY_STORE = OFF
GO
USE [SalesManagement]
GO
/****** Object:  User [nguyendang127]    Script Date: 4/16/2022 11:54:47 AM ******/
CREATE USER [nguyendang127] FOR LOGIN [nguyendang127] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [nguyendang127]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_name] [nchar](10) NULL,
	[product_id] [int] NOT NULL,
	[category_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_client] [nvarchar](50) NOT NULL,
	[invoice_date] [date] NULL,
	[invoice_is_paid] [bit] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[invoice_id] [int] NULL,
	[order_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](200) NOT NULL,
	[product_image] [image] NULL,
	[product_quantity] [int] NOT NULL,
	[product_price] [bigint] NOT NULL,
	[store_id] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [nvarchar](50) NOT NULL,
	[store_address] [nvarchar](200) NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_username] [nvarchar](20) NOT NULL,
	[user_password] [nvarchar](20) NOT NULL,
	[user_phone] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Invoices] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Invoices]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Stores]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_Users]
GO
/****** Object:  StoredProcedure [dbo].[UserStore]    Script Date: 4/16/2022 11:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserStore] @user_id int
AS
SELECT store_id, 
	store_name,
	store_address
FROM Stores
WHERE user_id = @user_id
ORDER BY store_id;
GO
USE [master]
GO
ALTER DATABASE [SalesManagement] SET  READ_WRITE 
GO
