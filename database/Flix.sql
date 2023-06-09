USE master
-- drop database [Flix_Movie]
GO
create database [Flix_Movie]
GO
USE [Flix_Movie]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 4/12/2023 10:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NULL,
	[VideoID] [int] NULL,
	[LikeDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 4/12/2023 10:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NULL,
	[VideoID] [int] NULL,
	[Emails] [nvarchar](50) NOT NULL,
	[ShareDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/12/2023 10:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 4/12/2023 10:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Poster] [nvarchar](200) NOT NULL,
	[Views] [int] NOT NULL,
	[Descriptions] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[Href] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Users] ([ID], [Password], [Fullname], [Email], [Admin]) VALUES (N'dangth', N'123', N'Trần Hữu Đang', N'dang@gmail.com', 0)
INSERT [dbo].[Users] ([ID], [Password], [Fullname], [Email], [Admin]) VALUES (N'dannk', N'123', N'Nguyễn Khánh Đan', N'dan@gmail.com', 0)
INSERT [dbo].[Users] ([ID], [Password], [Fullname], [Email], [Admin]) VALUES (N'sydh', N'123', N'Đoàn Hiệp Sỹ', N'sy@gmail.com', 0)
INSERT [dbo].[Users] ([ID], [Password], [Fullname], [Email], [Admin]) VALUES (N'vilb', N'123', N'Lê Bích Vi', N'lebichvicm2020@gmail.com', 1)
INSERT [dbo].[Users] ([ID], [Password], [Fullname], [Email], [Admin]) VALUES (N'vinhpq', N'123', N'Phùng Quốc Vinh', N'vinh@gmail.com', 0)
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([ID], [Title], [Poster], [Views], [Descriptions], [Active], [Href]) VALUES (1, N'Thám tử lừng danh Conan - Tập 421', N'conan.jpg', 0, N'NỘI DUNG DÀNH CHO KHÁN GIẢ TUỔI THANH THIẾU NIÊN
Thám tử lừng danh Conan xoay quanh câu chuyện về chàng thám tử Kudo Shinichi, trong một lần đang điều tra đã bị Tổ chức Áo Đen ép uống thuốc độc, khiến cho cơ thể bị teo nhỏ. Sau đó, Shinichi chuyển đến sống ở nhà của người bạn thuở niên thiếu Ran Mori cùng người bố Kogoro Mori. Tại đây, cậu dùng văn phòng thám tử của ông Kogoro để truy tìm tung tích của tổ chức Áo Đen đồng thời giúp ông phá nhiều vụ án dưới một thân phận mới là Conan Edogawa.', 1, N'https://www.youtube.com/embed/v2u8l4kbFz4')
INSERT [dbo].[Video] ([ID], [Title], [Poster], [Views], [Descriptions], [Active], [Href]) VALUES (2, N'Doraemon Phần 12 - Tổng hợp Bộ Hoạt Hình Doraemon hay nhất', N'doraemon.jpg', 0, N'Kênh thiếu nhi hàng đầu trên YouTube với các video nhạc thiếu nhi, hoạt hình nổi tiếng, các chương trình giáo dục bổ ích và nhiều nội dung thú vị khác.', 1, N'https://www.youtube.com/embed/QT51UpasLLs')
INSERT [dbo].[Video] ([ID], [Title], [Poster], [Views], [Descriptions], [Active], [Href]) VALUES (3, N'Pokesmon Tập 297 - Huấn Luyện Hạng Bậc Thầy', N'posters-pokemon.jpg', 0, N'Kênh thiếu nhi hàng đầu trên YouTube với các video nhạc thiếu nhi, hoạt hình nổi tiếng, các chương trình giáo dục bổ ích và nhiều nội dung thú vị khác.', 1, N'https://www.youtube.com/embed/EZqDUug0QXM')
INSERT [dbo].[Video] ([ID], [Title], [Poster], [Views], [Descriptions], [Active], [Href]) VALUES (4, N'Tom and Jerry - Giấc ngủ trưa của con mèo', N'Tom-and-Jerry.jpg', 0, N'Kênh thiếu nhi hàng đầu trên YouTube với các video nhạc thiếu nhi, hoạt hình nổi tiếng, các chương trình giáo dục bổ ích và nhiều nội dung thú vị khác.', 1, N'https://www.youtube.com/embed/QT51UpasLLs')
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([VideoID])
REFERENCES [dbo].[Video] ([ID])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([VideoID])
REFERENCES [dbo].[Video] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[STATISTICAL]    Script Date: 4/12/2023 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[STATISTICAL]
AS
BEGIN
	SELECT 
		VD.title,
		COUNT(FV.videoID) AS 'FAVORITE COUNT'
	FROM VIDEO VD
		JOIN FAVORITE FV ON VD.id = FV.videoID
	GROUP BY VD.title
END
GO
/****** Object:  StoredProcedure [dbo].[Statistical_Share]    Script Date: 4/12/2023 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Statistical_Share]
	(@titleVideo NVARCHAR(50))
AS
BEGIN
	SELECT 
		US.id AS 'SENDER NAME',
		US.email AS 'SENDER EMAIL',
		SH.emails AS 'RECEIVER EMAIL',
		SH.shareDate AS 'SEND DATE'
	FROM USERS US 
	JOIN SHARE SH ON SH.userID = US.id
	JOIN VIDEO VD ON VD.id = SH.videoID
	WHERE VD.title =  @titleVideo
	GROUP BY US.id, US.email, SH.emails, SH.shareDate
END
GO
/****** Object:  StoredProcedure [dbo].[Statistical_User]    Script Date: 4/12/2023 10:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Statistical_User] 
	(@titleVideo NVARCHAR(50))
AS
BEGIN
	SELECT 
		US.id AS 'USERNAME',
		US.fullname,
		US.email,
		FV.likeDate AS 'FAVORITE DATE'
	FROM FAVORITE FV 
	JOIN USERS US ON US.id = FV.userID
	JOIN VIDEO VD ON VD.id = FV.videoID
	WHERE VD.title =  @titleVideo
	GROUP BY US.id, US.fullname, US.email, FV.likeDate
END
GO
