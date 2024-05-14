USE [master]
GO
/****** Object:  Database [dbEduPlatform]    Script Date: 5/14/2024 3:48:33 PM ******/
CREATE DATABASE [dbEduPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbEduPlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbEduPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbEduPlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbEduPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbEduPlatform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbEduPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbEduPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbEduPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbEduPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbEduPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbEduPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbEduPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbEduPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbEduPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbEduPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbEduPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbEduPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbEduPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbEduPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbEduPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbEduPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbEduPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbEduPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbEduPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbEduPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbEduPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbEduPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbEduPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbEduPlatform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbEduPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [dbEduPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbEduPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbEduPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbEduPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbEduPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbEduPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbEduPlatform] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbEduPlatform] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbEduPlatform]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[ChapterName] [nvarchar](50) NULL,
	[ChapterNumber] [int] NULL,
	[ChapterDescription] [nvarchar](max) NULL,
	[CourseID] [int] NULL,
 CONSTRAINT [PK_Chapters] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Part]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Part](
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [nvarchar](50) NULL,
	[PartNumber] [int] NULL,
	[PartDescription] [nvarchar](max) NULL,
	[PartVideo] [nvarchar](max) NULL,
	[VideoMin] [int] NULL,
	[VideoSec] [int] NULL,
	[ChapterID] [int] NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[CoursePrice] [numeric](6, 2) NULL,
	[TrainerShareRate] [numeric](3, 2) NULL,
	[CreateDate] [date] NULL,
	[IsActive] [bit] NULL,
	[UserID] [int] NULL,
	[PortalID] [int] NULL,
	[NumberofViews] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserFirstName] [nvarchar](50) NOT NULL,
	[UserMiddleName] [nvarchar](50) NOT NULL,
	[UserLastName] [nvarchar](50) NOT NULL,
	[UserProfilePic] [varchar](500) NULL,
	[UserGender] [char](1) NULL,
	[UserTelephone] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[JoinDate] [date] NULL,
	[IsActive] [bit] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserType] [char](2) NULL,
	[DateofBirth] [date] NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CourseInfo]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseInfo]
AS
SELECT dbo.Course.CourseName, dbo.Course.CourseDescription, dbo.Users.UserFirstName + ' ' + dbo.Users.UserMiddleName + ' ' + dbo.Users.UserLastName AS TrainerName, dbo.Users.UserProfilePic, dbo.Course.CourseID, dbo.Part.VideoMin, 
                  dbo.Part.VideoSec, dbo.Chapter.ChapterName, dbo.Chapter.ChapterID
FROM     dbo.Part INNER JOIN
                  dbo.Chapter ON dbo.Part.ChapterID = dbo.Chapter.ChapterID RIGHT OUTER JOIN
                  dbo.Course INNER JOIN
                  dbo.Users ON dbo.Course.UserID = dbo.Users.UserID ON dbo.Chapter.CourseID = dbo.Course.CourseID
