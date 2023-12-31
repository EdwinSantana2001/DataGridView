USE [master]
GO
/****** Object:  Database [SolutionFinal]    Script Date: 09/27/2023 1:48:57 a. m. ******/
CREATE DATABASE [SolutionFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SolutionFinal', FILENAME = N'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\SolutionFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SolutionFinal_log', FILENAME = N'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\SolutionFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SolutionFinal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SolutionFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SolutionFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SolutionFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SolutionFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SolutionFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SolutionFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [SolutionFinal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SolutionFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SolutionFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SolutionFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SolutionFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SolutionFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SolutionFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SolutionFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SolutionFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SolutionFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SolutionFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SolutionFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SolutionFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SolutionFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SolutionFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SolutionFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SolutionFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SolutionFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SolutionFinal] SET  MULTI_USER 
GO
ALTER DATABASE [SolutionFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SolutionFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SolutionFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SolutionFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SolutionFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SolutionFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SolutionFinal] SET QUERY_STORE = ON
GO
ALTER DATABASE [SolutionFinal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SolutionFinal]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [nvarchar](50) NOT NULL,
	[apellido_cliente] [nvarchar](50) NOT NULL,
	[tipo_identificacion] [varchar](9) NULL,
	[identificacion] [varchar](48) NOT NULL,
	[telefono] [varchar](9) NULL,
	[email] [varchar](255) NULL,
	[direccion_residencia] [nvarchar](255) NULL,
	[fk_codigo_corregimiento] [varchar](10) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[edad]  AS (datediff(year,[fecha_nacimiento],getdate())),
	[genero] [varchar](9) NULL,
	[PEP] [bit] NOT NULL,
	[tipo_contrib] [varchar](16) NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[codigo_provincia] [varchar](3) NULL,
	[nombre_provincia] [varchar](100) NULL,
	[codigo_distrito] [varchar](6) NULL,
	[nombre_distrito] [varchar](100) NULL,
	[codigo_corregimiento] [varchar](10) NOT NULL,
	[nombre_corregimiento] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_corregimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[id_servicio] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_id_cliente] [bigint] NULL,
	[fk_id_producto] [int] NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_termino] [date] NULL,
	[descripcion] [nchar](2000) NULL,
	[monto] [money] NOT NULL,
	[servicio_activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id_cliente], [nombre_cliente], [apellido_cliente], [tipo_identificacion], [identificacion], [telefono], [email], [direccion_residencia], [fk_codigo_corregimiento], [fecha_nacimiento], [genero], [PEP], [tipo_contrib], [activo]) VALUES (1, N'Edwin', N'Santana', N'CEDULA', N'8-966-1136', N'6891-7200', N'edwsan2001edwsan@gmail.com', N'Por el coco', N'CD13004006', CAST(N'2001-10-02' AS Date), N'MASCULINO', 0, N'GOBIERNO', 1)
