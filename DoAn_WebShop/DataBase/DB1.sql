USE [master]
GO
/****** Object:  Database [QLBH_DoAn]    Script Date: 6/17/2017 1:02:09 PM ******/
CREATE DATABASE [QLBH_DoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH_DoAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH_DoAn.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_DoAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH_DoAn_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH_DoAn] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH_DoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH_DoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH_DoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH_DoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH_DoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH_DoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH_DoAn] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH_DoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH_DoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH_DoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH_DoAn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBH_DoAn] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLBH_DoAn]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/17/2017 1:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [nvarchar](10) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 6/17/2017 1:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [nvarchar](10) NOT NULL,
	[TenNhaSanXuat] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[San_Pham]    Script Date: 6/17/2017 1:02:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[San_Pham](
	[MaSP] [nvarchar](10) NOT NULL,
	[MaLoaiSP] [nvarchar](10) NULL,
	[MaNhaSanXuat] [nvarchar](10) NULL,
	[TenSP] [nvarchar](max) NULL,
	[CauHinh] [text] NULL,
	[HinhChinh] [nvarchar](50) NULL,
	[Hinh1] [nvarchar](50) NULL,
	[Hinh2] [nvarchar](50) NULL,
	[Hinh3] [nvarchar](50) NULL,
	[Hinh4] [nvarchar](50) NULL,
	[Gia] [int] NULL CONSTRAINT [DF_San_Pham_Gia]  DEFAULT ((0)),
	[SoLuongDaBan] [int] NULL CONSTRAINT [DF_San_Pham_SoLuongDaBan]  DEFAULT ((0)),
	[LuotView] [int] NULL CONSTRAINT [DF_San_Pham_LuotView]  DEFAULT ((0)),
	[TinhTrang] [nchar](10) NULL CONSTRAINT [DF_San_Pham_TinhTrang]  DEFAULT ((0)),
 CONSTRAINT [PK_San_Pham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP01', N'Cao Cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP02', N'Trung Bình')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP03', N'Phổ Thông')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'          ', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX01     ', N'Iphone')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX02     ', N'SamSung')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX03     ', N'Oppo')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP01', N'LSP01', N'NSX01', N'Iphone 7', N'Chua Xac Dinh', N'1.png', NULL, NULL, NULL, NULL, 24000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP02', N'LSP01', N'NSX01', N'Iphone 6', N'Chua Xac Dinh', N'2.png', NULL, NULL, NULL, NULL, 20000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP03', N'LSP02', N'NSX01', N'Iphone 5', N'Chua Xac Dinh', N'3.png', NULL, NULL, NULL, NULL, 14000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP04', N'LSP03', N'NSX01', N'Iphone 4', N'Chua Xac Dinh', N'4.png', NULL, NULL, NULL, NULL, 4000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP05', N'LSP01', N'NSX02', N'SamSung1', N'Chua Xac Dinh', N'5.png', NULL, NULL, NULL, NULL, 10000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP06', N'LSP03', N'NSX02', N'SamSung2', N'Chua Xac Dinh', N'6.png', NULL, NULL, NULL, NULL, 19000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP07', N'LSP02', N'NSX02', N'SamSung3', N'Chua Xac Dinh', N'7.png', NULL, NULL, NULL, NULL, 7000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP08', N'LSP03', N'NSX02', N'SamSung4', N'Chua Xac Dinh', N'8.png', NULL, NULL, NULL, NULL, 13000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP09', N'LSP01', N'NSX03', N'Oppo1', N'Chua Xac Dinh', N'9.png', NULL, NULL, NULL, NULL, 7000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP10', N'LSP02', N'NSX03', N'Oppo2', N'Chua Xac Dinh', N'10.png', NULL, NULL, NULL, NULL, 4000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP11', N'LSP01', N'NSX03', N'Oppo3', N'Chua Xac Dinh', N'11.png', NULL, NULL, NULL, NULL, 9000000, 0, 0, N'0         ')
INSERT [dbo].[San_Pham] ([MaSP], [MaLoaiSP], [MaNhaSanXuat], [TenSP], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP12', N'LSP02', N'NSX03', N'Oppo4', N'Chua Xac Dinh', N'12.png', NULL, NULL, NULL, NULL, 11000000, 0, 0, N'0         ')
ALTER TABLE [dbo].[San_Pham]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[San_Pham] CHECK CONSTRAINT [FK_San_Pham_LoaiSanPham]
GO
ALTER TABLE [dbo].[San_Pham]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_NhaSanXuat] FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([MaNhaSanXuat])
GO
ALTER TABLE [dbo].[San_Pham] CHECK CONSTRAINT [FK_San_Pham_NhaSanXuat]
GO
USE [master]
GO
ALTER DATABASE [QLBH_DoAn] SET  READ_WRITE 
GO
