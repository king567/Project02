USE [FDB02]
GO
/****** Object:  Table [dbo].[BlacklistReasons]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlacklistReasons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_BlacklistReasons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blacklists]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blacklists](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[BlacklistReasonId] [int] NOT NULL,
	[BlacklistTime] [datetime] NOT NULL,
	[NextRestorationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Blacklists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Creditcards]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Creditcards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CardNumber] [nchar](16) NOT NULL,
	[ThreeNumber] [nchar](3) NOT NULL,
	[ExpireDate] [nvarchar](7) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_PayMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](100) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteMedias]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteMedias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[MediaInformId] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteMedias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestBooks]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestBooks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](254) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Message] [nvarchar](3000) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_GuestBooks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageCodes]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISOCode] [nvarchar](10) NULL,
	[LanguageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_LanguageCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaInfos]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Title] [nvarchar](150) NULL,
	[OverView] [nvarchar](max) NULL,
	[Adult] [bit] NULL,
	[OriginalLanguageId] [int] NULL,
	[OriginalTitle] [nvarchar](255) NULL,
	[BackdropPath] [nvarchar](255) NULL,
	[PosterPath] [nvarchar](50) NULL,
 CONSTRAINT [PK_MediaInfos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaInfos_Genres_Rel]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaInfos_Genres_Rel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaInfoId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_VideoGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaInfos_OttTypes_Rel]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaInfos_OttTypes_Rel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaInfoId] [int] NOT NULL,
	[OttTypeId] [int] NOT NULL,
	[Release_Date] [datetime] NOT NULL,
	[Removal_Date] [datetime] NULL,
 CONSTRAINT [PK_VideoOttTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BirthOfDate] [datetime] NOT NULL,
	[Email] [nvarchar](254) NOT NULL,
	[VipStartdate] [datetime] NULL,
	[VipEnddate] [datetime] NULL,
	[BlacklistEnddate] [datetime] NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmedCode] [nvarchar](50) NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Publishdate] [date] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OttTypes]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OttTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_OttTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayTypes]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](30) NOT NULL,
	[Fee] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_PayTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaInfoId] [int] NOT NULL,
	[MemberId] [int] NULL,
	[Comment] [nvarchar](500) NULL,
	[Rate] [int] NULL,
	[CreatedTime] [datetime] NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vipitems]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vipitems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[PayTypeId] [int] NOT NULL,
	[CreditcardId] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Vips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BlacklistReasons] ON 

INSERT [dbo].[BlacklistReasons] ([Id], [Reason], [DisplayOrder]) VALUES (3, N'色情或煽情露骨的留言', 10)
INSERT [dbo].[BlacklistReasons] ([Id], [Reason], [DisplayOrder]) VALUES (4, N'騷擾或霸凌內容', 10)
INSERT [dbo].[BlacklistReasons] ([Id], [Reason], [DisplayOrder]) VALUES (5, N'仇恨言論或血腥暴力的內容', 20)
INSERT [dbo].[BlacklistReasons] ([Id], [Reason], [DisplayOrder]) VALUES (7, N'不請自來的廣告', 30)
INSERT [dbo].[BlacklistReasons] ([Id], [Reason], [DisplayOrder]) VALUES (11, N'垃圾留言', 30)
SET IDENTITY_INSERT [dbo].[BlacklistReasons] OFF
GO
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (5, NULL, 7, CAST(N'2023-10-04T00:00:00.000' AS DateTime), CAST(N'2023-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (17, 2, 4, CAST(N'2023-09-23T00:00:00.000' AS DateTime), CAST(N'2023-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (18, 1, 11, CAST(N'2023-08-14T00:00:00.000' AS DateTime), CAST(N'2023-10-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (19, 1, 5, CAST(N'2023-08-14T13:22:57.007' AS DateTime), CAST(N'2023-10-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (20, 3, 11, CAST(N'2023-08-17T18:33:55.000' AS DateTime), CAST(N'2023-10-17T18:33:55.000' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (30, NULL, 7, CAST(N'2023-09-28T09:16:16.757' AS DateTime), CAST(N'2023-11-28T09:16:16.757' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (34, NULL, 7, CAST(N'2023-09-25T15:02:47.297' AS DateTime), CAST(N'2023-11-25T15:02:47.297' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (41, NULL, 4, CAST(N'2023-09-25T15:12:45.313' AS DateTime), CAST(N'2023-11-25T15:12:45.313' AS DateTime))
INSERT [dbo].[Blacklists] ([Id], [UserId], [BlacklistReasonId], [BlacklistTime], [NextRestorationTime]) VALUES (49, NULL, 5, CAST(N'2023-09-25T20:34:38.000' AS DateTime), CAST(N'2023-11-25T20:34:38.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'電視')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'電影')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'動畫')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Creditcards] ON 

INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (1, 2, N'1111111122222222', N'123', N'2028/03', N'郭', N'米妮')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (2, 2, N'3333333344444444', N'456', N'2025/01', N'郭', N'米妮')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (3, 48, N'1234567891080987', N'789', N'2027/11', N'郭', N'艾倫')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (12, 2, N'1111111111122232', N'456', N'2027/10', N'郭', N'米妮')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (13, 17, N'1212121212121212', N'456', N'2023/11', N'陳', N'宸瑜')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (14, 18, N'1718191019181910', N'456', N'2029/10', N'王', N'鳳羽')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (15, 2, N'1234555555555555', N'456', N'2029/10', N'郭', N'米妮')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (16, 17, N'1111111111111111', N'123', N'2029/10', N'陳', N'宸瑜')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (17, 3, N'1111111111111111', N'123', N'2029/10', N'趙', N'彼得')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (18, 3, N'1111111111111111', N'123', N'2027/12', N'趙', N'彼得')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (19, 7, N'123456789009765 ', N'456', N'2023/12', N'林', N'曉晴')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (20, 6, N'1234566666543212', N'456', N'2028/11', N'胡', N'丰逸')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (23, 18, N'1111111111111111', N'456', N'2029/10', N'王', N'凰羽')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (24, 17, N'1111111111111111', N'456', N'2028/11', N'陳', N'宸瑜')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (25, 7, N'111111111111111 ', N'222', N'2029/11', N'王', N'曉晴')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (26, 22, N'2222222222222222', N'123', N'2025/11', N'陳', N'香茹')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (27, 12, N'12222122122121  ', N'234', N'2025/04', N'林', N'浩成')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (28, 20, N'1223457887654322', N'887', N'2026/04', N'高', N'雨婷')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (29, 26, N'6473890987636257', N'123', N'2028/09', N'謝', N'婧琪')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (30, 26, N'6473890987636257', N'123', N'2028/09', N'謝', N'靖琪')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (31, 58, N'253647688905948 ', N'456', N'2027/05', N'陳', N'意雲')
INSERT [dbo].[Creditcards] ([Id], [MemberId], [CardNumber], [ThreeNumber], [ExpireDate], [FirstName], [LastName]) VALUES (34, 20, N'123444444444444 ', N'456', N'2023/10', N'22', N'2')
SET IDENTITY_INSERT [dbo].[Creditcards] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (1, N'如果忘記密碼怎麼辦？', N'可在登入畫面下方點選忘記密碼,填寫資料後會寄Email至信箱,即可重設密碼', 1, 30, NULL)
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (2, N'如何擁有VIP服務？', N'若您想成為付費會員,可在登入後的會員中心,點選立即升級,並選取您想要的方案進行購買', 1, 40, NULL)
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (3, N'為甚麼登入後無法留言?', N'可以進入會員中心頁,查看是否有停權', 1, 20, NULL)
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteMedias] ON 

INSERT [dbo].[FavoriteMedias] ([Id], [MemberId], [MediaInformId]) VALUES (2, 34, 26)
INSERT [dbo].[FavoriteMedias] ([Id], [MemberId], [MediaInformId]) VALUES (3, 48, 26)
SET IDENTITY_INSERT [dbo].[FavoriteMedias] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (12, N'冒險')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (14, N'幻想')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (16, N'動畫')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (18, N'戲劇')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (27, N'恐怖')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (28, N'動作')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (35, N'喜劇')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (36, N'歷史')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (37, N'西方')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (53, N'驚悚')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (80, N'犯罪')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (99, N'紀錄')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (878, N'科幻小說')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (9648, N'神秘')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10402, N'音樂')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10749, N'浪漫')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10751, N'家庭')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10752, N'戰爭')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10770, N'電視電影')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageCodes] ON 

INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (1, N'af-ZA', N'南非荷蘭語 - 南非')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (2, N'sq-AL', N'阿爾巴尼亞人 - 阿爾巴尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (3, N'ar-DZ', N'阿拉伯語 - 阿爾及利亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (4, N'ar-BH', N'阿拉伯語 - 巴林')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (5, N'ar-EG', N'阿拉伯語 - 埃及')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (6, N'ar-IQ', N'阿拉伯語 - 伊拉克')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (7, N'ar-JO', N'阿拉伯語 - 約旦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (8, N'ar-KW', N'阿拉伯語 - 科威特')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (9, N'ar-LB', N'阿拉伯語 - 黎巴嫩')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (10, N'ar-LY', N'阿拉伯語 - 利比亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (11, N'ar-MA', N'阿拉伯語 - 摩洛哥')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (12, N'ar-OM', N'阿拉伯語 - 阿曼')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (13, N'ar-QA', N'阿拉伯語 - 卡塔爾')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (14, N'ar-SA', N'阿拉伯語 - 沙特阿拉伯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (15, N'ar-SY', N'阿拉伯語 - 敘利亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (16, N'ar-TN', N'阿拉伯語 - 突尼斯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (17, N'ar-AE', N'阿拉伯語 - 阿拉伯聯合酋長國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (18, N'ar-YE', N'阿拉伯語 - 也門')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (19, N'hy-AM', N'亞美尼亞 - 亞美尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (20, N'Cy-az-AZ', N'阿塞拜疆（西里爾） - 阿塞拜疆')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (21, N'Lt-az-AZ', N'阿塞拜疆（拉丁） - 阿塞拜疆')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (22, N'eu-ES', N'巴斯克語 - 巴斯克語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (23, N'be-BY', N'白俄羅斯 - 白俄羅斯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (24, N'bg-BG', N'保加利亞 - 保加利亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (25, N'ca-ES', N'加泰羅尼亞語 - 加泰羅尼語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (26, N'zh-CN', N'中文 - 中國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (27, N'zh-HK', N'中文 - 香港特別行政區')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (28, N'zh-MO', N'中文 - 澳門特別行政區')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (29, N'zh-SG', N'中文 - 新加坡')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (30, N'zh-TW', N'中文 - 台灣')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (31, N'zh-CHS', N'簡體中文）')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (32, N'zh-CHT', N'繁體中文）')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (33, N'hr-HR', N'克羅地亞 - 克羅地亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (34, N'cs-CZ', N'捷克 - 捷克共和國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (35, N'da-DK', N'丹麥語 - 丹麥語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (36, N'div-MV', N'Dhivehi - 馬爾地夫')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (37, N'nl-BE', N'荷蘭 - 比利時')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (38, N'nl-NL', N'荷蘭 - 荷蘭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (39, N'en-AU', N'英文 - 澳大利亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (40, N'en-BZ', N'英語 - 伯利茲')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (41, N'en-CA', N'英文 - 加拿大')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (42, N'en-CB', N'英語 - 加勒比')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (43, N'en-IE', N'英語 - 愛爾蘭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (44, N'en-JM', N'英語 - 牙買加')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (45, N'en-NZ', N'英語 - 新西蘭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (46, N'en-PH', N'英語 - 菲律賓')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (47, N'en-ZA', N'英文 - 南非')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (48, N'en-TT', N'英文 - 特立尼達和多巴哥')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (49, N'en-GB', N'英文 - 英國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (50, N'en-US', N'美國英語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (51, N'en-ZW', N'英語 - 津巴布韋')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (52, N'et-EE', N'愛沙尼亞語 - 愛沙尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (53, N'fo-FO', N'法羅群島 - 法羅群島')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (54, N'fa-IR', N'波斯 - 伊朗')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (55, N'fi-FI', N'芬蘭 - 芬蘭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (56, N'fr-BE', N'法語 - 比利時')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (57, N'fr-CA', N'法語 - 加拿大')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (58, N'fr-FR', N'法國 - 法國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (59, N'fr-LU', N'法語 - 盧森堡')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (60, N'fr-MC', N'法語 - 摩納哥')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (61, N'fr-CH', N'法語 - 瑞士')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (62, N'gl-ES', N'加利西亞人 - 加利西亞人')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (63, N'ka-GE', N'格魯吉亞 - 格魯吉亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (64, N'de-AT', N'德國 - 奧地利')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (65, N'de-DE', N'德國 - 德國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (66, N'de-LI', N'德語 - 列支敦士登')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (67, N'de-LU', N'德國 - 盧森堡')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (68, N'de-CH', N'德國 - 瑞士')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (69, N'el-GR', N'希臘 - 希臘')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (70, N'gu-IN', N'古吉拉特文 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (71, N'he-IL', N'希伯來語 - 以色列')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (72, N'hi-IN', N'印地文 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (73, N'hu-HU', N'匈牙利 - 匈牙利')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (74, N'is-IS', N'冰島 - 冰島')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (75, N'id-ID', N'印尼 - 印尼')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (76, N'it-IT', N'意大利 - 意大利')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (77, N'it-CH', N'意大利語 - 瑞士')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (78, N'ja-JP', N'日文 - 日本')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (79, N'kn-IN', N'卡納達 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (80, N'kk-KZ', N'哈薩克斯坦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (81, N'kok-IN', N'康卡尼 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (82, N'ko-KR', N'韓國 - 韓國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (83, N'ky-KZ', N'吉爾吉斯斯坦 - 哈薩克斯坦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (84, N'lv-LV', N'拉脫維亞 - 拉脫維亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (85, N'lt-LT', N'立陶宛立陶宛')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (86, N'mk-MK', N'馬其頓（FYROM）')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (87, N'ms-BN', N'馬來文 - 文萊')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (88, N'ms-MY', N'馬來文 - 馬來西亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (89, N'mr-IN', N'馬拉地 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (90, N'mn-MN', N'蒙古 - 蒙古')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (91, N'nb-NO', N'挪威語（Bokmål） - 挪威')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (92, N'nn-NO', N'挪威（尼諾斯克） - 挪威')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (93, N'pl-PL', N'波蘭語 - 波蘭語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (94, N'pt-BR', N'葡萄牙語 - 巴西')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (95, N'pt-PT', N'葡萄牙 - 葡萄牙')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (96, N'pa-IN', N'旁遮普邦 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (97, N'ro-RO', N'羅馬尼亞語 - 羅馬尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (98, N'ru-RU', N'俄羅斯 - 俄羅斯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (99, N'sa-IN', N'梵文 - 印度')
GO
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (100, N'Cy-sr-SP', N'塞爾維亞語（塞爾維亞語） - 塞爾維亞語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (101, N'Lt-sr-SP', N'塞爾維亞（拉丁） - 塞爾維亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (102, N'sk-SK', N'斯洛伐克語 - 斯洛伐克')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (103, N'sl-SI', N'斯洛文尼亞語 - 斯洛維尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (104, N'es-AR', N'西班牙語 - 阿根廷')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (105, N'es-BO', N'西班牙語 - 玻利維亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (106, N'es-CL', N'西班牙語 - 智利')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (107, N'es-CO', N'西班牙 - 哥倫比亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (108, N'es-CR', N'西班牙語 - 哥斯達黎加')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (109, N'es-DO', N'西班牙語 - 多米尼加共和國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (110, N'es-EC', N'西班牙語 - 厄瓜多爾')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (111, N'es-SV', N'西班牙語 - 薩爾瓦多')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (112, N'es-GT', N'西班牙語 - 危地馬拉')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (113, N'es-HN', N'西班牙語 - 洪都拉斯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (114, N'es-MX', N'西班牙語 - 墨西哥')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (115, N'es-NI', N'西班牙語 - 尼加拉瓜')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (116, N'es-PA', N'西班牙語 - 巴拿馬')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (117, N'es-PY', N'西班牙語 - 巴拉圭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (118, N'es-PE', N'西班牙語 - 秘魯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (119, N'es-PR', N'西班牙語 - 波多黎各')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (120, N'es-ES', N'西班牙語 - 西班牙')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (121, N'es-UY', N'西班牙語 - 烏拉圭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (122, N'es-VE', N'西班牙語 - 委內瑞拉')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (123, N'sw-KE', N'斯瓦希里語 - 肯尼亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (124, N'sv-FI', N'瑞典語 - 芬蘭語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (125, N'sv-SE', N'瑞典語 - 瑞典語')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (126, N'syr-SY', N'敘利亞 - 敘利亞')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (127, N'ta-IN', N'泰米爾語 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (128, N'tt-RU', N'韃靼 - 俄羅斯')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (129, N'te-IN', N'泰盧固語 - 印度')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (130, N'th-TH', N'泰國 - 泰國')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (131, N'tr-TR', N'土耳其 - 土耳其')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (132, N'uk-UA', N'烏克蘭 - 烏克蘭')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (133, N'ur-PK', N'烏爾都語 - 巴基斯坦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (134, N'Cy-uz-UZ', N'烏茲別克語（西里爾文） - 烏茲別克斯坦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (135, N'Lt-uz-UZ', N'烏茲別克語（拉丁語） - 烏茲別克斯坦')
INSERT [dbo].[LanguageCodes] ([Id], [ISOCode], [LanguageName]) VALUES (136, N'vi-VN', N'越南 - 越南')
SET IDENTITY_INSERT [dbo].[LanguageCodes] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaInfos] ON 

INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (19, 2, N'變形金剛：萬獸崛起', N'再度以精彩刺激的動作場面及氣勢磅薄的宏偉奇觀捕捉全球影迷的想像力，《變形金剛：萬獸崛起》一片將帶領觀眾回到1990年代，跟著博派變形金剛展開一場橫跨全世界的冒險旅程，並且介紹一個全新品種的變形金剛－強大金剛－加入博派變形金剛與狂派變形金剛之間在地球上的大戰。', 1, 1, N'Transformers: Rise of the Beasts', N'/Images/Backdrop/oxrt1mop.iok.jpg', N'/Images/Poster/d5zefnqx.lds.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (20, 2, N'閃電俠', N'在《閃電俠》中，貝瑞使用超能力回到過去，想要改變已發生的事件，卻衝擊了時空秩序。當貝瑞試圖拯救家人時，不小心改變了未來，使他受困於另一個時空中；在這個時空中，回歸的薩德將軍正威脅著毀滅世界，但卻沒有超級英雄可以求助，除非貝瑞能說服一位退休的蝙蝠俠重現江湖，解救一位被監禁的氪星人……儘管他可能找錯了人。到頭來，貝瑞為了拯救他所在的世界，返回他所知的未來，唯一的希望就是用盡生命賽跑，但他最後做出的犧牲足以拯救整個宇宙嗎？', 1, 2, N'The Flash', N'/Images/Backdrop/avl3shki.pam.jpg', N'/Images/Poster/13pyon5x.hac.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (21, 2, N'Barbie芭比', N'芭比（瑪格羅比 飾演）在一個完美的地方過著完美的人生，會舉辦超級盛大的派對，有華麗音樂及排舞，每天都過著很棒的日子。但有一天怪事開始發生在芭比身上，她的洗澡水不熱，會從屋頂跌落，甚至發現她的腳跟竟然貼地了，變成扁平足。之後她決定與肯尼（萊恩葛斯林 飾演）進入真實世界，去探索事情的真相，並且引發一連串的意外事件。', 0, 2, N'Barbie', N'/Images/Backdrop/szet14it.ygl.jpg', N'/Images/Poster/plobbnm4.bdk.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (22, 2, N'鬼打牆', N'男孩彼得（伍迪諾曼 飾）為臥室牆壁裡不斷發出的神祕敲打聲感到困擾，但他的爸爸馬克（安東尼史塔 飾）和媽媽卡蘿（麗茲凱普蘭 飾）都堅稱那只是他的想像，父母的反應讓彼得開始懷疑他們是否有什麼不可告人的祕密……。

', 1, 1, N'Cobweb', N'/Images/Backdrop/1xqgchgr.nip.jpg', N'/Images/Poster/fnvegtfk.htb.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (23, 1, N'法網遊龍', N'每一集影集內容不乏根據真實案件和時事頭條新聞改編的事件內容。每集都由警方偵查開啟序幕，庭上偵訊作結收場。

', 1, 1, N'Law & Order', N'/Images/Backdrop/dp3qwcc5.lxh.jpg', N'/Images/Poster/4wru2xfp.gv2.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (24, 1, N'戀愛島 美國版', N'American version of the British dating reality competition in which ten singles come to stay in a villa for a few weeks and have to couple up with one another. Over the course of those weeks, they face the public vote and might be eliminated from the show. Other islanders join and try to break up the couples.

', 1, 1, N'Love Island', N'/Images/Backdrop/1hddf0nc.g4s.jpg', N'/Images/Poster/a3x00ghj.skz.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (25, 3, N'辛普森家庭', N'辛普森一家是居住在美國「心臟地帶」類型的小鎮內糊的一個典型家庭。家中的父親荷馬擔任著內糊核電站的安全檢查員——這個職位與他粗心、弄臣式的個性顯得很不相稱。他的妻子瑪姬·辛普森，是一位典型的美國式主婦和母親。他們有著三個孩子：十歲的大兒子巴特是一個麻煩製造者；八歲早熟的女兒麗莎是一位積極行動主義者；小女兒麥姬是一個幾乎不會說話，只能用吸橡皮奶嘴進行交流的嬰兒。這家人養有一條名叫勇哥的狗，以及一隻名叫雪球二世的貓。兩隻寵物都曾在幾集動畫中充當中心角色。儘管度過了許多次節日或生日這樣的年度重要事件，辛普森一家人都沒有因為真實歲月的流逝而逐漸老去，其面貌與他們在1980年代末露面時並無二樣。

《辛普森家庭》有許多怪僻的次要角色：同事、老師、親朋好友、地方名人。格朗寧起初只是打算讓這些角色出現一次，讓他們充當笑料製造者，或用來填補小鎮需要的一些功能。不過，大部分的這些角色後來都被保留了下來，其形象也得到擴充，甚至不少角色在後來還成為了幾集動畫的中心人物。', 1, 2, N'The Simpsons', N'/Images/Backdrop/vm5lijmc.qtr.jpg', N'/Images/Poster/yb4vu1tl.oif.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (26, 1, N'無照律師', N'Mike Ross，一位誤入歧途的大學輟學生，為了給重病中的祖母提供更好的看護服務挺而走險。偶然遇見了知名律師事務所的王牌律師Harvey Specter。Harvey從這個年輕人身上看到了自己的影子。所以儘管Mike沒有法學學歷及律師執照，Harvey仍決定冒險雇用Mike為自己的助理律師。在這個工作壓力極大，競爭極為激烈的事務所中，要如何守住Mike的秘密？兩個處境截然不同，卻又性情相投的人之間又會擦出怎樣的火花呢？

', 0, 3, N'Suits', N'/Images/Backdrop/2hdmj2pt.jsd.jpg', N'/Images/Poster/gwewttll.i0n.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (27, 2, N'超級瑪利歐兄弟電影版', N'任天堂暨照明娛樂共同出品一部改編自最受歡迎電玩遊戲《超級瑪利歐兄弟》的全新動畫片《超級瑪利歐兄弟電影版》。 《超級瑪利歐兄弟電影版》一片的導演是亞倫霍瓦斯和麥可傑勒尼克（卡通影集《少年悍將GO！》、《電影少年悍將GO！》），編劇是馬修福格（《樂高玩電影2》、《小小兵2：格魯的崛起》），配音演員包括克里斯普瑞特（瑪利歐）、安雅泰勒喬伊（碧姬公主）、查理戴（路易吉）、傑克布萊克（庫巴）、基根麥可奇（奇諾比奧）、塞斯羅根（咚奇剛）、佛萊德阿米森（庫朗奇剛）、凱文麥可理查森（卡美克）以及賽巴斯汀曼尼斯葛爾柯（布拉奇）。

這部動畫片的製片是照明娛樂創辦人和執行長克里斯梅勒丹德利以及任天堂的「瑪利歐之父」宮本茂。這部動畫片將由環球影業與任天堂共同出資製作，並由環球影業全球發行。', 0, 4, N'The Super Mario Bros. Movie', N'/Images/Backdrop/mipm1j2j.le2.jpg', N'/Images/Poster/wxx4j1u5.t1u.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (28, 2, N'攻心諜戰', N'《攻心諜戰》講述的是瑞秋·史東（蓋兒·加朵飾）是一名情報特工，替強大的全球維和組織工作。眼見組織即將失去最珍貴但也最危險的資產，一切只能靠她一人之力力挽狂瀾。頂尖探員帕克（傑米·道南飾）帶領的軍情六處小組個個都是菁英，唯有瑞秋·史東（蓋兒·加朵 飾）看似初出茅廬加入軍情六處，但萬萬沒想到她其實私下效力於名為「憲章」的祕密維和組織，這個組織運用先進科技化解全球危機，但其他間諜都不知曉其存在。瑞秋在受訓後成為全能型前線探員，她的能力專業優異，使命必達、數據至上，且完全不相信任何人。某次她如常出勤，神祕駭客凱雅·達萬（艾莉雅· 巴特飾）卻來攪局，瑞秋的雙重身分就此交織碰撞，她必須及時保護憲章組織，以一己之力逆轉將局。不過在這一陣拉扯之中，就算身手了得又如何？人性或許才是她最寶貴的資產。', 1, 50, N'Heart of Stone', N'/Images/Backdrop/zy0dyx1k.iix.jpg', N'/Images/Poster/rsiozjoe.lhn.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (29, 3, N'南方四賤客', N'該劇主要講述發生在四個住在科羅拉多州中一個虛擬小鎮南方公園的男孩屎蛋、凱子、阿ㄆㄧㄚˇ和阿尼身邊的故事。四位孩童滿嘴髒話，這部諷刺情境喜劇透過他們的視角看世界，以歡樂的方式，惡搞時下潮流、名人和政治人物。

', 0, 50, N'South Park', N'/Images/Backdrop/sbyfmvne.iey.jpg', N'/Images/Poster/isvmscrf.a4y.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (49, 2, N'巨齒鯊2：海溝深淵', N'潛入未知水域，帶著大膽的研究團隊，潛到海底最深處進行探勘。然而，這趟探勘很快就陷入混亂；一場惡意的採礦作業威脅到他們的任務，迫使他們捲入一場高風險的生存之戰。為了要對抗龐大的巨齒鯊及無情的環境掠奪者，英雄們必須靠智取、智勝，甚至要游得比恐怖掠食者更快，才能贏得這場與時間的賽跑！', 1, 50, N'Meg 2: The Trench', N'/Images/Backdrop/4gzzcdzm.hla.jpg', N'/Images/Poster/25kncbxx.hgp.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (50, 1, N'良醫墨非', N'患有自閉症和學者候群的年輕外科醫生尚恩墨菲，從安靜的鄉村生活，遷居留駐著名聖文德醫院外科部門。獨行俠尚恩無法與周遭的人接觸交流，他唯一的支持者艾倫葛拉斯曼醫生挑戰院董事會和內職員的疑慮和偏見，帶領尚恩加入醫療團隊。', 1, 50, N'The Good Doctor', N'/Images/Backdrop/zoyivwbd.u31.jpg', N'/Images/Poster/0twz2exr.roi.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (51, 2, N'爆復', N'高階銀行經理麥特（連恩尼遜 飾）開車送小孩上學時接到一通未知來電，對方威脅他不可以任意下車，否則汽車上的炸彈將會爆炸……。

', 0, 18, N'Retribution', N'/Images/Backdrop/jrlbgke3.f4u.jpg', N'/Images/Poster/h21apfqd.hes.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (52, 2, N'兩小無猜', N'以主人翁凱文·阿諾回憶他在1968年至1973年期間度過的少年時代（12～17歲，由弗瑞德·薩維奇飾演）回憶為故事主軸，並以成年的凱文旁白（丹尼爾·史登）負責串場，且正好是設定成本片在美國首播期間（1988年-1993年）的20年前。各季故事中融合了以當時凱文年齡觀點而言的典型社會時事（如越戰、總統選舉），與印象深刻的事件（如考試、升學、畢業）。每集的主線包括凱文跟鄰家女孩溫妮的甜蜜戀情、與家人間的溫暖插曲、朋友間的苦澀體驗等，並搭配成年凱文帶有懷舊與嘲諷語調的旁白。本片整體上是個以典型美國少年都曾有過的生活體驗為題材，與少年歷經各種經驗長大成人的故事。', 0, 50, N'The Wonder Years', N'/Images/Backdrop/5v3ko40j.zs5.jpg', N'/Images/Poster/e5ijtgj0.iz5.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (54, 1, N'神仙家庭', N'60 年代賣座魔幻喜劇電視影集，伊麗莎白孟哥馬利飾演的莎曼珊是位具有超能力的魔法仙女，為了愛情她化身為平凡人與她所心愛的丈夫組成了家庭。但天真善良的莎曼珊，卻私底下動動鼻子並運用魔力幫助家人及朋友解決問題，一連串的麻煩與趣事，就此發生', 1, 17, N'Bewitched', N'/Images/Backdrop/zshilizc.1tx.jpg', N'/Images/Poster/sctp22d3.p5t.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (55, 2, N'元素方城市', N'《元素方城市》設於一座聚集空氣、水、火、土四大基本元素「民眾」共存居住的城市，敘述一名脾氣火熱的「火女」與一位隨遇而安的「水男」雖已身為元素，卻反而仍得探索內心更加基本的「元素」：原本水火不容的他們的彼此共通之處。這部再度發揮皮克斯動畫工作室異想天開創意的作品，仍具備表現人類情感與連結的靈魂核心，也充滿不可或缺的爆笑與感人情節，即將再度擄獲影迷觀眾的心！', 0, 50, N'Elemental', N'/Images/Backdrop/ctxgncet.jdx.jpg', N'/Images/Poster/bvygidzv.k5d.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (56, 1, N'鬼修女II', N'故事發生在1956年的法國，一名牧師慘遭謀殺，某種邪惡正在散播，艾琳修女將再次與鬼修女瓦拉克展開正面對決。', 1, 18, N'The Nun II', N'/Images/Backdrop/vrvdw2i2.ktu.jpg', N'/Images/Poster/5al5i1ba.qfs.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (57, 2, N'卡爾有約', N'這回卡爾爺爺即將前往一個浪漫約會，盼望能夠展開第二春，愛犬小逗則幫他使勁全力，希望如願贏得心儀對象的芳心，未料越幫越忙，小逗教的確是狗狗的約會秘訣，過程十分可愛又笑料百出，絕對能再度擄獲所有觀眾的心。', 1, 50, N'Carl''s Date', N'/Images/Backdrop/y1vgkzwz.bad.jpg', N'/Images/Poster/baqlwgis.ght.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (58, 2, N'蜘蛛人：穿越新宇宙', N'邁爾斯摩拉斯將再度回歸獲得奧斯卡金像獎的《蜘蛛人：新宇宙》的續集篇章，這次這位紐約布魯克林的全職社區英雄，將與女蜘蛛人關史黛西聯手穿梭多元宇宙，展開一段史詩般的冒險。但是當他發現其他蜘蛛人對於自身存在的執著，而且在面對威脅意見紛紛時，傷痕累累的邁爾斯必須找到自己作為一位超級英雄的定位，並且拯救他所愛的人。', 0, 50, N'Spider-Man: Across the Spider-Verse', N'/Images/Backdrop/z0x1j3cv.glb.jpg', N'/Images/Poster/av25my2y.pnd.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (59, 2, N'After Everything', N'Besieged by writer’s block and the crushing breakup with Tessa, Hardin travels to Portugal in search of a woman he wronged in the past – and to find himself. Hoping to win back Tessa, he realizes he needs to change his ways before he can make the ultimate commitment.', 0, 50, N'After Everything', N'/Images/Backdrop/chrsrfq3.ghz.jpg', N'/Images/Poster/chzmx2ck.txe.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (60, 2, N'復仇狗聯盟', N'大家都說狗狗是人類最好的朋友，但是如果有個狗主人是個大混蛋呢？如果是這樣，復仇狗聯盟就該集結了。 雷吉（威爾法洛 配音）是一隻天真無邪、樂觀活潑的邊境㹴犬，儘管牠被牠的渣男主人道格（喜劇影集《最後一個男人》、金獎名片《內布拉斯加》威爾佛提 飾演）丟棄在大城市的殘酷街頭，雷吉卻仍然相信牠最愛的主人絕對不會故意棄養牠。 但是當雷吉遇到一隻老是老愛飆髒話，講起話來像連珠炮一樣快的波士頓㹴犬蟲仔（金獎影帝傑米福克斯 配音），一隻熱愛自由的流浪狗，而且相信只有遜咖才需要狗主人，雷吉這才終於發現牠的狗主人道格一直以來都在虐待牠，而且道格是一個沒心沒肺的人渣。 為了向這種狼心狗肺的狗主人展開復仇，雷吉、蟲仔和蟲仔的麻吉們－瑪姬（《出神入化》、《婚禮終結者》艾拉費雪 配音），一隻冰雪聰明的澳洲牧羊犬，然而牠的主人卻因為又認養了一隻小狗狗冷落牠；以及韓特（《可能還愛你》、《水行俠》朴藍道 配音），一隻患有焦慮症的大丹犬，因為自己是一隻治療犬老是覺得壓力超大－牠們組成復仇狗聯盟，然後腦力激盪，想出一個超完美的復仇計畫，並且展開一場史詩般的冒險旅程，幫助雷吉找到回家的路，而且最後還要讓道格付出慘痛代價。', 1, 50, N'Strays', N'/Images/Backdrop/d0vu4wjp.gq4.jpg', N'/Images/Poster/rqghi2ag.pd3.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (61, 2, N'印第安納瓊斯：命運輪盤', N'《印第安納瓊斯：命運輪盤》劇情敘述考古冒險家瓊斯博士即將退休，他正準備迎接他平穩安定的生活，他的教女海倫娜卻找到一件在二戰期間被發現的古代遺物，這個古文明產物足以摧毀現今的和平，於是印第安納被迫再度騎上馬，展開他人生最後一次冒險。該片是由《賽道狂人》、《羅根》導演詹姆士曼格執導，電影網羅了不少國家的實力派演員，包括《追殺夏娃》英國女星菲比沃勒布里奇、《奇異博士》的丹麥男星邁茲米克森、西班牙著名演員安東尼奧班德拉斯以及德國的湯瑪斯柯瑞奇曼。', 0, 50, N'Indiana Jones and the Dial of Destiny', N'/Images/Backdrop/oxjrwpw3.pmj.jpg', N'/Images/Poster/qtg0zl0z.d41.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (62, 2, N'捍衛任務4', N'約翰維克（基努李維 飾）經歷上集的事件後，繼續與驅逐他的殺手組織「高桌會」展開對抗，隨著懸賞金額的不斷飆升，約翰維克將迎來他殺手生涯最強大的對手', 1, 50, N'John Wick: Chapter 4', N'/Images/Backdrop/albbefqx.wbi.jpg', N'/Images/Poster/rfldsz0f.uzk.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (63, 2, N'奧本海默', N'克里斯多夫諾蘭自編自導的《奧本海默》是一部用IMAX攝影機拍攝的史詩驚悚片，觀眾將看到一個謎一般的男人是如何陷入一個自相矛盾的困境，他為了拯救這個世界，必須先毀滅它。', 1, 50, N'Oppenheimer', N'/Images/Backdrop/bwxkcxfm.fl5.jpg', N'/Images/Poster/3u0xqj4e.tq5.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (64, 2, N'藍甲蟲', N'敘述海梅雷耶斯剛從大學畢業回到家鄉，對未來滿懷抱負，但卻發現他的家已經跟以前不一樣了。他開始尋找自己在這個世界上的目標，此時命運來敲門，海梅意外尋獲一個外星生物科技的古遺物—聖甲蟲。這隻聖甲蟲忽然選擇海梅成為其共生宿主，使海梅獲得一套神奇的盔甲，並被賦予出乎意料的超能力。這永遠改變海梅的命運，從此變成超級英雄藍甲蟲', 0, 50, N'Blue Beetle', N'/Images/Backdrop/5o4lhhgt.1oh.jpg', N'/Images/Poster/zdsjweq2.ull.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (65, 2, N'暗夜異劫', N'才華洋溢的年輕女子布琳受到自己社區居民的排擠，雖然孤單一人，但還好她在從小長大的家裡得到了慰藉，直到有一天，來自外星的入侵者製造了詭異聲響，吵醒了布琳，布琳和外星生物就此展開了動魄驚心的對決，她必須對抗威脅到她未來的外星生物，並同時被迫正視自己的過去。', 0, 50, N'No One Will Save You', N'/Images/Backdrop/lyvq30ru.3fe.jpg', N'/Images/Poster/qpauqogd.4uz.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (66, 1, N'亞蘇卡', N'《亞蘇卡》影集的背景為帝國垮台之後，前絕地武士亞蘇卡譚諾展開調查，因為危弱的銀河即將面臨新的威脅。', 0, 50, N'Ahsoka', N'/Images/Backdrop/q1fr4fg1.4d0.jpg', N'/Images/Poster/4fo04zd1.snd.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (72, 1, N'時光之輪', N'一名古怪卻擁有強大能力的女子來到村落，聲稱五個年輕村民中有一人是古老預言中的孩子，能夠永遠改變光明與黑暗之間的平衡，這番話永遠改變了他們的人生。闇帝即將掙脫牢獄的枷鎖，最後的戰役就要到來，世界的命運危在旦夕，這五個人必須選擇是否要相信這個陌生人，以及要不要相信彼此。', 0, 50, N'The Wheel of Time', N'/Images/Backdrop/2izlqbwj.sx2.jpg', N'/Images/Poster/4kv0zmqc.hvm.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (73, 2, N'實習醫生', N'《實習醫生》（英語：Grey''s Anatomy）是一部以醫學為主題，在美國十分受歡迎的黃金時段影集。曾多次獲得艾美獎，第一季在2005年3月27日（美國地區）於美國廣播公司首播，故事主要圍繞在由艾蓮·朋佩歐飾演的梅若迪絲·葛蕾（Meredith Grey），她是華盛頓州西雅圖恩典醫院的外科實習醫生。本劇同時也有許多其他人物參與，但梅若迪絲·葛蕾是最主要的角色，同時幾乎在每一集的開頭和結尾擔任旁白的工作。目前已開播至第十七季，成為盤踞美國電視熱門時段最久的醫療劇集。

本劇的原文標題「Grey''s Anatomy」除了意指女主角的名字之外，同時也與一本知名的解剖學教科書名《格雷氏解剖學》（英語：Henry Gray''s Anatomy of the Human Body）近似。', 0, 50, N'Grey''s Anatomy', N'/Images/Backdrop/u3ddtsad.4ub.jpg', N'/Images/Poster/0eityhvi.t0m.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (74, 2, N'坎達哈行動', N'中情局幹員湯姆（傑瑞德巴特勒 飾）在一項臥底行動曝光後，遭到阿富汗的精銳部隊和外國間諜的追捕和獵殺。深陷敵區的湯姆必須趕在時限內，和他的翻譯殺出一條血路，前往位於坎達哈的撤離地點。', 1, 50, N'Kandahar', N'/Images/Backdrop/tnz2i1nv.ste.jpg', N'/Images/Poster/4fivyrao.c12.jpg')
INSERT [dbo].[MediaInfos] ([Id], [CategoryId], [Title], [OverView], [Adult], [OriginalLanguageId], [OriginalTitle], [BackdropPath], [PosterPath]) VALUES (75, 2, N'戰王征途', N'為人正直的英勇王子慘遭流放多年，為了阻止魔王對他的妻子下毒手，上山下海展開豪壯的冒險旅程。', 0, 75, N'आदिपुरुष', N'/Images/Backdrop/mmztv5zs.wcp.jpg', N'/Images/Poster/kzdejhb2.va0.jpg')
SET IDENTITY_INSERT [dbo].[MediaInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaInfos_Genres_Rel] ON 

INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (336, 73, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (343, 20, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (344, 20, 10751)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (345, 20, 10752)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (346, 21, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (347, 21, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (348, 21, 10402)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (349, 22, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (350, 22, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (351, 22, 10751)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (352, 23, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (353, 23, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (354, 23, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (355, 24, 99)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (356, 24, 9648)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (357, 24, 10770)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (358, 19, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (359, 19, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (360, 26, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (361, 26, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (362, 26, 10770)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (363, 25, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (364, 25, 878)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (365, 27, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (366, 27, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (367, 28, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (368, 28, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (369, 28, 35)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (370, 28, 9648)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (371, 28, 10749)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (372, 29, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (373, 29, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (374, 29, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (375, 49, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (376, 49, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (377, 49, 53)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (378, 49, 9648)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (379, 50, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (380, 51, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (381, 51, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (382, 51, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (383, 52, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (384, 52, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (385, 54, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (386, 54, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (387, 55, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (388, 55, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (389, 56, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (390, 56, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (391, 57, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (392, 57, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (393, 57, 35)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (394, 58, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (395, 58, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (396, 58, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (397, 59, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (398, 59, 10749)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (399, 60, 16)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (400, 60, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (401, 61, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (402, 61, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (403, 62, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (404, 62, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (405, 62, 53)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (406, 63, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (407, 63, 36)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (408, 63, 10752)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (409, 64, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (410, 64, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (411, 65, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (412, 65, 27)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (413, 65, 9648)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (414, 66, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (415, 66, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (416, 72, 18)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (417, 74, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (418, 74, 28)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (419, 75, 12)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (420, 75, 14)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (421, 75, 9648)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (422, 75, 10402)
INSERT [dbo].[MediaInfos_Genres_Rel] ([Id], [MediaInfoId], [GenreId]) VALUES (423, 75, 10749)
SET IDENTITY_INSERT [dbo].[MediaInfos_Genres_Rel] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaInfos_OttTypes_Rel] ON 

INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (147, 73, 3, CAST(N'2023-10-07T00:00:00.000' AS DateTime), CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (154, 20, 1, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (155, 20, 5, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (156, 21, 2, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (157, 21, 5, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (158, 22, 2, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (159, 22, 4, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (160, 23, 6, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (161, 24, 1, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (162, 24, 3, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (163, 19, 2, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (164, 19, 3, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (165, 26, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (166, 26, 4, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (167, 26, 6, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (168, 26, 7, CAST(N'2023-09-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (169, 25, 1, CAST(N'2011-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (170, 25, 5, CAST(N'2023-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (171, 27, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (172, 28, 1, CAST(N'2023-06-14T00:00:00.000' AS DateTime), CAST(N'2023-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (173, 29, 3, CAST(N'2023-09-15T00:00:00.000' AS DateTime), CAST(N'2023-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (174, 49, 1, CAST(N'2023-09-21T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (175, 50, 5, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (176, 50, 6, CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (177, 51, 3, CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (178, 52, 11, CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (179, 54, 2, CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (180, 55, 3, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (181, 56, 3, CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (182, 57, 2, CAST(N'2023-09-08T00:00:00.000' AS DateTime), CAST(N'2023-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (183, 58, 6, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (184, 59, 11, CAST(N'2023-09-13T00:00:00.000' AS DateTime), CAST(N'2023-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (185, 60, 3, CAST(N'2023-09-06T00:00:00.000' AS DateTime), CAST(N'2023-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (186, 61, 5, CAST(N'2023-09-26T00:00:00.000' AS DateTime), CAST(N'2026-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (187, 62, 1, CAST(N'2021-01-27T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (188, 62, 11, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(N'2024-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (189, 63, 4, CAST(N'2023-09-30T00:00:00.000' AS DateTime), CAST(N'2023-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (190, 64, 1, CAST(N'2023-08-17T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (191, 65, 3, CAST(N'2023-09-22T00:00:00.000' AS DateTime), CAST(N'2024-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (192, 66, 3, CAST(N'2023-04-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (193, 72, 4, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2024-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (194, 74, 11, CAST(N'2023-10-11T00:00:00.000' AS DateTime), CAST(N'2024-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[MediaInfos_OttTypes_Rel] ([Id], [MediaInfoId], [OttTypeId], [Release_Date], [Removal_Date]) VALUES (195, 75, 4, CAST(N'2023-10-10T00:00:00.000' AS DateTime), CAST(N'2023-12-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaInfos_OttTypes_Rel] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (2, N'mini', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'米妮', CAST(N'1987-01-05T00:00:00.000' AS DateTime), N'mini@gmail.com', CAST(N'2023-09-15T00:00:00.000' AS DateTime), CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2023-08-08T13:45:10.307' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (3, N'peter', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'彼得', CAST(N'1976-03-06T00:00:00.000' AS DateTime), N'peter@gmail.com', CAST(N'2023-10-02T00:00:00.000' AS DateTime), CAST(N'2023-11-02T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2023-08-08T13:46:38.860' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (5, N'mikkel', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'思翰', CAST(N'1975-12-19T22:39:58.000' AS DateTime), N'mohern0@360.cn', NULL, NULL, CAST(N'2023-12-04T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2020-01-07T10:42:34.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (6, N'vinny', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'丰逸', CAST(N'1994-06-10T12:13:41.000' AS DateTime), N'vbrookson1@indiatimes.com', CAST(N'2023-10-02T22:42:38.670' AS DateTime), CAST(N'2023-11-02T22:42:38.670' AS DateTime), NULL, NULL, NULL, CAST(N'2021-03-01T20:44:11.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (7, N'ulla', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'曉晴', CAST(N'2003-04-10T16:30:38.000' AS DateTime), N'uboodle2@mozilla.org', CAST(N'2023-10-03T09:25:17.203' AS DateTime), CAST(N'2023-11-03T09:25:17.203' AS DateTime), NULL, NULL, NULL, CAST(N'2021-02-25T16:36:32.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (8, N'georgie', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'欣妍', CAST(N'2008-08-30T02:03:08.000' AS DateTime), N'ggrzegorek3@wp.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-17T05:12:04.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (9, N'jacob', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'依娜', CAST(N'1998-10-19T09:02:01.000' AS DateTime), N'jgibling4@virginia.edu', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-25T12:40:52.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (10, N'janene', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'羽彤', CAST(N'1992-10-12T17:01:06.000' AS DateTime), N'jbuffy5@mail.ru', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-01-21T14:35:42.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (11, N'garek', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'一烽', CAST(N'1973-01-03T13:29:17.000' AS DateTime), N'gbabber6@tmall.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-06-06T17:16:43.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (12, N'alika', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'浩成', CAST(N'2006-02-16T22:01:29.000' AS DateTime), N'aleyton7@biglobe.ne.jp', CAST(N'2023-09-24T00:00:00.000' AS DateTime), CAST(N'2023-10-23T17:47:47.543' AS DateTime), NULL, NULL, NULL, CAST(N'2020-06-24T00:03:02.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (13, N'audrie', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'丰逸', CAST(N'1973-07-08T16:29:07.000' AS DateTime), N'amacpaden8@huffingtonpost.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-06T02:20:22.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (14, N'caldwell', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'博菘', CAST(N'2005-07-21T13:32:39.000' AS DateTime), N'cgalle9@hibu.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-09T08:12:00.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (15, N'kirstyn', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'清凌', CAST(N'2010-12-02T17:01:01.000' AS DateTime), N'klongbonea@typepad.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-17T20:15:41.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (16, N'harlan', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'墨含', CAST(N'1999-07-17T17:49:50.000' AS DateTime), N'hkleiserb@hc360.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-04-19T05:16:56.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (17, N'clark', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'宸瑜', CAST(N'2006-04-18T05:59:45.000' AS DateTime), N'chadgkissc@indiegogo.com', CAST(N'2023-10-03T09:15:02.097' AS DateTime), CAST(N'2024-01-03T09:15:02.097' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-17T18:27:24.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (18, N'rina', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'凰羽', CAST(N'2007-04-10T07:35:25.000' AS DateTime), N'rthorndaled@dion.ne.jp', CAST(N'2023-10-03T09:15:02.097' AS DateTime), CAST(N'2023-11-03T09:15:02.097' AS DateTime), CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-28T18:36:34.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (19, N'feodor', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'梓彤', CAST(N'1970-01-13T09:58:37.000' AS DateTime), N'fmartone@creativecommons.org', NULL, NULL, CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2020-01-27T17:25:19.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (20, N'deni', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'雨婷', CAST(N'1987-08-25T10:19:00.000' AS DateTime), N'delse0@friendfeed.com', CAST(N'2023-10-03T13:30:14.793' AS DateTime), CAST(N'2024-01-03T13:30:14.793' AS DateTime), CAST(N'2023-10-17T18:33:55.000' AS DateTime), NULL, NULL, CAST(N'2022-12-22T11:09:53.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (21, N'phyllida', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'欣妍', CAST(N'1977-02-04T09:15:43.000' AS DateTime), N'psprouls1@e-recht24.de', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-17T18:22:19.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (22, N'eden', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'香茹', CAST(N'2004-11-12T23:20:39.000' AS DateTime), N'emclleese2@about.com', CAST(N'2023-10-03T09:35:10.317' AS DateTime), CAST(N'2024-01-03T09:35:14.690' AS DateTime), NULL, NULL, NULL, CAST(N'2020-09-01T07:59:23.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (23, N'maire', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'麗卿', CAST(N'1972-07-15T15:28:26.000' AS DateTime), N'mcornhill3@slate.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-06-29T15:49:22.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (24, N'korey', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'莉姿', CAST(N'1971-09-08T19:21:39.000' AS DateTime), N'kbalas4@feedburner.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-26T23:04:21.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (25, N'laurel', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'莉姿', CAST(N'1997-07-18T13:48:05.000' AS DateTime), N'lgini5@elegantthemes.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-27T07:55:27.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (26, N'reynold', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'婧琪', CAST(N'2000-10-21T04:23:30.000' AS DateTime), N'rspillard6@google.co.uk', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18T11:05:00.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (27, N'ginger', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'昕磊', CAST(N'1971-05-03T02:50:35.000' AS DateTime), N'gsheasby7@sitemeter.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-14T22:05:25.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (28, N'laurena', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'尚霖', CAST(N'1988-01-23T18:44:27.000' AS DateTime), N'ljones8@cyberchimps.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-03-19T15:06:26.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (29, N'petronilla', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'浩成', CAST(N'1970-12-06T05:35:30.000' AS DateTime), N'psearles9@slashdot.org', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-06-03T05:50:09.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (30, N'koralle', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'亦涵', CAST(N'1973-05-24T14:37:25.000' AS DateTime), N'khumana@java.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-14T04:19:32.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (34, N'cola', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'可樂', CAST(N'1999-10-01T00:00:00.000' AS DateTime), N'cola@gmailcom', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T13:06:12.657' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (39, N'yoyo', N'95F12F96D5A52FA997BC0B3266E8B7DA22E3A6B86DCD88FB2BDFA9038A7F2970', N'佑佑', CAST(N'1998-12-22T00:00:00.000' AS DateTime), N'yoyo4me@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-24T19:24:14.240' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (40, N'weedasd', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'偉德', CAST(N'1990-10-11T00:00:00.000' AS DateTime), N'weedasd@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-24T19:55:19.480' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (41, N'helena', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'海倫', CAST(N'1998-12-11T00:00:00.000' AS DateTime), N'helena@gmail.com', NULL, NULL, NULL, 0, N'3a813e7face348779d8424ed70dc2f77', CAST(N'2023-09-24T20:56:13.607' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (42, N'yozhi', N'C7D15FB26B28A60D5F5EC2FF95DDE9DC553F97F9DAC27F1551B87F6835B83535', N'佑慈', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'yoyo11@gmail.com', NULL, NULL, NULL, 0, N'fd725fc5ae7c493383a8a511c5fed32b', CAST(N'2023-09-25T13:49:03.380' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (43, N'lalaisme', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'笑笑', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'lala@gmail.com', NULL, NULL, NULL, 0, N'70ba3828fbca4b8fa8cedc35665fcfe9', CAST(N'2023-09-25T13:55:20.977' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (44, N'uniqlo', N'96B0C336010B5C89565EA5BFB50E585639EC04A0A952B7FE460AAEA42ADC2752', N'小咪', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'uniqlo@gmail.com', NULL, NULL, NULL, 0, N'3a26a05212064a8db6bb91e6676bbc50', CAST(N'2023-09-25T13:55:57.610' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (45, N'queen', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'小雅', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'queen@gmail.com', NULL, NULL, NULL, 0, N'f10fd36419d147c389583e0ea4fb1564', CAST(N'2023-09-25T13:59:30.970' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (46, N'miya', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'米亞', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'miya@gmail.com', NULL, NULL, NULL, 0, N'ddddabb5470d494f8cef7869d17e8a1e', CAST(N'2023-09-25T14:00:19.387' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (47, N'helenan', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'海納', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'helenan@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-25T14:02:17.710' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (48, N'allen', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'艾倫', CAST(N'1986-02-04T00:00:00.000' AS DateTime), N'lee871222@gmail.com', CAST(N'2023-09-10T00:00:00.000' AS DateTime), CAST(N'2023-10-09T00:00:00.000' AS DateTime), NULL, 1, N'75bf7f73bf194f01befcc8ebfea21f71', CAST(N'2023-07-25T14:09:56.670' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (49, N'fly', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'翔翔', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'fly@gmail.com', NULL, NULL, NULL, 0, N'a3f08f04e7da4b44ba2cee92d9ded7e9', CAST(N'2023-09-25T14:10:40.133' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (50, N'jiajia', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'家家', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'jiajia@gmail.comw', NULL, NULL, NULL, 0, N'7e9f46ee5dae452cb3c3f9e0513c6de4', CAST(N'2023-09-25T14:13:26.247' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (58, N'yiyun', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'意雲', CAST(N'1984-10-31T00:00:00.000' AS DateTime), N'yiyun@gmail.com', CAST(N'2023-10-03T13:07:54.537' AS DateTime), CAST(N'2023-11-03T13:07:54.537' AS DateTime), NULL, 0, N'1e82624c306c400fb01991d3f57deff5', CAST(N'2023-10-03T12:33:51.807' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (59, N'sunray', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'昇銳', CAST(N'1978-10-22T00:00:00.000' AS DateTime), N'sunray@gmail.com', NULL, NULL, NULL, 0, N'4728c5c6f1584ba3b3d8b344bd5781f1', CAST(N'2023-10-03T13:22:58.983' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (60, N'sunraye', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'升銳', CAST(N'1978-10-22T00:00:00.000' AS DateTime), N'sunraye@gmail.com', NULL, NULL, NULL, 0, N'03423ea5633c490b86da9d831c38058d', CAST(N'2023-10-03T13:24:17.483' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (61, N'sinhwha', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'欣樺', CAST(N'1977-03-01T00:00:00.000' AS DateTime), N'sinhwha@gmail.com', NULL, NULL, NULL, 0, N'd5b41128917a400b87a6a6838f2aae5a', CAST(N'2023-10-03T13:26:07.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (1, N'6/30網站更新', N'將於6/30上午9:00~11:00,進行網站更新,造成不便,造成不便進請見諒', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (3, N'7月上映與下映資訊', N'7月份的上映與下映資訊,將於6/30中午更新~', CAST(N'2023-06-26' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (5, N'7/31網站更新', N'將於7/31上午9:00~11:00,進行網站更新,造成不便,造成不便進請見諒', CAST(N'2023-07-26' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (6, N'8月上映與下映資訊', N'8月份的上映與下映資訊,將於7/31中午更新~', CAST(N'2023-07-27' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (7, N'8/31網站更新', N'將於8/31上午9:00~11:00,進行網站更新,造成不便,造成不便進請見諒', CAST(N'2023-08-26' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (9, N'9月上映與下映資訊', N'9月份的上映與下映資訊,將於8/31中午更新~', CAST(N'2023-08-27' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (10, N'9/30網站更新', N'將於9/30上午9:00~11:00,進行網站更新,造成不便,造成不便進請見諒', CAST(N'2023-09-25' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (11, N'10月上映與下映資訊', N'10月份的上映與下映資訊,將於9/30中午更新~', CAST(N'2023-09-26' AS Date))
INSERT [dbo].[News] ([Id], [Title], [Description], [Publishdate]) VALUES (12, N'即將推出積分商城', N'將於11月中推出積分商城,會員可透過每天登入獲得積分!且可透過積分兌換商品~ 將於11月初再次公告。', CAST(N'2023-10-06' AS Date))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[OttTypes] ON 

INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (1, N'Netflix')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (2, N'HBO')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (3, N'Disney')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (4, N'LiTV')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (5, N'MyVideo')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (6, N'friDay')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (7, N'LINE TV')
INSERT [dbo].[OttTypes] ([Id], [Name]) VALUES (11, N'ABC')
SET IDENTITY_INSERT [dbo].[OttTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[PayTypes] ON 

INSERT [dbo].[PayTypes] ([Id], [Type], [Fee], [DisplayOrder]) VALUES (1, N'月費', 50, 10)
INSERT [dbo].[PayTypes] ([Id], [Type], [Fee], [DisplayOrder]) VALUES (2, N'季費', 120, 20)
SET IDENTITY_INSERT [dbo].[PayTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (6, 19, 2, N'雖然是一部大悶片,但算是高級知識份子的片單,票房不錯,應該是吸引大學理工科系有唸過物理的人來觀看,如果文組的話應該就看不懂了,但還是覺得悶,難怪配樂從頭到尾沒停過,沒配樂的話真的是會睡著', 3, CAST(N'2023-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (7, 19, 5, N'就是一部無腦片~ 連爽片都不算...要去看的人三思', 1, CAST(N'2023-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (8, 20, 7, N'這部電影好看 , 老少咸宜 , 有成年女生看到流眼淚 XD 以水和火兩個元素來詮釋故事蠻有創意的', 5, CAST(N'2023-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (9, 20, 8, N'這明明就是好看的爽片，除了一開始吳京說了比較多中文，其餘幾乎沒甚麼冷場😃', 5, CAST(N'2023-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (10, 20, 20, N'這部電影好看 , 全程都蠻刺激的 , 很期待明年的結局', 5, CAST(N'2023-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (11, 20, 9, N'第一集這麼好看.結果第二集拍得跟狗屎一樣.完全沒有任何的緊張感.直接變搞笑片', 1, CAST(N'2023-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (12, 20, 3, N'太好看了！！！ 迪士尼的美術永遠不會讓人失望 劇中探討非常多面向 最後忍不住還是滴了十滴眼淚 很感人 每一幕都美到想截圖', 5, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (14, 23, 22, N'第一次看電影看到睡著，真的無言，不知道在演沙小。', 1, CAST(N'2023-05-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (15, 23, 23, N'很好看,小朋友看的超開心,很有共鳴,期待出下一部', 5, CAST(N'2023-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (16, 23, 19, N'爛到不行 浪費了前三部的票房 拍成這樣簡直是災難', 1, CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (18, 23, 27, N'劇情鋪陳得宜，有感動有歡樂，演技也沒話說，推薦！', 5, CAST(N'2023-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (19, 23, 17, N'本來以為會是動作科幻片，沒想到是劇情片，還不錯看', 5, CAST(N'2023-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (20, 24, 10, N'劇情銜接的莫名其妙 很多點看起來就是可笑而已', 2, CAST(N'2023-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (21, 24, 6, N'不要懷疑！碟戰情報類型電影的天花板！從頭到尾絕無冷場，小弟用一生含淚推薦這部電影！', 5, CAST(N'2023-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (22, 24, 8, N'反派演的很棒，整部片看的很爽雖然劇情蠻老梗的，但⋯這不就爽片嗎？有爽到', 4, CAST(N'2023-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (23, 24, 15, N'幸好James Gunn有回來執導 只有他執導才是真正的星際異攻隊', 5, CAST(N'2023-07-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (24, 26, 2, N'《金裝律師》是那些一旦開始觀看就無法停止的節目之一。 令人上癮！ 這個節目中角色之間的化學反應和電視上一樣好！ 市面上有數千部關於律師的節目，但這是迄今為止最好、最原創的一部！ 我極力推薦這個節目！', 5, CAST(N'2023-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (97, 26, 5, N'考慮到我已經沒什麼可看的了，這個節目確實幫助我消磨了時間……但它並不能真正吸引我並讓我興奮', 2, CAST(N'2023-09-27T15:49:45.673' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (98, 26, 7, N'是一部完整的劇，共7季。 但梅根馬克爾突然變成了《金裝律師》中的洋子。

隨著梅根馬克爾斯退出，該劇失去了一位明星。 第8-9季就成了絕唱。', 4, CAST(N'2023-09-27T15:57:13.123' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (99, 26, 30, N'前幾季還不錯，但到了第六季，每個場景都會以兩個人用對方的名字互相感謝來結束。 “謝謝邁克”“謝謝哈維”。 謝謝唐娜。 謝謝路易斯。 沒有人像在這個節目中那樣說話或使用名字。 無論誰編寫這個節目，都需要時不時地走出家門。', 4, CAST(N'2023-09-27T16:38:04.597' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (106, 55, 48, N'這部電影好看 , 老少咸宜 , 有成年女生看到流眼淚 XD 以水和火兩個元素來詮釋故事蠻有創意的', 5, CAST(N'2023-10-04T09:16:05.250' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (107, 55, 2, N'太好看了！！！ 迪士尼的美術永遠不會讓人失望 劇中探討非常多面向 最後忍不住還是滴了十滴眼淚 很感人 每一幕都美到想截圖', 5, CAST(N'2023-10-04T09:17:13.757' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (108, 55, 5, N'使用元素傳達人類情感是一個好主意，但執行不好。 動畫還可以，但不是唯一的。 當然沒有什麼可限制的。 角色發展的深度似乎很淺。 音樂是中等的。 編輯很斷開。 聲音混合很公平。 場景進步的場景很尷尬，運行時間比電影中的材料所期望的要長。', 2, CAST(N'2023-10-04T09:21:34.007' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (109, 55, 8, N'Elemental是皮克斯的最新電影，我以低期望和完全失望的方式走進了電影，實際上哭了出去。 Elemental得出了一個令人印象深刻的結論，我很高興他們對此進行了不同的轉彎並切換了一些東西。 不要破壞任何東西，但是這部電影像真正的創造力和有趣的觀看一樣，讓我印象深刻。 Ember和Wade之間的化學反應感到匆忙，但我不敢相信它實際上在最後起作用。 我笑了，我哭了，我喜歡這部電影，這很重要。 向下重新觀看。', 4, CAST(N'2023-10-04T09:22:42.020' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (110, 52, 20, N'從1988年到1993年的演出結束，我記得看著凱文·阿諾德（Kevin Arnold）成長。 與我最相關的情節是凱文（Kevin）試圖在課堂上打電話給最漂亮的女孩，並撥打最後一個數字的一​​集。 我想他害怕被拒絕。 我記得在那個年齡做同樣的事情。 再次，凱文和溫妮之間的關係再次是無價的，就像“回到過去”的方式。 我希望現在有更多這樣的節目，但是現在我們可以選擇觀看這些可悲的現實節目，這些節目吸引了這些可悲的現實節目，並且似乎只娛樂社會的腦弱（主要是大學生）。', 5, CAST(N'2023-10-04T09:26:36.050' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (112, 52, 23, N'我真的很喜歡這個。 我同意，正如其他人評論了這是多麼原始的。 弗雷德·薩維奇（Fred Savage）是一位很棒的兒童演員，他使演出變得更加真實。 我明白了為什麼這個節目已經很長時間了，並且仍在顯示。 這對所有人來說都是非常棒的表演。', 5, CAST(N'2023-10-04T09:28:06.333' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (113, 51, 19, N'當我走出劇院時，我幾乎感覺到了……空虛...但是我不想說這部電影很糟糕，但是...我也不想說這部電影不錯。幸運的是，這部電影只有一個半小時的時間，因此不會花你太多時間。', 2, CAST(N'2023-10-04T09:31:32.030' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (114, 51, 27, N'利亞姆·尼森斯（Liam Neesons）保護父親的人物糟糕的動作戲，對話或表演。 因為這是我們在所有整齊地包裝成一個2小時的電影都看到的。 感覺就像在場的演員都不願意在那裡。 他們似乎只是在進行動作以獲得薪水。', 1, CAST(N'2023-10-04T09:33:35.103' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (115, 51, 48, N'爛片無誤', 1, CAST(N'2023-10-04T09:33:50.987' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (116, 49, 39, N' 在上半場大部分時間的大部分時間都有黑暗的環境，可預測的結果和嚴重缺乏鯊魚的無聊，只有由於事件的俗氣和荒謬，它只會改善結局。 即使那樣，這還是一團糟，從一個動作場景跳到另一個動作場景，沒有任何節奏的概念。 ', 1, CAST(N'2023-10-04T09:36:03.253' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (117, 49, 34, N'看完了，第二部印證了這系列的靈魂只有郭達。我對吳京的演技一言難盡，他越來越不像一個演員，而是一個符號，很迷惑。', 2, CAST(N'2023-10-04T09:37:03.187' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (118, 49, 48, N'中美合拍災難片，本身就是災難，吳京和沈騰靠攏了，有他倆的片都要小心', 2, CAST(N'2023-10-04T09:37:20.617' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (119, 25, 30, N'不知道為什麼 看這個的時候覺得自己特滿足特幸福', 5, CAST(N'2023-10-04T10:02:53.220' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (120, 28, 61, N'大數據堆積的網狀質地的動作片（AI劇本）。 故事很裝X，也很幼稚，角色只有名字和背景，沒有性格和靈魂，動作場面毫無新意，山寨007和碟中諜的過時產物。 白白浪費蓋兒加朵。', 2, CAST(N'2023-10-04T10:06:48.707' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (121, 28, 59, N'全程都是各種的高科技，我看了半小時，沒覺得劇情有多好，就是覺得那個遠程導航系統不錯，只需要按照綠線走就是最優路線（高德導航、百度導航：我們也有 綠色的最優路線！）看到一個多小時的時候覺得沒意思就幹別的去了，老婆倒是專心致志的把整部看完了，話說我老婆能認真看完的電影還真不多，他喜歡的 電影就是一個——“火爆”，看來這部電影的火爆還是沒問題的，電影裡比較有趣的一個地方：蓋爾加朵在游泳的時候發現她的髮際線好高啊😄', 4, CAST(N'2023-10-04T10:08:01.077' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (122, 28, 58, N'一堆人抱著食之無味棄之可惜的態度看完之後喋喋不休指指點點，全是負面情緒，電影帶給你的是享受，還是情緒宣洩呢，以為自己什麼都懂，高高在上，不屑一顧 ，在我看來情報類電影碟之心還算近期不錯的影片了，為什麼大家看個電影戾氣都這麼重呢，可能生活不如意，本想透過電影釋放情緒，結果心情很糟看不進去就 跑網上散發慪氣，又或者失戀，離婚，欺騙，失業讓自己心情很down，想看個電影舒緩心情，結果看不懂或看不進去就看是抹黑，抱怨。', 5, CAST(N'2023-10-04T10:08:25.713' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (123, 28, 50, N'電影沒有太多的驚喜，整部電影的節奏也很平淡，特技也是以往見過的，只是稍微有點調整。 演員的表演都是很平常的，沒有很出色的發揮！ 連動作設計都很普通！

這是一部典型的商業片，沒有太多的內涵。', 3, CAST(N'2023-10-04T10:09:15.620' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (131, 27, 2, N'在曾經的爆米花爽片霸主漫威/迪士尼拍不出合格的爆米花爽片之時，反而出現了《龍與地下城》和《超級瑪莉兄弟》這樣的比漫威還漫威/比迪士尼 還迪士尼的優秀爆米花爽片。 即使不管什麼情懷與彩蛋，《超級瑪莉兄弟》都是一部教科書級的合家歡爆米花爽片，少兒向的劇情，緊湊的節奏，一幕接一幕的炫目又各具特色的場景，充滿正能量的 劇情，總的來說就是一部從頭爽到尾不用帶腦子看的（或者說建議不要帶腦子看的）解壓爽片。

話說全片印象最深的反而是作為跨物種舔狗的大BOSS酷霸王，即使公主不接受跨物種婚姻，酷霸王註定杯具也還是一意孤行的當舔狗，搶奪神器無敵星也是為了給碧姬公主 一起攜手統治世界，結果被公主一頓操作把無敵星送給了情敵。 。 。 感覺其實最後的大戰都是不必要的了，碧姬公主再多隱忍一下把無敵星騙到手不就直接結束戰鬥了麼。 。 。

PS：碧姬公主越看越覺得像艾爾莎，特別是使用冰魔法橫掃千軍那段簡直就是艾爾莎附體了。 。 。', 4, CAST(N'2023-10-04T11:49:10.670' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (132, 27, 3, N'我更喜歡的結局是：馬裡奧拿到無敵星，但沒有吃掉，而是說：我不需要無敵星，我練習了這麼久，就是為了現在。 然後透過技巧打敗了庫巴，最後落在旗桿上。

只是我個人希望是這樣的結局，不代表其他人。

很喜歡桃子公主的設定，滿是奇諾比奧的蘑菇王國，以及馬裡奧賽車選車，淚奔。

為什麼馬裡奧沒有吃花丟火球環節？ 還挺想看的。

希望死後能上任天堂。', 5, CAST(N'2023-10-04T11:49:44.233' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (133, 27, 5, N'粉絲向合家歡遊改電影，雖激動於能看到從小玩到大的馬裡奧系列角色登上銀幕，但平鋪直敘、簡單無聊的故事，升級打怪換地圖的敘事節奏，縱有不錯的視效和 IP情懷，還是讓觀眾昏昏欲睡，到底講好一個好故事才是電影的核心價值。

雖瑪利歐系列遊戲的劇情亦大多一根筋，像庫巴和瑪利歐永遠的情敵死對頭，但遊戲的互動性帶來的心流顯然是無法生搬硬造到電影裡的。


遊戲是在創造世界給玩家，電影僅能呈現世界給觀眾，即使精心還原了各個地區和獨特玩法場景的視效，也至多能販賣情懷給玩家，而觀眾則是司空見慣。

電影篇幅太短也是遊改漫改電影的普遍弊端，反而改成劇集增加時長、聚焦少數角色（如神秘海域），另闢故事線（如生化危機、怪物獵人、皮卡丘偵探）都更易做好。

若要貪心地在90分鐘內將IP全數登場，就只好做成頭號玩家、失控玩家這種彩蛋形式罷。', 4, CAST(N'2023-10-04T11:51:14.047' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (134, 27, 6, N'本人身為瑪利歐遊戲系列30年忠實玩家，原本非常期待這部電影，看後卻比較失望。

影片幾乎沒有劇情可言。 完全是馬裡奧系列遊戲（超級瑪麗，大金剛，馬裡奧賽車等）片段的大串燒。 東拼西湊的玩意。 看到一半就不怎麼想看了，但還是耐心看完。 觀影感受如同白水煮雞肋「食之無味，棄之可惜」。

任天堂聯手好萊塢專為遊戲粉絲打造的這部電影——誠意不足。', 2, CAST(N'2023-10-04T11:51:42.933' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (135, 27, 7, N'由於我對遊戲改編的電影，並沒抱什麼太大預期，只是覺得致敬一下，或者把元素堆積到一起，就算是一部成功的電影了，畢竟堆積堆積元素，賣一賣情懷也是可以理解的 嘛，但這部電影其實超乎了我的預期，雖然劇情上並沒有什麼過度的刻畫，也沒有什麼所謂的反轉和現在觀眾想要追求的一些東西，不過，其實簡單一點。 並沒有什麼壞處。', 5, CAST(N'2023-10-04T11:53:39.067' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (136, 27, 8, N'太可愛的片子了！ 都是玩過的橋段，原來看遊戲示範是那麼開心的事兒。

不知道00後還是不是超級馬力的粉絲，至少708090估計都是吧，畢竟那時候有遊戲機玩就是很了不起的事情了。

怎麼早點沒想到要拍這樣的電影？ 算是彌補了哈利波特的空檔吧。 這幾年，加上疫情，實在太無聊了。

反而是十歲以下的小孩子，看得懂麼？ 估計00後恐怕就不哈了。

坐等續集啊，最好每年一部。', 5, CAST(N'2023-10-04T11:54:10.017' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (137, 27, 9, N'完完全全就是拍給曾經在任天堂的機器，或是小霸王的機器上，打過超級瑪利歐遊戲的朋友們的情懷電影。 一開場，就是那熟悉的畫面感，當然這個酷炫的畫面，比起當年我在黑白電視機上打遊戲的時候，也是截然不同的感受的。 不過看到這兩個可以頂出蘑菇的兄弟，一下子又被拉回到那個曾經無比快樂的童年。 這就是這部電影最大的價值了。

至於你說，這部電影的故事到底有多好，我勸你還是算了，因為西方的這類電影從來不是以故事情節取勝的。 我們可以把重點放在情懷上，除了那以外，更多的關注點可以是畫面的優美，可以是特效的牛，總之一句話，這電影適合在電影院裡看，但是看完了也就看完了。', 4, CAST(N'2023-10-04T11:54:50.900' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (138, 27, 10, N'懂得取捨，大道至簡…

一味貪多，求全責備，可能會失去更多的精準和力度，懂得取捨，知道要什麼，知道可以要到多少，更加重要。
就算沒有玩過遊戲，對於「超級瑪莉」「小人吃蘑菇」之類的估計很多人也看過，雖然有些人會心裡腹韻，這樣的故事可以講到什麼程度，又可以吸引怎麼樣的 觀眾呢，這部電影給我們一個滿意的回答。
人物形象，還原遊戲同時抓住了其萌和擬人化神態的重點，俏皮可愛讓人印象深刻，同時又給其賦予了不同的性格無論是與當下的流行文化還是社會風氣都緊緊貼合， 具有時代感的同時又不會太誇張…
遊戲元素，對於遊戲中的關卡和遊戲中的道具，都極度不刻意的融入其中，並不會給人生硬的感覺，潛移默化潤物無聲的植入遊戲元素才是其高明之處…', 4, CAST(N'2023-10-04T11:55:18.930' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (139, 27, 11, N'全世界的蘑菇人聯合起來，蘑菇王國不能損傷絲毫，人類世界盡情砸爛。

有人說過於敷衍……可真誠和愛本來就是簡單直接。

永遠被這種勇往直前的勇氣打動。 愛這個世界，對一個悲觀主義者來說，是短暫的溫暖慰藉。

所以童年給我們的是繼續活下去的勇氣和力量。 相信有愛，相信有時候好運會站在我這邊，陪我一起看彩虹。', 5, CAST(N'2023-10-04T11:55:45.017' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (140, 27, 12, N'都是童年的回憶啊，馬裡奧兄弟。 只是有很多部遊戲都沒玩過，小恐龍和公主都是第一次見，但是天空之城的跑跳模式，還是看著我很開心～

其實他們要是出城市類的，我會比較感興趣。 他們在城市裡面下水道的那一幕，讓我想起了忍者龜的遊戲，好像也出🎬了

他們還有一個彩蛋估計是想出續集，我更期待了', 5, CAST(N'2023-10-04T11:56:13.680' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (141, 27, 13, N'劇情精彩刺激搞笑且緊湊，色彩絢麗，天馬行空的想像及畫面感讓人心曠神怡，特效及3D效果槓槓滴，同時原版遊戲裡的情節及配樂帶來滿滿的兒時回憶。 另外，馬力歐的不服輸精神給娃留下了深刻印象，起到了鼓勵他永不服輸、堅持很酷的效果；路易吉最後時刻挺身而出，保護了哥哥也讓他完成了一次蛻變，給 娃也留下了深刻印象。 這是一部同時適合大人、兒童或親子觀賞的電影，超級推薦觀賞～', 5, CAST(N'2023-10-04T11:57:08.720' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (142, 27, 14, N'重溫了經典的遊戲，馬裡奧知道自己想要什麼，想做什麼，因此總是能激勵自己，不斷前進，並達成目標，努力成為了更好的自己，得到了家人、朋友的愛護。 越是自以為是,越什麼都不是，越是放下，越是得到。 人生從來沒有無用的經歷，一切都是最好的安排。
耐得住寂寞，才能贏得成功。 只要我們不念過往，不畏將來，光明就在前方。', 5, CAST(N'2023-10-04T11:59:47.067' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (143, 22, 15, N'小成本精彩懸疑片，不動聲色中讓你體會驚心動魄...', 5, CAST(N'2023-10-04T14:00:32.640' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (144, 22, 16, N'這片子拍的算是質優價廉了！', 4, CAST(N'2023-10-04T14:00:47.740' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (145, 22, 17, N'上來依舊吐槽中文譯名，這個譯名無言的劇透，再加上小成本電影和比較業餘的演技。 。 讓我整部電影的前半部都有一種這是一個爛片的錯覺。 。 但這也成為了最後峰迴路轉的小驚喜。 。 翻譯真的不走心。 。 雖然有鬼打牆的意思。 。 但是走投無路比較好。 其實這部電影叫林中小屋更貼切，更有感覺。 不是嗎？', 3, CAST(N'2023-10-04T14:01:55.240' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (146, 22, 18, N'我覺得恐怖倒是沒有那麼恐怖。 其實相對覺得有點寡淡了。 其深層和原生家庭的討論不謀而合，我們長大成人，做的選擇，想法，興趣。 有種說法是原生家庭帶來的，一個好的家庭或許人生就不一樣了。
        還有就是穿越，你確定你要改變過去嗎？ 也許細微的改動，你就不存在這個世界了。
        我們做自己的選擇，不知道好壞，生活總是會給我們答案，不是所有人都能重來，我們需要的是接受自己，進而改變自己。', 3, CAST(N'2023-10-04T14:02:18.640' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (147, 22, 19, N'這是我看的電影中，中文譯名和電影內容不符，並因此將電影的層次拉下不止一檔中排名第二，第一的是《刺激1995》，它是另一個廣為人知的名字是《肖申克 的救贖》。

自己為這部電影取了兩個中文名，第一個是《奇幻三代情》，有些劇透了，那就叫《人生的蝴蝶效應》

蝴蝶效應（ The Butterfly Effect）是指在一個動力系統中，初始條件下微小的變化能帶動整個系統的長期的巨大的連鎖反應。 這是一種混沌現象。 簡單說就是一個微小的改變能影響事物未來的發展。

那麼在漫長的人生中，蝴蝶效應會扮演多少作用呢？ ！ 其實蝴蝶效應從某點來說，無疑就是因一個微小的變化而導致未來“更好”或“更壞”，而無疑人人都想更好！ 從這點看，是不是有點像我們常說的「機不可失，失不再來」！

但是，我們會在什麼時候更重視運氣呢！ 就是你是這件事無法掌握，無法改變時，期待有神秘的好運可以讓你得到你想得到的！

可又有幾人會一輩子好運呢？ ！

最後說一句雞湯的老話：命是弱者的藉口,運是強者的謙辭！', 4, CAST(N'2023-10-04T14:02:48.150' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (148, 21, 20, N'“肯在芭比樂園獲得的職位，會和女性在現實世界中獲得的職位一樣多”', 5, CAST(N'2023-10-04T14:03:47.380' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (149, 21, 21, N'我感覺本片的定位是成為一部女性賦權的當代Grease, 但不小心拍成了青少年芭比Glee。 話說得都沒錯，但感覺是全程民聊，最後還要給Ken塞個找到了自我的橋段，何必呢，讓Ken去死不就得了。', 3, CAST(N'2023-10-04T14:04:04.733' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (150, 21, 22, N'的確精彩，出人意料的敘事姿態，全面反叛和自我重新審視，打破男女的一切凝視，回到生命本身去探索，去發現，去尋找意義——這。 。 。 我說的居然是一部玩具電影《芭比娃娃》

全片的某種另類氣質，讓我嗅到了某種當年我在國外第一次看《小丑》時的某種感覺，都非常另類得出人意料，在各種冒犯之中高歌猛進，最終打碎一切， 《小丑》成為全球罕見的票房超過10億美金的R級電影

這次《芭比》表面看人畜無害，但導演Greta Gerwig借用大眾對女性玩偶的延伸出的所有刻板印象進行反諷，刺破偽裝，面對真相，非常了不起~

借用一部電影，美泰兒公司說，不用你們動手，我自己來革自己的命，我自己來，自己給自己斬首，「芭比」可以給女孩們製造夢幻，也可以透過告別過去身份，進入新 世界去尋找生命的意義──敢情你兩邊啥都要啊，把消費主義躲到存在主義思考背後，美泰公司我看行，一出手就比孩之寶想得更顛覆，也是大膽得換一 種方式追求商業上的成功', 4, CAST(N'2023-10-04T14:05:30.430' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (151, 21, 23, N'芭比世界是少女想像的女性烏托邦，肯定懸浮，但至少比男人描繪的烏托邦有意思得多，因為男人不管怎麼想像桃花源，其中都離不開家庭——父母、子女，最小的父權制細胞，用歲月靜 好溫馨親情包裹成一種社會標配。 以至於凡是看見幻想未來的作品，如果還離不開家庭我就總覺得差點意思。 在這個意義上，《芭比》走出了突破性的一步，儘管芭比世界不過是資本主義為了解決和控制少女麻煩而製造出的一塊粉紅塑料，然而如果只把女性看成被動的，一味受控的 群體，又是太小看了女性，預設了資本主義會是顛覆不破的父權最先進形態。 要用發展和辯證的眼光看問題，從封建製到資本主義演變千年，其中又怎會沒有女性群體的反作用力？

男性早早就控制了所有的暴力機器，把世界當成一個大籠子，看似固若金湯，但《芭比》點出，男性畢竟不是機器，男性畢竟有男性的弱點。 如今硬碰硬是不可能的了，女性瓦解父權制的關鍵說不定就得從這最傻白甜，最性別刻板印象，最充滿男凝氣息的芭比世界裡開始。', 5, CAST(N'2023-10-04T14:06:10.947' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (152, 21, 24, N'可能是預期太高，所以沒有期待中那麼好，畢竟是一部輕鬆喜劇風的商業電影，批評和揭露社會現像已經做得很不錯，希望它再能給出解決方案就有些要求過高了。 全片最搞笑、出彩的部分莫過於對肯mansplain的展現，一句句let me show you過於洗腦，全場觀眾都笑到爆炸。 私以為電影一開始就是導演挖的一個坑，一定會有無數男性跟女生分享「這個是致敬的2001太空漫遊！」然後在後續劇情裡被無情諷刺。', 4, CAST(N'2023-10-04T14:06:47.237' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (153, 21, 25, N'芭比拍成電影，女主角打扮成芭比扮相，它首先是真人動畫電影。 它依據的是一種肖似性原理，類似於漫畫書，漫畫書裡的主人公一以貫之，就像小說基於的是‘人稱’和姓名:你，我，他，朱麗，約翰。 她來自一個符號世界，這個世界完全是粉紅色的，它類似於一個微型世界，但不是模仿真實世界的。 它是一些場景:女人的典型場景，戀愛，化妝。 芭比娃娃的生活歷來被當成可愛女性的養成類樣本。 它是一個‘act’，不只一個表演，一個裝扮，也是一個角色。 這個字的內涵的範疇其實構成了這部電影的內容。 這部電影是非常符號化的，片中每一個道具，陳設和色彩花紋都是女性世界中舉足輕重的一部分。 雖然它本身依據的已經是一個符號:芭比。 作為一部電影，它評價了整個好萊塢敘事，這個是後話。 但更重要的是它對符號敘事的改進。', 4, CAST(N'2023-10-04T14:08:40.403' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (154, 21, 26, N'當你在現實裡用荒誕手法去展現自己那點小心思時，你會被認為是虛假、尷尬和夾帶私貨；可當你在荒誕裡用現實去展現其本身的光怪陸離和血腥殘酷時，你 可以道出整個世界的真相。
《芭比》是我今年看過最好的外語片，好玩好笑又鞭闢入裡，臉裡子都有了，怎能不愛？', 5, CAST(N'2023-10-04T14:09:01.440' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (155, 21, 27, N'先解釋下打分，如果這部電影是免費的，也許我可以給四顆星。 但既然這是商業電影，我只能給三顆星。 我認為能給這部電影打五星的人都是沒必要看這部電影的，而需要看這部電影的人大概率覺得這部電影很無聊，從市場原則出發，這不是一部供求搭配的好 電影。

但它還是有可圈可點之處。 其實我認為這部電影最適合男性觀眾觀看，看完你就知道女性真的很渺小，她們這輩子可能都想不明白的事情，我們7歲的時候就已經懂了。

本片的敘事結構其實挺複雜的，芭比樂園與現實世界相反，然後芭比和肯與現實中的人分別進入對方的世界。 這是一個拓樸變換，這個構思是值得讚許的，然而它的呈現只能說還是拍給女性觀眾看的。

無論是對男性觀眾或女性觀眾而言，本片講的是同一個道理，當一個平凡的普通人，也就是告訴我們要躺平。 不同的是，對女性而言，她們要走出父權制給她們建立的芭比樂園，而對男性來說，則需要放棄對女性的任何幻想。', 2, CAST(N'2023-10-04T14:09:38.960' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (156, 21, 28, N'芭比這部電影經不起推敲，或許是電影主題本身的問題，但無論無何它都算不上一部好片。
     我們首先所知芭比的世界與我們的世界是相對的（或者說是與我們曾經的世界），一個為女性為中心的母權社會和一個以男性為中心的父權社會，所以芭比世界所發生 的事情和要諷刺和批判的事情我們要反著來看。
     當芭比世界的中心被男性所奪取，一切都倒過來了，本該是女性佔有的政府，諾貝爾獎，職業，體育運動…都被男性所佔有，然後芭比就急了，要動員所有芭比來 奪回她們的世界，但肯只是用曾經芭比所對待肯一樣態度來對待芭比，他們只是佔有了曾經芭比都獨佔有的一切，然後芭比就認為這一切都是錯的。 然後我們放在我們的現實世界，當男性來控制一切時，女性爭奪權利，那我們是不是也要認為這種行為是錯誤的，世界本身由男性所獨佔，就像芭比世界由女性所獨佔，任何 一方倒轉將是不道德的錯誤，這不是芭比的劇情所提現出來的嗎', 1, CAST(N'2023-10-04T14:10:20.983' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (157, 21, 29, N'這部電影讓我學到了，就算設定再離譜，只要保持穩態，不前後矛盾，能自圓其說，觀眾就能夠接受。 所以，虛擬世界中基本世界觀設定需要保持穩定，就算離譜，只要是穩定的離譜，觀眾就能學會並且接受。 但很多寫故事的人，連離譜都不敢離譜的。 這樣就會受限，束縛了故事發展。', 5, CAST(N'2023-10-04T14:12:32.627' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (158, 21, 30, N'扯這部電影是過於女權主義就完全是沒有看懂電影，3/4位置的確有點說教，但馬上又被劇情解構了，反反复复的解構重塑就是為了最後人格的新生，嘲笑父權制就 和父權制和馬綁在一起一樣好笑，實際上只是在說，離開所謂父權制的規訓和極端女權的洗腦，成為「擁有獨立自我人格」的人。

它的劇情一直在設置槽點和毛病，等著各位觀客分析“它是女權主義”、“反父權制”，或者像我一樣反對這些觀點，這些討論組成了它沒有設置的彩蛋。', 4, CAST(N'2023-10-04T14:13:06.480' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (159, 21, 40, N'三星到四星之間吧，嚴格一點三星，寬容一點就四星。

我認為它是一部喜劇，和一部意象電影，半個歌舞片。

有三四處人物動機太過突然，例如中間芭比在wierd barbie家自暴自棄說自己啥都不行，例如結尾肯在Dream House的一串自白。

靠對話推動的部分比較多，長篇說教部分會發呆以致想給三星，唱唱跳跳閃閃亮亮的部分（就像在美國遊輪上看的節目）會大笑開心就想給四星。', 4, CAST(N'2023-10-04T14:13:32.960' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (160, 21, 41, N'電影《芭比》一上映，就掀起了「粉紅色」的浪潮。 我非常喜歡電影《芭比娃娃》，整部電影輕鬆愉快，陽光沙灘、美女帥哥、載歌載舞，最後強行昇華的happy enading，一部非常典型的可以和朋友熱鬧鬧鬧一起看的爆米花無腦電影。', 5, CAST(N'2023-10-04T14:15:25.677' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (161, 21, 43, N'：“女性主題現在是爆款，未來只會看到更多蹭此題材的作品，《芭比》遠遠比不上影史上嚴肅認真剖析性別議題的若干佳作。”

是的，它表意直白，毫不正經，輸出密集，鏡頭語言幼稚。 它是一部十足的商業片，一部情緒誇張放大的comedy，一部簡餐，一部噱頭。

但這就是《芭比》這部電影該有的樣子。 它是Instagram與所有的即時社交軟體，它是洛杉磯無所事事的美國年輕人，是現代性和互聯網文化，我們的teenage years和immediate emotions。 如果我們不能希望它身上承托這些現代文化的縮影，那麼請問現代所有的所謂電影與文藝愛好者：還要躺在批判的窠臼裡多少年？ 這部電影片頭對《2001太空漫遊》的改編就已經宣告打破庫伯力克宇宙式深沉思考的厚障壁。

We teenagers, we teenage barbies.

“或許比起大肆批評這部院線電影本身，還是芭比所反饋的現代社會文化更加值得關注。”', 5, CAST(N'2023-10-04T14:16:00.950' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (162, 21, 42, N'《芭比》或許是日前最難定義的類型片。

它俏皮又嚴肅，是一個讓存在主義者或許語塞，甚至對一些女權主義者來說更加一頭霧水的有關文化的終極問題。 你大可以把它當作對脆弱的陽剛氣概的簡單嘲弄以及女性堅韌的陰柔氣質的褒獎，也可以對高密集的好萊塢假知識分子式的左翼包袱一笑而過。 但如果你仔細觀看本片，則會發現它其實是一次預先排演多次的，野心勃勃的，全景式的與結構模擬場域的調情。 它全不是一部簡單的「女性主義」電影，因為它的視角已經超越了性別本身。 （當然它也不完美）', 5, CAST(N'2023-10-04T14:17:21.727' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (163, 57, 10, N'鮑伯做這個短片一定很無奈吧，最成功的作品之一像隻狗一樣給瘋狂元素城作配。', 5, CAST(N'2023-10-04T14:24:18.510' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (164, 57, 11, N'倒是很適合做Elemental的貼片短片，老年人的愛情也是愛情，情節略顯俗套，不過到最後date的對像也沒出現，有點遺憾。', 3, CAST(N'2023-10-04T14:24:30.700' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (165, 57, 12, N'①十多年前的正片，現在突然來一個衍生短片，隔了一代人的記憶了；②當年在正片中老頭是念念不忘前女友的忠貞男人設，不過既然斯人已去，未亡人來一段黃昏戀未嘗 不可，但臨約會前對照片裡的前女友一通示愛，並表示當晚不會和約會對象太親密，簡直是畫蛇添足，只能說明這老頭既要又要，以及對約會對象的不尊重；③短 短八分鐘情節沒有起伏，故事、笑料和寓意都十分寡淡。', 3, CAST(N'2023-10-04T14:24:46.580' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (166, 58, 13, N'沒有第一部那種一氣呵成的流暢感。
用宿命論和電車難題這兩個情節模板好老套。 好像是辭職就可以避免宿命，那這麼大費周章幹什麼！
對邁爾斯父母的刻畫，有點失敗，讓我覺得有點討厭，太過一板一眼了。 第一部還不會這樣，會點到為止。
而且蜘蛛人大亂鬥那一段，讓我覺得這些蜘蛛人好菜啊，有點掉價。
沒看之前，我就以為蜘蛛人老闆2099很屌，結果就……這。
這個不優秀的劇本分成上下部，真的不值得。 而且這種戛然而止的結尾，真的挺敗好感的。
美術和分鏡依然強，但是配樂比不上第一部。
還有一點我覺得是個大敗筆──這部說 麥爾斯成為蜘蛛人是個烏龍，一個錯誤！ 這直接讓第一部的勵志成為笑話！ 我覺得關於超級英雄的接棒傳承，第一部做到無可挑剔了。
雖然「宿命題」和「電車難題」是超級英雄逃不開的命題，但在《蜘蛛人縱橫宇宙》裡就是讓我感覺刻意又生硬，說服力弱。', 3, CAST(N'2023-10-04T14:26:39.150' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (167, 58, 14, N'這就是我的年度電影了。 沒給滿分的原因其實跟我玩《王國之淚》的體驗一樣──第二次震撼人遠比第一次要難得多。 但它確確實實也給了我無與倫比的觀影體驗。', 4, CAST(N'2023-10-04T14:27:49.683' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (168, 59, 15, N'原來after還可以更爛，前五分之四是自詡多情的男主角的失戀旅拍嗎？ 很難想像男主角這麼有toxic masculian的人還愛讀書寫作，最後停留在tessa懷二胎作為he也是很無語。 咱就是說以後這種東西能不能一次性拍完，觀眾也是會成長的，當年喜歡的東西現在看來就是巧克力味的屎，戰線拉的又臭又長，對第一部的一點點小心動 都磨沒了。', 1, CAST(N'2023-10-04T14:28:26.577' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (169, 59, 16, N'從大一追到大四，H&T終於HE了。 ｜｜整部劇沒幾分鐘女主角，就別拉著女主角宣傳了，男主角自從當了這劇的製片人之後戲外就抓馬不斷，全劇完結，女主角終於解脫。', 2, CAST(N'2023-10-04T14:28:42.290' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (170, 60, 11, N'屎尿屁含量：99%。 好笑程度：1000%。', 4, CAST(N'2023-10-04T14:29:27.393' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (171, 60, 12, N'[復仇狗聯盟] 好可愛', 5, CAST(N'2023-10-04T14:29:45.467' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (172, 60, 13, N'如電影片名所示，本片是一部搞笑又刺激、讓人拍手稱快的復仇爽片！ 我宣布這是我今年看過的最爽的狗狗電影！', 5, CAST(N'2023-10-04T14:30:06.187' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (173, 60, 10, N'這是一部給狗奴們的電影，但完全站在狗的那一邊！ 這是一部充滿著喜劇和溫情的影片，透過幽默的方式講述了動物之間的情感和友誼。 影片的故事情節緊湊有趣，為觀眾帶來了愉悅和歡樂的觀影體驗。 無論是喜歡動物故事、喜劇片或是爆笑喜劇的觀眾，都能在這部電影中找到自己的樂趣。 這部劇的演員陣容也很強大，導演和劇組也是很強的，訓狗師也很棒，狗狗們所取得的成就將讓所有人大吃一驚。', 5, CAST(N'2023-10-04T14:30:28.417' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (174, 61, 14, N'遇事不決，量子力學。 解釋不通，穿越時空。', 3, CAST(N'2023-10-04T14:31:14.920' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (175, 61, 15, N'很難說回到阿基米德的時代比較cool，還是去1939年創死元首比較酷。 開頭那段手撕納粹戲比想像中長，我很難不替電影院裡的德國人尷尬。 不過，納粹真的，勞模級反派。 矜矜業業地干到了Indy都退休了，還能拉出一支有錢有人有武器有紀律的隊伍，我哭死。 PS動作戲超值，熱烈讚美Phoebe，再來部大女主角吧，阿基米德的墳挖完了，再去挖歐拉的如何？ 😛', 4, CAST(N'2023-10-04T14:31:26.530' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (176, 61, 16, N'作為印第安納瓊斯的謝幕之作，這部電影已經很好了，無比驚險的場面和視效，熟悉的配樂，即使導演不是斯皮爾伯格了也看出了當年的情懷和致敬，像洞穴裡 的蟲子和結尾的親吻都致敬了前幾部，確實讓我感動了。 全片唯一的不足就是結尾，我覺得最好的謝幕其實是讓瓊斯留下，這也算是對這個系列的一個交代了。 時隔這麼多年了，好萊塢特效不斷升級，讓瓊斯能夠重回當年的光輝，你說它炒冷飯吧，是有點，但是這碗冷飯確實很香，更爽的場面和特效，動作戲份也不老 套，冒險還是當年的味道，靠「命運轉盤」引入時間的概念使情緒渲染更到位了，「拔叔」的加入也很讓我驚嘆，作為這個從上個世紀延續到現在的系列，這個結局 拍的已經很讓我滿意了。 這次就算徹底結束了，希望不要再繼續拍了，這個系列的每一部在我心中都是經典，作為一個橫跨世紀的冒險電影系列，就讓它永久留在歷史裡吧', 5, CAST(N'2023-10-04T14:31:53.793' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (177, 62, 10, N'滿分五分我給十分三個小時的電影看著跟半個小時似的槍戰運鏡簡直了環境塑造無懈可擊高雅的同時又不失幽默完美詮釋何為西裝暴徒唯一的槽點就是戰力（子彈威力 和護甲防禦）有些崩主角能用小手槍打的重甲武士抬不起頭但是主要角色對槍衣服一拉比美隊的盾還硬jw的體質美隊看了都不好意思說自己嗑藥了甄子丹 的定位可以自稱蝙蝠俠（字面意思）了。 ps 最後的最後有彩蛋', 5, CAST(N'2023-10-04T14:32:37.047' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (178, 62, 11, N'下一部要不讓葉師傅演吧，我看葉師傅的手法真是行雲流水，幀數都得比喬師傅高二十幀。 估計是為了照顧喬師傅，感覺葉師傅出手還是收斂了。', 4, CAST(N'2023-10-04T14:32:49.430' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (179, 62, 12, N'你很難想像這這個系列是從第一部那樣的b級片進化而來的，這一部無論在攝影，置景，美術，燈光等各個製作層面來看都是行業頂級水準，配之從 不令人失望的動作戲，這就是當今最好的動作片系列之一。', 4, CAST(N'2023-10-04T14:33:50.113' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (180, 62, 13, N'本片沒有一隻狗狗受到傷害。', 4, CAST(N'2023-10-04T14:34:14.880' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (181, 63, 14, N'看之前以為奧本海默是著名的科學家，看完才意識到他其實是一位情緒穩定的專案經理！', 5, CAST(N'2023-10-04T14:34:46.357' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (182, 63, 15, N'“有一天，當他們對你的懲罰足夠多時，他們會給你提供鮭魚和土豆沙拉，發表演講，給你一枚獎章。請記住，這不是為了你，而是為了他們。”', 5, CAST(N'2023-10-04T14:34:59.893' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (183, 63, 16, N'偉大的作品探討人性。 看完真的覺得人類會毀滅自己。 希望諾蘭在這部電影上的商業化努力能讓更多人看到這部電影並且思考戰爭、和平與人類命運。', 5, CAST(N'2023-10-04T14:36:03.280' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (184, 63, 10, N'《奧本海默》的劇情和文字都很刻意，看完你會覺得是一部中規中矩的「佳作」。

有點像寫中學生優秀作文，你要這裡隱喻那裡排比，最後來點首尾呼應，這裡那裡的剪輯推動劇情發展，給你一點點懸疑到最後恍然大悟讓你爽一下。', 3, CAST(N'2023-10-04T14:36:23.620' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (185, 63, 11, N'後勁很大，看完後一整天滿腦子都是這部電影，記錄幾個觸動比較深刻的點。 諾蘭在這部傳記電影中依舊延續了自己對光影與時間的極致掌控', 3, CAST(N'2023-10-04T14:36:40.830' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (186, 63, 12, N'文明的躍遷，可以說是人類經歷一個個劫難浴火焚身到當下的。

《奧本海默》所講述的無疑是二十世紀人類最大劫數的關鍵所在，是原子彈結束的二戰麼？ 仰或是人類的無盡野心，僅讓現代戰爭暫熄？ 讓「戰爭」以另一種形式繼續。

答案是確切的，戰爭從未停止過，不論明或暗，顯或隱，科技或政治，歷史與現實。', 4, CAST(N'2023-10-04T14:37:02.383' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (187, 63, 13, N'我沒想到這部片能有這麼高的分。 從觀感上，它不像一部大眾友好的電影，信息複雜（乾信息量其實不大，因為水分很多），敘述花哨，雖然美術和表演很好，但不足以掩蓋前兩點帶來的晦澀。 從結構上，奧本海默的事蹟與對他的「審判」兩條大邏輯線各自閉合，但合在一起又無法構成一套完整敘事，而在兩條線並行了大半部電影后，一條 線戛然而止，另一條線卻在不知趣地繼續嘮叨，結果在這條線接近尾聲的時候，那條莫名其妙的黑白影像線居然成了所有事件的邏輯落點。 結果是：整部電影最終形成的敘事被簡化為這樣一句話——《一個愛因斯坦的眼神引發的血案》。', 5, CAST(N'2023-10-04T14:37:57.077' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (188, 63, 17, N'如無意外，《奧本海默》就是今年最強的大片了。

這不僅因為導演是諾蘭、3小時的片長、大規模實拍、信息量巨大、再次展現了好萊塢電影的深厚底蘊，更因為影片在大製作基礎上的強作者性，發出的那一聲聲 直擊靈魂的叩問。', 5, CAST(N'2023-10-04T14:38:30.693' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (189, 63, 18, N'這片應該是諾蘭拍的最符合學院美學的片子，嚴肅，歷史，大傳記電影，不出意外這片將在明年的奧斯卡上至少獲得十項提名（感謝《沙丘2》調檔，沒人 競爭技術獎囉，嘿嘿。）。 在看本片之前一直覺得敘事節奏應該同《登月第一人》相似，然而看完之後才發現本片給我的觀感非常類似《美麗心靈》，都是講述天才科學家的成長史，以及不得 不面對困擾一生的痛苦現實。 諾蘭在本片以倒敘，正敘，以及彩色和黑白兩個視角，將奧本海默傳奇的一生盡數展現出來。 這樣的敘事風格看起來有些凌亂，但實則是將重點事件一一敘述出來。 眾所周知，傳記電影的核心，就是要將歷史人物中起到中心事件的故事完整的呈現出來，但又不能顧此失彼顯得故事冗長乏味。 而諾蘭則透過這種打亂敘事的手法，突顯了奧本海默各時期所要面對的抉擇。 另外，本片的演員們表演堪稱一流，在頒獎季一定會帶來各種提名，在此也希望艾蜜莉能得到久違的奧提。 在此多說一句，今年的頒獎季絕對好看刺激，沉寂多年的奧萊塢終於要迎來奧斯卡大年了。 最後，必須強調：無論是誰，做什麼事，在哪裡做，一定要遠離政客才會平安一生。', 4, CAST(N'2023-10-04T14:38:56.933' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (190, 63, 19, N'看完《奧本海默》，我第一個感受是：

得罪人這件事，真的很玄學。

遇到看不慣你的人，你走路先邁左腳可能對方都會因此記恨上你。 所以敏銳有時候是好事，雖然有時候，你以為有人喜歡你可能是個美麗的誤會，但當你感到有人討厭自己，這大概率不會是錯覺。', 4, CAST(N'2023-10-04T14:39:14.333' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (191, 63, 20, N'《奧本海默》是大眾精神產品的典範，其中提醒當代人需要持續思考和麵對的問題是，我們如何和一個（科學）技術主導的世界相處；對電影中的奧本海默來說 ，是發明核彈技術是否正當的問題。', 5, CAST(N'2023-10-04T14:39:56.523' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (192, 63, 21, N'最令我震撼的不是三位一體試驗成功的那一刻，而是在廣島投放原子彈後奧本海默的演講，上學時在歷史書上輕飄飄的幾句話，此刻以具象化的形態呈現在了我的 眼前，了解電影一開始奧本海默耳邊那震耳欲聾的聲音來源，自己竟也不禁冒出一身冷汗。 相較於視覺傳達，這部電影對聲音的控制更為絕妙。
最後揭開了愛因斯坦和奧本海默對話之謎，雖然在意料之中，但心情還是沉重起來，但我並不排斥這種沉重。 正如愛因斯坦所說，奧本海默並不是獨一無二的存在，如果當初奧本海默拒絕，那也一定會有第二個「奧本海默」出現，毀滅不是從三位一體試驗開始，也不是 從廣島原子彈開始，也不是從科學家腦海中的靈感湧現開始，而是從最初的最初，那永恆不變的，人類無盡的慾望和貪婪開始。 所以我實在是很喜歡開頭普羅米修斯的這個類比。
在我看來，看完《芭比》刻意去模仿芭比系裝扮的人和看完《奧本海默》提議往日本投放核武的人是同一類人。', 5, CAST(N'2023-10-04T14:40:15.250' AS DateTime))
GO
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (193, 63, 22, N'《奧本海默》是一部引人深思的傳記片，展現了美國物理學家羅伯特·奧本海默在開發原子彈的歷程中所經歷的挑戰和成長。 影片透過生動的敘事和細緻的角色刻畫，把觀眾帶入了一個充滿智慧和激情的世界，讓我們對人類的科技進步和道德責任有了更深入的思考。', 3, CAST(N'2023-10-04T14:40:45.070' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (194, 63, 23, N'絕對是諾蘭節奏和剪輯最封神的一部作品，不同於記憶碎片和追隨那種創新式的剪輯，想對比於之前懸疑動作居多的作品，這部從頭到尾說到尾的基本純文戲電影讓 人看的絲毫不覺得疲憊，甚至從頭到尾緊繃到尾。 尤其是開頭的蒙太奇，中間的核彈高潮，以及最後審判時的波折和最後所有的壓抑匯集到奧本海默和愛因斯坦的對話，巨大的蘑菇雲騰空而起，只留下坐在電影院目瞪口呆的 我們。', 5, CAST(N'2023-10-04T14:41:23.003' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (195, 63, 24, N'《奧本海默》是一部深度挖掘歷史人物和事件的電影傑作，它挑戰了觀眾對於科學、權力和道德的固有觀念，並促使我們反思這些觀念。 本片以其歷史準確性、藝術才華和思想深度在電影界獨樹一格。', 5, CAST(N'2023-10-04T14:41:41.033' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (196, 63, 25, N'      諾蘭就別拍自己都搞不清楚的宏大時間史詩《信條》，《奧本海默》是一個人的史詩，三小時片長裝得下一生的浮光掠影。唯有他才能把憂鬱症、科學的天賦與大自然的閃電、雷、雨雜簅在一起，卻不顯刻意，奧本海默好像天生攜帶者呼風喚雨，而又脆弱的本我、超我。', 4, CAST(N'2023-10-04T14:42:03.123' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (197, 63, 26, N'毫無疑問的是，《奧本海默》的上映，諾蘭再一次向全世界的觀眾（日本除外）貢獻了一部質量上乘之作，仍然是使用膠片拍攝，而非數碼攝影機，仍然是堅持實景拍攝，而非棚內特效，因為他是這樣一位才華橫溢的、任性的、幸運的導演，因此我也深刻地認為，無論是作為膠片愛好者還是電影觀眾，他的電影上映之時即是一個節日的開始。', 4, CAST(N'2023-10-04T14:42:21.473' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (199, 63, 27, N'很諾蘭的匠氣超過才氣的作品，懂得熟練地使用一套偏工業化的手法去將影片提升（渲染）到一定程度，但似乎就沒有其他更有意思的了，表達的思想也很老套和膚淺，其中的一些試聽和表現的處理甚至也很老套，比如對奧本海默早年在歐洲求學時，他內心的某種掙扎和黑暗的表現手法就是他的夢境：夢到了原子鍊式反應的爆炸，在課堂上走神，腦袋裡是他的夢境，在他想毒死他導師的時候，也僅僅是透過弦樂的堆砌和模板化的好萊塢式的神態表演來展現，而且在說的台詞在明明非常乏味的情況下，大肆使用種種套路手法渲染，把它包裝得似乎有些什麼東西，讓人感覺是沒有內涵的華麗——而這種華麗恰恰是最令人反感。', 3, CAST(N'2023-10-04T14:42:54.780' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (200, 63, 28, N'太喜歡諾導對節奏的把握，三小時一點都不覺得長，連呼吸的節奏彷若都被他牢牢掌控。 反而在後半段聽證會那裡有短兵相接之感，在黑白膠片裡揭開Strauss內心黑暗的真相，容不得思考的驚訝。

蘑菇雲被拍的很美，靜默，唯有呼吸。 慶祝會上跺腳聲，奧本海默腦海裡的幻想，那些似笑若哭的臉。 演員的每個細微表情都被膠卷敏銳捕捉，共感。

最給我重擊的是片尾和愛因斯坦的對話，I believe we did. 舉重若輕的說出，卻如若向觀眾投下一顆原子彈。 湖上的漣漪，地圖上的漣漪。', 5, CAST(N'2023-10-04T14:43:58.227' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (201, 64, 28, N'好陳舊，從人物到情節每一處都如此陳舊，而且很多處都有一種可疑的幾十年前低成本B級片的味兒是怎麼回事。但也有可能人家就是追求這個感覺，土到極致就是潮，我祝你成功吧', 3, CAST(N'2023-10-04T14:44:36.160' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (202, 64, 27, N'奶奶那句打倒帝國主義還挺搞笑的。本片有意融入了各種拉美文化，以及強調家庭這一點，也是以往超英電影很少見的，應該也是拉丁美洲文化的一層吧。但是，基本上就是DC很難看的超級英雄電影了，超級英雄的能力毫無吸引力，而且很多熟悉的影子。劇情也是老土和俗套到要命，而且，男主角的行為也有些傻，情節又基本沒啥緊張感。挺無聊的一個片子。', 2, CAST(N'2023-10-04T14:44:46.283' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (203, 64, 26, N'時且平庸的作品，整體很塑膠質感，最後好像是cosplay出來的人物。沒什麼原創性，你能看到鋼鐵人、蝙蝠俠、綠燈俠，甚至星河戰隊，都是前輩和別人玩剩下的東西，聖甲蟲也沒什麼記憶點。文戲更是俗不可耐，男女主沒見幾面就要吻上了，情緒和感情毫無刻畫，最後輸出全靠吼…', 1, CAST(N'2023-10-04T14:44:58.297' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (204, 65, 25, N'情節一般邏輯不嚴謹', 3, CAST(N'2023-10-04T14:45:26.047' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (205, 65, 24, N'節奏緊湊，剪輯了得，像是在看幾分鐘看完大片。', 3, CAST(N'2023-10-04T14:45:33.050' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (206, 73, 23, N'看了兩集就超級想要上班想要那種忙碌的感覺', 5, CAST(N'2023-10-04T14:46:05.480' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (207, 73, 22, N'慢慢補美劇看吧……這片子我還以為很醫務，結果很言情，我喜歡house多多了。這片子最棒的是它裡面的音樂。', 4, CAST(N'2023-10-04T14:46:13.280' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (208, 73, 21, N'ABC的套路，但是我很買帳', 5, CAST(N'2023-10-04T14:46:20.457' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (209, 73, 20, N'討厭格雷，其他人都喜歡~', 4, CAST(N'2023-10-04T14:46:26.583' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (210, 73, 40, N'看到S04筋疲力盡了盡實在看不下去。我還是中意插科打諢多過這種家長里短。誰要管你們這些長得又不是很好看的人最後到底跟誰在一起啊…', 4, CAST(N'2023-10-04T14:46:36.553' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (211, 74, 41, N'美中不足的是，伊朗隊太弱了。', 4, CAST(N'2023-10-04T14:47:05.350' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (212, 74, 42, N'片名非要硬加個「陷落」很討厭，根本不是一個系列，人家正統陷落第四部還在開發中。蓋里奇拍了設定在撤軍前的美國良心，這部是撤軍後的故事，特工和翻譯被多方追殺，沙漠追車，AK打飛機，沙漠有大場面爆炸戲，「撤軍後的阿富汗就像冷戰裡的柏林，學生軍，isisk，軍閥，巴基斯坦人，印度人，伊朗人，毛子，某大國，各方勢力混戰', 3, CAST(N'2023-10-04T14:47:13.087' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (213, 74, 43, N'男二騎了一部戲的摩托精神可嘉', 2, CAST(N'2023-10-04T14:47:20.613' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (214, 74, 44, N'提前觀影了，還不錯，可以有三星，沙漠戰鬥還是值得到戲院觀看的。故事情節一眼望到底，值得稱讚的是對中東地區複雜的國際形勢的刻畫以及片尾透露的反戰思想，這兩點算是拯救了全篇無可救藥的美式“正義”和英雄主義。看了兩部男主角領銜主演的電影，竟然都是有一個女兒的美國孤膽英雄。另一位本片著力刻畫的人物是巴基斯坦“007”，導演大概對這個角色十分喜愛，賦予了他豐富的性格，瀟灑的出場，幾乎喧賓奪主。', 3, CAST(N'2023-10-04T14:47:30.647' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (215, 74, 45, N'陷落哥這次是真的無聊，而且好der，就美國人，阿富汗人算人，Taliban人和伊朗人不算人是吧，他們回家可以，另外那些人就該死是吧', 1, CAST(N'2023-10-04T14:47:43.253' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (216, 75, 46, N'要啥沒啥。', 1, CAST(N'2023-10-04T14:48:10.893' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (217, 75, 47, N'誰看誰傻逼', 1, CAST(N'2023-10-04T14:48:19.687' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (218, 50, 48, N'BGM太好聽了！海默的眼睛會說話！', 5, CAST(N'2023-10-04T14:52:02.460' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (219, 50, 47, N'男主角像玩具小熊，眼睛像帶了美瞳w', 5, CAST(N'2023-10-04T14:52:08.770' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (220, 50, 49, N'嗯好老婆好醫生還有什麼，統統放馬過來吧，難得有個好點的劇能看了~', 5, CAST(N'2023-10-04T14:52:23.443' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (221, 50, 46, N'不要強制給肖恩配女朋友好嗎，我們肖恩是要搞事業的男人。', 4, CAST(N'2023-10-04T14:52:43.850' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (222, 50, 45, N'追到S03了～希望能多給Dr.Shaun事業線戲份吧，別加太多狗血感情戲，別走格蕾的老路，咱還是專注搞事業吧。', 4, CAST(N'2023-10-04T14:52:52.987' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (223, 50, 44, N'依舊封神第六季借林醫生走黑暗面首集銜接鋪墊穩噹當第二集林醫生直言痛恨墨菲太愛編劇把一個好人且正常人的內心血淋淋的剖開呈現如果當時不改手術她還會活著嗎無法證明的假說到頭來墨菲還是被當作異類看待so real', 5, CAST(N'2023-10-04T14:53:12.443' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (224, 50, 43, N'不曉得為啥一年更比一年戳淚點…', 5, CAST(N'2023-10-04T14:53:19.330' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (225, 54, 42, N'他們生出來的孩子算泥巴種麼。很多橋段還蠻搞笑的', 4, CAST(N'2023-10-04T14:53:57.843' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (226, 54, 11, N'不經意會發現有幾位老的大牌在裡面。', 4, CAST(N'2023-10-04T14:54:06.240' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (227, 54, 12, N'威爾法瑞爾真是不招人喜歡呢！不過這個故事俗套的讓人有些無語，基本上沒有亮點。。', 2, CAST(N'2023-10-04T14:54:15.340' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (228, 56, 13, N'什麼鬼東西，比第一部還爛，後面幾乎是喜劇……一分滾粗。', 1, CAST(N'2023-10-04T14:54:53.530' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (229, 56, 14, N'觀感不是很好，感覺宗教驚悚片這類片多數最後靠法器什麼的，就有點垮了，而且拍太長了，剪輯有點亂，這一點我覺得比電影本身要恐怖一些。', 2, CAST(N'2023-10-04T14:55:02.307' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (230, 56, 15, N'其實暗喻的是情感關係。分手了就別來找我，物是人非，前男友只會變得比鬼還可怕。為什麼要找那雙眼睛，因為戀愛腦缺的就是一雙識人的慧眼啊，幫你看透渣男！', 3, CAST(N'2023-10-04T14:55:10.843' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (231, 66, 16, N'莎繽紛：被光劍捅到怎麼會死呢，一天就養好了🐶 奎剛金的絕地英靈：？？？👋', 5, CAST(N'2023-10-04T14:55:46.440' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (232, 66, 17, N'除了奎剛金之外，其他人被捅穿了都不會去見奎剛金是吧', 3, CAST(N'2023-10-04T14:55:54.113' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (233, 72, 18, N'第六集真的拉高了很多，如果接下來能保持這個水準，那將成為經典', 5, CAST(N'2023-10-04T14:56:22.113' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (234, 72, 19, N'要是能少點男1的鏡頭，那就更好了，感覺不是很聰明的樣子', 1, CAST(N'2023-10-04T14:56:31.113' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (235, 25, 20, N'強在沒有一個討人喜歡的角色，居然還能紅。', 3, CAST(N'2023-10-04T14:57:16.107' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (236, 25, 21, N'Best cartoon ever!', 5, CAST(N'2023-10-04T14:57:39.873' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (237, 25, 22, N'依然搞笑', 5, CAST(N'2023-10-04T14:57:47.633' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (238, 25, 23, N'太腦殘了(*￣▽￣)y', 5, CAST(N'2023-10-04T14:58:08.727' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (239, 25, 24, N'好短啊', 3, CAST(N'2023-10-04T14:58:17.143' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (240, 25, 25, N'31載的黃金劇集冷清的可憐吶', 4, CAST(N'2023-10-04T14:58:41.440' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (241, 25, 26, N'到底是怎麼做到播到現在還是很好看，Lisa和Bart奇怪又溫馨的兄妹情我可以看到永遠。', 5, CAST(N'2023-10-04T14:58:52.167' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (242, 29, 27, N'good!', 3, CAST(N'2023-10-04T14:59:30.137' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (1, N'傑西', N'jessy', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (2, N'喬安', N'joanne', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (3, N'賽門', N'simon', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (4, N'柔斯', N'rose', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (5, N'吉米', N'jimmy', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [IsConfirmed], [ConfirmCode]) VALUES (6, N'艾倫', N'allen', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vipitems] ON 

INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (8, 12, 1, 27, CAST(N'2023-09-23T17:47:47.543' AS DateTime), CAST(N'2023-09-24T00:00:00.000' AS DateTime), CAST(N'2023-10-23T17:47:47.543' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (9, 3, 1, 17, CAST(N'2023-08-30T17:47:51.630' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:47:51.630' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (11, 20, 1, 28, CAST(N'2022-12-25T17:49:33.003' AS DateTime), CAST(N'2022-12-26T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (12, 2, 1, 1, CAST(N'2023-08-30T17:50:03.260' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:50:03.260' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (13, 26, 1, 29, CAST(N'2022-11-08T17:50:08.360' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (14, 17, 1, 13, CAST(N'2023-08-23T00:00:00.000' AS DateTime), CAST(N'2023-08-24T00:00:00.000' AS DateTime), CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (15, 18, 1, 14, CAST(N'2023-08-08T00:00:00.000' AS DateTime), CAST(N'2023-08-09T00:00:00.000' AS DateTime), CAST(N'2023-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (16, 17, 1, 16, CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-26T00:00:00.000' AS DateTime), CAST(N'2023-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (17, 26, 1, 30, CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2023-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (18, 7, 1, 19, CAST(N'2023-03-16T00:00:00.000' AS DateTime), CAST(N'2023-03-16T00:00:00.000' AS DateTime), CAST(N'2023-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (19, 48, 1, 3, CAST(N'2023-09-30T00:00:00.000' AS DateTime), CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(N'2023-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (20, 2, 1, 2, CAST(N'2023-04-04T00:00:00.000' AS DateTime), CAST(N'2023-04-04T00:00:00.000' AS DateTime), CAST(N'2023-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (21, 2, 1, 12, CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(N'2023-05-04T00:00:00.000' AS DateTime), CAST(N'2023-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (22, 2, 1, 15, CAST(N'2023-09-15T00:00:00.000' AS DateTime), CAST(N'2023-09-15T00:00:00.000' AS DateTime), CAST(N'2023-10-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (25, 3, 1, 18, CAST(N'2023-10-02T22:24:59.517' AS DateTime), CAST(N'2023-10-02T22:24:59.517' AS DateTime), CAST(N'2023-11-02T22:24:59.517' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (27, 6, 1, 20, CAST(N'2023-10-02T22:42:38.670' AS DateTime), CAST(N'2023-10-02T22:42:38.670' AS DateTime), CAST(N'2023-11-02T22:42:38.670' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (30, 18, 1, 23, CAST(N'2023-10-03T09:02:00.260' AS DateTime), CAST(N'2023-10-03T09:02:00.390' AS DateTime), CAST(N'2023-11-03T09:02:15.907' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (31, 17, 2, 24, CAST(N'2023-10-03T09:15:02.097' AS DateTime), CAST(N'2023-10-03T09:15:02.207' AS DateTime), CAST(N'2024-01-03T09:15:06.067' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (32, 7, 1, 25, CAST(N'2023-10-03T09:25:17.203' AS DateTime), CAST(N'2023-10-03T09:25:17.203' AS DateTime), CAST(N'2023-11-03T09:25:17.203' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (33, 22, 2, 26, CAST(N'2023-10-03T09:34:56.633' AS DateTime), CAST(N'2023-10-03T09:34:56.877' AS DateTime), CAST(N'2024-01-03T09:35:00.313' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (34, 58, 1, 31, CAST(N'2023-10-03T12:55:00.930' AS DateTime), CAST(N'2023-10-03T12:55:00.930' AS DateTime), CAST(N'2023-11-03T12:55:00.930' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (37, 20, 2, 34, CAST(N'2023-10-03T13:30:14.777' AS DateTime), CAST(N'2023-10-03T13:30:14.777' AS DateTime), CAST(N'2024-01-03T13:30:14.777' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vipitems] OFF
GO
ALTER TABLE [dbo].[Blacklists] ADD  CONSTRAINT [DF_Blacklists_BlacklistTime]  DEFAULT (getdate()) FOR [BlacklistTime]
GO
ALTER TABLE [dbo].[FAQs] ADD  CONSTRAINT [DF_FAQs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[GuestBooks] ADD  CONSTRAINT [DF_GuestBooks_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[MediaInfos] ADD  CONSTRAINT [DF_MediaInfos_Adult]  DEFAULT ((0)) FOR [Adult]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Publishdate]  DEFAULT (getdate()) FOR [Publishdate]
GO
ALTER TABLE [dbo].[Ratings] ADD  CONSTRAINT [DF_Ratings_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Enabled]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Vipitems] ADD  CONSTRAINT [DF_Vips_PaymentDate]  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Blacklists]  WITH CHECK ADD  CONSTRAINT [FK_Blacklists_BlacklistReasons] FOREIGN KEY([BlacklistReasonId])
REFERENCES [dbo].[BlacklistReasons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blacklists] CHECK CONSTRAINT [FK_Blacklists_BlacklistReasons]
GO
ALTER TABLE [dbo].[Blacklists]  WITH CHECK ADD  CONSTRAINT [FK_Blacklists_Members] FOREIGN KEY([Id])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blacklists] CHECK CONSTRAINT [FK_Blacklists_Members]
GO
ALTER TABLE [dbo].[Blacklists]  WITH CHECK ADD  CONSTRAINT [FK_Blacklists_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blacklists] CHECK CONSTRAINT [FK_Blacklists_Users]
GO
ALTER TABLE [dbo].[Creditcards]  WITH CHECK ADD  CONSTRAINT [FK_Creditcards_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Creditcards] CHECK CONSTRAINT [FK_Creditcards_Members]
GO
ALTER TABLE [dbo].[FAQs]  WITH CHECK ADD  CONSTRAINT [FK_FAQs_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FAQs] CHECK CONSTRAINT [FK_FAQs_Users]
GO
ALTER TABLE [dbo].[FavoriteMedias]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteMedias_MediaInfos] FOREIGN KEY([MediaInformId])
REFERENCES [dbo].[MediaInfos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FavoriteMedias] CHECK CONSTRAINT [FK_FavoriteMedias_MediaInfos]
GO
ALTER TABLE [dbo].[FavoriteMedias]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteMedias_Users] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FavoriteMedias] CHECK CONSTRAINT [FK_FavoriteMedias_Users]
GO
ALTER TABLE [dbo].[MediaInfos]  WITH CHECK ADD  CONSTRAINT [FK_MediaInfos_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[MediaInfos] CHECK CONSTRAINT [FK_MediaInfos_Categories]
GO
ALTER TABLE [dbo].[MediaInfos]  WITH CHECK ADD  CONSTRAINT [FK_MediaInfos_LanguageCodes] FOREIGN KEY([OriginalLanguageId])
REFERENCES [dbo].[LanguageCodes] ([Id])
GO
ALTER TABLE [dbo].[MediaInfos] CHECK CONSTRAINT [FK_MediaInfos_LanguageCodes]
GO
ALTER TABLE [dbo].[MediaInfos_Genres_Rel]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[MediaInfos_Genres_Rel] CHECK CONSTRAINT [FK_VideoGenres_Genres]
GO
ALTER TABLE [dbo].[MediaInfos_Genres_Rel]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_MediaInfos] FOREIGN KEY([MediaInfoId])
REFERENCES [dbo].[MediaInfos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MediaInfos_Genres_Rel] CHECK CONSTRAINT [FK_VideoGenres_MediaInfos]
GO
ALTER TABLE [dbo].[MediaInfos_OttTypes_Rel]  WITH CHECK ADD  CONSTRAINT [FK_VideoOttTypes_MediaInfos] FOREIGN KEY([MediaInfoId])
REFERENCES [dbo].[MediaInfos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MediaInfos_OttTypes_Rel] CHECK CONSTRAINT [FK_VideoOttTypes_MediaInfos]
GO
ALTER TABLE [dbo].[MediaInfos_OttTypes_Rel]  WITH CHECK ADD  CONSTRAINT [FK_VideoOttTypes_OttTypes] FOREIGN KEY([OttTypeId])
REFERENCES [dbo].[OttTypes] ([Id])
GO
ALTER TABLE [dbo].[MediaInfos_OttTypes_Rel] CHECK CONSTRAINT [FK_VideoOttTypes_OttTypes]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_MediaInfos] FOREIGN KEY([MediaInfoId])
REFERENCES [dbo].[MediaInfos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_MediaInfos]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Members]
GO
ALTER TABLE [dbo].[Vipitems]  WITH CHECK ADD  CONSTRAINT [FK_Vipitems_Creditcards] FOREIGN KEY([CreditcardId])
REFERENCES [dbo].[Creditcards] ([Id])
GO
ALTER TABLE [dbo].[Vipitems] CHECK CONSTRAINT [FK_Vipitems_Creditcards]
GO
ALTER TABLE [dbo].[Vipitems]  WITH CHECK ADD  CONSTRAINT [FK_VipPays_PayTypes] FOREIGN KEY([PayTypeId])
REFERENCES [dbo].[PayTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vipitems] CHECK CONSTRAINT [FK_VipPays_PayTypes]
GO
ALTER TABLE [dbo].[Vipitems]  WITH CHECK ADD  CONSTRAINT [FK_Vips_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vipitems] CHECK CONSTRAINT [FK_Vips_Members]
GO
/****** Object:  StoredProcedure [dbo].[CreateCategory]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCategory]
    @Name NVARCHAR(255)
AS
BEGIN
    INSERT INTO Categories (Name)
    VALUES (@Name);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory]
    @Id INT
AS
BEGIN
    DELETE FROM Categories WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCategories]
AS
BEGIN
    SELECT * FROM Categories;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoryById]
    @Id INT
AS
BEGIN
    SELECT * FROM Categories WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCategories]
    @Name NVARCHAR(100) = NULL
AS
BEGIN
    SELECT * FROM Categories WHERE (@Name IS NULL OR Name LIKE '%' + @Name + '%');
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2023/10/4 下午 03:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory]
    @Id INT,
    @Name NVARCHAR(255)
AS
BEGIN
    UPDATE Categories
    SET Name = @Name
    WHERE Id = @Id;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'黑名單理由ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BlacklistReasons', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BlacklistReasons', @level2type=N'COLUMN',@level2name=N'Reason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示順序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BlacklistReasons', @level2type=N'COLUMN',@level2name=N'DisplayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'黑名單理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BlacklistReasons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'黑名單ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blacklists', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連結管理者編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blacklists', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blacklists', @level2type=N'COLUMN',@level2name=N'BlacklistTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blacklists', @level2type=N'COLUMN',@level2name=N'NextRestorationTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'黑名單' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blacklists'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類別ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'信用卡卡號 16碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Creditcards', @level2type=N'COLUMN',@level2name=N'CardNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背面末三碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Creditcards', @level2type=N'COLUMN',@level2name=N'ThreeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓氏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Creditcards', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Creditcards', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'信用卡付費資訊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Creditcards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'問與答ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'問題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs', @level2type=N'COLUMN',@level2name=N'Question'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs', @level2type=N'COLUMN',@level2name=N'Answer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0不顯示,1顯示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示順序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs', @level2type=N'COLUMN',@level2name=N'DisplayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'問與答' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FAQs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genres', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類型名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genres', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genres'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EMAIL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主旨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'討論板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuestBooks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片資訊編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類別Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片簡介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'OverView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成人片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'Adult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片原始語言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'OriginalLanguageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片原始標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'OriginalTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景圖片路徑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'BackdropPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片封面路徑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos', @level2type=N'COLUMN',@level2name=N'PosterPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片資訊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類型關聯ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_Genres_Rel', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片資訊ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_Genres_Rel', @level2type=N'COLUMN',@level2name=N'MediaInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_Genres_Rel', @level2type=N'COLUMN',@level2name=N'GenreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片類型關聯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_Genres_Rel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片上映平台關聯ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_OttTypes_Rel', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片資訊ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_OttTypes_Rel', @level2type=N'COLUMN',@level2name=N'MediaInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上映平台ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_OttTypes_Rel', @level2type=N'COLUMN',@level2name=N'OttTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片上映平台類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaInfos_OttTypes_Rel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'BirthOfDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子郵件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號創建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前台會員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新消息ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發布日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Publishdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上映平台ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OttTypes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上映平台名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OttTypes', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上映平台種類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OttTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'費用種類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayTypes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'種類,有年費和月費' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayTypes', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示順序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayTypes', @level2type=N'COLUMN',@level2name=N'DisplayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'費用種類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'評分編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影片資訊 Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'MediaInfoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'評論' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'評分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發布時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員評分影片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ratings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'IsConfirmed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'後臺管理者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高級會員ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連結會員編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連結年費月費類型編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems', @level2type=N'COLUMN',@level2name=N'PayTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失效日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems', @level2type=N'COLUMN',@level2name=N'ExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高級會員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vipitems'
GO