GO
/****** Object:  View [dbo].[CourseChapters]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseChapters]
AS
SELECT dbo.Chapter.ChapterName, dbo.Part.PartName, dbo.Part.PartVideo, dbo.Part.VideoMin, dbo.Part.VideoSec, dbo.Course.CourseID, dbo.Chapter.ChapterID, dbo.Chapter.ChapterNumber, dbo.Part.PartNumber, 
                  dbo.Chapter.ChapterDescription, dbo.Part.PartID
FROM     dbo.Chapter INNER JOIN
                  dbo.Course ON dbo.Chapter.CourseID = dbo.Course.CourseID LEFT OUTER JOIN
                  dbo.Part ON dbo.Chapter.ChapterID = dbo.Part.ChapterID
GO
/****** Object:  Table [dbo].[Portal]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portal](
	[PortalID] [int] IDENTITY(1,1) NOT NULL,
	[PortalName] [nvarchar](50) NULL,
	[PortalDescription] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Portal] PRIMARY KEY CLUSTERED 
(
	[PortalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PortalsView]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PortalsView]
AS
SELECT dbo.Portal.PortalID, dbo.Portal.PortalName, dbo.Course.CourseID, dbo.Course.CourseName, dbo.Course.CourseDescription, dbo.Course.CoursePrice, 
                  dbo.Users.UserFirstName + ' ' + dbo.Users.UserMiddleName + ' ' + dbo.Users.UserLastName AS TrainerName, dbo.Part.VideoMin, dbo.Part.VideoSec, dbo.Chapter.ChapterID, dbo.Chapter.ChapterName
FROM     dbo.Part INNER JOIN
                  dbo.Chapter ON dbo.Part.ChapterID = dbo.Chapter.ChapterID RIGHT OUTER JOIN
                  dbo.Course INNER JOIN
                  dbo.Users ON dbo.Course.UserID = dbo.Users.UserID ON dbo.Chapter.CourseID = dbo.Course.CourseID RIGHT OUTER JOIN
                  dbo.Portal ON dbo.Course.PortalID = dbo.Portal.PortalID
GO
/****** Object:  Table [dbo].[CourseRegistration]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRegistration](
	[CourseRegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[RegistrationID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CourseRegistration] PRIMARY KEY CLUSTERED 
(
	[CourseRegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[RegistrarionDate] [date] NULL,
	[RegistraionPrice] [numeric](6, 2) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RegisteredCourses]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RegisteredCourses]
AS
SELECT dbo.CourseRegistration.CourseID, dbo.Registration.UserID, dbo.Registration.RegistrationID, dbo.CourseRegistration.CourseName
FROM     dbo.CourseRegistration INNER JOIN
                  dbo.Registration ON dbo.CourseRegistration.RegistrationID = dbo.Registration.RegistrationID
GO
/****** Object:  View [dbo].[View_1]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT IsActive
FROM     dbo.Portal
GO
/****** Object:  View [dbo].[View_2]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT dbo.Course.CourseName, dbo.Portal.PortalName, dbo.Trainer.TrainerFName, dbo.Trainer.TrainerLName
FROM     dbo.Course INNER JOIN
                  dbo.Portal ON dbo.Course.PortalID = dbo.Portal.PortalID INNER JOIN
                  dbo.Trainer ON dbo.Course.TrainerID = dbo.Trainer.TrainerID
GO
/****** Object:  View [dbo].[vwCourses]    Script Date: 5/14/2024 3:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCourses]
AS
SELECT dbo.Course.CourseID, dbo.Course.CourseName, dbo.Course.CourseDescription, dbo.Course.CoursePrice, dbo.Course.CreateDate, dbo.Portal.PortalID, dbo.Portal.PortalName, dbo.Users.UserID, 
                  dbo.Users.UserFirstName + ' ' + dbo.Users.UserMiddleName + ' ' + dbo.Users.UserLastName AS TrainerName, dbo.Course.NumberofViews, dbo.Users.UserProfilePic
FROM     dbo.Course INNER JOIN
                  dbo.Portal ON dbo.Course.PortalID = dbo.Portal.PortalID INNER JOIN
                  dbo.Users ON dbo.Course.UserID = dbo.Users.UserID
WHERE  (dbo.Course.IsActive = 1)
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (1, N'Chapter1', 1, N'Chapter1Description', 1)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (2, N'Chapter2', 2, N'Chapter2Description', 1)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (3, N'Chapter3', 3, N'Chapter3Description', 1)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (4, N'Chapter4', 4, N'Chapter4Description', 1)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (5, N'Chapter1', 1, N'Chapter1Description', 2)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (6, N'Chapter2', 2, N'Chapter2Description', 2)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (7, N'Chapter3', 3, N'Chapter3Description', 2)
GO
INSERT [dbo].[Chapter] ([ChapterID], [ChapterName], [ChapterNumber], [ChapterDescription], [CourseID]) VALUES (8, N'Chapter4', 4, N'Chapter4Description', 2)
GO
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription], [CoursePrice], [TrainerShareRate], [CreateDate], [IsActive], [UserID], [PortalID], [NumberofViews]) VALUES (1, N'Learn HTML', N'aboutaboutabout', CAST(313.00 AS Numeric(6, 2)), CAST(1.00 AS Numeric(3, 2)), CAST(N'2020-05-05' AS Date), 1, 1, 3, 7)
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription], [CoursePrice], [TrainerShareRate], [CreateDate], [IsActive], [UserID], [PortalID], [NumberofViews]) VALUES (2, N'Learn CSS', N'aboutaboutabout', CAST(100.00 AS Numeric(6, 2)), CAST(1.00 AS Numeric(3, 2)), CAST(N'2020-05-05' AS Date), 1, 2, 4, 4)
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription], [CoursePrice], [TrainerShareRate], [CreateDate], [IsActive], [UserID], [PortalID], [NumberofViews]) VALUES (3, N'Learn BootStrap', N'aboutaboutabout', CAST(100.00 AS Numeric(6, 2)), CAST(1.00 AS Numeric(3, 2)), CAST(N'2020-05-05' AS Date), 1, 3, 5, 3)
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription], [CoursePrice], [TrainerShareRate], [CreateDate], [IsActive], [UserID], [PortalID], [NumberofViews]) VALUES (7, N'testcourse', N'aboutaboutabout', CAST(212.00 AS Numeric(6, 2)), CAST(0.50 AS Numeric(3, 2)), CAST(N'2222-02-02' AS Date), 1, 1, 3, 2)
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription], [CoursePrice], [TrainerShareRate], [CreateDate], [IsActive], [UserID], [PortalID], [NumberofViews]) VALUES (8, N'testcourse2', N'aboutaboutabout', CAST(213.00 AS Numeric(6, 2)), CAST(0.50 AS Numeric(3, 2)), CAST(N'2222-02-02' AS Date), 1, 1, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseRegistration] ON 
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (2, 1, 1, N'Learn HTML')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (3, 2, 1, N'Learn CSS')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (4, 3, 1, N'Learn BootStrap')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (5, 7, 2, N'testcourse')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (6, 1, 3, N'Learn HTML')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (7, 2, 3, N'Learn CSS')
GO
INSERT [dbo].[CourseRegistration] ([CourseRegistrationID], [CourseID], [RegistrationID], [CourseName]) VALUES (8, 3, 4, N'Learn BootStrap')
GO
SET IDENTITY_INSERT [dbo].[CourseRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[Part] ON 
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (1, N'Trailer', 1, N'TrailerDescriptio', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 2, 20, 2)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (2, N'Part1', 1, N'Part1Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 1, 15, 2)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (3, N'Part2', 2, N'Part2Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 5, 51, 2)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (4, N'Part3', 1, N'Part3Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 1, 12, 3)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (5, N'Part4', 2, N'Part4Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 8, 31, 3)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (6, N'Part5', 1, N'Part5Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 6, 43, 4)
GO
INSERT [dbo].[Part] ([PartID], [PartName], [PartNumber], [PartDescription], [PartVideo], [VideoMin], [VideoSec], [ChapterID]) VALUES (7, N'Part6', 2, N'Part6Description', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/ipBw3f6kaMg?si=AZKj7H_URNfu_Uw2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 4, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Part] OFF
GO
SET IDENTITY_INSERT [dbo].[Portal] ON 
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (1, N'AInteligence', N'about Ai', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (2, N'Machine Learning', N'about Machine Learning', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (3, N'Html', N'about Html', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (4, N'Css', N'about Css', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (5, N'BootStrap', N'about BootStrap', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (6, N'Java Script', N'about Java Script', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (7, N'PHP', N'about PHP', 1)
GO
INSERT [dbo].[Portal] ([PortalID], [PortalName], [PortalDescription], [IsActive]) VALUES (8, N'JQuery', N'about JQuery', 1)
GO
SET IDENTITY_INSERT [dbo].[Portal] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 
GO
INSERT [dbo].[Registration] ([RegistrationID], [RegistrarionDate], [RegistraionPrice], [UserID]) VALUES (1, CAST(N'2024-03-25' AS Date), CAST(10.00 AS Numeric(6, 2)), 6)
GO
INSERT [dbo].[Registration] ([RegistrationID], [RegistrarionDate], [RegistraionPrice], [UserID]) VALUES (2, CAST(N'2024-03-25' AS Date), CAST(10.00 AS Numeric(6, 2)), 1)
GO
INSERT [dbo].[Registration] ([RegistrationID], [RegistrarionDate], [RegistraionPrice], [UserID]) VALUES (3, CAST(N'2024-03-25' AS Date), CAST(10.00 AS Numeric(6, 2)), 37)
GO
INSERT [dbo].[Registration] ([RegistrationID], [RegistrarionDate], [RegistraionPrice], [UserID]) VALUES (4, CAST(N'2024-03-25' AS Date), CAST(10.00 AS Numeric(6, 2)), 37)
GO
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (1, N'Youssef', N'Mahmoud', N'Koubeissi', N'FolderonServerForImages\TrainersImages\gt.jpeg', N'M', N'71/559718', N'yk@muc.edu.lb', CAST(N'2020-01-01' AS Date), 1, N'YoussefKoubeissi', N'1234567', N'TR', CAST(N'2002-07-04' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (2, N'Mahmoud', N'Mouhamad', N'Mehdi', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'78/880672', N'mh@muc.edu.lb', CAST(N'2020-01-01' AS Date), 1, N'MahmoudMehdi', N'1234567', N'TR', CAST(N'2000-02-02' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (3, N'Ali', N'jihad', N'Hammoud', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'76/655266', N'al@muc.edu.lb', CAST(N'2020-01-01' AS Date), 1, N'AliHammoud', N'1234567', N'TR', CAST(N'2000-02-02' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (5, N'Yaser', N'emad', N'Monzer', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'76/732561', N'ym@muc.edu.lb', CAST(N'2020-01-01' AS Date), 1, N'YaserMonzer', N'1234567', N'TR', CAST(N'2000-02-02' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (6, N'Hussein', N'test', N'Ali', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'78/541236', N'ha@muc.edu.lb', CAST(N'2019-05-05' AS Date), 1, N'hussein', N'1111', N'TE', CAST(N'2000-02-02' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (7, N'Admin', N'test', N'Admin', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'454545', N'test1@mail.com', CAST(N'2020-02-02' AS Date), 1, N'test1', N'1111', N'AD', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (12, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'6513124548', N'test6@mail.com', CAST(N'2020-05-05' AS Date), 1, N'test6', N'1111', N'TR', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (13, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'5413', N'test7@mail.com', CAST(N'2020-02-02' AS Date), 1, N'test7', N'1111', N'TR', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (16, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'1234', N'test9@mail.com', CAST(N'2222-02-22' AS Date), 0, N'test9', N'1111', N'TR', CAST(N'2222-02-22' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (34, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'112455', N'test51@mail.com', CAST(N'2222-02-22' AS Date), 0, N'test51', N'test', N'TR', CAST(N'2222-02-22' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (36, N'test', N'test', N'test', N'alfa romeo giulia.jpg', N'M', N'15132', N'test53@test.com', CAST(N'2222-02-22' AS Date), 1, N'test53', N'test', N'TR', CAST(N'2222-02-22' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (37, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'32323', N'test54@test.com', CAST(N'2222-02-22' AS Date), 1, N'test54', N'test', N'TE', CAST(N'2222-02-22' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (38, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'32323', N'test55@test.com', CAST(N'2222-02-22' AS Date), 1, N'test55', N'test', N'TE', CAST(N'2222-02-22' AS Date))
GO
INSERT [dbo].[Users] ([UserID], [UserFirstName], [UserMiddleName], [UserLastName], [UserProfilePic], [UserGender], [UserTelephone], [UserEmail], [JoinDate], [IsActive], [UserName], [UserPassword], [UserType], [DateofBirth]) VALUES (39, N'test', N'test', N'test', N'FolderonServerForImages\TrainersImages\WhatsApp Image 2023-12-23 at 13.11.03_39d430b4.jpg', N'M', N'32323', N'test55@test.com', CAST(N'2222-02-22' AS Date), 1, N'test56', N'test', N'TE', CAST(N'2222-02-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Portal] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portal] ([PortalID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Portal]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Users]
GO
ALTER TABLE [dbo].[CourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistration_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CourseRegistration] CHECK CONSTRAINT [FK_CourseRegistration_Course]
GO
ALTER TABLE [dbo].[CourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistration_Registration] FOREIGN KEY([RegistrationID])
REFERENCES [dbo].[Registration] ([RegistrationID])
GO
ALTER TABLE [dbo].[CourseRegistration] CHECK CONSTRAINT [FK_CourseRegistration_Registration]
GO
ALTER TABLE [dbo].[Part]  WITH CHECK ADD  CONSTRAINT [FK_Part_Chapter] FOREIGN KEY([ChapterID])
REFERENCES [dbo].[Chapter] ([ChapterID])
GO
ALTER TABLE [dbo].[Part] CHECK CONSTRAINT [FK_Part_Chapter]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Chapter"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 146
               Left = 321
               Bottom = 309
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Part"
            Begin Extent = 
               Top = 3
               Left = 635
               Bottom = 166
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseChapters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseChapters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 557
               Bottom = 170
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Chapter"
            Begin Extent = 
               Top = 14
               Left = 817
               Bottom = 177
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Part"
            Begin Extent = 
               Top = 9
               Left = 1116
               Bottom = 172
               Right = 1313
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 2532
         Width = 4212
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 570
               Bottom = 170
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Portal"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 170
               Right = 522
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Chapter"
            Begin Extent = 
               Top = 7
               Left = 833
               Bottom = 170
               Right = 1056
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Part"
            Begin Extent = 
               Top = 7
               Left = 1100
               Bottom = 170
               Right = 1297
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PortalsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PortalsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PortalsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CourseRegistration"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Registration"
            Begin Extent = 
               Top = 7
               Left = 331
               Bottom = 170
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegisteredCourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegisteredCourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Portal"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Portal"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 170
               Right = 522
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Trainer"
            Begin Extent = 
               Top = 7
               Left = 570
               Bottom = 170
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[22] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Portal"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 170
               Right = 522
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 570
               Bottom = 170
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCourses'
GO
USE [master]
GO
ALTER DATABASE [dbEduPlatform] SET  READ_WRITE 
GO
