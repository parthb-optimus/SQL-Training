USE [DB02]
GO
/****** Object:  Table [dbo].[t_user_master]    Script Date: 28-02-2018 12:00:01 ******/
DROP TABLE [dbo].[t_user_master]
GO
/****** Object:  Table [dbo].[t_transaction]    Script Date: 28-02-2018 12:00:01 ******/
DROP TABLE [dbo].[t_transaction]
GO
/****** Object:  Table [dbo].[t_product_master]    Script Date: 28-02-2018 12:00:01 ******/
DROP TABLE [dbo].[t_product_master]
GO
/****** Object:  Table [dbo].[t_product_master]    Script Date: 28-02-2018 12:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_product_master](
	[Product_ID] [varchar](5) NULL,
	[Product_Name] [varchar](50) NULL,
	[Cost_Per_Item] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_transaction]    Script Date: 28-02-2018 12:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_transaction](
	[User_ID] [varchar](5) NULL,
	[Product_ID] [varchar](5) NULL,
	[Transaction_Date] [date] NULL,
	[Transaction_Type] [varchar](50) NULL,
	[Transaction_Amount] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user_master]    Script Date: 28-02-2018 12:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user_master](
	[User_ID] [varchar](5) NULL,
	[User_Name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_product_master] ([Product_ID], [Product_Name], [Cost_Per_Item]) VALUES (N'P1', N'Pen', 10)
GO
INSERT [dbo].[t_product_master] ([Product_ID], [Product_Name], [Cost_Per_Item]) VALUES (N'P2', N'Scale', 15)
GO
INSERT [dbo].[t_product_master] ([Product_ID], [Product_Name], [Cost_Per_Item]) VALUES (N'P3', N'Note Book', 25)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U1', N'P1', CAST(0x75330B00 AS Date), N'Order', 150)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U1', N'P1', CAST(0x8F330B00 AS Date), N'Payment', 750)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U1', N'P1', CAST(0x8F330B00 AS Date), N'Order', 200)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U1', N'P3', CAST(0x94330B00 AS Date), N'Order', 50)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U3', N'P2', CAST(0x95330B00 AS Date), N'Order', 100)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U2', N'P1', CAST(0xA8330B00 AS Date), N'Order', 75)
GO
INSERT [dbo].[t_transaction] ([User_ID], [Product_ID], [Transaction_Date], [Transaction_Type], [Transaction_Amount]) VALUES (N'U3', N'P2', CAST(0xC7330B00 AS Date), N'Payment', 250)
GO
INSERT [dbo].[t_user_master] ([User_ID], [User_Name]) VALUES (N'U1', N'Alfred Lawrence')
GO
INSERT [dbo].[t_user_master] ([User_ID], [User_Name]) VALUES (N'U2', N'William Paul')
GO
INSERT [dbo].[t_user_master] ([User_ID], [User_Name]) VALUES (N'U3', N'Edward Fillip')
GO
