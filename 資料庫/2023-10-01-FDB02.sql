USE [FDB02]
GO
/****** Object:  Table [dbo].[BlacklistReasons]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Blacklists]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Creditcards]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[FAQs]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[FavoriteMedias]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Genres]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[GuestBooks]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[LanguageCodes]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[MediaInfos]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[MediaInfos_Genres_Rel]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[MediaInfos_OttTypes_Rel]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Members]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[OttTypes]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[PayTypes]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Ratings]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
/****** Object:  Table [dbo].[Vipitems]    Script Date: 2023/10/1 下午 11:17:42 ******/
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
SET IDENTITY_INSERT [dbo].[Creditcards] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (1, N'如何收到影片上線時的提醒通知？', N'只要將即將上架的影片、跟播戲劇、動漫或節目，加入[我的收藏]，會在該影片上線後發送推播通知您。', 1, 30, NULL)
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (2, N'如何取消VIP服務？', N'若您深思熟慮後仍決定要取消,請先登入會員,並在首頁由右上角會員的下拉選單點選會員中心，即可進入我的訂閱方案並取消VIP,提醒您取消VIP服務請最遲於次期扣款日的前一日完成。', 1, 40, NULL)
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [Enabled], [DisplayOrder], [UserId]) VALUES (3, N'積分有使用期限嗎？哪裡可以查詢？', N'積分設有使用期限,到期日皆為該年的12/31,提醒您,到期的積分將會自動失效，請務必在效期內使用完畢，以免影響自身權益。您可以登入後,在首頁右上角會員名的下拉選單點選會員中心,即可查剩餘積分與到期日。', 1, 20, NULL)
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteMedias] ON 

INSERT [dbo].[FavoriteMedias] ([Id], [MemberId], [MediaInformId]) VALUES (2, 34, 26)
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

INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (2, N'mini', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'米妮', CAST(N'1987-01-05T00:00:00.000' AS DateTime), N'mini@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-08T13:45:10.307' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (3, N'peter', N'peter2222', N'彼得', CAST(N'1976-03-06T00:00:00.000' AS DateTime), N'peter@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-08T13:46:38.860' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (5, N'mikkel', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'思翰', CAST(N'1975-12-19T22:39:58.000' AS DateTime), N'mohern0@360.cn', CAST(N'2023-09-06T00:00:00.000' AS DateTime), CAST(N'2023-10-07T00:00:00.000' AS DateTime), CAST(N'2023-12-04T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2020-01-07T10:42:34.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (6, N'vinny', N'vinny5555', N'丰逸', CAST(N'1994-06-10T12:13:41.000' AS DateTime), N'vbrookson1@indiatimes.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-01T20:44:11.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (7, N'ulla', N'ulla6666', N'曉晴', CAST(N'2003-04-10T16:30:38.000' AS DateTime), N'uboodle2@mozilla.org', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-02-25T16:36:32.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (8, N'georgie', N'georgie7777', N'欣妍', CAST(N'2008-08-30T02:03:08.000' AS DateTime), N'ggrzegorek3@wp.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-17T05:12:04.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (9, N'jacob', N'jacob8888', N'依娜', CAST(N'1998-10-19T09:02:01.000' AS DateTime), N'jgibling4@virginia.edu', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-25T12:40:52.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (10, N'janene', N'janene9999', N'羽彤', CAST(N'1992-10-12T17:01:06.000' AS DateTime), N'jbuffy5@mail.ru', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-01-21T14:35:42.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (11, N'garek', N'garek1212', N'一烽', CAST(N'1973-01-03T13:29:17.000' AS DateTime), N'gbabber6@tmall.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-06-06T17:16:43.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (12, N'alika', N'alika2323', N'浩成', CAST(N'2006-02-16T22:01:29.000' AS DateTime), N'aleyton7@biglobe.ne.jp', CAST(N'2023-09-22T00:00:00.000' AS DateTime), CAST(N'2023-10-23T17:47:47.543' AS DateTime), NULL, NULL, NULL, CAST(N'2020-06-24T00:03:02.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (13, N'audrie', N'audrie3434', N'丰逸', CAST(N'1973-07-08T16:29:07.000' AS DateTime), N'amacpaden8@huffingtonpost.com', CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:47:51.630' AS DateTime), NULL, NULL, NULL, CAST(N'2022-08-06T02:20:22.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (14, N'caldwell', N'caldwell4545', N'博菘', CAST(N'2005-07-21T13:32:39.000' AS DateTime), N'cgalle9@hibu.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-09T08:12:00.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (15, N'kirstyn', N'kirstyn5656', N'清凌', CAST(N'2010-12-02T17:01:01.000' AS DateTime), N'klongbonea@typepad.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-17T20:15:41.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (16, N'harlan', N'harlan6767', N'墨含', CAST(N'1999-07-17T17:49:50.000' AS DateTime), N'hkleiserb@hc360.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-04-19T05:16:56.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (17, N'clark', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'宸瑜', CAST(N'2006-04-18T05:59:45.000' AS DateTime), N'chadgkissc@indiegogo.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-17T18:27:24.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (18, N'rina', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'凰羽', CAST(N'2007-04-10T07:35:25.000' AS DateTime), N'rthorndaled@dion.ne.jp', NULL, NULL, CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-28T18:36:34.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (19, N'feodor', N'feodor1234', N'梓彤', CAST(N'1970-01-13T09:58:37.000' AS DateTime), N'fmartone@creativecommons.org', NULL, NULL, CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2020-01-27T17:25:19.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (20, N'deni', N'deni1234', N'雨婷', CAST(N'1987-08-25T10:19:00.000' AS DateTime), N'delse0@friendfeed.com', NULL, NULL, CAST(N'2023-10-17T18:33:55.000' AS DateTime), NULL, NULL, CAST(N'2022-12-22T11:09:53.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (21, N'phyllida', N'phyllida1234', N'欣妍', CAST(N'1977-02-04T09:15:43.000' AS DateTime), N'psprouls1@e-recht24.de', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-17T18:22:19.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (22, N'eden', N'eden1234', N'香茹', CAST(N'2004-11-12T23:20:39.000' AS DateTime), N'emclleese2@about.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-09-01T07:59:23.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (23, N'maire', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'麗卿', CAST(N'1972-07-15T15:28:26.000' AS DateTime), N'mcornhill3@slate.com', CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:50:03.260' AS DateTime), NULL, NULL, NULL, CAST(N'2023-06-29T15:49:22.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (24, N'korey', N'korey1234', N'莉姿', CAST(N'1971-09-08T19:21:39.000' AS DateTime), N'kbalas4@feedburner.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-26T23:04:21.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (25, N'laurel', N'laurel1234', N'莉姿', CAST(N'1997-07-18T13:48:05.000' AS DateTime), N'lgini5@elegantthemes.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-27T07:55:27.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (26, N'reynold', N'reynold1234', N'婧琪', CAST(N'2000-10-21T04:23:30.000' AS DateTime), N'rspillard6@google.co.uk', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18T11:05:00.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (27, N'ginger', N'ginger1234', N'昕磊', CAST(N'1971-05-03T02:50:35.000' AS DateTime), N'gsheasby7@sitemeter.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-14T22:05:25.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (28, N'laurena', N'laurena1234', N'尚霖', CAST(N'1988-01-23T18:44:27.000' AS DateTime), N'ljones8@cyberchimps.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-03-19T15:06:26.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (29, N'petronilla', N'petronilla1234', N'浩成', CAST(N'1970-12-06T05:35:30.000' AS DateTime), N'psearles9@slashdot.org', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-06-03T05:50:09.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (30, N'koralle', N'koralle1234', N'亦涵', CAST(N'1973-05-24T14:37:25.000' AS DateTime), N'khumana@java.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-14T04:19:32.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (34, N'cola', N'cola1q1q', N'可樂', CAST(N'1999-10-01T00:00:00.000' AS DateTime), N'cola@gmailcom', CAST(N'2023-09-10T00:00:00.000' AS DateTime), CAST(N'2023-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2023-03-23T13:06:12.657' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (39, N'yoyo', N'95F12F96D5A52FA997BC0B3266E8B7DA22E3A6B86DCD88FB2BDFA9038A7F2970', N'佑佑', CAST(N'1998-12-22T00:00:00.000' AS DateTime), N'yoyo4me@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-24T19:24:14.240' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (40, N'weedasd', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'偉德', CAST(N'1990-10-11T00:00:00.000' AS DateTime), N'weedasd@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-24T19:55:19.480' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (41, N'helena', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'海倫', CAST(N'1998-12-11T00:00:00.000' AS DateTime), N'helena@gmail.com', NULL, NULL, NULL, 0, N'3a813e7face348779d8424ed70dc2f77', CAST(N'2023-09-24T20:56:13.607' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (42, N'yozhi', N'C7D15FB26B28A60D5F5EC2FF95DDE9DC553F97F9DAC27F1551B87F6835B83535', N'佑慈', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'yoyo11@gmail.com', NULL, NULL, NULL, 0, N'fd725fc5ae7c493383a8a511c5fed32b', CAST(N'2023-09-25T13:49:03.380' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (43, N'lalaisme', N'98F5499CF4DCDD78615AB251E3E902DA49C1C34F2D8EED4F091DB8C2ECA9A28B', N'笑笑', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'lala@gmail.com', NULL, NULL, NULL, 0, N'70ba3828fbca4b8fa8cedc35665fcfe9', CAST(N'2023-09-25T13:55:20.977' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (44, N'uniqlo', N'96B0C336010B5C89565EA5BFB50E585639EC04A0A952B7FE460AAEA42ADC2752', N'小咪', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'uniqlo@gmail.com', NULL, NULL, NULL, 0, N'3a26a05212064a8db6bb91e6676bbc50', CAST(N'2023-09-25T13:55:57.610' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (45, N'queen', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'小雅', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'queen@gmail.com', NULL, NULL, NULL, 0, N'f10fd36419d147c389583e0ea4fb1564', CAST(N'2023-09-25T13:59:30.970' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (46, N'miya', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'米亞', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'miya@gmail.com', NULL, NULL, NULL, 0, N'ddddabb5470d494f8cef7869d17e8a1e', CAST(N'2023-09-25T14:00:19.387' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (47, N'helenan', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'海納', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'helenan@gmail.com', NULL, NULL, NULL, 1, NULL, CAST(N'2023-09-25T14:02:17.710' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (48, N'allen', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'艾倫', CAST(N'1986-02-04T00:00:00.000' AS DateTime), N'lee871222@gmail.com', CAST(N'2023-09-10T00:00:00.000' AS DateTime), CAST(N'2023-10-09T00:00:00.000' AS DateTime), NULL, 1, N'75e3595705fe406d9ac17463042c0e4c', CAST(N'2023-07-25T14:09:56.670' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (49, N'aaa', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'幼幼aa', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'allenq5@gmail.com', NULL, NULL, NULL, 0, N'a3f08f04e7da4b44ba2cee92d9ded7e9', CAST(N'2023-09-25T14:10:40.133' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (50, N'111', N'8A74CF37CD5E5CB72F042CF2EBB617EBA1075B0FE50F856FA28CB0D4FE5415F7', N'幼幼qqq', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'allen5@gmail.comw', NULL, NULL, NULL, 0, N'7e9f46ee5dae452cb3c3f9e0513c6de4', CAST(N'2023-09-25T14:13:26.247' AS DateTime))
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [BirthOfDate], [Email], [VipStartdate], [VipEnddate], [BlacklistEnddate], [IsConfirmed], [ConfirmedCode], [CreatedTime]) VALUES (51, N'122222', N'95F12F96D5A52FA997BC0B3266E8B7DA22E3A6B86DCD88FB2BDFA9038A7F2970', N'test11', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'allen5rrr@gmail.comw', NULL, NULL, NULL, 0, N'3e89d56ff0b44c20ae2aa57686538b47', CAST(N'2023-09-25T14:25:26.620' AS DateTime))
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
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (100, 26, 30, N'ffffffff', 3, CAST(N'2023-09-27T17:19:38.523' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (101, 26, 30, N'EEE', 1, CAST(N'2023-09-28T11:07:41.760' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (102, 26, 30, N'H', 3, CAST(N'2023-09-28T11:09:45.620' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (103, 59, 30, N'SFASF', 5, CAST(N'2023-09-28T14:49:26.520' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (104, 52, 30, N'EWEWE', 2, CAST(N'2023-09-28T14:51:08.180' AS DateTime))
INSERT [dbo].[Ratings] ([Id], [MediaInfoId], [MemberId], [Comment], [Rate], [CreatedTime]) VALUES (105, 26, 30, N'44', 2, CAST(N'2023-09-28T16:06:16.143' AS DateTime))
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

INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (5, 5, 1, 1, CAST(N'2023-09-08T00:00:00.000' AS DateTime), CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (8, 12, 1, 1, CAST(N'2022-09-23T17:47:47.543' AS DateTime), CAST(N'2023-09-24T00:00:00.000' AS DateTime), CAST(N'2023-10-23T17:47:47.543' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (9, 13, 1, 1, CAST(N'2023-08-30T17:47:51.630' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:47:51.630' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (11, 20, 1, 1, CAST(N'2022-12-25T17:49:33.003' AS DateTime), CAST(N'2022-12-26T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (12, 23, 1, 1, CAST(N'2023-08-30T17:50:03.260' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2023-09-30T17:50:03.260' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (13, 26, 1, 1, CAST(N'2022-11-08T17:50:08.360' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (14, 12, 1, 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), CAST(N'2023-08-24T00:00:00.000' AS DateTime), CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (15, 5, 1, 1, CAST(N'2023-08-08T00:00:00.000' AS DateTime), CAST(N'2023-08-09T00:00:00.000' AS DateTime), CAST(N'2023-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (16, 20, 1, 1, CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-26T00:00:00.000' AS DateTime), CAST(N'2023-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (17, 26, 1, 1, CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2023-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (18, 7, 1, 1, CAST(N'2023-03-16T00:00:00.000' AS DateTime), CAST(N'2023-03-16T00:00:00.000' AS DateTime), CAST(N'2023-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (19, 48, 1, 1, CAST(N'2023-09-30T00:00:00.000' AS DateTime), CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(N'2023-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (20, 2, 1, 1, CAST(N'2023-04-04T00:00:00.000' AS DateTime), CAST(N'2023-04-04T00:00:00.000' AS DateTime), CAST(N'2023-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Vipitems] ([Id], [MemberId], [PayTypeId], [CreditcardId], [PaymentDate], [StartDate], [ExpiryDate]) VALUES (21, 2, 1, 1, CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(N'2023-05-04T00:00:00.000' AS DateTime), CAST(N'2023-06-03T00:00:00.000' AS DateTime))
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
GO
ALTER TABLE [dbo].[FavoriteMedias] CHECK CONSTRAINT [FK_FavoriteMedias_MediaInfos]
GO
ALTER TABLE [dbo].[FavoriteMedias]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteMedias_Users] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
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
/****** Object:  StoredProcedure [dbo].[GetMediaInfos]    Script Date: 2023/10/1 下午 11:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMediaInfos]
AS
BEGIN
    SELECT * FROM MediaInfos;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPayFees]    Script Date: 2023/10/1 下午 11:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayFees]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT * FROM PayFees ORDER BY DisplayOrder
	
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPayFee]    Script Date: 2023/10/1 下午 11:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertPayFee]
(
@Fee	INT,
@DisplayOrder	INT
)
AS
BEGIN;
	SET NOCOUNT ON;

	DECLARE @NewId INT;
	INSERT INTO PayFees(Fee, DisplayOrder)
	VALUES(@Fee, @DisplayOrder);

	-- 取得剛剛新增記錄的 id
	SET @NewId = SCOPE_IDENTITY();

	-- 傳回新增的記錄
	SELECT * FROM PayFees WHERE Id = @NewId;

	SET NOCOUNT OFF;
END;
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
