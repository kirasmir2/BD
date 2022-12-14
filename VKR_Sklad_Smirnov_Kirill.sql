USE [master]
GO
/****** Object:  Database [VKRsklad]    Script Date: 23.06.2022 0:16:20 ******/
CREATE DATABASE [VKRsklad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VKRsklad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VKRsklad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VKRsklad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VKRsklad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VKRsklad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VKRsklad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VKRsklad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VKRsklad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VKRsklad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VKRsklad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VKRsklad] SET ARITHABORT OFF 
GO
ALTER DATABASE [VKRsklad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VKRsklad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VKRsklad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VKRsklad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VKRsklad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VKRsklad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VKRsklad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VKRsklad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VKRsklad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VKRsklad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VKRsklad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VKRsklad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VKRsklad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VKRsklad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VKRsklad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VKRsklad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VKRsklad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VKRsklad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VKRsklad] SET  MULTI_USER 
GO
ALTER DATABASE [VKRsklad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VKRsklad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VKRsklad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VKRsklad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VKRsklad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VKRsklad] SET QUERY_STORE = OFF
GO
USE [VKRsklad]
GO
/****** Object:  Table [dbo].[Dolwnost]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dolwnost](
	[Kod_dolwnosti] [int] NOT NULL,
	[Nazvanie] [nvarchar](200) NULL,
	[Oklad] [nvarchar](200) NULL,
	[Dolwnostnii_obiazannosti] [nvarchar](200) NULL,
 CONSTRAINT [PK_Dolwnost] PRIMARY KEY CLUSTERED 
(
	[Kod_dolwnosti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[Kod_klienta] [int] IDENTITY(1,1) NOT NULL,
	[Naimenovanie] [nvarchar](200) NULL,
	[Adres] [nvarchar](200) NULL,
	[Dopolnitelnaia_informawia] [nvarchar](500) NULL,
	[Nomer_telewona] [nvarchar](200) NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[Kod_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvoditel]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvoditel](
	[Kod_proizvoditelia] [int] NOT NULL,
	[Nazvanie_kompanii] [nvarchar](200) NULL,
	[Adres] [nvarchar](200) NULL,
 CONSTRAINT [PK_Proizvoditel] PRIMARY KEY CLUSTERED 
(
	[Kod_proizvoditelia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sklad]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklad](
	[Nomer_sklada] [int] NOT NULL,
	[Nazvanie] [nvarchar](200) NULL,
	[Uslovie_xranenia] [nvarchar](200) NULL,
 CONSTRAINT [PK_Sklad] PRIMARY KEY CLUSTERED 
(
	[Nomer_sklada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnik]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnik](
	[ID_sotrudnika] [int] IDENTITY(1,1) NOT NULL,
	[Wamilia] [nvarchar](200) NULL,
	[Imia] [nvarchar](200) NULL,
	[Otwewto] [nvarchar](200) NULL,
	[Passportnii_dannie] [nvarchar](200) NULL,
	[Nomer_telewona] [nvarchar](200) NULL,
	[Adres] [nvarchar](400) NULL,
	[Login] [nvarchar](200) NULL,
	[Parol] [nvarchar](200) NULL,
	[Dolwnost] [int] NULL,
	[Pol] [nvarchar](200) NULL,
 CONSTRAINT [PK_Sotrudnik] PRIMARY KEY CLUSTERED 
(
	[ID_sotrudnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tovar]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tovar](
	[Nomer_tovara] [int] IDENTITY(1,1) NOT NULL,
	[Nazvanie] [nvarchar](200) NULL,
	[Kolitewto_upakowok] [nvarchar](200) NULL,
	[Thena_za_upakowku] [int] NULL,
	[Tip_sklada] [int] NULL,
	[Proizvoditel] [int] NULL,
	[Postawsik] [nvarchar](200) NULL,
	[Srok_xranenia] [nvarchar](200) NULL,
	[Uslovia_xranenia] [nvarchar](200) NULL,
 CONSTRAINT [PK_Tovar] PRIMARY KEY CLUSTERED 
(
	[Nomer_tovara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[Nomer_zakaza] [int] IDENTITY(1,1) NOT NULL,
	[Klient] [int] NULL,
	[Kplitewto_upakowok] [nvarchar](200) NULL,
	[Ves] [nvarchar](200) NULL,
	[Data_dostavki] [datetime] NULL,
	[Adres_dostavki] [nvarchar](200) NULL,
	[Sotrudniki] [int] NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[Nomer_zakaza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz_Tovar]    Script Date: 23.06.2022 0:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz_Tovar](
	[NomerZakaza] [int] NOT NULL,
	[NomerTovara] [int] NOT NULL,
 CONSTRAINT [PK_Zakaz/Tovar] PRIMARY KEY CLUSTERED 
(
	[NomerZakaza] ASC,
	[NomerTovara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dolwnost] ([Kod_dolwnosti], [Nazvanie], [Oklad], [Dolwnostnii_obiazannosti]) VALUES (1, N'Кладовщик', N'30 000', N'Анализ, обработка товаров')
INSERT [dbo].[Dolwnost] ([Kod_dolwnosti], [Nazvanie], [Oklad], [Dolwnostnii_obiazannosti]) VALUES (2, N'Администратор', N'60 000', N'Анализ, обработка товаров, регистрация нового пользователя')
INSERT [dbo].[Dolwnost] ([Kod_dolwnosti], [Nazvanie], [Oklad], [Dolwnostnii_obiazannosti]) VALUES (3, N'Менеджер', N'25 000', N'Просмотр информации')
INSERT [dbo].[Dolwnost] ([Kod_dolwnosti], [Nazvanie], [Oklad], [Dolwnostnii_obiazannosti]) VALUES (4, N'Диспетчер', N'35 000', N'Просмотр информации')
GO
SET IDENTITY_INSERT [dbo].[Klient] ON 

INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (1, N'Аптека 76 Плюс', N'ул. Светлая, д.38', N'Аптека', N'41-00-50')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (2, N'Живика/ЗдравСити', N'ул.Труфанова, д.21', N'Аптека', N'53-33-13')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (3, N'ИП Аптека №4', N'ул. Республиканская, д.45', N'Аптека', N'72-67-59')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (4, N'Аптека +- здоров', N'ул. Толмогорова, д.44', N'Аптека', N'46-32-43')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (5, N'Астра', N'ул. Стачек , д. 60', N'Аптека', N'75-57-93')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (6, N'Арка76', N'ул. Труфанова, д.24', N'Аптечный склад', N'Отсутствует')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (7, N'Будь здоров!', N'ул. Бабича, д. 28', N'Аптека', N'59-44-80, 59-44-80')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (8, N'ФизО', N'ул. Светлая, д.43', N'Частный', N'89642323456')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (9, N'Вита Экспресс', N'ул. Свободы, д. 91', N'Аптека', N'8-800-755-00-03')
INSERT [dbo].[Klient] ([Kod_klienta], [Naimenovanie], [Adres], [Dopolnitelnaia_informawia], [Nomer_telewona]) VALUES (10, N'Столички', N'ул. Салтыкова-Щедрина, 44/18', N'Аптека', N'89201101257')
SET IDENTITY_INSERT [dbo].[Klient] OFF
GO
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (1, N'Органика АО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (2, N'Татхимфармпрепараты АО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (3, N'Байер Биттерфельд ГмбХ', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (4, N'Фармстандарт-Лексредства ОАО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (5, N'АВВА РУС АО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (6, N'Такеда Фармасьютикалс ООО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (7, N'Делфарм Гайярд', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (8, N'Юник Фармасьютикал Лабораториз (Отделение фирмы Дж.)', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (9, N'Биосинтез ПАО', N'1')
INSERT [dbo].[Proizvoditel] ([Kod_proizvoditelia], [Nazvanie_kompanii], [Adres]) VALUES (10, N'Обновление ПФК  АО', N'1')
GO
INSERT [dbo].[Sklad] ([Nomer_sklada], [Nazvanie], [Uslovie_xranenia]) VALUES (1, N'Общий склад', N'Всё хранится')
INSERT [dbo].[Sklad] ([Nomer_sklada], [Nazvanie], [Uslovie_xranenia]) VALUES (2, N'СДП', N'Сильнодействующие препараты')
INSERT [dbo].[Sklad] ([Nomer_sklada], [Nazvanie], [Uslovie_xranenia]) VALUES (3, N'Холодильник', N'2-8 градусов, температура хранения')
INSERT [dbo].[Sklad] ([Nomer_sklada], [Nazvanie], [Uslovie_xranenia]) VALUES (4, N'Прохлада', N'8-15 градусов, температура харенения')
GO
SET IDENTITY_INSERT [dbo].[Sotrudnik] ON 

INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (1, N'Ситников', N'Илья', N'Вадимович', N'2321 246743', N'89658737619', N'Г. Ярославль, ул Первомайская, дом 1, кв 33', N'1', N'1', 1, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (2, N'Тюкальцев', N'Дмитрий', N'Олегович', N'1222 345375', N'89628328541', N'Г. Ярославль, ул. Судостроителей, д. 11, кв 32', N'DmOl96', N'Oleg12', 2, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (3, N'Сарычев', N'Илья', N'Дмитриевич', N'2323 345654', N'89432431256', N'Г. Ярославль, ул. Звёздная, д. 21, кв 22', N'IlDm94', N'Dmit23', 4, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (4, N'Шарапин', N'Пётр', N'Сергеевич', N'7983 287534', N'89537856029', N'Г. Ярославль, ул. Звёздная, д. 23, кв 20', N'PeSe95', N'Serg79', 1, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (5, N'Петрович', N'Кирилл', N'Сергеевич', N'6885 342754', N'89617892432', N'Г. Ярославль, ул. Пушкина, д. 44, кв 5', N'KiSe96', N'Serg68', 1, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (6, N'Кутузов', N'Сергей', N'Олегович', N'4676 231436', N'89375812748', N'Г. Ярославль, ул. Черкирова, д. 4, кв 1', N'SeOl93', N'Oleg46', 1, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (7, N'Фёдоров', N'Егор', N'Алексеевич', N'3454 342554', N'89623847581', N'Г. Ярославль, ул. Пушкина, д. 2, кв 5', N'EgAl96', N'AleCoKt', 3, N'Муж')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (8, N'Фёдорова', N'Елена', N'Семеновна', N'3578 435546', N'89673456873', N'Г. Ярославль, ул. Первомайская, д. 6 , кв 5', N'ElSe96', N'Semen35M', 3, N'Жен')
INSERT [dbo].[Sotrudnik] ([ID_sotrudnika], [Wamilia], [Imia], [Otwewto], [Passportnii_dannie], [Nomer_telewona], [Adres], [Login], [Parol], [Dolwnost], [Pol]) VALUES (9, N'Ситникова', N'Галина', N'Аркадьевна', N'5656 656544', N'89343233233', N'Г. Ярославль, ул. Крестова, д. 1 , кв 75', N'SiTa93', N'Ar56Ar', 4, N'Жен')
SET IDENTITY_INSERT [dbo].[Sotrudnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Tovar] ON 

INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (1, N'Анальгин', N'115', 99, 3, 1, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (2, N'Аллобарбитал', N'92', 1000, 2, 2, N'ОЗОН ООО', N'24 мес', N'8-15 градусов')
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (3, N'Аспирин', N'56', 375, 2, 3, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (4, N'Уголь активированный', N'400', 40, 1, 4, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (5, N'Фильтрум-сти', N'120', 385, 1, 5, NULL, N'12 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (6, N'Актовегин', N'130', 657, 4, 6, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (7, N'Ренни', N'85', 249, 1, 7, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (8, N'Ринза', N'80', 114, 1, 8, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (9, N'Димедрол', N'50', 32, 2, 9, NULL, N'24 мес', NULL)
INSERT [dbo].[Tovar] ([Nomer_tovara], [Nazvanie], [Kolitewto_upakowok], [Thena_za_upakowku], [Tip_sklada], [Proizvoditel], [Postawsik], [Srok_xranenia], [Uslovia_xranenia]) VALUES (10, N'Валидол', N'78', 105, 1, 10, NULL, N'24 мес', NULL)
SET IDENTITY_INSERT [dbo].[Tovar] OFF
GO
SET IDENTITY_INSERT [dbo].[Zakaz] ON 

INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (6, 1, N'7', N'500 г', CAST(N'2022-02-20T12:00:00.000' AS DateTime), N'ул. Светлая, д.38', 1)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (7, 2, N'35', N'1 кг', CAST(N'2021-01-03T01:45:00.000' AS DateTime), N'ул.Труфанова, д.21', 4)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (8, 3, N'10', N'1 кг', CAST(N'2022-02-21T08:00:00.000' AS DateTime), N'ул. Республиканская, д.45', 4)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (9, 4, N'23', N'600 г', CAST(N'2022-06-21T08:00:00.000' AS DateTime), N'ул. Толмогорова, д.44', 6)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (10, 5, N'4', N'350 г', CAST(N'2022-06-20T09:00:00.000' AS DateTime), N'ул. Стачек , д. 60', 1)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (11, 6, N'30', N'900 г', CAST(N'2022-05-19T10:00:00.000' AS DateTime), N'ул. Труфанова, д.24', 6)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (12, 7, N'15', N'500 г', CAST(N'2022-05-07T08:00:00.000' AS DateTime), N'ул. Бабича, д. 28', 5)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (13, 3, N'10', N'675 г', CAST(N'2022-05-13T08:45:00.000' AS DateTime), N'ул. Республиканская, д.45', 5)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (14, 8, N'18', N'700 г', CAST(N'2022-06-21T12:00:00.000' AS DateTime), N'ул. Светлая, д.43', 1)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (15, 2, N'6', N'378 г', CAST(N'2022-06-07T07:40:00.000' AS DateTime), N'ул.Труфанова, д.21', 6)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (16, 9, N'12', N'369', CAST(N'2022-06-29T12:00:00.000' AS DateTime), N'ул. Свободы, д. 91', 4)
INSERT [dbo].[Zakaz] ([Nomer_zakaza], [Klient], [Kplitewto_upakowok], [Ves], [Data_dostavki], [Adres_dostavki], [Sotrudniki]) VALUES (17, 10, N'13', N'350', CAST(N'2022-07-18T12:00:00.000' AS DateTime), N'ул. Салтыкова-Щедрина, 44/18', 5)
SET IDENTITY_INSERT [dbo].[Zakaz] OFF
GO
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (6, 1)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (6, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (6, 3)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (6, 4)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (6, 5)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (7, 6)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (7, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (7, 10)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (8, 1)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (8, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (8, 8)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (8, 9)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (9, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (9, 4)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (9, 6)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (9, 8)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (10, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (10, 3)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (10, 9)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (10, 10)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (11, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (11, 6)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (11, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (11, 9)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (12, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (12, 4)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (13, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (13, 8)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (13, 10)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (14, 1)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (14, 5)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (14, 6)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (14, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (15, 4)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (15, 6)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (15, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (16, 4)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (16, 9)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (17, 2)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (17, 7)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (17, 8)
INSERT [dbo].[Zakaz_Tovar] ([NomerZakaza], [NomerTovara]) VALUES (17, 10)
GO
ALTER TABLE [dbo].[Sotrudnik]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudnik_Dolwnost] FOREIGN KEY([Dolwnost])
REFERENCES [dbo].[Dolwnost] ([Kod_dolwnosti])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sotrudnik] CHECK CONSTRAINT [FK_Sotrudnik_Dolwnost]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Proizvoditel] FOREIGN KEY([Proizvoditel])
REFERENCES [dbo].[Proizvoditel] ([Kod_proizvoditelia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Proizvoditel]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Sklad] FOREIGN KEY([Tip_sklada])
REFERENCES [dbo].[Sklad] ([Nomer_sklada])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Sklad]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Klient] FOREIGN KEY([Klient])
REFERENCES [dbo].[Klient] ([Kod_klienta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Klient]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Sotrudnik] FOREIGN KEY([Sotrudniki])
REFERENCES [dbo].[Sotrudnik] ([ID_sotrudnika])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Sotrudnik]
GO
ALTER TABLE [dbo].[Zakaz_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz/Tovar_Tovar] FOREIGN KEY([NomerTovara])
REFERENCES [dbo].[Tovar] ([Nomer_tovara])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zakaz_Tovar] CHECK CONSTRAINT [FK_Zakaz/Tovar_Tovar]
GO
ALTER TABLE [dbo].[Zakaz_Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz/Tovar_Zakaz] FOREIGN KEY([NomerZakaza])
REFERENCES [dbo].[Zakaz] ([Nomer_zakaza])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zakaz_Tovar] CHECK CONSTRAINT [FK_Zakaz/Tovar_Zakaz]
GO
USE [master]
GO
ALTER DATABASE [VKRsklad] SET  READ_WRITE 
GO
