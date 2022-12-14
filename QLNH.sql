USE [master]
GO
/****** Object:  Database [QLNH]    Script Date: 08/11/2015 01:56:52 ******/
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'QLNH')
BEGIN
CREATE DATABASE [QLNH] 
GO
ALTER DATABASE [QLNH] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLNH] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLNH] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLNH] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLNH] SET ARITHABORT OFF
GO
ALTER DATABASE [QLNH] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QLNH] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLNH] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLNH] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLNH] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLNH] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLNH] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLNH] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLNH] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLNH] SET  READ_WRITE
GO
ALTER DATABASE [QLNH] SET RECOVERY FULL
GO
ALTER DATABASE [QLNH] SET  MULTI_USER
GO
if ( ((@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 760)) or 
		(@@microsoftversion / power(2, 24) >= 9) )begin 
	exec dbo.sp_dboption @dbname =  N'QLNH', @optname = 'db chaining', @optvalue = 'OFF'
 end
GO
USE [QLNH]
GO
/****** Object:  ForeignKey [FK_TAIKHOAN_KHACHHANG]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TAIKHOAN_KHACHHANG]') AND type = 'F')
ALTER TABLE [dbo].[TAIKHOAN] DROP CONSTRAINT [FK_TAIKHOAN_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_TAIKHOAN_LOAITAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TAIKHOAN_LOAITAIKHOAN]') AND type = 'F')
ALTER TABLE [dbo].[TAIKHOAN] DROP CONSTRAINT [FK_TAIKHOAN_LOAITAIKHOAN]
GO
/****** Object:  ForeignKey [FK_GIAODICH_TAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GIAODICH_TAIKHOAN]') AND type = 'F')
ALTER TABLE [dbo].[GIAODICH] DROP CONSTRAINT [FK_GIAODICH_TAIKHOAN]
GO
/****** Object:  StoredProcedure [dbo].[USP_CAU10]    Script Date: 08/11/2015 01:56:56 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_CAU10]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[USP_CAU10]
GO
/****** Object:  StoredProcedure [dbo].[USP_CAU3]    Script Date: 08/11/2015 01:56:56 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_CAU3]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[USP_CAU3]
GO
/****** Object:  StoredProcedure [dbo].[USP_CAU4]    Script Date: 08/11/2015 01:56:56 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_CAU4]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[USP_CAU4]
GO
/****** Object:  StoredProcedure [dbo].[USP_CAU1]    Script Date: 08/11/2015 01:56:56 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_CAU1]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[USP_CAU1]
GO
/****** Object:  Table [dbo].[GIAODICH]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GIAODICH_TAIKHOAN]') AND type = 'F')
ALTER TABLE [dbo].[GIAODICH] DROP CONSTRAINT [FK_GIAODICH_TAIKHOAN]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GIAODICH]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[GIAODICH]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TAIKHOAN_KHACHHANG]') AND type = 'F')
ALTER TABLE [dbo].[TAIKHOAN] DROP CONSTRAINT [FK_TAIKHOAN_KHACHHANG]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TAIKHOAN_LOAITAIKHOAN]') AND type = 'F')
ALTER TABLE [dbo].[TAIKHOAN] DROP CONSTRAINT [FK_TAIKHOAN_LOAITAIKHOAN]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TAIKHOAN]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[TAIKHOAN]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[KHACHHANG]
GO
/****** Object:  Table [dbo].[LOAITAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LOAITAIKHOAN]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LOAITAIKHOAN]
GO
/****** Object:  Table [dbo].[LOAITAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LOAITAIKHOAN]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LOAITAIKHOAN](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_LOAITAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[LOAITAIKHOAN] ([MaLoai], [TenLoai]) VALUES (1, N'Có kỳ hạn')
INSERT [dbo].[LOAITAIKHOAN] ([MaLoai], [TenLoai]) VALUES (2, N'Không kỳ hạn')
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 08/11/2015 01:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [char](20) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[CMND] [char](9) NULL,
	[DiaChi] [nvarchar](40) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi]) VALUES (CONVERT(TEXT, N'CID100001           '), N'Nguyễn Thành Trung', CAST(0x000079CF00000000 AS DateTime), CONVERT(TEXT, N'240112111'), N'Hồ Chí Minh')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi]) VALUES (CONVERT(TEXT, N'CID100002           '), N'Trần Thị Trà Hương', CAST(0x00007B6100000000 AS DateTime), CONVERT(TEXT, N'241000222'), N'Cà Mau')
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 08/11/2015 01:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TAIKHOAN]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [char](12) NOT NULL,
	[NgayLap] [datetime] NULL,
	[SoDu] [int] NULL,
	[LoaiTK] [int] NULL,
	[MaKH] [char](20) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TAIKHOAN] ([MaTK], [NgayLap], [SoDu], [LoaiTK], [MaKH], [TinhTrang]) VALUES (CONVERT(TEXT, N'190020110001'), CAST(0x0000A16500000000 AS DateTime), 45000, 1, CONVERT(TEXT, N'CID100002           '), NULL)
INSERT [dbo].[TAIKHOAN] ([MaTK], [NgayLap], [SoDu], [LoaiTK], [MaKH], [TinhTrang]) VALUES (CONVERT(TEXT, N'190020110002'), CAST(0x0000A16500000000 AS DateTime), 45000, 1, CONVERT(TEXT, N'CID100002           '), NULL)
INSERT [dbo].[TAIKHOAN] ([MaTK], [NgayLap], [SoDu], [LoaiTK], [MaKH], [TinhTrang]) VALUES (CONVERT(TEXT, N'190020110003'), CAST(0x0000A1BE00000000 AS DateTime), 30000, 2, CONVERT(TEXT, N'CID100001           '), NULL)
/****** Object:  Table [dbo].[GIAODICH]    Script Date: 08/11/2015 01:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GIAODICH]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GIAODICH](
	[MaGD] [int] NOT NULL,
	[MaTK] [char](12) NULL,
	[SoTien] [int] NULL,
	[ThoiGianGD] [datetime] NULL,
	[GhiChu] [char](40) NULL,
 CONSTRAINT [PK_GIAODICH] PRIMARY KEY CLUSTERED 
(
	[MaGD] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (2, CONVERT(TEXT, N'190020110002'), 45000, CAST(0x0000A16500C5C100 AS DateTime), CONVERT(TEXT, N'                                        '))
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (3, CONVERT(TEXT, N'190020110003'), 30000, CAST(0x0000A16501391C40 AS DateTime), CONVERT(TEXT, N'                                        '))
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (4, CONVERT(TEXT, N'190020110003'), 20000, CAST(0x0000A16500D63BC0 AS DateTime), CONVERT(TEXT, N'                                        '))
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (5, CONVERT(TEXT, N'190020110003'), -2000, CAST(0x0000A16800735B40 AS DateTime), CONVERT(TEXT, N'                                        '))
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (6, CONVERT(TEXT, N'190020110002'), -5000, CAST(0x0000A16A009450C0 AS DateTime), CONVERT(TEXT, N'                                        '))
INSERT [dbo].[GIAODICH] ([MaGD], [MaTK], [SoTien], [ThoiGianGD], [GhiChu]) VALUES (7, CONVERT(TEXT, N'190020110002'), 15000, CAST(0x0000A16F00F73140 AS DateTime), CONVERT(TEXT, N'                                        '))