INSERT [dbo].[Clientes] ([id_cliente], [nombre_cliente], [apellido_cliente], [tipo_identificacion], [identificacion], [telefono], [email], [direccion_residencia], [fk_codigo_corregimiento], [fecha_nacimiento], [genero], [PEP], [tipo_contrib], [activo]) VALUES (4, N'Marta', N'Santana', N'CEDULA', N'8-967-1136', N'6449-1824', N'marta2004marta@gmail.com', N'Por el coco', N'CD13004006', CAST(N'2004-08-23' AS Date), N'FEMENINO', 0, N'GOBIERNO', 1)
INSERT [dbo].[Clientes] ([id_cliente], [nombre_cliente], [apellido_cliente], [tipo_identificacion], [identificacion], [telefono], [email], [direccion_residencia], [fk_codigo_corregimiento], [fecha_nacimiento], [genero], [PEP], [tipo_contrib], [activo]) VALUES (5, N'Arel', N'Santana', N'CEDULA', N'8-966-1137', N'6894-8965', N'arel@gmail.com', N'El coco cerca del inadeh', N'CD13004006', CAST(N'2002-10-16' AS Date), N'MASCULINO', 0, N'GOBIERNO', 1)
INSERT [dbo].[Clientes] ([id_cliente], [nombre_cliente], [apellido_cliente], [tipo_identificacion], [identificacion], [telefono], [email], [direccion_residencia], [fk_codigo_corregimiento], [fecha_nacimiento], [genero], [PEP], [tipo_contrib], [activo]) VALUES (6, N'Gisela', N'Ramirez', N'CEDULA', N'8-966-1148', N'6894-8965', N'Gisela@gmail.com', N'Cerca de doña paquita', N'CD13004006', CAST(N'1988-10-16' AS Date), N'FEMENINO', 0, N'GOBIERNO', 1)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (1, N'AMADEUS ADVANCE')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (2, N'AMADEUS ENTERPRISE')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (3, N'AMADEUS FIDUCIA')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (4, N'MEDICUSS')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (5, N'AMADEUS NOMINA')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (6, N'AMADEUS RRHH')
INSERT [dbo].[Productos] ([id_producto], [nombre_producto]) VALUES (7, N'AMADEUS PRESUPUESTO')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01001', N'BOCAS DEL TORO', N'CD01001001', N'BOCAS DEL TORO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01001', N'BOCAS DEL TORO', N'CD01001002', N'BASTIMENTOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01001', N'BOCAS DEL TORO', N'CD01001003', N'CAUCHERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01001', N'BOCAS DEL TORO', N'CD01001004', N'PUNTA LAUREL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01001', N'BOCAS DEL TORO', N'CD01001005', N'TIERRA OSCURA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002001', N'CHANGUINOLA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002002', N'ALMIRANTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002003', N'GUABITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002004', N'TERIBE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002005', N'VALLE DEL RISCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002006', N'EL EMPALME')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01002', N'CHANGUINOLA', N'CD01002007', N'LAS TABLAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01003', N'CHIRIQUI GRANDE', N'CD01003001', N'CHIRIQUI GRANDE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01003', N'CHIRIQUI GRANDE', N'CD01003002', N'MIRAMAR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01003', N'CHIRIQUI GRANDE', N'CD01003003', N'PUNTA PEÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01003', N'CHIRIQUI GRANDE', N'CD01003004', N'PUNTA ROBALO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P01', N'BOCAS DEL TORO', N'D01003', N'CHIRIQUI GRANDE', N'CD01003005', N'RAMBALA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02001', N'AGUADULCE', N'CD02001001', N'AGUADULCE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02001', N'AGUADULCE', N'CD02001002', N'EL CRISTO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02001', N'AGUADULCE', N'CD02001003', N'EL ROBLE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02001', N'AGUADULCE', N'CD02001004', N'POCRI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02001', N'AGUADULCE', N'CD02001005', N'BARRIOS UNIDOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002001', N'ANTON (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002002', N'CABUYA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002003', N'EL CHIRU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002004', N'EL RETIRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002005', N'EL VALLE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002006', N'JUAN DIAZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002007', N'RIO HATO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002008', N'SAN JUAN DE DIOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002009', N'SANTA RITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02002', N'ANTON', N'CD02002010', N'CABALLERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003001', N'LA PINTADA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003002', N'EL HARINO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003003', N'EL POTRERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003004', N'LLANO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003005', N'PIEDRAS GORDAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02003', N'LA PINTADA', N'CD02003006', N'LAS LOMAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02004', N'NATA', N'CD02004001', N'NATA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02004', N'NATA', N'CD02004002', N'CAPELLANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02004', N'NATA', N'CD02004003', N'EL CAÑO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02004', N'NATA', N'CD02004004', N'GUZMAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02004', N'NATA', N'CD02004006', N'TOZA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02005', N'OLA', N'CD02005001', N'OLA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02005', N'OLA', N'CD02005002', N'EL COPE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02005', N'OLA', N'CD02005003', N'EL PALMAR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02005', N'OLA', N'CD02005004', N'EL PICACHO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02005', N'OLA', N'CD02005005', N'LA PAVA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006001', N'PENONOME (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006002', N'CAÑAVERAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006003', N'COCLE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006004', N'CHIGUIRI ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006005', N'EL COCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006006', N'PAJONAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006007', N'RIO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006008', N'RIO INDIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006009', N'TOABRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P02', N'COCLE', N'D02006', N'PENONOME', N'CD02006010', N'TULU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001001', N'BARRIO NORTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001002', N'BARRIO SUR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001003', N'BUENA VISTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001004', N'CATIVA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001005', N'CIRCITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001006', N'CRISTOBAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001007', N'ESCOBAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001008', N'LIMON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001009', N'NUEVA PROVIDENCIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001010', N'PUERTO PILON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001011', N'SABANITAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001012', N'SALAMANCA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001013', N'SAN JUAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03001', N'COLON', N'CD03001014', N'SANTA ROSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002001', N'NUEVO CHAGRES (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002002', N'ACHIOTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002003', N'EL GUABO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002004', N'LA ENCANTADA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002005', N'PALMAS BELLAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002006', N'PIÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03002', N'CHAGRES', N'CD03002007', N'SALUD')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003001', N'MIGUEL DE LA BORDA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003002', N'COCLE DEL NORTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003003', N'EL GUASMO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003004', N'GOBEA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003005', N'RIO INDIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03003', N'DONOSO', N'CD03003006', N'SAN JOSE DEL GENERAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03004', N'PORTOBELO', N'CD03004001', N'PORTOBELO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03004', N'PORTOBELO', N'CD03004002', N'CACIQUE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03004', N'PORTOBELO', N'CD03004003', N'GARROTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03004', N'PORTOBELO', N'CD03004004', N'ISLA GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03004', N'PORTOBELO', N'CD03004005', N'MARIA CHIQUITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005001', N'PALENQUE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005002', N'CUANGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005003', N'MIRAMAR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005004', N'NOMBRE DE DIOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005005', N'PALMIRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005006', N'PLAYA CHIQUITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005007', N'SANTA ISABEL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P03', N'COLON', N'D03005', N'SANTA ISABEL', N'CD03005008', N'VIENTO FRIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001001', N'ALANJE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001002', N'DIVALA')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001003', N'EL TEJAR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001004', N'GUARUMAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001005', N'PALO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001006', N'QUEREVALO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001007', N'SANTO TOMAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001008', N'CANTA GALLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04001', N'ALANJE', N'CD04001009', N'NUEVO MEXICO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04002', N'BARU', N'CD04002001', N'PUERTO ARMUELLES (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04002', N'BARU', N'CD04002002', N'LIMONES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04002', N'BARU', N'CD04002003', N'PROGRESO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04002', N'BARU', N'CD04002004', N'BACO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04002', N'BARU', N'CD04002005', N'RODOLFO AGUILAR DELGADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003001', N'BOQUERON (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003002', N'BAGALA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003003', N'CORDILLERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003004', N'GUABAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003005', N'GUAYABAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003006', N'PARAISO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003007', N'PEDREGAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04003', N'BOQUERON', N'CD04003008', N'TIJERAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004001', N'BAJO BOQUETE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004002', N'CALDERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004003', N'PALMIRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004004', N'ALTO BOQUETE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004005', N'JARAMILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04004', N'BOQUETE', N'CD04004006', N'LOS NARANJOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005001', N'LA CONCEPCION (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005002', N'ASERRIO DE GARICHE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005003', N'BUGABA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005004', N'CERRO PUNTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005005', N'GOMEZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005006', N'LA ESTRELLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005007', N'SAN ANDRES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005008', N'SANTA MARTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005009', N'SANTA ROSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005010', N'SANTO DOMINGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005011', N'SORTOVA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005012', N'VOLCAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04005', N'BUGABA', N'CD04005013', N'EL BONGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006001', N'DAVID (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006002', N'BIJAGUAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006003', N'COCHEA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006004', N'CHIRIQUI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006005', N'GUACA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006006', N'LAS LOMAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006007', N'PEDREGAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006008', N'SAN CARLOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006009', N'SAN PABLO NUEVO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04006', N'DAVID', N'CD04006010', N'SAN PABLO VIEJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007001', N'DOLEGA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007002', N'DOS RIOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007003', N'LOS ANASTACIOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007004', N'POTRERILLOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007005', N'POTRERILLOS ABAJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007006', N'ROVIRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007007', N'TINAJAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04007', N'DOLEGA', N'CD04007008', N'LOS ALGARRROBOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04008', N'GUALACA', N'CD04008001', N'GUALACA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04008', N'GUALACA', N'CD04008002', N'HORNITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04008', N'GUALACA', N'CD04008003', N'LOS ANGELES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04008', N'GUALACA', N'CD04008004', N'PAJA DE SOMBRERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04008', N'GUALACA', N'CD04008005', N'RINCON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04009', N'REMEDIOS', N'CD04009001', N'REMEDIOS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04009', N'REMEDIOS', N'CD04009002', N'EL NANCITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04009', N'REMEDIOS', N'CD04009003', N'EL PORVENIR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04009', N'REMEDIOS', N'CD04009004', N'EL PUERTO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04009', N'REMEDIOS', N'CD04009005', N'SANTA LUCIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010001', N'RIO SERENO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010002', N'BREÑON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010003', N'CAÑAS GORDAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010004', N'MONTE LIRIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010005', N'PLAZA CAISAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010006', N'SANTA CRUZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010007', N'DOMINICAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04010', N'RENACIMIENTO', N'CD04010008', N'SANTA CLARA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04011', N'SAN FELIX', N'CD04011001', N'LAS LAJAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04011', N'SAN FELIX', N'CD04011002', N'JUAY')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04011', N'SAN FELIX', N'CD04011003', N'LAJAS ADENTRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04011', N'SAN FELIX', N'CD04011004', N'SAN FELIX')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04011', N'SAN FELIX', N'CD04011005', N'SANTA CRUZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04012', N'SAN LORENZO', N'CD04012001', N'HORCONCITOS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04012', N'SAN LORENZO', N'CD04012002', N'BOCA CHICA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04012', N'SAN LORENZO', N'CD04012003', N'BOCA DEL MONTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04012', N'SAN LORENZO', N'CD04012004', N'SAN JUAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04012', N'SAN LORENZO', N'CD04012005', N'SAN LORENZO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013001', N'TOLE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013002', N'BELLA VISTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013003', N'CERRO VIEJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013004', N'EL CRISTO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013005', N'JUSTO FIDEL PALACIOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013006', N'LAJAS DE TOLE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013007', N'POTRERO DE CAÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013008', N'QUEBRADA DE PIEDRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P04', N'CHIRIQUI', N'D04013', N'TOLE', N'CD04013009', N'VELADERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001001', N'LA PALMA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001002', N'CAMOGANTI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001003', N'CHEPIGANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001004', N'GARACHINE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001005', N'JAQUE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001006', N'PUERTO PIÑA')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001007', N'RIO CONGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001008', N'RIO IGLESIAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001009', N'SAMBU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001010', N'SETEGANTI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001011', N'TAIMATI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001012', N'TUCUTI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001013', N'AGUA FRIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001014', N'CUCUNATI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001015', N'RIO CONGO ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05001', N'CHEPIGANA', N'CD05001016', N'SANTA FE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002001', N'EL REAL DE SANTA MARIA (CABECE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002002', N'BOCA DE CUPE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002003', N'PAYA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002004', N'PINOGANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002005', N'PUCURO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002006', N'YAPE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002007', N'YAVIZA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002008', N'METETI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P05', N'DARIEN', N'D05002', N'PINOGANA', N'CD05002009', N'COMARCA KUNA DE WARGANDI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06001', N'CHITRE', N'CD06001001', N'CHITRE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06001', N'CHITRE', N'CD06001002', N'LA ARENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06001', N'CHITRE', N'CD06001003', N'MONAGRILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06001', N'CHITRE', N'CD06001004', N'LLANO BONITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06001', N'CHITRE', N'CD06001005', N'SAN JUAN BAUTISTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002001', N'LAS MINAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002002', N'CHEPO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002003', N'CHUMICAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002004', N'EL TORO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002005', N'LEONES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002006', N'QUEBRADA DEL ROSARIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06002', N'LAS MINAS', N'CD06002007', N'QUEBRADA EL CIPRIAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003001', N'LOS POZOS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003002', N'CAPURI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003003', N'EL CALABACITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003004', N'EL CEDRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003005', N'LA ARENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003006', N'LA PITALOSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003007', N'LOS CERRITOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003008', N'LOS CERROS DE PAJA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06003', N'LOS POZOS', N'CD06003009', N'LAS LLANAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004001', N'OCU (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004002', N'CERRO LARGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004003', N'LOS LLANOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004004', N'LLANO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004005', N'PEÑAS CHATAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004006', N'EL TIJERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06004', N'OCU', N'CD06004007', N'MENCHACA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005001', N'PARITA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005002', N'CABUYA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005003', N'LOS CASTILLOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005004', N'LLANO DE LA CRUZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005005', N'PARIS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005006', N'PORTOBELILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06005', N'PARITA', N'CD06005007', N'POTUGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006001', N'PESE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006002', N'LAS CABRAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006003', N'EL PAJARO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006004', N'EL BARRERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006005', N'EL PEDREGOSO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006006', N'EL CIRUELO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006007', N'SABANAGRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06006', N'PESE', N'CD06006008', N'RINCON HONDO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06007', N'SANTA MARIA', N'CD06007001', N'SANTA MARIA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06007', N'SANTA MARIA', N'CD06007002', N'CHUPAMPA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06007', N'SANTA MARIA', N'CD06007003', N'EL RINCON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06007', N'SANTA MARIA', N'CD06007004', N'EL LIMON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P06', N'HERRERA', N'D06007', N'SANTA MARIA', N'CD06007005', N'LOS CANELOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001001', N'GUARARE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001002', N'EL ESPINAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001003', N'EL MACANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001004', N'GUARARE ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001005', N'LA ENEA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001006', N'LA PASERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001007', N'LAS TRANCAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001008', N'LLANO ABAJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001009', N'EL HATO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07001', N'GUARARE', N'CD07001010', N'PERALES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002001', N'LAS TABLAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002002', N'BAJO CORRAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002003', N'BAYANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002004', N'EL CARATE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002005', N'EL COCAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002006', N'EL MANANTIAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002007', N'EL MUÑOZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002008', N'EL PEDREGOSO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002009', N'LA LAJA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002010', N'LA MIEL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002011', N'LA PALMA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002012', N'LA TIZA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002013', N'LAS PALMITAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002014', N'LAS TABLAS ABAJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002015', N'NUARIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002016', N'PALMIRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002017', N'PEÑA BLANCA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002018', N'RIO HONDO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002019', N'SAN JOSE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002020', N'SAN MIGUEL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002021', N'SANTO DOMINGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002022', N'SESTEADERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002023', N'VALLE RICO')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07002', N'LAS TABLAS', N'CD07002024', N'VALLERIQUITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003001', N'LA VILLA DE LOS SANTOS (CABECE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003002', N'EL GUASIMO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003003', N'LA COLORADA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003004', N'LA ESPIGADILLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003005', N'LAS CRUCES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003006', N'LAS GUABAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003007', N'LOS ANGELES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003008', N'LOS OLIVOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003009', N'LLANO LARGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003010', N'SABANAGRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003011', N'SANTA ANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003012', N'TRES QUEBRADAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003013', N'AGUA BUENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07003', N'LOS SANTOS', N'CD07003014', N'VILLA LOURDES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004001', N'MACARACAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004002', N'BAHIA HONDA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004003', N'BAJOS DE GUERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004004', N'COROZAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004005', N'CHUPA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004006', N'EL CEDRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004007', N'ESPINO AMARILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004008', N'LA MESA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004009', N'LAS PALMAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004010', N'LLANO DE PIEDRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07004', N'MACARACAS', N'CD07004011', N'MOGOLLON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07005', N'PEDASI', N'CD07005001', N'PEDASI (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07005', N'PEDASI', N'CD07005002', N'LOS ASIENTOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07005', N'PEDASI', N'CD07005003', N'MARIABE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07005', N'PEDASI', N'CD07005004', N'PURIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07005', N'PEDASI', N'CD07005005', N'ORIA ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07006', N'POCRI', N'CD07006001', N'POCRI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07006', N'POCRI', N'CD07006002', N'EL CAÑAFISTULO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07006', N'POCRI', N'CD07006003', N'LAJAMINA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07006', N'POCRI', N'CD07006004', N'PARAISO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07006', N'POCRI', N'CD07006005', N'PARITILLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007001', N'TONOSI (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007002', N'ALTOS DE GUERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007003', N'CAÑAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007004', N'EL BEBEDERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007005', N'EL CACAO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007006', N'EL CORTEZO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007007', N'FLORES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007008', N'GUANICO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007009', N'LA TRONOSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007010', N'CAMBUTAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P07', N'LOS SANTOS', N'D07007', N'TONOSI', N'CD07007011', N'ISLA DE CAQAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002001', N'SAN MIGUEL (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002002', N'LA ENSENADA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002003', N'LA ESMERALDA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002004', N'LA GUINEA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002005', N'PEDRO GONZALEZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08002', N'BALBOA', N'CD08002006', N'SABOGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005001', N'CHEPO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005002', N'CAÑITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005003', N'CHEPILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005004', N'EL LLANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005005', N'LAS MARGARITAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005006', N'SANTA CRUZ DE CHININA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005007', N'COMARCA KUNA DE MADUNGANDI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08005', N'CHEPO', N'CD08005008', N'TORTI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08006', N'CHIMAN', N'CD08006001', N'CHIMAN (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08006', N'CHIMAN', N'CD08006002', N'BRUJAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08006', N'CHIMAN', N'CD08006003', N'GONZALO VASQUEZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08006', N'CHIMAN', N'CD08006004', N'PASIGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08006', N'CHIMAN', N'CD08006005', N'UNION SANTEÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008001', N'SAN FELIPE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008002', N'EL CHORRILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008003', N'SANTA ANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008004', N'LA EXPOSICION O CALIDONIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008005', N'CURUNDU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008006', N'BETANIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008007', N'BELLA VISTA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008008', N'PUEBLO NUEVO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008009', N'SAN FRANCISCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008010', N'PARQUE LEFEVRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008011', N'RIO ABAJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008012', N'JUAN DIAZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008013', N'PEDREGAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008014', N'ANCON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008015', N'CHILIBRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008016', N'LAS CUMBRES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008017', N'PACORA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008018', N'SAN MARTIN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008019', N'TOCUMEN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008020', N'LAS MAÑANITAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008021', N'24 DE DICIEMBRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008022', N'ERNESTO CORDOBA CAMPOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008023', N'ALCALDE DIAZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008024', N'CAIMITILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008025', N'DON BOSCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08008', N'PANAMA', N'CD08008026', N'LAS GARZAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010001', N'AMELIA DENIS DE ICAZA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010002', N'BELISARIO PORRAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010003', N'JOSE DOMINGO ESPINAR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010004', N'MATEO ITURRALDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010005', N'VICTORIANO LORENZO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010006', N'ARNULFO ARIAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010007', N'BELISARIO FRIAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010008', N'OMAR TORRIJOS')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08010', N'SAN MIGUELITO', N'CD08010009', N'RUFINA ALFARO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08011', N'TABOGA', N'CD08011001', N'TABOGA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08011', N'TABOGA', N'CD08011002', N'OTOQUE ORIENTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P08', N'PANAMA', N'D08011', N'TABOGA', N'CD08011003', N'OTOQUE OCCIDENTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09001', N'ATALAYA', N'CD09001001', N'ATALAYA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09001', N'ATALAYA', N'CD09001002', N'EL BARRITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09001', N'ATALAYA', N'CD09001003', N'LA MONTAÑUELA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09001', N'ATALAYA', N'CD09001004', N'LA CARRILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09001', N'ATALAYA', N'CD09001005', N'SAN ANTONIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002001', N'CALOBRE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002002', N'BARNIZAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002003', N'CHITRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002004', N'EL COCLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002005', N'EL POTRERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002006', N'LA LAGUNA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002007', N'LA RAYA DE CALOBRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002008', N'LA TETILLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002009', N'LA YEGUADA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002010', N'LAS GUIAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002011', N'MONJARAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09002', N'CALOBRE', N'CD09002012', N'SAN JOSE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003001', N'CAÑAZAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003002', N'CERRO PLATA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003003', N'EL PICADOR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003004', N'LOS VALLES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003005', N'SAN JOSE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003006', N'SAN MARCELO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09003', N'CAÑAZAS', N'CD09003007', N'EL AROMILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004001', N'LA MESA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004002', N'BISVALLES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004003', N'BORO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004004', N'LLANO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004005', N'SAN BARTOLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09004', N'LA MEZA', N'CD09004006', N'LOS MILAGROS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005001', N'LAS PALMAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005002', N'CERRO DE CASA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005003', N'COROZAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005004', N'EL MARIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005005', N'EL PRADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005006', N'EL RINCON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005007', N'LOLA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005008', N'PIXVAE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005009', N'PUERTO VIDAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005010', N'SAN MARTIN DE PORRES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005011', N'VIGUI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09005', N'LAS PALMAS', N'CD09005012', N'ZAPOTILLO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006001', N'MONTIJO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006002', N'ARENAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006003', N'GOBERNADORA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006004', N'LA GARCEANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006005', N'LEONES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006006', N'CEBACO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006007', N'COSTA HERMOSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006008', N'UNION DEL NORTE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006009', N'TEBARIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09006', N'MONTIJO', N'CD09006010', N'EL PILON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09007', N'RIO DE JESUS', N'CD09007001', N'RIO DE JESUS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09007', N'RIO DE JESUS', N'CD09007002', N'LAS HUACAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09007', N'RIO DE JESUS', N'CD09007003', N'LOS CASTILLOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09007', N'RIO DE JESUS', N'CD09007004', N'UTIRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09007', N'RIO DE JESUS', N'CD09007005', N'CATORCE DE NOVIEMBRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008001', N'SAN FRANCISCO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008002', N'CORRAL FALSO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008003', N'LOS HATILLOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008004', N'REMANCE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008005', N'SAN JUAN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09008', N'SAN FRANCISCO', N'CD09008006', N'SAN JOSE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009001', N'SANTA FE (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009002', N'CALOVEBORA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009003', N'EL ALTO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009004', N'EL CUAY')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009005', N'EL PANTANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009006', N'GATU O GATUCITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09009', N'SANTA FE', N'CD09009007', N'RIO LUIS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010001', N'SANTIAGO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010002', N'LA COLORADA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010003', N'LA PEÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010004', N'LA RAYA DE SANTA MARIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010005', N'PONUGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010006', N'SAN PEDRO DEL ESPINO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010007', N'CANTO DEL LLANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010008', N'LOS ALGARROBOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010009', N'CARLOS SANTANA AVILA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010010', N'EDWIN FABREGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010011', N'SAN MARTIN DE PORRES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09010', N'SANTIAGO', N'CD09010012', N'URRACA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011001', N'SONA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011002', N'BAHIA HONDA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011003', N'CALIDONIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011004', N'CATIVE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011005', N'EL MARAÑON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011006', N'GUARUMAL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011007', N'LA SOLEDAD')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011008', N'QUEBRADA DE ORO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011009', N'RIO GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09011', N'SONA', N'CD09011010', N'RODEO VIEJO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09012', N'MARIATO', N'CD09012001', N'LLANO DE CATIVAL O MARIATO (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09012', N'MARIATO', N'CD09012002', N'ARENAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09012', N'MARIATO', N'CD09012003', N'EL CACAO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09012', N'MARIATO', N'CD09012004', N'QUEBRO')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P09', N'VERAGUAS', N'D09012', N'MARIATO', N'CD09012005', N'TEBARIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P10', N'COMARCA KUNA YALA', N'D10001', N'COMARCA KUNA YALA', N'CD10001001', N'NARGANA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P10', N'COMARCA KUNA YALA', N'D10001', N'COMARCA KUNA YALA', N'CD10001002', N'AILIGANDI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P10', N'COMARCA KUNA YALA', N'D10001', N'COMARCA KUNA YALA', N'CD10001003', N'PUERTO OBALDIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P10', N'COMARCA KUNA YALA', N'D10001', N'COMARCA KUNA YALA', N'CD10001004', N'TUBUALA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P11', N'COMARCA EMBERA-WOUNAAN', N'D11001', N'CEMACO', N'CD11001001', N'CIRILO GUAINORA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P11', N'COMARCA EMBERA-WOUNAAN', N'D11001', N'CEMACO', N'CD11001002', N'LAJAS BLANCAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P11', N'COMARCA EMBERA-WOUNAAN', N'D11001', N'CEMACO', N'CD11001003', N'MANUEL ORTEGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P11', N'COMARCA EMBERA-WOUNAAN', N'D11002', N'SAMBU', N'CD11002001', N'RIO SABALO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P11', N'COMARCA EMBERA-WOUNAAN', N'D11002', N'SAMBU', N'CD11002002', N'JINGURUDO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001001', N'SOLOY (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001002', N'BOCA DE BALSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001003', N'CAMARON ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001004', N'CERRO BANCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001005', N'CERRO DE PATENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001006', N'EMPLANADA DE CHORCHA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001007', N'NAMNONI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12001', N'BESIKO', N'CD12001008', N'NIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002001', N'HATO PILON (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002002', N'CASCABEL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002003', N'HATO COROTU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002004', N'HATO CULANTRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002005', N'HATO JOBO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002006', N'HATO JULI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002007', N'QUEBRADA DE LORO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12002', N'MIRONO', N'CD12002008', N'SALTO DUPI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003001', N'CHICHICA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003002', N'ALTO CABALLERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003003', N'BAKAMA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003004', N'CERRO CAÑA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003005', N'CERRO PUERCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003006', N'KRUA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003007', N'MARACA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003008', N'NIBRA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003009', N'PEÑA BLANCA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003010', N'ROKA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003011', N'SITIO PRADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12003', N'MUNA', N'CD12003012', N'UMANI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12004', N'NOLE DUIMA', N'CD12004001', N'CERRO IGLESIAS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12004', N'NOLE DUIMA', N'CD12004002', N'HATO CHAMI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12004', N'NOLE DUIMA', N'CD12004003', N'JADEBERI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12004', N'NOLE DUIMA', N'CD12004004', N'LAJERO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12004', N'NOLE DUIMA', N'CD12004005', N'SUSAMA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005001', N'BUENOS AIRES (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005002', N'AGUA DE SALUD')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005003', N'ALTO DE JESUS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005004', N'CERRO PELADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005005', N'EL BALE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005006', N'EL PAREDON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005007', N'EL PIRO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005008', N'GUAYABITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12005', N'NURUM', N'CD12005009', N'GUIBALE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006001', N'BISIRA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006002', N'BURI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006003', N'GUARIVIARA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006004', N'GUORONI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006005', N'KANKINTU')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006006', N'MUNUNI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006007', N'PIEDRA ROJA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006008', N'TUWAI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12006', N'KANKINTU', N'CD12006009', N'MAN CREEK')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007001', N'KUSAPIN (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007002', N'BAHIA AZUL')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007003', N'CALOVEBORA O SANTA CATALINA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007004', N'LOMA YUCA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007005', N'RIO CHIRIQUI')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007006', N'TOBOBE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P12', N'COMARCA NGÄBE-BUGLE', N'D12007', N'KUSAPIN', N'CD12007007', N'VALLE BONITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001001', N'ARRAIJAN (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001002', N'BURUNGA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001003', N'CERRO SILVESTRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001004', N'JUAN DEMOSTENES AROSEMENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001005', N'NUEVO EMPERADOR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001006', N'SANTA CLARA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001007', N'VERACRUZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13001', N'ARRAIJAN', N'CD13001008', N'VISTA ALEGRE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002001', N'CAPIRA (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002002', N'CAIMITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002003', N'CAMPANA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002004', N'CERMEÑO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002005', N'CIRI DE LOS SOTOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002006', N'CIRI GRANDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002007', N'EL CACAO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002008', N'LA TRINIDAD')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002009', N'LAS OLLAS ARRIBA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002010', N'LIDICE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002011', N'VILLA CARMEN')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002012', N'VILLA ROSARIO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13002', N'CAPIRA', N'CD13002013', N'SANTA ROSA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003001', N'CHAME (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003002', N'BEJUCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003003', N'BUENOS AIRES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003004', N'CABUYA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003005', N'CHICA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003006', N'EL LIBANO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003007', N'LAS LAJAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003008', N'NUEVA GORGONA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003009', N'PUNTA CHAME')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003010', N'SAJALICES')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13003', N'CHAME', N'CD13003011', N'SORA')
GO
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004001', N'BARRIO BALBOA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004002', N'BARRIO COLON')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004003', N'AMADOR')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004004', N'AROSEMENA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004005', N'EL ARADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004006', N'EL COCO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004007', N'FEUILLET')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004008', N'GUADALUPE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004009', N'HERRERA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004010', N'HURTADO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004011', N'ITURRALDE')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004012', N'LA REPRESA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004013', N'LOS DIAZ')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004014', N'MENDOZA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004015', N'OBALDIA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004016', N'PLAYA LEONA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004017', N'PUERTO CAIMITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13004', N'LA CHORRERA', N'CD13004018', N'SANTA RITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005001', N'SAN CARLOS (CABECERA)')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005002', N'EL ESPINO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005003', N'EL HIGO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005004', N'GUAYABITO')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005005', N'LA ERMITA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005006', N'LA LAGUNA')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005007', N'LAS UVAS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005008', N'LOS LLANITOS')
INSERT [dbo].[Provincia] ([codigo_provincia], [nombre_provincia], [codigo_distrito], [nombre_distrito], [codigo_corregimiento], [nombre_corregimiento]) VALUES (N'P13', N'PANAMA OESTE', N'D13005', N'SAN CARLOS', N'CD13005009', N'SAN JOSE')
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([id_servicio], [fk_id_cliente], [fk_id_producto], [fecha_inicio], [fecha_termino], [descripcion], [monto], [servicio_activo]) VALUES (1, 1, 1, CAST(N'2023-09-11' AS Date), CAST(N'2024-09-11' AS Date), N'La descripción de AMADEUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 1000.0000, 1)
INSERT [dbo].[Servicios] ([id_servicio], [fk_id_cliente], [fk_id_producto], [fecha_inicio], [fecha_termino], [descripcion], [monto], [servicio_activo]) VALUES (2, 6, 1, CAST(N'2023-09-11' AS Date), CAST(N'2024-09-11' AS Date), N'La descripción de AMADEUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 40000.0000, 1)
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__C196DEC704942426]    Script Date: 09/27/2023 1:48:57 a. m. ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ((0)) FOR [PEP]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Servicios] ADD  DEFAULT ((1)) FOR [servicio_activo]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([fk_codigo_corregimiento])
REFERENCES [dbo].[Provincia] ([codigo_corregimiento])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([fk_id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([fk_id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([genero]='NO APLICA' OR [genero]='FEMENINO' OR [genero]='MASCULINO'))
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([tipo_contrib]='EXTRANJERO' OR [tipo_contrib]='GOBIERNO' OR [tipo_contrib]='CONSUMIDOR FINAL' OR [tipo_contrib]='CONTRIBUYENTE'))
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([tipo_identificacion]='PASAPORTE' OR [tipo_identificacion]='RUC' OR [tipo_identificacion]='CEDULA'))
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ActualizarCliente]
(
    @IdCliente BigInt,
    @NombreCliente Nvarchar(50),
    @ApellidoCliente Nvarchar(50),
    @TipoIdentificacion Varchar(9),
    @Identificacion Varchar(48),
    @Telefono Varchar(9),
    @Email Varchar(255),
    @DireccionResidencia Nvarchar(255),
    @FkCodigoCorregimiento Varchar(10),
    @FechaNacimiento Date,
    @Genero Varchar(9),
    @PEP Bit,
    @TipoContrib Varchar(9),
    @Activo Bit
)
As
	BEgin
		Update Clientes
		set
			nombre_cliente = @NombreCliente,
			apellido_cliente = @ApellidoCliente,
			tipo_identificacion = @TipoIdentificacion,
			identificacion = @Identificacion,
			telefono = @Telefono,
			email = @Email,
			direccion_residencia = @DireccionResidencia,
			fk_codigo_corregimiento = @FkCodigoCorregimiento,
			fecha_nacimiento = @FechaNacimiento,
			genero = @Genero,
			PEP = @PEP,
			tipo_contrib = @TipoContrib,
			activo = @Activo
		Where
			id_cliente = @IdCliente;
	End
