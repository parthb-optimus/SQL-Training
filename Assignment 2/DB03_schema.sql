USE [DB03]
GO
/****** Object:  Table [dbo].[t_activity]    Script Date: 01-03-2018 11:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_activity](
	[Activity_id] [int] NOT NULL,
	[Activity_description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_atten_det]    Script Date: 01-03-2018 11:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_atten_det](
	[Atten_id] [int] IDENTITY(1001,1) NOT NULL,
	[Emp_id] [int] NULL,
	[Activity_id] [int] NULL,
	[Atten_start_datetime] [datetime] NULL,
	[Atten_end_hrs] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_emp]    Script Date: 01-03-2018 11:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_emp](
	[Emp_id] [int] IDENTITY(1001,2) NOT NULL,
	[Emp_Code] [varchar](50) NULL,
	[Emp_f_name] [varchar](50) NOT NULL,
	[Emp_m_name] [varchar](50) NULL,
	[Emp_l_name] [varchar](50) NULL,
	[Emp_DOB] [date] NULL,
	[Emp_DOJ] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_salary]    Script Date: 01-03-2018 11:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_salary](
	[Salary_id] [int] NULL,
	[Emp_id] [int] NULL,
	[Changed_date] [date] NULL,
	[New_Salary] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[t_activity] ([Activity_id], [Activity_description]) VALUES (1, N'Code Analysis')
GO
INSERT [dbo].[t_activity] ([Activity_id], [Activity_description]) VALUES (2, N'Lunch')
GO
INSERT [dbo].[t_activity] ([Activity_id], [Activity_description]) VALUES (3, N'Coding')
GO
INSERT [dbo].[t_activity] ([Activity_id], [Activity_description]) VALUES (4, N'Knowledge Transition')
GO
INSERT [dbo].[t_activity] ([Activity_id], [Activity_description]) VALUES (5, N'Database')
GO
SET IDENTITY_INSERT [dbo].[t_atten_det] ON 

GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1001, 1001, 5, CAST(0x00009E8900A4CB80 AS DateTime), 2)
GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1002, 1001, 1, CAST(0x00009E6B00A4CB80 AS DateTime), 3)
GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1003, 1001, 3, CAST(0x00009E6B00D63BC0 AS DateTime), 5)
GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1004, 1003, 5, CAST(0x00009E8C00A4CB80 AS DateTime), 8)
GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1005, 1003, 5, CAST(0x00009E8D00A4CB80 AS DateTime), 8)
GO
INSERT [dbo].[t_atten_det] ([Atten_id], [Emp_id], [Activity_id], [Atten_start_datetime], [Atten_end_hrs]) VALUES (1006, 1003, 5, CAST(0x00009E8F00A4CB80 AS DateTime), 7)
GO
SET IDENTITY_INSERT [dbo].[t_atten_det] OFF
GO
SET IDENTITY_INSERT [dbo].[t_emp] ON 

GO
INSERT [dbo].[t_emp] ([Emp_id], [Emp_Code], [Emp_f_name], [Emp_m_name], [Emp_l_name], [Emp_DOB], [Emp_DOJ]) VALUES (1001, N'OPT20110105', N'Manmohan', NULL, N'Singh', CAST(0xEE0B0B00 AS Date), CAST(0xDC320B00 AS Date))
GO
INSERT [dbo].[t_emp] ([Emp_id], [Emp_Code], [Emp_f_name], [Emp_m_name], [Emp_l_name], [Emp_DOB], [Emp_DOJ]) VALUES (1003, N'OPT20100915', N'Alfred', N'Joseph', N'Lawrence', CAST(0x22130B00 AS Date), CAST(0x5E350B00 AS Date))
GO
SET IDENTITY_INSERT [dbo].[t_emp] OFF
GO
INSERT [dbo].[t_salary] ([Salary_id], [Emp_id], [Changed_date], [New_Salary]) VALUES (1001, 1003, CAST(0xE7330B00 AS Date), CAST(20000 AS Decimal(18, 0)))
GO
INSERT [dbo].[t_salary] ([Salary_id], [Emp_id], [Changed_date], [New_Salary]) VALUES (1002, 1003, CAST(0xBD330B00 AS Date), CAST(25000 AS Decimal(18, 0)))
GO
INSERT [dbo].[t_salary] ([Salary_id], [Emp_id], [Changed_date], [New_Salary]) VALUES (1003, 1001, CAST(0xE7330B00 AS Date), CAST(26000 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[t_atten_det]  WITH CHECK ADD FOREIGN KEY([Activity_id])
REFERENCES [dbo].[t_activity] ([Activity_id])
GO
ALTER TABLE [dbo].[t_atten_det]  WITH CHECK ADD FOREIGN KEY([Emp_id])
REFERENCES [dbo].[t_emp] ([Emp_id])
GO
ALTER TABLE [dbo].[t_emp]  WITH CHECK ADD CHECK  (((datepart(year,[Emp_DOJ])-datepart(year,[Emp_DOB]))>(18) OR (datepart(year,[Emp_DOJ])-datepart(year,[Emp_DOB]))=(18) AND datepart(month,[Emp_DOJ])>datepart(month,[Emp_DOB]) OR (datepart(year,[Emp_DOJ])-datepart(year,[Emp_DOB]))=(18) AND datepart(month,[Emp_DOJ])>datepart(month,[Emp_DOB]) AND datepart(day,[Emp_DOJ])>=datepart(day,[Emp_DOB])))
GO
