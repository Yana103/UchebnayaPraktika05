USE [master]
GO
/****** Object:  Database [Session1_XX]    Script Date: 13.03.2023 22:06:19 ******/
CREATE DATABASE [Session1_XX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session1_XX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Session1_XX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session1_XX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Session1_XX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Session1_XX] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session1_XX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session1_XX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session1_XX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session1_XX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session1_XX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session1_XX] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session1_XX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session1_XX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session1_XX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session1_XX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session1_XX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session1_XX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session1_XX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session1_XX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session1_XX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session1_XX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session1_XX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session1_XX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session1_XX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session1_XX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session1_XX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session1_XX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session1_XX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session1_XX] SET RECOVERY FULL 
GO
ALTER DATABASE [Session1_XX] SET  MULTI_USER 
GO
ALTER DATABASE [Session1_XX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session1_XX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session1_XX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session1_XX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session1_XX] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session1_XX] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Session1_XX] SET QUERY_STORE = OFF
GO
USE [Session1_XX]
GO
/****** Object:  Table [dbo].[ActiveTime]    Script Date: 13.03.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveTime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[Date] [date] NULL,
	[Login_Time] [datetime] NULL,
	[Logout_Time] [datetime] NULL,
	[Time_spent] [time](7) NULL,
	[Reason] [text] NULL,
 CONSTRAINT [PK_ActiveTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 13.03.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 13.03.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.03.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.03.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OfficeID] [int] NULL,
	[Birthdate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActiveTime] ON 

INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (35, 16, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T01:48:46.557' AS DateTime), CAST(N'2022-06-23T01:48:52.760' AS DateTime), CAST(N'00:00:06.2055130' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (36, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T03:11:04.493' AS DateTime), CAST(N'2022-06-23T03:11:09.137' AS DateTime), CAST(N'00:00:04.6421802' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (37, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T11:19:34.347' AS DateTime), CAST(N'2022-06-23T11:19:44.413' AS DateTime), CAST(N'00:00:10.0653649' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (38, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T11:19:51.547' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (39, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T11:28:27.753' AS DateTime), CAST(N'2022-06-23T11:28:38.400' AS DateTime), CAST(N'00:00:10.6476626' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (40, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T11:28:41.600' AS DateTime), CAST(N'2022-06-23T11:28:46.690' AS DateTime), CAST(N'00:00:05.0884486' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (41, 16, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T11:29:09.933' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (42, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T13:46:43.653' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (43, 1037, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T14:00:34.530' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (44, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T17:22:10.317' AS DateTime), CAST(N'2022-06-23T17:24:04.937' AS DateTime), CAST(N'00:01:54.6210846' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (45, 21, CAST(N'2022-06-23' AS Date), CAST(N'2022-06-23T17:24:07.813' AS DateTime), CAST(N'2022-06-23T17:24:20.333' AS DateTime), CAST(N'00:00:12.5202077' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (46, 21, CAST(N'2022-06-25' AS Date), CAST(N'2022-06-25T23:03:16.873' AS DateTime), CAST(N'2022-06-25T23:03:58.267' AS DateTime), CAST(N'00:00:41.3925231' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (1023, 21, CAST(N'2022-10-17' AS Date), CAST(N'2022-10-17T11:11:07.153' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (1024, 21, CAST(N'2022-11-30' AS Date), CAST(N'2022-11-30T00:05:55.110' AS DateTime), CAST(N'2022-11-30T00:10:16.787' AS DateTime), CAST(N'00:04:21.6757373' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (2024, 21, CAST(N'2023-01-14' AS Date), CAST(N'2023-01-14T18:06:52.907' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (3024, 21, CAST(N'2023-01-23' AS Date), CAST(N'2023-01-23T12:16:19.023' AS DateTime), CAST(N'2023-01-23T12:16:27.667' AS DateTime), CAST(N'00:00:08.6441432' AS Time), NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (3025, 21, CAST(N'2023-02-17' AS Date), CAST(N'2023-02-17T12:37:31.080' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActiveTime] ([ID], [ID_User], [Date], [Login_Time], [Logout_Time], [Time_spent], [Reason]) VALUES (3026, 21, CAST(N'2023-03-13' AS Date), CAST(N'2023-03-13T21:36:22.907' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActiveTime] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name]) VALUES (1, N'Afghanistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (2, N'Albania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (3, N'Algeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (4, N'Andorra')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (5, N'Angola')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (6, N'Antigua & Deps')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (7, N'Argentina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (8, N'Armenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (9, N'Australia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (10, N'Austria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (12, N'Bahamas')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (13, N'Bahrain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (14, N'Bangladesh')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (15, N'Barbados')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (16, N'Belarus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (17, N'Belgium')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (18, N'Belize')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (19, N'Benin')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (20, N'Bhutan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (21, N'Bolivia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (22, N'Bosnia Herzegovina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (23, N'Botswana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (24, N'Brazil')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (25, N'Brunei')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (26, N'Bulgaria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (27, N'Burkina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (28, N'Burundi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (29, N'Cambodia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (30, N'Cameroon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (31, N'Canada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (32, N'Cape Verde')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (33, N'Central African Rep')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (34, N'Chad')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (35, N'Chile')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (36, N'China')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (37, N'Colombia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (38, N'Comoros')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (39, N'Congo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (40, N'Congo {Democratic Rep}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (41, N'Costa Rica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (42, N'Croatia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (43, N'Cuba')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (44, N'Cyprus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (45, N'Czech Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (46, N'Denmark')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (47, N'Djibouti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (48, N'Dominica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (49, N'Dominican Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (50, N'East Timor')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (51, N'Ecuador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (52, N'Egypt')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (53, N'El Salvador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (54, N'Equatorial Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (55, N'Eritrea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (56, N'Estonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (57, N'Ethiopia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (58, N'Fiji')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (59, N'Finland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (60, N'France')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (61, N'Gabon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (62, N'Gambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (63, N'Georgia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (64, N'Germany')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (65, N'Ghana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (66, N'Greece')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (67, N'Grenada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (68, N'Guatemala')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (69, N'Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (70, N'Guinea-Bissau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (71, N'Guyana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (72, N'Haiti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (73, N'Honduras')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (74, N'Hungary')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (75, N'Iceland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (76, N'India')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (77, N'Indonesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (78, N'Iran')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (79, N'Iraq')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (80, N'Ireland {Republic}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (81, N'Israel')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (82, N'Italy')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (83, N'Ivory Coast')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (84, N'Jamaica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (85, N'Japan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (86, N'Jordan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (87, N'Kazakhstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (88, N'Kenya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (89, N'Kiribati')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (90, N'Korea North')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (91, N'Korea South')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (92, N'Kosovo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (93, N'Kuwait')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (94, N'Kyrgyzstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (95, N'Laos')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (96, N'Latvia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (97, N'Lebanon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (98, N'Lesotho')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (99, N'Liberia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (100, N'Libya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (101, N'Liechtenstein')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (102, N'Lithuania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (103, N'Luxembourg')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (104, N'Macedonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (105, N'Madagascar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (106, N'Malawi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (107, N'Malaysia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (108, N'Maldives')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (109, N'Mali')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (110, N'Malta')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (111, N'Marshall Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (112, N'Mauritania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (113, N'Mauritius')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (114, N'Mexico')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (115, N'Micronesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (116, N'Moldova')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (117, N'Monaco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (118, N'Mongolia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (119, N'Montenegro')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (120, N'Morocco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (121, N'Mozambique')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (122, N'Myanmar, {Burma}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (123, N'Namibia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (124, N'Nauru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (125, N'Nepal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (126, N'Netherlands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (127, N'New Zealand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (128, N'Nicaragua')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (129, N'Niger')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (130, N'Nigeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (131, N'Norway')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (132, N'Oman')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (133, N'Pakistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (134, N'Palau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (135, N'Panama')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (136, N'Papua New Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (137, N'Paraguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (138, N'Peru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (139, N'Philippines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (140, N'Poland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (141, N'Portugal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (142, N'Qatar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (143, N'Romania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (144, N'Russian Federation')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (145, N'Rwanda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (146, N'St Kitts & Nevis')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (147, N'St Lucia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (148, N'Saint Vincent & the Grenadines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (149, N'Samoa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (150, N'San Marino')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (151, N'Sao Tome & Principe')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (152, N'Saudi Arabia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (153, N'Senegal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (154, N'Serbia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (155, N'Seychelles')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (156, N'Sierra Leone')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (157, N'Singapore')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (158, N'Slovakia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (159, N'Slovenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (160, N'Solomon Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (161, N'Somalia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (162, N'South Africa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (163, N'South Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (164, N'Spain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (165, N'Sri Lanka')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (166, N'Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (167, N'Suriname')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (168, N'Swaziland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (169, N'Sweden')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (170, N'Switzerland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (171, N'Syria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (172, N'Taiwan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (173, N'Tajikistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (174, N'Tanzania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (175, N'Thailand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (176, N'Togo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (177, N'Tonga')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (178, N'Trinidad & Tobago')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (179, N'Tunisia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (180, N'Turkey')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (181, N'Turkmenistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (182, N'Tuvalu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (183, N'Uganda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (184, N'Ukraine')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (185, N'United Arab Emirates')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (186, N'United Kingdom')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (187, N'United States')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (188, N'Uruguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (189, N'Uzbekistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (190, N'Vanuatu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (191, N'Vatican City')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (192, N'Venezuela')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (193, N'Vietnam')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (194, N'Yemen')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (195, N'Zambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (196, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 

INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (1, 185, N'Abu dhabi', N'638-757-8582
', N'MIchael Malki')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (3, 52, N'Cairo', N'252-224-8525', N'David Johns')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (4, 13, N'Bahrain', N'542-227-5825', N'Katie Ballmer')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (5, 142, N'Doha', N'758-278-9597', N'Ariel Levy')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (6, 152, N'Riyadh', N'285-285-1474', N'Andrew Hobart')
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (9, 2, N'j.doe@amonic.com', N'123', N'John', N'Doe', 1, CAST(N'1983-01-13' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (10, 1, N'k.omar@amonic.com', N'4258', N'Karim', N'Omar', 1, CAST(N'1980-03-19' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (11, 2, N'h.saeed@amonic.com', N'2020', N'Hannan', N'Saeed', 3, CAST(N'1989-12-20' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (12, 2, N'a.hobart@amonic.com', N'6996', N'Andrew', N'Hobart', 6, CAST(N'1990-01-30' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (13, 1, N'k.anderson@amonic.com', N'4570', N'Katrin', N'Anderson', 5, CAST(N'1992-10-11' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (14, 2, N'h.wyrick@amonic.com', N'1199', N'Hava', N'Wyrick', 1, CAST(N'1988-08-08' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (15, 1, N'marie.horn@amonic.com', N'55555', N'Marie', N'Horn', 4, CAST(N'1981-06-04' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (16, 1, N'm.osteen@amonic.com', N'9800', N'Milagros', N'Osteen', 1, CAST(N'1991-03-02' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (17, 1, N'1', N'1', N'1', N'1', 1, CAST(N'1991-03-02' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (21, 2, N'2', N'2', N'2', N'2', 1, CAST(N'2222-03-02' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1018, 1, N'vorbeet@mail.ru', N'ORfwg4jD', N'Maxim', N'Vladykin', 4, CAST(N'2003-06-07' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1019, 2, N'nastya.kostura@mail.ru', N'8702452325', N'Anastasia', N'Kostura', 4, CAST(N'2002-03-15' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1037, 2, N'4eg1VarA@misharuk.com', N'xxxmaxtopxxx', N'_MaX1m_', N'777_M16ARUK_777', 5, CAST(N'2077-06-19' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1038, 1, N'Rayan_Gosling@Ken.com', N'TARIELNORMCHEL', N'Rayan', N'Gosling', 4, CAST(N'1980-11-12' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (2036, 2, N'Egor@mail.ru', N'123456', N'Egor', N'Moloka', 5, CAST(N'2023-02-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ActiveTime]  WITH CHECK ADD  CONSTRAINT [FK_ActiveTime_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ActiveTime] CHECK CONSTRAINT [FK_ActiveTime_Users]
GO
ALTER TABLE [dbo].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Office_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Offices] CHECK CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Session1_XX] SET  READ_WRITE 
GO
