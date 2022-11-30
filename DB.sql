USE [master]
GO
/****** Object:  Database [VA_STORE]    Script Date: 11/24/2022 3:09:30 PM ******/
CREATE DATABASE [VA_STORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VA_STORE', FILENAME = N'C:\Users\B5M\VA_STORE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VA_STORE_log', FILENAME = N'C:\Users\B5M\VA_STORE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VA_STORE] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VA_STORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VA_STORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VA_STORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VA_STORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VA_STORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VA_STORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [VA_STORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VA_STORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VA_STORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VA_STORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VA_STORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VA_STORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VA_STORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VA_STORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VA_STORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VA_STORE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VA_STORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VA_STORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VA_STORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VA_STORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VA_STORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VA_STORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VA_STORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VA_STORE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VA_STORE] SET  MULTI_USER 
GO
ALTER DATABASE [VA_STORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VA_STORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VA_STORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VA_STORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VA_STORE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VA_STORE] SET QUERY_STORE = OFF
GO
USE [VA_STORE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VA_STORE]
GO
/****** Object:  Table [dbo].[tb_ChiTietHoaDon]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ChiTietHoaDon](
	[SoHD] [int] NOT NULL,
	[IDSanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_tb_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_HoaDon]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HoaDon](
	[SoHD] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[NgayHD] [smalldatetime] NULL,
 CONSTRAINT [PK_tb_HoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_KhachHang]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_KhachHang](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[TenKhach] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Slider]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hinh] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[IDLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[LoaiSP] [nvarchar](50) NULL,
	[DoiTuong] [nvarchar](50) NULL,
	[SP] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[IDLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SanPham]    Script Date: 11/24/2022 3:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SanPham](
	[IDSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[Gia] [int] NULL,
	[TrangThai] [int] NULL,
	[LuotThich] [int] NULL,
	[HinhChinh] [nvarchar](50) NULL,
	[Hinh1] [nvarchar](50) NULL,
	[Hinh2] [nvarchar](50) NULL,
	[Hinh3] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuongTrongKho] [int] NULL,
	[IDLoaiSP] [int] NULL,
 CONSTRAINT [PK_tbl_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Slider] ON 

INSERT [dbo].[tb_Slider] ([ID], [Hinh]) VALUES (1, N'slider1.jpg')
INSERT [dbo].[tb_Slider] ([ID], [Hinh]) VALUES (2, N'slider2.jpg')
INSERT [dbo].[tb_Slider] ([ID], [Hinh]) VALUES (3, N'slider3.jpg')
INSERT [dbo].[tb_Slider] ([ID], [Hinh]) VALUES (4, N'slider4.jpg')
SET IDENTITY_INSERT [dbo].[tb_Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_User] ON 

INSERT [dbo].[tb_User] ([IDUser], [Password], [Email], [LastName], [FirstName]) VALUES (2, N'd0010a6f34908640a4a6da2389772a78', N'admin2808@gmail.com', N'Anh', N'Nguyễn Tuấn')
INSERT [dbo].[tb_User] ([IDUser], [Password], [Email], [LastName], [FirstName]) VALUES (2002, N'd0010a6f34908640a4a6da2389772a78', N'user2808@gmail.com', N'anh', N'tuấn')
INSERT [dbo].[tb_User] ([IDUser], [Password], [Email], [LastName], [FirstName]) VALUES (3002, N'e5642615149e73d17de96c6fa7f38fa1', N'TuanAnh2808@gmail.com', N'Anh', N'Nguyễn Tuấn')
INSERT [dbo].[tb_User] ([IDUser], [Password], [Email], [LastName], [FirstName]) VALUES (3003, N'e5642615149e73d17de96c6fa7f38fa1', N'ThuyVy0110@gmail.com', N'Vy', N'Nguyễn Thị Thúy')
INSERT [dbo].[tb_User] ([IDUser], [Password], [Email], [LastName], [FirstName]) VALUES (6002, N'81dc9bdb52d04dc20036dbd8313ed055', N'lucamlong@gmail.com', N'long', N'lung')
SET IDENTITY_INSERT [dbo].[tb_User] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_SanPham] ON 

INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4002, N'ÁO THUN IN HÌNH', 850000, 0, NULL, N'1.jpg', N'1-1.jpg', N'1-2.jpg', N'1-3.jpg', N'Giới Thiệu:- Áo thun dài tay, độ dài ngang hông  - Cổ tròn, tay áo và gấu bo viền co giãn  - Phía trước áo in hình vẽ  - Mix áo cùng quần jeans hoặc chân váy, phù hợp mặc hằng ngày  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.  Thông tin mẫu:  Chiều cao: 167 cm  Cân nặng: 50 kg  Số đo 3 vòng:83-65-93 cm  Mẫu mặc size MChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4003, N'ÁO THUN IN HỌA TIẾT', 850000, 0, NULL, N'2.jpg', N'2-1.jpg', N'2-2.jpg', N'2-3.jpg', N'Giới thiệu:- Áo cổ tròn, tay dài. Bo gấu ở cổ và tay áo. In họa tiết khác màu mặt trước áo.  - Chất liệu vải thun dày dặn, giữ nhiệt tốt  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.  Thông tin mẫu:  Chiều cao: 168 cm  Cân nặng: 50 kg  Số đo 3 vòng:80-62-95 cm  Mẫu mặc size SChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải.', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4004, N'ÁO THUN CỔ THUYỀN XẾP NHÚM', 750000, 0, NULL, N'3.jpg', N'3-1.jpg', N'3-2.jpg', N'3-3.jpg', N'Giới thiệu:- Áo thun dài tay, độ dài qua mông  - Cổ thuyền cách điệu, thiết kế xếp ly nhúm 1 bên áo  - Chất liệu vải thun gân mềm mại, co giãn nhẹ  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.  Thông tin mẫu:  Chiều cao: 168 cm  Cân nặng: 50 kg  Số đo 3 vòng:80-62-95 cm  Mẫu mặc size SChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4005, N'ÁO THUN POLO CỔ VIỀN', 890000, 0, NULL, N'4.jpg', N'4-1.jpg', N'4-2.jpg', N'4-3.jpg', N'Giới thiệu:- Áo polo dáng suông ôm nhẹ  - Cổ và tay vải khác in viền, phía trước là hàng khuy cài  - Hình trái tim được may đính bên ngực phải  - Chất liệu vải thun mềm mát, thấm hút mồ hôi tốt  - Áo xẻ tà, tà sau dài hơn trước  - Mix cùng nhiều kiểu quần khác nhau, phù hợp mặc hằng ngày  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.  Thông tin mẫu:  Chiều cao: 167 cm  Cân nặng: 50 kg  Số đo 3 vòng:83-65-93 cm  Mẫu mặc size MChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4006, N'ÁO THUN CỔ ĐỔ', 690000, 0, NULL, N'5.jpg', N'5-1.jpg', N'5-2.jpg', N'5-3.jpg', N'Giới thiệu:- Thiết kế áo cổ đổ, tay hến, vai có dây rút tạo kiểu.  - Chất liệu thun thoáng mát, dáng áo ôm gọn gàng.  - Mix cùng nhiều kiểu quần, chân váy khác nhau. Phù hợp diện đi chơi, dạo phố.  Thông tin mẫu:  Chiều cao: 167 cm  Cân nặng: 50 kg  Số đo 3 vòng:83-65-93 cm  Mẫu mặc size MChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4007, N'ÁO THUN HỌA TIẾT NỔI', 680000, 0, NULL, N'6.jpg', N'6-1.jpg', N'6-2.jpg', N'6-3.jpg', N'Giới thiệu:Áo thun cổ tròn, tay ngắn. Dáng áo suông. Thiết kế áo được nhấn nhá với chi tiết nổi, chất liệu thun bền màu giúp điều hòa nhiệt độ cơ thể hiệu quả trong những ngày hè oi ả. Kết hợp item này cùng quần jeans, quần âu, chân zuýp xòe,… diện đi làm hay đi chơi đều phù hợp.  Mẫu mặc size M:  Chiều cao: 1m67  Cân nặng: 50kg  Số đo: 83-65-93cmChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4008, N'ÁO THUN ĐÍNH NGỌC TRAI', 590000, 0, NULL, N'7.jpg', N'7-1.jpg', N'7-2.jpg', N'7-3.jpg', N'Giới thiệu:Áo thun cổ tim, tay ngắn. Dáng áo suông. Thiết kế áo được nhấn nhá với chi tiết hoa đính ngọc trai, chất liệu thun bền màu giúp điều hòa nhiệt độ cơ thể hiệu quả trong những ngày hè oi ả. Kết hợp item này cùng quần jeans, quần âu, chân zuýp xòe,… diện đi làm hay đi chơi đều phù hợp.Chi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4009, N'ÁO THUN DO WHAT MAKE YOU HAPPY', 413000, 0, NULL, N'8.jfif', N'8-1.jfif', N'8-2.jfif', N'8-3.jfif', N'Giới thiệu:Áo thun cơ bản với nền trơn và chữ in màu ở giữa. Áo ngắn tay, cổ tròn, dáng suông.  Lựa chọn một chiếc áo thun basic sẽ khiến phong cách của nàng trở nên năng động và trẻ trung hơn. Thiết kế áo thun với câu nói cổ vũ sẽ giúp vẻ ngoài nàng sáng bừng rực rỡ. Đơn giản phối cùng quần jean là đã hoàn thành ngay một set đồ tiêu chuẩn.  Màu sắc: Trắng - Xanh lá  Mẫu mặc size S:  Chiều cao: 1m69  Cân nặng: 48kg  Số đo: 80-60-90cmChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4010, N'ÁO PHỐI HOA VOAN', 790000, 0, NULL, N'9.jfif', N'9-1.jfif', N'9-2.jfif', N'9-3.jfif', N'Giới thiệu:Áo chất thun, cổ tròn, tay ngắn, dáng suông. Trên vai được phối cùng phụ kiện đính kết từ voan và ngọc trai.  Đây là một mẫu áo thun tràn đầy vẻ dịu dàng và nữ tính dành cho những cô nàng mùa hè của IVY. Dáng áo trơn suông rất dễ để mix-match trong nhiều set đồ khác nhau. Áo có độ dài lửng nên nàng sơ vin hay thả dáng cũng đều xinh. Trên vai áo được đính kết phụ kiện từ voan và ngọc trai giúp tôn lên khí chất sang trọng, dịu dàng.  Màu sắc: Trắng - Đen  Mẫu mặc size S:  Chiều cao: 1m69  Cân nặng: 48kg  Số đo: 80-60-90cmChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4011, N'ÁO CROPTOP BO CHUN GẤU', 750000, 0, NULL, N'10.jfif', N'10-1.jfif', N'10-2.jfif', N'10-3.jfif', N'Giới thiệu :Áo croptop cổ tròn bằng chun co giãn, tay cánh dơi gấu lật. Gấu chần chun đều co giãn, bo phía dưới. Mặt trước in hàng chữ khác màu tạo điểm hút.  Kiểu dáng độc lạ cho 1 chiếc áo thun. Chất liệu thun cao cấp nhẹ, mềm, thấm hút mồ hôi, siêu co dãn...Mix cùng quần Jean, chân váy, zuýp dài...bạn sẽ có những set đồ thời trang, cá tính, lịch sự.  Màu sắc: Cam Đậm - Trắng  Mẫu mặc size S:  Chiều cao: 1m70 Cân nặng: 47kg Số đo 3 vòng: 78-60-90Chi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4012, N'ÁO THUN DÀI TAY SHINE', 495000, 0, NULL, N'11.jfif', N'11-1.jfif', N'11-2.jfif', N'11-3.jfif', N'Giới thiệu:Áo thun cổ tròn, tay dài. Bo gấu ở cổ và tay áo. In hình và chữ bắt sáng mặt trước. Chất thun có độ dày vừa phải, mềm mịn thoải mái cho làn da.  Dễ dàng mix đồ với quần dài, zuýp bò...để có ngay set đồ ưng ý đi chơi, hẹn hò, đi làm mà vẫn cá tính.  Màu sắc: Đen - Hồng  Mẫu mặc size S:  Chiều cao: 1m70 Cân nặng: 47kg Số đo 3 vòng: 78-60-90Chi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4013, N'ÁO THUN TAY PHỐI LƯỚI', 690000, 0, NULL, N'12.jfif', N'12-1.jfif', N'12-2.jfif', N'12-3.jfif', N'Giới thiệu:Áo thun cổ tròn, tay lỡ phối lưới tay bồng. Dáng áo xuông. Cài bằng khuy giọt lệ phía sau.  Chất liệu thun có sợi co giãn tạo cảm giác thoải mái cho người mặc. Thiết kế áo kiểu dáng đơn giản dễ dàng cho bạn kết hợp nhiều trang phục khác nhau như quần sooc, quần jean...  Màu sắc: Đen - Trắng  Mẫu mặc size S:  Chiều cao: 1m66 Cân nặng: 48kg Số đo 3 vòng: 78-61-88Chi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4014, N'ÁO HOODIE CỔ MŨ', 425000, 0, NULL, N'13.jfif', N'13-1.jfif', N'13-2.jfif', N'13-3.jfif', N'Giới thiệu:Áo thun cổ mũ có dây kéo rút. Tay dài ống rộng. Trang trí hình môi nhiều màu sắc phía trước.  Item không thể thiếu trong tủ đồ, áo hoodie cao cấp có kiểu dáng suông, dài tay phù hợp với nhiều vóc dáng. Mũ áo có kèm theo dây rút điều chỉnh tùy theo ý muốn  Chất liệu thun cao cấp, co dãn với 96,5% cotton tạo cảm giác thoải mái vận động, dễ chịu. Dễ dàng mix đồ với quần dài, zuýp bò...để có ngay set đồ ưng ý đi chơi, hẹn hò, đi làm mà vẫn cá tính.  Màu sắc: Đen - Đỏ - NudeChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 0)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (4016, N'ÁO THUN IN HÌNH', 455000, 0, NULL, N'14.jfif', N'14-1.jfif', N'14-2.jfif', N'14-3.jfif', N'Giới thiệu:Áo thun tay ngắn độ dài vừa phải mang phong cách trẻ trung năng động.  Họa tiết được in trên áo sẽ giúp chàng nổi bật giữa đám đông. Là sản phẩm phù hợp cho những buổi đi chơi hay hoạt động thể thao.  Màu sắc: Xanh Lá   Mẫu mặc size L:  Chiều cao: 1m77 Cân nặng: 68kg Số đo 3 vòng: 94-86-98 cmChi tiết bảo quản sản phẩm :   * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.  * Vải voan , lụa , chiffon nên giặt bằng tay.  * Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.  * Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.  * Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.   * Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.  * Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  * Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.  * Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.  * Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ', 1000, 8)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (6002, N'A JOYFUL SET', 848000, 0, NULL, N'20.jpg', N'20-1.jpg', N'20-2.jpg', N'20-3.jpg', N'Set đồ bé gái gồm áo khoác hoddie và quần legging. Áo khoác 1 lớp bé gái dáng hoddie cổ có mũ, dáng suông, tay và gấu áo may bo ống. Áo cài bằng khóa kéo nhựa YKK cao cấp, cùng màu, không chỉ đẹp mà mang lại sự bền bỉ cho chiếc áo. Hình in họa tiết sử dụng công nghệ in hiện đại, sắc hét, không bị bong. Quần legging co giãn, cạp chun thoải mái, kiểu dáng ôm sát giữ ấm tốt cho bé.  Sử dụng chất liệu vải thun mềm mịn, giữ ấm tốt, màu sắc tươi sáng. Mẹ đắn đo không biết phối đồ mặc cho bé? Hãy chọn ngay A Joyful Set là bé yêu đã có một outfit đi chơi và đi học vừa xinh vừa ấm!  Thông tin mẫu:  Chiều cao: 128 cm  Cân nặng: 28 kg  Mẫu mặc size 8-9  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.', 1000, 13)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (7002, N'ÁO HODDIE IN HỌA TIẾT LƯNG', 590000, 0, NULL, N'100.jpg', N'100-1.jpg', N'100-2.jpg', N'100-3.jpg', N'- Áo hoddie dáng rộng, cổ tay áo và gấu được may bo, mũ áo có dây rút  - Mặt lưng sau in hình họa tiết  - Chất liệu vải thun dày dặn, giữ nhiệt tốt  Lưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.  Thông tin mẫu:  Chiều cao: 128 cm  Cân nặng: 28 kg  Mẫu mặc size 8-9', 1000, 15)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (8002, N'nham ngọ', 1, 0, NULL, N'12.jpg', N'20-2.jpg', N'5.jpg', N'11.jpg', N'xinh', 100, 8)
INSERT [dbo].[tbl_SanPham] ([IDSanPham], [TenSanPham], [Gia], [TrangThai], [LuotThich], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [MoTa], [SoLuongTrongKho], [IDLoaiSP]) VALUES (8003, N'bé Thúy', 43, 0, NULL, NULL, NULL, NULL, NULL, N'rất xinh', 23, 9)
SET IDENTITY_INSERT [dbo].[tbl_SanPham] OFF
GO
ALTER TABLE [dbo].[tbl_SanPham] ADD  CONSTRAINT [DF_tbl_SanPham_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[tbl_SanPham] ADD  CONSTRAINT [DF_tbl_SanPham_LuotThich]  DEFAULT ((0)) FOR [LuotThich]
GO
USE [master]
GO
ALTER DATABASE [VA_STORE] SET  READ_WRITE 
GO
