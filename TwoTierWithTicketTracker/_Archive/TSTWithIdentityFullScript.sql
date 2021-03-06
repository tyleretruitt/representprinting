IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] DROP CONSTRAINT [FK_TSTOrders_TSTOrderTypes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] DROP CONSTRAINT [FK_TSTOrders_TSTOrderStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] DROP CONSTRAINT [FK_TSTOrders_TSTOrderPriorities]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] DROP CONSTRAINT [FK_TSTOrders_TSTEmployees1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] DROP CONSTRAINT [FK_TSTOrders_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[TSTShopNotes]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]') AND type in (N'U'))
DROP TABLE [dbo].[TSTShopNotes]
GO
/****** Object:  Table [dbo].[TSTPortfolioImages]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTPortfolioImages]') AND type in (N'U'))
DROP TABLE [dbo].[TSTPortfolioImages]
GO
/****** Object:  Table [dbo].[TSTOrderTypes]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderTypes]') AND type in (N'U'))
DROP TABLE [dbo].[TSTOrderTypes]
GO
/****** Object:  Table [dbo].[TSTOrderStatuses]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTOrderStatuses]
GO
/****** Object:  Table [dbo].[TSTOrders]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrders]') AND type in (N'U'))
DROP TABLE [dbo].[TSTOrders]
GO
/****** Object:  Table [dbo].[TSTOrderPriorities]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderPriorities]') AND type in (N'U'))
DROP TABLE [dbo].[TSTOrderPriorities]
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployeeStatuses]
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployees]
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
DROP TABLE [dbo].[TSTDepartments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/19/2017 9:39:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTDepartments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TSTDepartments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NOT NULL,
	[LName] [nvarchar](20) NOT NULL,
	[DeptID] [int] NOT NULL,
	[EmpStatusID] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[SeparationDate] [date] NULL,
	[Salary] [money] NOT NULL,
	[Address1] [nvarchar](150) NULL,
	[Address2] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](75) NOT NULL,
	[EmpPhoto] [nvarchar](100) NULL,
	[JobTitle] [nvarchar](20) NOT NULL,
	[UserID] [nvarchar](100) NULL,
 CONSTRAINT [PK_TSTEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployeeStatuses](
	[EmployeeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeStatusName] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTEmployeeStatus] PRIMARY KEY CLUSTERED 
(
	[EmployeeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTOrderPriorities]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderPriorities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTOrderPriorities](
	[PriorityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTTicketPriorities] PRIMARY KEY CLUSTERED 
(
	[PriorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTOrders]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTOrders](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketStatusID] [int] NOT NULL,
	[TroubleDescription] [nvarchar](max) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[SubmittedByID] [int] NOT NULL,
	[TechID] [int] NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Picture] [nvarchar](100) NULL,
	[PriorityID] [int] NOT NULL,
	[OrderTypeID] [int] NOT NULL,
	[FinshedDate] [smalldatetime] NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_TSTTickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTOrderStatuses]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTOrderStatuses](
	[TicketStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTTicketStatuses] PRIMARY KEY CLUSTERED 
(
	[TicketStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTOrderTypes]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTOrderTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTOrderTypes](
	[OrderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTPortfolioImages]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTPortfolioImages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTPortfolioImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TSTPortfolioImages] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTShopNotes]    Script Date: 1/19/2017 9:39:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTShopNotes](
	[NotationID] [int] IDENTITY(1,1) NOT NULL,
	[Notation] [nvarchar](500) NOT NULL,
	[TechID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[NotationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TSTTechNotes] PRIMARY KEY CLUSTERED 
(
	[NotationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201701112106060_InitialCreate', N'TwoTierWithTicketTracker.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C596FE436127E5F60FF83A0A7DD85D3F291194C8CEE19386D7BD7C8F8C0744FB26F03B6C46E1323518A44393682FCB23CE427E52FA4A85B3C7474AB0F0703782CB2F855B158248BC5A2FFFCFD8FF18767CF359E7018119F4ECC93D1B169606AFB0EA1AB8919B3E537EFCC0FEFFFF98FF195E33D1B3FE674679C0E5AD268623E32169C5B56643F620F45238FD8A11FF94B36B27DCF428E6F9D1E1F7F679D9C5818204CC0328CF1A79832E2E1E4033EA73EB571C062E4DEFA0E76A3AC1C6A6609AA71873C1C05C8C61373FE8B3F2738FC89B0C739B1BF62360F11FC178ED2A6A671E1120462CDB0BB340D44A9CF1003A1CF3F4778C6429FAE6601142077FE1260A05B2237C25967CE4BF2AEFD3A3EE5FDB2CA8639941D47CCF77A029E9C658AB2C4E66BA9DB2C1409AABC0295B317DEEB449D13F3C6C149D127DF0505880CCFA76EC88927E66DC1E2220AEE301BE50D4729E4750870BFF8E1D75115F1C8E8DCEEA830ACD3D131FF77644C6397C5219E501CB310B947C643BC7089FD037E99FB5F319D9C9D2C9667EFDEBC45CED9DB6FF1D99B6A4FA1AF40572B80A287D00F7008B2E165D17FD3B0EAED2CB161D1ACD226D50AD812CC11D3B845CF1F315DB147983DA7EF4CE39A3C63272FC98CEB332530A5A0110B63F8BC8B5D172D5C5CD45B8D3CF9CF06AEA76FDE0EC2F50E3D915532F4027F983821CCAB4FD84D6AA34712A4D3AB36DE5F32B2EBD0F7F877DDBED2DA2F333F0E6DDE195F4B3247E10AB3BA7463AB34DE4E26CDA18637EB1CF5F04D9B4B2A9BB7929477689D9990B3D8F56CC8E5DD2EDFCE1677110430788969718D34195CCBCE3512A08E0C5D83D2A84EBA1A1585CEFE9DD7C82B0F11778045B2031770569624F470D1CBEF7D3049447BCBFC80A208D608E77F287A6C101D7E1D40F419B6E3104C77C690176C9DDBC3A34FF15DEC2DF88CD81DAFC1860666DE35B2991F5E51DE6A63BC8FBEFDD58FD915752E11C39F999D03F2CF39F1BA030C22CE856DE328BA0663C6CED4075F3C07BCA1ECECB4371C5FADF6EDA44C5D443CB59722ACAB5F72D2D253515348DE8A864CE5B13489FAD15F11DA4DD49C542F6A4AD12A6A46D657540ED64DD28C522F6842D02A674A35980F988CD0F04E60027BF85EE0669BB76E2DA8A871062B24FE2FA6388465CC79408CE1909623D065DDD887B3900C1F67BAF5BD29E1F42372E3A159AD351B924560F8D990C01EFE6C48C484E227E270AFA4C3D1282706F84EF4EA5357FB9C1324DBF574A87573D7CC77B306E8A6CB4514F9364966812228968534EAF2830F67B4C737D2DE883112E818183AE15B1E9440DF4CD1A8EEE9257631C3C6859D060DA728B29123AB113AE4F4102CDF51158295B192BA70FF917882A5E3903742FC1014C14C2594C9D382509B04C86DD592D0B2E316C6FB5EF0106B2E71802967D8AA892ECCD5A1112E40C1471894360D8DAD8AC5351BA2C66BD58D799B0B5B8EBB14B1D8894DB6F8CE1ABBCCFCB7AD1866B3C676609CCD2AE9228036CCB70F03CDCE2A5D0D403CB81C9A810A27268D81662ED54E0CB4AEB13D18685D25AFCE40D3236AD7F117CEAB87669EF583F2EEB7F54675EDC1366BFA3830D34C7D4F68C3A0050E65F3BC5CF04AFCCC14873390333B9F4599AB2B9A08079F61560FD994FEAED20FB59A4144236A022C0DAD0534BB209480A409D543B83C96D7285DE645F480CDE36E8DB0D9DA2FC0566C40C6AE5E945608F5D7A9A271763A7D143D2BAC4132F24E87850A8EC220C4C5ABDEF10E4AD1C56565C574F185FB78C3958E6583D1A0A016CF55A3A4BC33836B2937CD762DA91CB23E2ED9465A12DC278D96F2CE0CAEA5CC46DB95A4700A7AB8051BA9A8BE850F34D9F24847B1DB1475632B4DA6CA0AC69626EB6A7C8B8280D055250B2B2B3166690AD6F49B59FF74242FC5B0EC48919554485B70627E885658A805D620E93509237689185A201EE7993A9E44A6DC5B35CB7FCEB2BA7DCA8398EF033935FFBDB82B6CBCD6AF6DBCB26792015E43773DEEDE2431758531A89B1B3C450EB9285484F1A7BE1B7B54EF6DE95BA79779D5F669898C30B604F9256F4A529DE4F3D6C7A1D328C933641B23567836EB8F9A1E42A7FBDC2FAD6A5FE7ABEA51F2D055154517CEDADB28EA5C9CF5474E7425FB0F5C2BC276665C96BF5205C88A7A6254522024B04A5D77D47A964A15B35ED31D514845A9420A553DA4AC269CD484AC56AC85A7D1A89AA23B0739C5A48A2ED7764756249B54A115D56B602B6416EBBAA32AF251AAC08AEAEED865728AB8A21EF09EA63DE00CB3A9A507E2CD76350DC67696C76136C5CABD7F15A852DC132BBBD997C0B2F283342DEDA97018D34A83229B99960643BF26D5AECFEB4B52E39DBF1EB376275E5BF69B7202F478FD0C78AB66229D104592827B7152144E84E3EC74D6FE58473AAEA524A691AB11B6FC9788616FC40946B39FDDA94B305FE073825B44C912472CCD03314F8F4F4E85273E87F3DCC68A22C7559C6E756F6EEA63B683942EFA8442FB11857282C5064F524A5029767D431DFC3C317F4D5A9D276110FE5B527C64DC449F29F939868A791863E3373961749814FDE6B3D8813EA8E8AED59BFF7F499B1E19F721CC9873E358D0E53A235C7F66D14B9AB4E906D2ACFDF8E2F54EA8DAFB0525AA3021D67FAEB0206C90A70AB994FFF2D0F3BFFB8AA67C8EB011A2E2C9C1507883A850F7A4601D2CED7302073E59F29CA05F67D5CF0BD6114DFBB480D0FE60E2C382EECB50DE728F5B8DE280B48B2529D1736B62F646599AFBDE9BA4FCED8D26BA9CA3DD036E833CEC352CE395A5300FB63B2A329407C3DEA7696F3D2DF9503291CB1C91FD2620EF32E7B8E1F6E86F956A7C00C9718A649FFD2714EFDAD67441DD03CFCAEC97367C60C696A580ED3F3978D7C6A60BF31EB8B1F54A013E305BDBD7FEB9674BEBBC85EE3DA157CE4DD25CCEA862C16D09BB69E01C4EF80B1F8C20F528D37796EA0CB1A6ECD6168625899EA93E354D642C4D1C89AF44D1CCB65F5FB30DBFB1B3194D335B4D426713EF6CFD6FE49DD134F3D6A449EE23D55899A8A84AFF6E59C79A72A55E536A71AD272D99EC6D3E6BE34DFB6BCA241E4429B5D9A3B9237E3D89C383A864C8A9D3235158BEEE85BDB3F2171C61FF8EC8AA84E07FCF9162BBB66B16343774E9E79BB720514E2244686E31430E6CA91721234B6433A8E631E6E4A17812B7E3371D0BECDCD0FB980531832E636FE1D6025EDC0968E29F6443D7651EDF07C9DF3C19A20B2026E1B1F97BFA7D4C5CA790FB5A1113D24070EF228BE8F2B1643CB2BB7A2990EE7CDA1128535FE114CDB117B80016DDD3197AC2EBC806E6F711AF90FD5246007520ED035157FBF892A05588BC28C328DBC327D8B0E33DBFFF0B25261E5AC8540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0f4df50b-dde3-4658-8d3a-22ae22913391', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f58d0673-a375-48eb-afc1-2481b0abae49', N'HR')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9e706b8d-76e6-4ce8-8a1d-bb728ef152c6', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f405791b-1b1d-40cb-b74b-58b3054933e0', N'Owner')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00056fbd-f893-46e3-88d2-3a8756b02bd5', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'157d8090-c145-44d0-9339-785e96e5993d', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2c3a34e9-8bfd-417e-8436-630441ecddb0', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3d256354-d1d8-433a-a93a-a281c686c088', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f3debcd-1fd6-4c81-87c1-e29ae5a293c3', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61738165-42c2-4d3e-9a82-0f401b8f6d21', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'74aa003f-59e6-4aae-886a-c9f007b1cf8b', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba89686f-9bae-4e6b-968e-068e1561d903', N'0f4df50b-dde3-4658-8d3a-22ae22913391')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b1ed809-c4ea-47ab-9ea2-8934e5ba8bdf', N'9e706b8d-76e6-4ce8-8a1d-bb728ef152c6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'11666532-9e76-4dce-815a-8b47cdb31176', N'9e706b8d-76e6-4ce8-8a1d-bb728ef152c6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c0abe3b-1cfe-4be8-a5a7-2b8f9f38b85c', N'9e706b8d-76e6-4ce8-8a1d-bb728ef152c6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7b59a29a-22c7-456c-98a6-275ff722fd6b', N'9e706b8d-76e6-4ce8-8a1d-bb728ef152c6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12799409-5bcd-4a5c-8cd9-6ae23ec033a7', N'f405791b-1b1d-40cb-b74b-58b3054933e0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b4d3d29-48c8-4d3f-9985-0bafed71bba5', N'f58d0673-a375-48eb-afc1-2481b0abae49')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f7e802fb-2b9e-4ea4-8fd7-63e70022299c', N'f58d0673-a375-48eb-afc1-2481b0abae49')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f827cb41-2ad9-42ad-852f-314baa47a364', N'f58d0673-a375-48eb-afc1-2481b0abae49')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00056fbd-f893-46e3-88d2-3a8756b02bd5', N'jbentley@representprinting.com', 0, N'AOsCc83Ei5+FJZ6mHUVlKIgzGnKJYSCpIfKxNsvVfjsRS87uJ/oQmmW/VkMjR+ufSA==', N'0ad33162-25aa-4865-9383-c80f28f72c66', NULL, 0, 0, NULL, 1, 0, N'jbentley@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b1ed809-c4ea-47ab-9ea2-8934e5ba8bdf', N'anichols@representprinting.com', 0, N'AKVWkeilNfWKz42P4bIkEMtcVHh5dgD/NWvPPw4vAT1qzCPRkvG9FGwvVIAMpK0C3w==', N'6a3cdced-9625-4c29-a23b-dfaf0aec0b6d', NULL, 0, 0, NULL, 1, 0, N'anichols@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'11666532-9e76-4dce-815a-8b47cdb31176', N'dlukowski@represntprinting.com', 0, N'AAGWL4nusMIGkatkdvQsiDRX8SNQH5onC2DOOBcE0GKEvbDkMt+2r7SrH3z1SyOIdQ==', N'b170fda4-e3a7-4108-b09e-cb4e18a80668', NULL, 0, 0, NULL, 1, 0, N'dlukowski@represntprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12799409-5bcd-4a5c-8cd9-6ae23ec033a7', N'tj@gmail.com', 0, N'ANlgJJRpl5wyzH0lD/yC0uZ20/rOl463Gx3o704U9sgYiO5iIOOilSqxYQcWrrAJtQ==', N'bab6d693-9606-4f4e-bc9c-6eff5254a379', NULL, 0, 0, NULL, 1, 0, N'tj@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'157d8090-c145-44d0-9339-785e96e5993d', N'jyoung@representprinting.com', 0, N'ADzEp99e/d+HqgC9Axe1cANN5eZ6Y1vRYzSAGbVCuBZPf5QvskkNqc3l3cEiYk7sYg==', N'268d6a55-0684-4186-8967-2bb64632babc', NULL, 0, 0, NULL, 1, 0, N'jyoung@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1c0abe3b-1cfe-4be8-a5a7-2b8f9f38b85c', N'rswanson@gmail.com', 0, N'ANpDuKyL8YVE3lzZ91Mp6YdFwkIuvaMYRo4sJfyd38unCUL5/B/QBg3eCnhfHHneXA==', N'47ca92d6-2db0-492c-b4bb-c30609892e1b', NULL, 0, 0, NULL, 1, 0, N'rswanson@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2c3a34e9-8bfd-417e-8436-630441ecddb0', N'tjwalker@gmail.com', 0, N'AMX+kGT4fN6koj39UVgTIm4+CyzT7akBn/nSBR7Bf5S0s5v4YOOBSlxv9k3UZEpM3w==', N'f638c10a-445d-4302-a4c1-7b14eac1df71', NULL, 0, 0, NULL, 1, 0, N'tjwalker@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3d256354-d1d8-433a-a93a-a281c686c088', N'jpix@representprinting.com', 0, N'ANWv/Q6j7+WVozrmLnugNft7hBEmGzhk4WnZ66iM13HztlPpe6WaA1eq8vDaBdfRSA==', N'3256b2b8-5d99-44e1-bcc2-94ebe9362bc9', NULL, 0, 0, NULL, 1, 0, N'jpix@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4b4d3d29-48c8-4d3f-9985-0bafed71bba5', N'abell@representprinting.com', 0, N'AODFycQB8k96L8PzMgMuBkmvETOPKh9Dj2xF+6ADuzXdRVx6VeuuYbhkDEP/YBJpKg==', N'd6494359-6bf2-4e15-8add-cd513d8989ff', NULL, 0, 0, NULL, 1, 0, N'abell@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5f3debcd-1fd6-4c81-87c1-e29ae5a293c3', N'jwall@representprinting.com', 0, N'AEC+yNR2sEqfPJKqWQMcE0+CbetMyOGxbx/MGND8grWdkThmPfla6VNL0RhbGyXaGA==', N'a4dcb788-75a4-4668-8bd5-c352720eb237', NULL, 0, 0, NULL, 1, 0, N'jwall@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61738165-42c2-4d3e-9a82-0f401b8f6d21', N'geoffwallingford@representprinting.com', 0, N'AD5aX0wdVgQQv7Sr7js/qT9hqb9Q1iGF5/L5rvapjZbfrG9UqL8mGDacwaFJmW+yCg==', N'0126151c-7e77-447d-80b1-2a0a2eb9942f', NULL, 0, 0, NULL, 1, 0, N'geoffwallingford@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'74aa003f-59e6-4aae-886a-c9f007b1cf8b', N'awiggins@representprinting.com', 0, N'ALrkPoLDWcmBKW6dRnKP3VG3OyrEK5vPIXX1ZtyMZ7Bh8XbYKfRiCqtHfABvIkI4GQ==', N'b5f815f3-04ba-45e4-be81-b475c2aa2e2b', NULL, 0, 0, NULL, 1, 0, N'awiggins@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7b59a29a-22c7-456c-98a6-275ff722fd6b', N'jsantamaria@representprinting.com', 0, N'ABBiYv0wlZmSo7Nr+xhkCZrs2v3TNTODD2X4k4QAt4IYkYwZklSJ2RUTACoOfGyvQQ==', N'f1292357-569d-4258-ad75-f6c4e849d41f', NULL, 0, 0, NULL, 1, 0, N'jsantamaria@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba89686f-9bae-4e6b-968e-068e1561d903', N'jreynolds@representprinting.com', 0, N'AEEvsbY4Ir/tsEYWNEgo8zo5krlKqvX777M9LjhwlTiq4pfrPjhPJuOe/QoGGiquGw==', N'ccf90310-098b-4862-8d85-b1e2b05b94e3', NULL, 0, 0, NULL, 1, 0, N'jreynolds@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f7e802fb-2b9e-4ea4-8fd7-63e70022299c', N'ianwilliams@representprinting.com', 0, N'ADjt24kgycxFLXKOE8C05Gygi0/xtg3/QK6QetzKvFfqlg1YNbM/6LZ3ZMkjO0hk9w==', N'b7439116-2b1b-43b5-b9ca-00f7aa49f08f', NULL, 0, 0, NULL, 1, 0, N'ianwilliams@representprinting.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f827cb41-2ad9-42ad-852f-314baa47a364', N'dking@representprinting.com', 0, N'AKglj2yM4Og3h9MNVrlKL0FkWrti3J7Yr7OiYbwH0b4SflrLLaY5wlz6kgGWswmFow==', N'115d717b-4436-48a0-96c0-b3b0d24c4d2f', NULL, 0, 0, NULL, 1, 0, N'dking@representprinting.com')
SET IDENTITY_INSERT [dbo].[TSTDepartments] ON 

INSERT [dbo].[TSTDepartments] ([DepartmentID], [Name], [Description], [IsActive]) VALUES (1, N'Human Resources', N'The Human Resource Department overlooks all of the other departments in terms of equity in the work place.  It is also the department that issues checks, and makes sure that all other employees are getting paid', 1)
INSERT [dbo].[TSTDepartments] ([DepartmentID], [Name], [Description], [IsActive]) VALUES (2, N'Management', N'Overlooks the basic duties of all of the work being performed in the shop.', 1)
INSERT [dbo].[TSTDepartments] ([DepartmentID], [Name], [Description], [IsActive]) VALUES (3, N'Shop', N'This position is responsible for operating the printing press for printing on shirts, signs, ect.', 1)
INSERT [dbo].[TSTDepartments] ([DepartmentID], [Name], [Description], [IsActive]) VALUES (5, N'Owner', N'This is the owner of the company, he started this company from the ground up', 1)
SET IDENTITY_INSERT [dbo].[TSTDepartments] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployees] ON 

INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (14, N'Tim', N'Johnson', 5, 1, CAST(0xC83A0B00 AS Date), NULL, 80000.0000, N'10442 Wornall Road', NULL, N'Kansas City', N'MO', N'64114', N'8165378677', N'tj@gmail.com', N'da7199e7-7f66-4df1-85b7-5a33ff0c799b.jpg', N'Owner', N'12799409-5bcd-4a5c-8cd9-6ae23ec033a7')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (26, N'Josh', N'Bentley', 3, 2, CAST(0x553C0B00 AS Date), NULL, 35000.0000, N'10339 State Line Road', NULL, N'Leawood', N'KS', N'64559', N'9136457488', N'jbentley@representprinting.com', N'0b48cc3f-6b6e-4cad-a9e6-04ded874ce5e.jpg', N'Printer', N'00056fbd-f893-46e3-88d2-3a8756b02bd5')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (27, N'Austin', N'Wiggins', 3, 4, CAST(0x553C0B00 AS Date), CAST(0x5A3C0B00 AS Date), 30000.0000, N'5 Obrien Road', NULL, N'Lee''s Summit', N'MO', N'63229', N'8167564888', N'awiggins@representprinting.com', N'0d862b08-16cb-4f72-a376-f9c79148c193.jpg', N'Reclaimer', N'74aa003f-59e6-4aae-886a-c9f007b1cf8b')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (28, N'Jessica', N'Reynolds', 1, 2, CAST(0x553C0B00 AS Date), NULL, 55000.0000, N'3968 SW Trafficway', NULL, N'Kansas City', N'MO', N'64001', N'8169786755', N'jreynolds@representprinting.com', N'7d13f081-5936-4e89-b4ac-907bfa5a480c.jpg', N'Human Resources', N'ba89686f-9bae-4e6b-968e-068e1561d903')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (29, N'Dean', N'Lukowski', 2, 3, CAST(0x583C0B00 AS Date), NULL, 50000.0000, N'60 Liden Court', NULL, N'Olathe', N'KS', N'64558', N'9134653766', N'dlukowski@represntprinting.com', N'2418f1e9-f338-47ed-b552-16aea86fb5ce.jpg', N'Printshop Manager', N'11666532-9e76-4dce-815a-8b47cdb31176')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (30, N'Jose', N'Santamaria', 3, 4, CAST(0x00000000 AS Date), CAST(0x5A3C0B00 AS Date), 65000.0000, N'4450 Southwest Blvd.', NULL, N'Kansas City', N'MO', N'64114', N'8167566998', N'jsantamaria@representprinting.com', N'76f71338-e204-40e3-a297-a922d02b112a.jpg', N'Printer', N'7b59a29a-22c7-456c-98a6-275ff722fd6b')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (31, N'Ian', N'Williams', 1, 1, CAST(0x563C0B00 AS Date), NULL, 55000.0000, N'50 West Ave', NULL, N'Kansas City', N'MO', N'64114', N'8167567466', N'ianwilliams@representprinting.com', N'5a8439be-7a0e-4c88-aedb-0e0a2e78d9a3.jpg', N'HR Repp', N'f7e802fb-2b9e-4ea4-8fd7-63e70022299c')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (32, N'Alex', N'Nichols', 2, 2, CAST(0x563C0B00 AS Date), NULL, 65000.0000, N'8098 Olathe Drive', NULL, N'Olathe', N'KS', N'64773', N'9136457566', N'anichols@representprinting.com', N'908df0e6-d3ea-4970-9f88-2eae4ea64b57.jpg', N'Printshop Manager', N'0b1ed809-c4ea-47ab-9ea2-8934e5ba8bdf')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (33, N'Ricardo', N'Master', 1, 4, CAST(0x00000000 AS Date), CAST(0x5A3C0B00 AS Date), 50000.0000, N'80 Fox Road', NULL, N'Liberty', N'MO', N'65437', N'8167564655', N'rmaster@representprinting.com', N'58f090b1-749f-4c2d-9d52-39b6e62d4cbd.jpg', N'Reclaimer', N'b4536bd4-1948-4a0e-903c-1be39f55d874')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (36, N'Amanda', N'Bell', 1, 1, CAST(0x583C0B00 AS Date), NULL, 55000.0000, N'70 Bell Ave', NULL, N'Kansas City', N'KS', N'64114', N'9130989788', N'abell@representprinting.com', N'b107fdcd-621a-42ec-b98a-dac3f296b6c6.jpg', N'HR Representative', N'4b4d3d29-48c8-4d3f-9985-0bafed71bba5')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (37, N'Darcy', N'King', 1, 1, CAST(0x583C0B00 AS Date), NULL, 55000.0000, N'90 South Street', NULL, N'Kansas City', N'MO', N'64114', N'8167567466', N'dking@representprinting.com', N'1e344afa-0c14-40da-89b6-b08ba8d95d49.jpg', N'HR Representative', N'f827cb41-2ad9-42ad-852f-314baa47a364')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (38, N'Ben', N'Johnson', 2, 1, CAST(0x583C0B00 AS Date), NULL, 65000.0000, N'Something Ave', NULL, N'Kansas City', N'MO', N'64114', N'3215378677', N'femployee@gmail.com', N'469a2f4b-e575-4e4b-822a-e2b3cc07dc60.jpg', N'Shop Manager', N'cda4eeca-feff-4379-98c8-17292ae3815b')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (39, N'Joey', N'Young', 3, 1, CAST(0x583C0B00 AS Date), NULL, 30000.0000, NULL, NULL, NULL, NULL, NULL, NULL, N'jyoung@representprinting.com', N'529ff31a-3ed6-4a22-b79c-b46d7233ed3f.jpg', N'HR Representative', N'157d8090-c145-44d0-9339-785e96e5993d')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (40, N'TJ', N'Walker', 3, 1, CAST(0x583C0B00 AS Date), NULL, 30000.0000, N'90 Chester Street', NULL, N'James', N'IA', N'98786', N'6457568677', N'tjwalker@gmail.com', N'noimage.jpg', N'HR Representative', N'2c3a34e9-8bfd-417e-8436-630441ecddb0')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (41, N'James', N'Pix', 3, 1, CAST(0x593C0B00 AS Date), NULL, 30000.0000, N'90 Noland Road', NULL, N'Independence', N'MO', N'64009', N'8167566999', N'jpix@representprinting.com', N'noimage.jpg', N'HR Representative', N'3d256354-d1d8-433a-a93a-a281c686c088')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [EmpStatusID], [HireDate], [SeparationDate], [Salary], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [EmpPhoto], [JobTitle], [UserID]) VALUES (42, N'Ron', N'Swanson', 2, 1, CAST(0x593C0B00 AS Date), NULL, 65000.0000, N'90 Mulbury Lane', NULL, N'Kansas City', N'KS', N'98786', N'9089878677', N'rswanson@gmail.com', N'noimage.jpg', N'Shop Manager', N'1c0abe3b-1cfe-4be8-a5a7-2b8f9f38b85c')
SET IDENTITY_INSERT [dbo].[TSTEmployees] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] ON 

INSERT [dbo].[TSTEmployeeStatuses] ([EmployeeStatusID], [EmployeeStatusName], [Description]) VALUES (1, N'Current', N'This is a current employee that has a schedule.')
INSERT [dbo].[TSTEmployeeStatuses] ([EmployeeStatusID], [EmployeeStatusName], [Description]) VALUES (2, N'Laid Off', N'This employee has been laid off most likely due to budget cuts')
INSERT [dbo].[TSTEmployeeStatuses] ([EmployeeStatusID], [EmployeeStatusName], [Description]) VALUES (3, N'On Suspension', N'This employee has been deemed on Suspension and has yet to be asked to return to work')
INSERT [dbo].[TSTEmployeeStatuses] ([EmployeeStatusID], [EmployeeStatusName], [Description]) VALUES (4, N'Fired', N'This employee has been deemed permanently terminated')
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] OFF
SET IDENTITY_INSERT [dbo].[TSTOrderPriorities] ON 

INSERT [dbo].[TSTOrderPriorities] ([PriorityID], [Name], [Description]) VALUES (1, N'High', N'This is an important order')
INSERT [dbo].[TSTOrderPriorities] ([PriorityID], [Name], [Description]) VALUES (2, N'Medium', N'This is an order or intermediate priority')
INSERT [dbo].[TSTOrderPriorities] ([PriorityID], [Name], [Description]) VALUES (3, N'Low', N'This is an order of low priority')
SET IDENTITY_INSERT [dbo].[TSTOrderPriorities] OFF
SET IDENTITY_INSERT [dbo].[TSTOrders] ON 

INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (40, 3, N'Doom Logo Silk Screening', CAST(0xA6FD033F AS SmallDateTime), 14, 39, N'Silk Screen', N'1df4e7d8-76c0-4eea-87e6-997b5f0dcb77.jpg', 1, 2, NULL, 122)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (41, 3, N'Customer wants these', CAST(0xA6FD0340 AS SmallDateTime), 14, 26, N'Silk Screen', N'775690bf-c5cd-4f73-9826-a34d06fe41ab.jpg', 2, 1, NULL, 100)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (42, 3, N'Wants these on shirts', CAST(0xA6FD0000 AS SmallDateTime), 29, 26, N'Silk Screen', N'eff3461f-bc11-45eb-815c-125b6722c9a2.jpg', 3, 1, NULL, 500)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (44, 3, N'Customer Wants to print this design onto white tshirts', CAST(0xA6FD0432 AS SmallDateTime), 30, 26, N'Silk Screen', N'b129d3c3-edc6-4abc-bbce-0e6724b82504.jpg', 2, 1, NULL, 50)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (45, 1, N'Customer Wants this design on green shirts by Friday', CAST(0xA6FD0000 AS SmallDateTime), 29, 26, N'Silk Screen', N'1b16af86-28b2-45dc-ba25-5ce6beb572e2.jpg', 1, 1, CAST(0xA6FE01F4 AS SmallDateTime), 100)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (46, 1, N'Customer Wants these shirts', CAST(0xA6FD055D AS SmallDateTime), 30, 26, N'Silk Screen', N'1d8e5ca6-5b3d-4184-af94-6ca229da399b.jpg', 2, 1, CAST(0xA6FE01F4 AS SmallDateTime), 55)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (47, 1, N'customer wants these shirts', CAST(0xA6FD055E AS SmallDateTime), 30, 27, N'Silk Screen', N'1f1cb33d-3ef3-462c-987a-74fb6b26c64a.jpg', 1, 1, CAST(0xA6FE01EC AS SmallDateTime), 100)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (48, 1, N'test', CAST(0xA6FE01EB AS SmallDateTime), 14, 30, N'Embroidery', N'84fcda47-2a24-4cd9-94d4-e337564b244b.jpg', 1, 1, CAST(0xA6FE01EC AS SmallDateTime), 50)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (49, 3, N'Customer wants this image on shirts', CAST(0xA6FE0337 AS SmallDateTime), 41, 26, N'Embroidery', N'7ac57fa1-42ca-43ed-8741-7651227f5880.jpg', 2, 2, NULL, 23)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (50, 2, N'customer wants these shirts printed', CAST(0xA6FE0530 AS SmallDateTime), 42, NULL, N'Silk Screen', N'549cb857-1c44-4166-b0b8-f85ddd12a0be.png', 2, 1, NULL, 35)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (51, 2, N'Customer Wants these shirts as soon as possible.', CAST(0xA6FE0530 AS SmallDateTime), 42, NULL, N'Silk Screen', N'e4752f24-6122-4640-bbf4-3be754d338ea.jpg', 2, 1, NULL, 50)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (52, 4, N'Customer needs these next week', CAST(0xA6FE0531 AS SmallDateTime), 42, NULL, N'Embroidery', N'57ebe5e3-0253-47f9-8acd-8a2e99949700.jpg', 2, 2, CAST(0xA6FF02AF AS SmallDateTime), 60)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (53, 4, N'This Customer is in the Christmas Spirit', CAST(0xA6FE0531 AS SmallDateTime), 42, NULL, N'Silk Screen', N'06618aef-6cec-417e-9927-603d7a1f0f6d.jpg', 2, 1, CAST(0xA6FF02B0 AS SmallDateTime), 6000)
INSERT [dbo].[TSTOrders] ([TicketID], [TicketStatusID], [TroubleDescription], [StartDate], [SubmittedByID], [TechID], [Subject], [Picture], [PriorityID], [OrderTypeID], [FinshedDate], [Quantity]) VALUES (54, 3, N'Customer wants longsleeve green T-shirts', CAST(0xA6FF0489 AS SmallDateTime), 41, 26, N'Silk Screen', N'47df05c7-41c1-4f0d-a3e8-dbeaf5f5a420.jpg', 2, 1, NULL, 100)
SET IDENTITY_INSERT [dbo].[TSTOrders] OFF
SET IDENTITY_INSERT [dbo].[TSTOrderStatuses] ON 

INSERT [dbo].[TSTOrderStatuses] ([TicketStatusID], [Name], [Description]) VALUES (1, N'Completed', N'The work order has been completed.')
INSERT [dbo].[TSTOrderStatuses] ([TicketStatusID], [Name], [Description]) VALUES (2, N'Received', N'The work order has been received, but still has yet to be printed. ')
INSERT [dbo].[TSTOrderStatuses] ([TicketStatusID], [Name], [Description]) VALUES (3, N'In Process', N'The work order has been started, yet needs to be completed')
INSERT [dbo].[TSTOrderStatuses] ([TicketStatusID], [Name], [Description]) VALUES (4, N'Inactive', N'The order is an inactive one.')
SET IDENTITY_INSERT [dbo].[TSTOrderStatuses] OFF
SET IDENTITY_INSERT [dbo].[TSTOrderTypes] ON 

INSERT [dbo].[TSTOrderTypes] ([OrderTypeID], [Name], [Description]) VALUES (1, N'Screen Printed', N'Order type for clothing printing.')
INSERT [dbo].[TSTOrderTypes] ([OrderTypeID], [Name], [Description]) VALUES (2, N'Embroidery', N'Order type for sign or banner printing')
SET IDENTITY_INSERT [dbo].[TSTOrderTypes] OFF
SET IDENTITY_INSERT [dbo].[TSTPortfolioImages] ON 

INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (3, N'11b84656-1401-4fdc-84bd-bf5cba25c144.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (5, N'4b8fbfab-ea3e-4647-bd9c-774dee4d21b2.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (8, N'933af0f7-4a8d-4cf1-802d-8b0ec8c92dda.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (9, N'0c36e71e-618a-4994-bd38-981365a8dcbf.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (10, N'463e2f9b-76d6-43c4-9428-2c40097f454c.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (18, N'8cf1a840-d63f-435e-8a72-e4ecb4f4fe9e.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (19, N'859b8a34-72ca-4ad3-a7aa-602b1ebe1089.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (20, N'e4c81879-31f9-4df7-9c76-baf32dea443c.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (21, N'8d95c92c-c4a6-49b5-907a-740e69d31489.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (23, N'5f45d8be-e4d2-4ba5-b068-2688561fb8a8.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (25, N'f7bd5c40-25db-4b8c-902f-a51dec276748.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (26, N'0d2d81da-6d66-45b3-b470-69895d8d444f.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (27, N'556ded80-15e9-42b5-9d76-417374d18023.jpg')
INSERT [dbo].[TSTPortfolioImages] ([ImageID], [Image]) VALUES (29, N'9b721b0d-cc6b-4640-8ac2-223266dcddd3.jpg')
SET IDENTITY_INSERT [dbo].[TSTPortfolioImages] OFF
SET IDENTITY_INSERT [dbo].[TSTShopNotes] ON 

INSERT [dbo].[TSTShopNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (2, N'Add Tech note', 14, 40, CAST(0xA6FE0256 AS SmallDateTime))
INSERT [dbo].[TSTShopNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (3, N'test', 14, 40, CAST(0xA6FE0258 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[TSTShopNotes] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTDepartments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[TSTDepartments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatus] FOREIGN KEY([EmpStatusID])
REFERENCES [dbo].[TSTEmployeeStatuses] ([EmployeeStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders]  WITH CHECK ADD  CONSTRAINT [FK_TSTOrders_TSTEmployees] FOREIGN KEY([SubmittedByID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] CHECK CONSTRAINT [FK_TSTOrders_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders]  WITH CHECK ADD  CONSTRAINT [FK_TSTOrders_TSTEmployees1] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] CHECK CONSTRAINT [FK_TSTOrders_TSTEmployees1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders]  WITH CHECK ADD  CONSTRAINT [FK_TSTOrders_TSTOrderPriorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[TSTOrderPriorities] ([PriorityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] CHECK CONSTRAINT [FK_TSTOrders_TSTOrderPriorities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders]  WITH CHECK ADD  CONSTRAINT [FK_TSTOrders_TSTOrderStatuses] FOREIGN KEY([TicketStatusID])
REFERENCES [dbo].[TSTOrderStatuses] ([TicketStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] CHECK CONSTRAINT [FK_TSTOrders_TSTOrderStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders]  WITH CHECK ADD  CONSTRAINT [FK_TSTOrders_TSTOrderTypes] FOREIGN KEY([OrderTypeID])
REFERENCES [dbo].[TSTOrderTypes] ([OrderTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTOrders_TSTOrderTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTOrders]'))
ALTER TABLE [dbo].[TSTOrders] CHECK CONSTRAINT [FK_TSTOrders_TSTOrderTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTEmployees] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTTickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TSTOrders] ([TicketID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTShopNotes]'))
ALTER TABLE [dbo].[TSTShopNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
