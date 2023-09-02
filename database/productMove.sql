USE [master]
GO
/****** Object:  Database [ProductMove]    Script Date: 1/9/2023 4:29:07 PM ******/
CREATE DATABASE [ProductMove]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductMove', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProductMove.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductMove_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProductMove_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProductMove] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductMove].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductMove] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductMove] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductMove] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductMove] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductMove] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductMove] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductMove] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductMove] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductMove] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductMove] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductMove] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductMove] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductMove] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductMove] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductMove] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductMove] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductMove] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductMove] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductMove] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductMove] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductMove] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductMove] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductMove] SET RECOVERY FULL 
GO
ALTER DATABASE [ProductMove] SET  MULTI_USER 
GO
ALTER DATABASE [ProductMove] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductMove] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductMove] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductMove] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductMove] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductMove] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProductMove', N'ON'
GO
ALTER DATABASE [ProductMove] SET QUERY_STORE = OFF
GO
USE [ProductMove]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[idBill] [int] NOT NULL,
	[dateOfBill] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[idCustomer] [int] NOT NULL,
	[idSeri] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[idBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[idCategory] [int] NOT NULL,
	[categoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[idCustomer] [int] NOT NULL,
	[customerName] [nvarchar](max) NOT NULL,
	[customerPhone] [nvarchar](max) NOT NULL,
	[customerAddress] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailWarehouse]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailWarehouse](
	[idDetaiWarehouse] [int] NOT NULL,
	[idWarehouse] [int] NOT NULL,
	[productStatus] [nvarchar](max) NOT NULL,
	[totalProduct] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
 CONSTRAINT [PK_DetailWarehouse] PRIMARY KEY CLUSTERED 
(
	[idDetaiWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Export]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export](
	[idExport] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[idWarehouse] [int] NOT NULL,
	[exportDate] [nvarchar](max) NOT NULL,
	[total] [int] NOT NULL,
	[productSeri] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Export] PRIMARY KEY CLUSTERED 
(
	[idExport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[idImport] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[idWarehouse] [int] NOT NULL,
	[importDate] [nvarchar](max) NOT NULL,
	[total] [int] NOT NULL,
	[productSeri] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Import] PRIMARY KEY CLUSTERED 
(
	[idImport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [int] NOT NULL,
	[idCategory] [int] NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[price] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[warrantyPeriod] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[idReport] [int] NOT NULL,
	[typeOfReport] [int] NOT NULL,
	[Time] [nvarchar](max) NOT NULL,
	[idWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[idReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seri]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seri](
	[idSeri] [int] NOT NULL,
	[seriName] [nvarchar](max) NOT NULL,
	[productionTime] [nvarchar](max) NOT NULL,
	[idProduct] [int] NOT NULL,
	[idWarehouse] [int] NULL,
	[productStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Seri] PRIMARY KEY CLUSTERED 
(
	[idSeri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idAccount] [int] NOT NULL,
	[userName] [nvarchar](max) NULL,
	[passWord] [nvarchar](max) NULL,
	[decentralization] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 1/9/2023 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[idWarehouse] [int] NOT NULL,
	[totalProduct] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[idWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Seri] FOREIGN KEY([idSeri])
REFERENCES [dbo].[Seri] ([idSeri])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Seri]
GO
ALTER TABLE [dbo].[DetailWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_DetailWarehouse_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[DetailWarehouse] CHECK CONSTRAINT [FK_DetailWarehouse_Product]
GO
ALTER TABLE [dbo].[DetailWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_DetailWarehouse_Warehouse] FOREIGN KEY([idWarehouse])
REFERENCES [dbo].[Warehouse] ([idWarehouse])
GO
ALTER TABLE [dbo].[DetailWarehouse] CHECK CONSTRAINT [FK_DetailWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD  CONSTRAINT [FK_Export_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Export] CHECK CONSTRAINT [FK_Export_Product]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD  CONSTRAINT [FK_Export_Warehouse] FOREIGN KEY([idWarehouse])
REFERENCES [dbo].[Warehouse] ([idWarehouse])
GO
ALTER TABLE [dbo].[Export] CHECK CONSTRAINT [FK_Export_Warehouse]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([idCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Seri]  WITH CHECK ADD  CONSTRAINT [FK_Seri_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seri] CHECK CONSTRAINT [FK_Seri_Product]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idAccount])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_User]
GO
USE [master]
GO
ALTER DATABASE [ProductMove] SET  READ_WRITE 
GO
