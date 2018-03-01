USE [SQLTEST]
GO
/****** Object:  Table [dbo].[department]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[departmentid] [int] NOT NULL,
	[departmentname] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[departmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[employeeid] [int] IDENTITY(1101,1) NOT NULL,
	[employeename] [varchar](30) NULL,
	[departmentid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JourneyDetails]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyDetails](
	[TrainID] [int] NULL,
	[StationID] [int] NULL,
	[Distance] [int] NULL,
	[ScheduleArrival] [datetime] NULL,
	[Departure] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project](
	[projectid] [int] IDENTITY(101,1) NOT NULL,
	[projectname] [varchar](30) NULL,
	[departmentid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[projectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[employeeid] [int] NULL,
	[projectid] [int] NULL,
	[hrs] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StationDetails]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StationDetails](
	[StationID] [int] NULL,
	[StationName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainDetails]    Script Date: 01-03-2018 13:16:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainDetails](
	[TrainID] [int] NULL,
	[TrainName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[department] ([departmentid], [departmentname]) VALUES (1, N'HR')
GO
INSERT [dbo].[department] ([departmentid], [departmentname]) VALUES (2, N'Development')
GO
INSERT [dbo].[department] ([departmentid], [departmentname]) VALUES (3, N'Testing')
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1101, N'Employee 1', 1)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1102, N'Employee 2', 1)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1103, N'Employee 3', 1)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1104, N'Employee 4', 1)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1105, N'Employee 5', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1106, N'Employee 6', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1107, N'Employee 7', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1108, N'Employee 8', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1109, N'Employee 9', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1110, N'Employee 10', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1111, N'Employee 11', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1112, N'Employee 12', 2)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1113, N'Employee 13', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1114, N'Employee 14', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1115, N'Employee 15', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1116, N'Employee 16', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1117, N'Employee 17', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1118, N'Employee 18', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1119, N'Employee 19', 3)
GO
INSERT [dbo].[employee] ([employeeid], [employeename], [departmentid]) VALUES (1120, N'Employee 20', 3)
GO
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (11404, 101, 0, NULL, CAST(0x00009FE300317040 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (11404, 103, 750, CAST(0x00009FE3009C8E20 AS DateTime), NULL)
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (22505, 101, 0, NULL, CAST(0x00009FE300537F00 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (22505, 102, 225, CAST(0x00009FE3005AA320 AS DateTime), CAST(0x00009FE30062E080 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (22505, 104, 150, CAST(0x00009FE300761A60 AS DateTime), CAST(0x00009FE3008116E0 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (22505, 103, 100, CAST(0x00009FE3008C1360 AS DateTime), NULL)
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (33606, 102, 0, NULL, CAST(0x00009FE300B12790 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (33606, 104, 150, CAST(0x00009FE300DBBA00 AS DateTime), CAST(0x00009FE300E297D0 AS DateTime))
GO
INSERT [dbo].[JourneyDetails] ([TrainID], [StationID], [Distance], [ScheduleArrival], [Departure]) VALUES (33606, 103, 100, CAST(0x00009FE3011DA500 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[project] ON 

GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (101, N'Project 1', 1)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (102, N'Project 2', 2)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (103, N'Project 3', 2)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (104, N'Project 4', 3)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (105, N'Project 5', 3)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (106, N'Project 6', 3)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (107, N'Project 7', 2)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (108, N'Project 8', 2)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (109, N'Project 9', 1)
GO
INSERT [dbo].[project] ([projectid], [projectname], [departmentid]) VALUES (110, N'Project 10', 2)
GO
SET IDENTITY_INSERT [dbo].[project] OFF
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1101, 101, 6)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1102, 101, 2)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1103, 102, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1104, 102, 4)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1105, 103, 5)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1106, 103, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1107, 104, 4)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1108, 104, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1109, 105, 9)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1110, 105, 8)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1111, 106, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1112, 106, 7)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1113, 107, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1114, 107, 6)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1115, 108, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1116, 108, 5)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1117, 109, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1118, 109, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1119, 110, 4)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1120, 110, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1109, 105, 4)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1110, 105, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1111, 106, 2)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1112, 106, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1101, 103, 3)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1102, 104, 4)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1103, 105, 1)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1104, 107, 6)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1105, 108, 7)
GO
INSERT [dbo].[schedule] ([employeeid], [projectid], [hrs]) VALUES (1106, 110, 8)
GO
INSERT [dbo].[StationDetails] ([StationID], [StationName]) VALUES (101, N'Delhi')
GO
INSERT [dbo].[StationDetails] ([StationID], [StationName]) VALUES (102, N'Aligarh')
GO
INSERT [dbo].[StationDetails] ([StationID], [StationName]) VALUES (103, N'Lucknow')
GO
INSERT [dbo].[StationDetails] ([StationID], [StationName]) VALUES (104, N'Kanpur')
GO
INSERT [dbo].[TrainDetails] ([TrainID], [TrainName]) VALUES (11404, N'Shatabdi')
GO
INSERT [dbo].[TrainDetails] ([TrainID], [TrainName]) VALUES (22505, N'Rajdhani')
GO
INSERT [dbo].[TrainDetails] ([TrainID], [TrainName]) VALUES (33606, N'Passanger')
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([departmentid])
REFERENCES [dbo].[department] ([departmentid])
GO
ALTER TABLE [dbo].[project]  WITH CHECK ADD FOREIGN KEY([departmentid])
REFERENCES [dbo].[department] ([departmentid])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([employeeid])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([projectid])
REFERENCES [dbo].[project] ([projectid])
GO