;
GO
/****** Object:  StoredProcedure [dbo].[sp_activo_cliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_activo_cliente](
	@IdCliente BigInt,
	@Activo BIT
)
as 
		Begin
			Update [dbo].[Clientes]
			set activo = @Activo
		Where
			id_cliente = @IdCliente;
	End 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_add_cliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_add_cliente] 
	@NombreCliente NVarchar(50),
    @ApellidoCliente NVarchar(50),
    @TipoIdentificacion Varchar(9),
    @Identificacion Varchar(48),
    @Telefono Varchar(9),
    @Email Varchar(255),
    @DireccionResidencia NVARCHAR(255),
    @FkCodigoCorregimiento Varchar(10),
    @FechaNacimiento date,
    @Genero varchar(9),
    @PEP Bit,
    @TipoContrib VARCHAR(9),
    @Activo Bit  
As
	begin
	Insert into Clientes(nombre_cliente, apellido_cliente, tipo_identificacion, identificacion, 
				telefono, email, direccion_residencia, fk_codigo_corregimiento, fecha_nacimiento, 
				genero, PEP, tipo_contrib, activo)
				values (@NombreCliente,
						@ApellidoCliente,
						@TipoIdentificacion,
						@Identificacion,
						@Telefono,
						@Email,
						@DireccionResidencia,
						@FkCodigoCorregimiento,
						@FechaNacimiento,
						@Genero,
						@PEP,
						@TipoContrib,
						@Activo)
	end 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_add_servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_add_servicios](
	@idCliente Bigint ,
	@idProducto int ,
	@fecha_inicio date ,
	@fecha_termino date ,
	@descripcion nchar(2000) ,
	@monto money,
	@servicio_activo bit 
)
as	
	Begin 
		if(@fecha_inicio<=@fecha_termino)
			Begin
				Insert into Servicios ( fk_id_cliente ,fk_id_producto  ,fecha_inicio ,fecha_termino ,descripcion ,monto ,servicio_activo )
				Values(
				@idCliente ,@idProducto ,@fecha_inicio ,@fecha_termino ,@descripcion ,@monto ,@servicio_activo )
			End
		else 
			print 'la fecha de inicio debe ser menor que la fecha de termino'
	end 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_findById_cliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_findById_cliente]
(
@id_cliente BigInt
)

as
	begin 
		select id_cliente,[nombre_cliente],[apellido_cliente],[tipo_identificacion],[identificacion],[telefono],[email],[direccion_residencia],
		[nombre_provincia],[nombre_distrito],[nombre_corregimiento]+codigo_corregimiento as codigo_corregimiento,[fecha_nacimiento],[edad],[genero],[PEP],[tipo_contrib],[activo]  
		from Clientes as C inner join Provincia P  ON C.[fk_codigo_corregimiento] = P.codigo_corregimiento
		where @id_cliente = id_cliente
	end
;
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_select_all_servicios]
as
	Begin
	Select fk_id_cliente,id_servicio,fk_id_producto,fecha_inicio,fecha_termino,descripcion,monto,servicio_activo from Servicios
	inner join [dbo].[Clientes] C On Servicios.fk_id_cliente = C.id_cliente
	End 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_select_cliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_select_cliente]
as 
	begin 
		select id_cliente,[nombre_cliente],[apellido_cliente],[tipo_identificacion],[identificacion],[telefono],[email],[direccion_residencia],
		[nombre_provincia],[nombre_distrito],[codigo_corregimiento],[fecha_nacimiento],[edad],[genero],[PEP],[tipo_contrib],[activo]  
		from Clientes as C inner join Provincia P  ON C.[fk_codigo_corregimiento] = P.codigo_corregimiento;
	end
;
GO
/****** Object:  StoredProcedure [dbo].[sp_selectby_id_cliente_servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_selectby_id_cliente_servicios](
	@id_cliente BigInt
)
as
	Begin
	Select fk_id_cliente,id_servicio,fk_id_producto,fecha_inicio,fecha_termino,descripcion,monto,servicio_activo from Servicios
	inner join [dbo].[Clientes] C On Servicios.fk_id_cliente = C.id_cliente
	where fk_id_cliente = @id_cliente;
	End 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_selectby_id_servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_selectby_id_servicios](
	@id_servicio BigInt
)
as
	Begin
	Select fk_id_cliente,id_servicio,fk_id_producto,fecha_inicio,fecha_termino,descripcion,monto,servicio_activo from Servicios
	where id_servicio = @id_servicio;
	End 
;
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_cliente]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_Update_cliente]
(
    @IdCliente BigInt,
    @NombreCliente Nvarchar(50),
    @ApellidoCliente Nvarchar(50),
    @TipoIdentificacion Varchar(9),
    @Identificacion Varchar(48),
    @Telefono Varchar(9),
    @Email Varchar(255),
    @DireccionResidencia Nvarchar(255),
    @Genero Varchar(9),
    @PEP Bit,
    @TipoContrib Varchar(9),
    @Activo Bit
)
As
	BEgin
		Update Clientes
		set
			nombre_cliente = @NombreCliente,
			apellido_cliente = @ApellidoCliente,
			tipo_identificacion = @TipoIdentificacion,
			identificacion = @Identificacion,
			telefono = @Telefono,
			email = @Email,
			direccion_residencia = @DireccionResidencia,
			genero = @Genero,
			PEP = @PEP,
			tipo_contrib = @TipoContrib,
			activo = @Activo
		Where
			id_cliente = @IdCliente;
	End
;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_servicios]    Script Date: 09/27/2023 1:48:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_update_servicios](
	@idServicio BigInt,
	@fecha_termino date ,
	@descripcion nchar(2000) ,
	@monto money,
	@servicio_activo bit 
)As 
	Begin
		Update Servicios
		set fecha_termino = @fecha_termino,
			descripcion = @descripcion,
			monto = @monto,			
			servicio_activo = @servicio_activo
			Where 
			id_servicio = @idServicio and fecha_inicio<=@fecha_termino
	End
;
GO
USE [master]
GO
ALTER DATABASE [SolutionFinal] SET  READ_WRITE 
GO
