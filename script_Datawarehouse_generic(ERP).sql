USE [master]
GO
/****** Object:  Database [ERP_DW]    Script Date: 11/26/2020 12:38:04 PM ******/
CREATE DATABASE [ERP_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ERP_DW.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ERP_DW_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ERP_DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ERP_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [ERP_DW] SET  MULTI_USER 
GO
ALTER DATABASE [ERP_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERP_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ERP_DW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ERP_DW', N'ON'
GO
ALTER DATABASE [ERP_DW] SET QUERY_STORE = OFF
GO
USE [ERP_DW]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_regler_paiement]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fun_regler_paiement]
(
	@paiement_restant decimal(14,2)
)
RETURNS BIT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @R BIT;

	if (@paiement_restant=0)
		set @R = 1
	else
		set @R = 0
	return @R

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_DETAIL_COMMANDE_ACHAT]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getEtat_Map_DETAIL_COMMANDE_ACHAT]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_DETAIL_COMMANDE_ACHAT where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_DETAIL_COMMANDE_Vente]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getEtat_Map_DETAIL_COMMANDE_Vente]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_DETAIL_COMMANDE_VENTE where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_DETAIL_Facture_Achat]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getEtat_Map_DETAIL_Facture_Achat]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_DETAIL_Facture_Achat where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_DETAIL_Facture_Vente]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getEtat_Map_DETAIL_Facture_Vente]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_DETAIL_Facture_VENTE where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_Fact_Conge]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getEtat_Map_Fact_Conge]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_Fact_Conge where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_Fact_Contrat]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getEtat_Map_Fact_Contrat]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_Fact_Contrat where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_FACT_INVENTAIRE_MOUVEMENTS]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getEtat_Map_FACT_INVENTAIRE_MOUVEMENTS]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_FACT_INVENTAIRE_MOUVEMENTS where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[getEtat_Map_FACT_PRODUCTION]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getEtat_Map_FACT_PRODUCTION]
(
	-- Add the parameters for the function here
	@Etat_erp varchar (20)
)
RETURNS varchar(20)
AS
BEGIN
	
	DECLARE @Etat_r varchar(20);
	SET @Etat_r = (select Etat_reel from Table_Map_FACT_PRODUCTION where @Etat_erp=Etat_erp);
	RETURN @Etat_r;

END
GO
/****** Object:  UserDefinedFunction [dbo].[return_cout_produit]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[return_cout_produit] 
(
	@Key int
)
RETURNS decimal(14,2)
AS
BEGIN
	DECLARE @coutP decimal(14,2);
	SET @coutP = (SELECT Cout_Produit from Dim_Produit WHERE @Key = Key_Produit) 
	RETURN @coutP

END

GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_Client]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[return_Key_Client] (@Id INT) 
RETURNS int
AS
BEGIN
DECLARE @KC INT;
SET @KC = (select Key_Client from Dim_Client where ID_Client=@Id AND is_current=1);
RETURN @KC
END;
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_DC_A]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[return_Key_DC_A] (@Id INT) 
RETURNS int
AS
BEGIN
DECLARE @KDC INT;
SET @KDC = (select Key_DC from DIM_DETAIL_COMMANDE_ACHAT where ID_DC=@Id AND is_current=1);
RETURN @KDC
END;

GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_DC_V]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[return_Key_DC_V] (@Id INT) 
RETURNS int
AS
BEGIN
DECLARE @KDC INT;
SET @KDC = (select Key_DC from Dim_Detail_Commande_Vente where ID_DC=@Id AND is_current=1);
RETURN @KDC
END;
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_DF_A]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[return_Key_DF_A]
(
	@id INT
)
RETURNS INT
AS
BEGIN

	DECLARE @KF INT;
	select @KF=key_facture from DIM_DETAIL_FACTURE_ACHAT WHERE @id=Id_facture and is_current=1;
	RETURN @KF

END
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_DF_V]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[return_Key_DF_V]
(
	@id INT
)
RETURNS INT
AS
BEGIN

	DECLARE @KF INT;
	select @KF=key_facture from Dim_Detail_Facture_Vente WHERE @id=Id_facture and is_current = 1;
	RETURN @KF

END
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_employee]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[return_Key_employee]
(
	@id int
)
RETURNS INT
AS
BEGIN

	DECLARE @KE INT;
	select @KE=Key_employee from DIM_EMPLOYEE WHERE @id=id_employee and is_current=1;
	RETURN @KE
END
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_Fournisseur]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[return_Key_Fournisseur] (@Id INT) 
RETURNS int
AS
BEGIN
DECLARE @KF INT;
SET @KF = (select Key_Fournisseur from Dim_Fournisseur where ID_Fournisseur=@Id AND is_current=1);
RETURN @KF
END;
GO
/****** Object:  UserDefinedFunction [dbo].[return_Key_Produit]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[return_Key_Produit] (@Id INT) 
RETURNS int
AS
BEGIN
DECLARE @KP INT;
SET @KP = (select Key_Produit from Dim_Produit where ID_Produit=@Id AND is_current=1);
RETURN @KP
END;
GO
/****** Object:  Table [dbo].[DIM_ACCOUNT]    Script Date: 11/26/2020 12:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ACCOUNT](
	[Id_account] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK__DIM_ACCO__741F0A2B0769087B] PRIMARY KEY CLUSTERED 
(
	[Id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Categorie]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Categorie](
	[ID_Categorie] [int] NOT NULL,
	[Nom_Categorie] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Categorie] PRIMARY KEY CLUSTERED 
(
	[ID_Categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Client]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Client](
	[Key_Client] [int] IDENTITY(1,1) NOT NULL,
	[ID_Client] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[types_societes] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Ville] [varchar](50) NULL,
	[Code_Postale] [int] NULL,
	[Pays] [varchar](50) NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK_Dim_Client] PRIMARY KEY CLUSTERED 
(
	[Key_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[CleDate] [date] NOT NULL,
	[NomDate]  AS (CONVERT([varchar](50),[CleDate],(103))),
	[IndiceJourDeSemaine]  AS (datepart(weekday,[CleDate])),
	[IndiceJourDuMois]  AS (datepart(day,[CleDate])),
	[IndiceJourDeAnnee]  AS (datepart(dayofyear,[CleDate])),
	[NomJourDeSemaine]  AS (datename(weekday,[CleDate])),
	[CleMoisEtAnnee]  AS (datepart(year,[CleDate])*(100)+datepart(month,[CleDate])),
	[IndiceMoisDeAnnee]  AS (datepart(month,[CleDate])),
	[NomMoisEtAnnee]  AS ((datename(month,[CleDate])+' ')+datename(year,[CleDate])),
	[NomMoisDeAnnee]  AS (datename(month,[CleDate])),
	[CleTrimesterEtAnnee]  AS (datepart(year,[CleDate])*(100)+datepart(quarter,[CleDate])),
	[IndiceTrimestreDeAnnee]  AS (datepart(quarter,[CleDate])),
	[NomTrimestreEtAnnee]  AS ((datename(year,[CleDate])+'T')+datename(quarter,[CleDate])),
	[NomTrimestreDeAnnee]  AS ('T'+datename(quarter,[CleDate])),
	[CleSemestreEtAnnee]  AS (datepart(year,[CleDate])*(100)+(datepart(quarter,[CleDate])+(1))/(2)),
	[IndiceSemestreDeAnnee]  AS ((datepart(quarter,[CleDate])+(1))/(2)),
	[NomSemestreEtAnnee]  AS ((datename(year,[CleDate])+'S')+CONVERT([char](1),(datepart(quarter,[CleDate])+(1))/(2))),
	[NomSemestreDeAnnee]  AS ('S'+CONVERT([char](1),(datepart(quarter,[CleDate])+(1))/(2))),
	[CleAnnee]  AS (datepart(year,[CleDate])),
	[NomAnnee]  AS ('AN '+CONVERT([varchar],datepart(year,[CleDate]))),
	[PremierJourDuMois]  AS (datefromparts(datepart(year,[CleDate]),datepart(month,[CleDate]),(1))),
	[DernierJourDuMois]  AS (eomonth([CleDate])),
	[CleSemaineIso]  AS (datepart(year,dateadd(day,(4)-datepart(weekday,[CleDate]),[CleDate]))*(100)+datepart(iso_week,[CleDate])),
	[IndiceSemaineIsoDeAnnee]  AS (datepart(iso_week,[CleDate])),
	[NomSemaineIsoEtAnnee]  AS ((datename(year,dateadd(day,(4)-datepart(weekday,[CleDate]),[CleDate]))+'W')+datename(iso_week,[CleDate])),
	[NomSemaineIsoDeAnnee]  AS ('W'+datename(iso_week,[CleDate])),
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[CleDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_DEPARTEMENT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DEPARTEMENT](
	[ID_Dep] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_DETAIL_COMMANDE_ACHAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DETAIL_COMMANDE_ACHAT](
	[Key_DC] [int] IDENTITY(1,1) NOT NULL,
	[ID_DC] [int] NULL,
	[Reference] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Key_DC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Detail_Commande_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Detail_Commande_Vente](
	[Key_DC] [int] IDENTITY(1,1) NOT NULL,
	[ID_DC] [int] NOT NULL,
	[Reference] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK_Dim_Detail_Commande_Vente] PRIMARY KEY CLUSTERED 
(
	[Key_DC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_DETAIL_FACTURE_ACHAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DETAIL_FACTURE_ACHAT](
	[key_facture] [int] IDENTITY(1,1) NOT NULL,
	[Id_facture] [int] NOT NULL,
	[Reference] [varchar](50) NULL,
	[Date_creation] [date] NULL,
	[Reference_commande] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK_DIM_DETAIL_FACTURE_ACHAT] PRIMARY KEY CLUSTERED 
(
	[key_facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Detail_Facture_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Detail_Facture_Vente](
	[key_facture] [int] IDENTITY(1,1) NOT NULL,
	[ID_Facture] [int] NOT NULL,
	[Ref] [varchar](50) NULL,
	[Date_cree] [date] NULL,
	[Ref_Command] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK_Dim_Detail_Facture_Vente] PRIMARY KEY CLUSTERED 
(
	[key_facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_EMPLOI]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_EMPLOI](
	[Id_emploi] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_emploi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_EMPLOYEE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_EMPLOYEE](
	[Key_employee] [int] IDENTITY(1,1) NOT NULL,
	[Id_employee] [int] NOT NULL,
	[Id_departement] [int] NULL,
	[Id_emploi] [int] NULL,
	[Nom] [varchar](50) NULL,
	[Date_naissance] [date] NULL,
	[Genre] [varchar](10) NULL,
	[Telephone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Niveau_etude] [varchar](30) NULL,
	[Adresse_domicile] [varchar](50) NULL,
	[Etat_civil] [varchar](15) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK__DIM_EMPL__52E064774E4849F0] PRIMARY KEY CLUSTERED 
(
	[Key_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ENTREPOT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ENTREPOT](
	[ID_Entrepot] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Type_site] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Entrepot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_FOURNISSEUR]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_FOURNISSEUR](
	[Key_FOURNISSEUR] [int] IDENTITY(1,1) NOT NULL,
	[ID_FOURNISSEUR] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[types_societes] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Ville] [varchar](50) NULL,
	[Code_Postale] [int] NULL,
	[Pays] [varchar](50) NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK__Dim_FOUR__BD08DF202AC1E39C] PRIMARY KEY CLUSTERED 
(
	[Key_FOURNISSEUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Machine]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Machine](
	[ID_Machine] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Ref] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Machine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Magasin]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Magasin](
	[ID_Magasin] [int] NOT NULL,
	[ID_Region] [int] NULL,
	[Nom] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[Ville] [varchar](50) NULL,
	[Code_postal] [int] NULL,
	[Pays] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Magasin] PRIMARY KEY CLUSTERED 
(
	[ID_Magasin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Operation]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Operation](
	[ID_Operation] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Operation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Paiement_Client]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Paiement_Client](
	[ID_Paiement] [int] NOT NULL,
	[Reference_Paiement] [varchar](50) NULL,
	[montant_Paiement] [decimal](14, 2) NOT NULL,
	[Type_Paiement] [varchar](50) NULL,
	[Date_Paiement] [date] NOT NULL,
	[ID_Facture_Client] [int] NOT NULL,
 CONSTRAINT [PK__Dim_Paie__03CFDF8994211948] PRIMARY KEY CLUSTERED 
(
	[ID_Paiement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Paiement_Fournisseur]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Paiement_Fournisseur](
	[ID_Paiement] [int] NOT NULL,
	[ID_Facture_fournisseur] [int] NOT NULL,
	[Reference_Paiement] [varchar](50) NULL,
	[montant_Paiement] [decimal](14, 2) NOT NULL,
	[Type_Paiement] [varchar](50) NULL,
	[Date_Paiement] [date] NOT NULL,
 CONSTRAINT [PK__Dim_Paie__03CFDF896A787AE7] PRIMARY KEY CLUSTERED 
(
	[ID_Paiement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Produit]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Produit](
	[Key_Produit] [int] IDENTITY(1,1) NOT NULL,
	[ID_Produit] [int] NOT NULL,
	[ID_sous_categorie] [int] NULL,
	[Reference] [varchar](50) NULL,
	[Nom] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Cout_produit] [decimal](14, 2) NULL,
	[Couleur] [varchar](50) NULL,
	[Produit_achete] [bit] NULL,
	[Produit_vendu] [bit] NULL,
	[Produit_depenser] [bit] NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK_Dim_Produit] PRIMARY KEY CLUSTERED 
(
	[Key_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Region](
	[ID_Region] [int] NOT NULL,
	[Region] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Region] PRIMARY KEY CLUSTERED 
(
	[ID_Region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sous-Categorie]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sous-Categorie](
	[ID_sous_categorie] [int] NOT NULL,
	[sous_categorie] [varchar](50) NULL,
	[ID_Categorie] [int] NULL,
 CONSTRAINT [PK_Dim_Sous-Categorie] PRIMARY KEY CLUSTERED 
(
	[ID_sous_categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Transport]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Transport](
	[ID_Transport] [int] NOT NULL,
	[type_vehicule] [varchar](50) NULL,
	[cout_transport] [decimal](14, 2) NULL,
	[matricule] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Transport] PRIMARY KEY CLUSTERED 
(
	[ID_Transport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TYPE_COMPETENCE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TYPE_COMPETENCE](
	[Id_type_competence] [int] NOT NULL,
	[Nom_type_competence] [varchar](50) NULL,
 CONSTRAINT [PK_DIM_TYPE_COMPETENCE] PRIMARY KEY CLUSTERED 
(
	[Id_type_competence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TYPE_EXPEDITION]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TYPE_EXPEDITION](
	[Type_ID] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_ACHAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_ACHAT](
	[ID] [int] NOT NULL,
	[Key_FOURNISSEUR] [int] NULL,
	[Key_produit] [int] NULL,
	[ID_Dep] [int] NULL,
	[key_facture] [int] NULL,
	[Quantite_achete] [int] NULL,
	[Date_achat] [date] NULL,
	[Prix_unitaire] [decimal](14, 2) NULL,
	[Prix_total_HT] [decimal](14, 2) NULL,
	[Taxe]  AS ([Prix_total]-[Prix_total_HT]),
	[Prix_total] [decimal](14, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_COMMANDE_ACHAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_COMMANDE_ACHAT](
	[ID] [int] NOT NULL,
	[Key_FOURNISSEUR] [int] NULL,
	[Key_produit] [int] NULL,
	[Key_DC] [int] NULL,
	[ID_Dep] [int] NULL,
	[Quantite_commande] [int] NULL,
	[Date_commande] [date] NULL,
	[Date_confirmation] [date] NULL,
	[Prix_unitaire] [decimal](14, 2) NULL,
	[Prix_total_HT] [decimal](14, 2) NULL,
	[Taxe] [decimal](14, 2) NULL,
	[Prix_total] [decimal](14, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Commande_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Commande_Vente](
	[ID] [int] NOT NULL,
	[Key_Produit] [int] NULL,
	[Key_Client] [int] NULL,
	[Key_DC] [int] NULL,
	[ID_Magasin] [int] NULL,
	[Description] [varchar](max) NULL,
	[Quantite] [decimal](8, 2) NULL,
	[Prix_Unitaire] [decimal](14, 2) NULL,
	[Prix_HT] [decimal](14, 2) NULL,
	[Remise] [decimal](14, 2) NULL,
	[Prix_Total] [decimal](14, 2) NULL,
	[Date_commande] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_COMPETENCE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_COMPETENCE](
	[ID] [int] NOT NULL,
	[Key_employee] [int] NOT NULL,
	[Id_type_competence] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Niveau] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_CONGE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_CONGE](
	[ID] [int] NOT NULL,
	[Key_employee] [int] NULL,
	[Description] [varchar](50) NULL,
	[Type_conge] [varchar](50) NULL,
	[Date_debut] [date] NULL,
	[Date_fin] [date] NULL,
	[Nombre_jour] [int] NULL,
	[Etat] [varchar](50) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_CONTRAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_CONTRAT](
	[Id_contrat] [int] NULL,
	[Key_employee] [int] NULL,
	[Date_debut] [date] NULL,
	[Date_fin] [date] NULL,
	[Date_fin_essai] [date] NULL,
	[Salaire] [decimal](14, 2) NULL,
	[Type] [varchar](15) NULL,
	[Etat] [varchar](10) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_EVALUATION]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_EVALUATION](
	[Id_evaluation] [int] NOT NULL,
	[Note] [varchar](50) NULL,
	[Date] [date] NULL,
	[Key_employee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_evaluation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_Facture_Client]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_Facture_Client](
	[ID_Facture] [int] NOT NULL,
	[Key_Client] [int] NOT NULL,
	[Ref_Facture] [varchar](50) NULL,
	[Taxes] [decimal](14, 2) NULL,
	[Montant_HT] [decimal](14, 2) NULL,
	[Montant_Total] [decimal](14, 2) NULL,
	[Montant_restant] [decimal](14, 2) NULL,
	[Regler] [bit] NOT NULL,
	[Date_dernier_paiement] [date] NULL,
	[Condition_Date_Paiement] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_Facture_FOURNISSEUR]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_Facture_FOURNISSEUR](
	[ID_Facture] [int] NOT NULL,
	[Key_fournisseur] [int] NOT NULL,
	[Ref_Facture] [varchar](50) NULL,
	[Taxes] [decimal](14, 2) NULL,
	[Montant_HT] [decimal](14, 2) NULL,
	[Montant_Total] [decimal](14, 2) NULL,
	[Montant_restant] [decimal](14, 2) NULL,
	[Regler] [bit] NOT NULL,
	[Date_dernier_paiement] [date] NULL,
	[Condition_Date_Paiement] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_FINANCE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_FINANCE](
	[ID] [int] NOT NULL,
	[Id_account] [int] NOT NULL,
	[ID_Dep] [int] NULL,
	[Date] [date] NULL,
	[Montant] [decimal](14, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_INVENTAIRE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_INVENTAIRE](
	[Key_Inventaire] [int] IDENTITY(1,1) NOT NULL,
	[ID_Inventaire] [int] NULL,
	[Key_Produit] [int] NULL,
	[ID_Entrepot] [int] NULL,
	[Quantite] [decimal](8, 2) NULL,
	[Date_inventaire] [date] NULL,
	[is_current] [bit] NULL,
 CONSTRAINT [PK_FACT_INVENTAIRE] PRIMARY KEY CLUSTERED 
(
	[Key_Inventaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_INVENTAIRE_MOUVEMENTS]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS](
	[ID] [int] NOT NULL,
	[Ref] [varchar](50) NULL,
	[Key_Produit] [int] NULL,
	[Type_ID] [int] NULL,
	[Source] [int] NULL,
	[Destination] [int] NULL,
	[Quantite] [int] NULL,
	[Date] [date] NULL,
	[Type_mouvement] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[is_current] [bit] NOT NULL,
 CONSTRAINT [PK__FACT_INV__3214EC27C0626FDE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_PRESENCE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_PRESENCE](
	[Id_presence] [int] NOT NULL,
	[Key_employee] [int] NULL,
	[Arrive_date] [date] NULL,
	[Sortie_date] [date] NULL,
	[Arrive_temps] [time](0) NULL,
	[Sortie_temps] [time](0) NULL,
	[Heures_de_travail] [int] NULL,
	[Periode] [varchar](50) NULL,
 CONSTRAINT [PK__FACT_PRE__B04DA14F8F0BA39E] PRIMARY KEY CLUSTERED 
(
	[Id_presence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_PRODUCTION]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_PRODUCTION](
	[ID_Production] [int] NOT NULL,
	[Key_Produit] [int] NULL,
	[ID_Operation] [int] NULL,
	[ID_Machine] [int] NULL,
	[Reference] [varchar](50) NULL,
	[Quantite] [numeric](8, 2) NULL,
	[Etat] [varchar](50) NULL,
	[Date_debut_planifiee] [date] NULL,
	[Date_fin_planifiee] [date] NULL,
	[Date_debut_Fabrication] [date] NULL,
	[Date_fin_Fabrication] [date] NULL,
	[Duree_planifiee]  AS (datediff(day,[Date_debut_planifiee],[Date_fin_planifiee])),
	[Duree_Fabrication]  AS (datediff(day,[Date_debut_Fabrication],[Date_fin_Fabrication])),
 CONSTRAINT [PK__Fact_Pro__3214EC27B5094A6E] PRIMARY KEY CLUSTERED 
(
	[ID_Production] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_SCM]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_SCM](
	[ID] [int] NOT NULL,
	[Key_Produit] [int] NULL,
	[ID_Transport] [int] NULL,
	[ID_Magasin] [int] NULL,
	[Key_Client] [int] NULL,
	[Qnt_Lvr] [int] NULL,
	[Retard]  AS (datediff(day,[Date_Prevue],[Date_effective])),
	[Durre_préparatin_Livraison]  AS (datediff(day,[Date_Commande],[Date_effective])),
	[Date_Prevue] [date] NULL,
	[Date_effective] [date] NULL,
	[Ref_Commande] [varchar](50) NULL,
	[Date_commande] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_VENTE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_VENTE](
	[ID_Vente] [int] NOT NULL,
	[Key_Client] [int] NULL,
	[Key_Produit] [int] NULL,
	[ID_Magasin] [int] NULL,
	[key_facture] [int] NULL,
	[Quantite] [decimal](14, 2) NULL,
	[Prix_Unitaire] [decimal](14, 2) NULL,
	[Taxe]  AS ([Prix_Total]-[Prix_HT]),
	[Prix_HT] [decimal](14, 2) NULL,
	[Remise] [decimal](14, 2) NULL,
	[Prix_Total] [decimal](14, 2) NULL,
	[Date_Vente] [date] NULL,
	[Profit]  AS ([Prix_Total]-[dbo].[return_cout_produit]([Key_Produit])*[Quantite]),
 CONSTRAINT [PK_FACT_VENTE] PRIMARY KEY CLUSTERED 
(
	[ID_Vente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_DETAIL_COMMANDE_ACHAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_DETAIL_COMMANDE_ACHAT](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_Detail_Commande_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_Detail_Commande_Vente](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_Detail_Facture_Achat]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_Detail_Facture_Achat](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_Detail_Facture_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_Detail_Facture_Vente](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_FACT_CONGE]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_FACT_CONGE](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_FACT_CONTRAT]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_FACT_CONTRAT](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_FACT_INVENTAIRE_MOUVEMENTS]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_FACT_INVENTAIRE_MOUVEMENTS](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Map_FACT_PRODUCTION]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Map_FACT_PRODUCTION](
	[Etat_reel] [varchar](50) NULL,
	[Etat_erp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dim_Client]    Script Date: 11/26/2020 12:38:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Dim_Client] ON [dbo].[Dim_Client]
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dim_Detail_Commande_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Dim_Detail_Commande_Vente] ON [dbo].[Dim_Detail_Commande_Vente]
(
	[ID_DC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID_Dim_FOURNISSEUR]    Script Date: 11/26/2020 12:38:06 PM ******/
CREATE NONCLUSTERED INDEX [ID_Dim_FOURNISSEUR] ON [dbo].[Dim_FOURNISSEUR]
(
	[ID_FOURNISSEUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dim_Produit]    Script Date: 11/26/2020 12:38:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Dim_Produit] ON [dbo].[Dim_Produit]
(
	[ID_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID_Fact_Commande_Vente]    Script Date: 11/26/2020 12:38:06 PM ******/
CREATE NONCLUSTERED INDEX [ID_Fact_Commande_Vente] ON [dbo].[Fact_Commande_Vente]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Client] ADD  CONSTRAINT [DF_Dim_Client_Date_Start]  DEFAULT (getdate()) FOR [Date_Start]
GO
ALTER TABLE [dbo].[Dim_Client] ADD  CONSTRAINT [DF_Dim_Client_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[DIM_DETAIL_COMMANDE_ACHAT] ADD  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[DIM_DETAIL_COMMANDE_ACHAT] ADD  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[Dim_Detail_Commande_Vente] ADD  CONSTRAINT [DF_Dim_Detail_Commande_Vente_Date_Start]  DEFAULT (getdate()) FOR [Date_Start]
GO
ALTER TABLE [dbo].[Dim_Detail_Commande_Vente] ADD  CONSTRAINT [DF_Dim_Detail_Commande_Vente_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[DIM_DETAIL_FACTURE_ACHAT] ADD  CONSTRAINT [DF_DIM_DETAIL_FACTURE_ACHAT_Date_start]  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[DIM_DETAIL_FACTURE_ACHAT] ADD  CONSTRAINT [DF_DIM_DETAIL_FACTURE_ACHAT_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[Dim_Detail_Facture_Vente] ADD  CONSTRAINT [DF_Dim_Detail_Facture_Vente_Date_Start]  DEFAULT (getdate()) FOR [Date_Start]
GO
ALTER TABLE [dbo].[Dim_Detail_Facture_Vente] ADD  CONSTRAINT [DF_Dim_Detail_Facture_Vente_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE] ADD  CONSTRAINT [DF__DIM_EMPLO__Date___6BAEFA67]  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE] ADD  CONSTRAINT [DF__DIM_EMPLO__is_cu__6CA31EA0]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[Dim_FOURNISSEUR] ADD  CONSTRAINT [DF_Dim_FOURNISSEUR_Date_Start]  DEFAULT (getdate()) FOR [Date_Start]
GO
ALTER TABLE [dbo].[Dim_FOURNISSEUR] ADD  CONSTRAINT [DF_Dim_FOURNISSEUR_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[Dim_Produit] ADD  CONSTRAINT [DF_Dim_Produit_Date_Start]  DEFAULT (getdate()) FOR [Date_Start]
GO
ALTER TABLE [dbo].[Dim_Produit] ADD  CONSTRAINT [DF_Dim_Produit_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[FACT_CONGE] ADD  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[FACT_CONGE] ADD  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[FACT_CONTRAT] ADD  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[FACT_CONTRAT] ADD  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE] ADD  CONSTRAINT [DF_FACT_INVENTAIRE_is_current]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] ADD  CONSTRAINT [DF__FACT_INVE__Date___4FD1D5C8]  DEFAULT (getdate()) FOR [Date_start]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] ADD  CONSTRAINT [DF__FACT_INVE__is_cu__50C5FA01]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE]  WITH NOCHECK ADD  CONSTRAINT [FK_DIM_EMPLOYEE_DIM_DEPARTEMENT] FOREIGN KEY([Id_departement])
REFERENCES [dbo].[DIM_DEPARTEMENT] ([ID_Dep])
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE] CHECK CONSTRAINT [FK_DIM_EMPLOYEE_DIM_DEPARTEMENT]
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE]  WITH NOCHECK ADD  CONSTRAINT [FK_DIM_EMPLOYEE_DIM_EMPLOI] FOREIGN KEY([Id_emploi])
REFERENCES [dbo].[DIM_EMPLOI] ([Id_emploi])
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE] CHECK CONSTRAINT [FK_DIM_EMPLOYEE_DIM_EMPLOI]
GO
ALTER TABLE [dbo].[Dim_Magasin]  WITH NOCHECK ADD  CONSTRAINT [FK_Dim_Magasin_Dim_Region] FOREIGN KEY([ID_Region])
REFERENCES [dbo].[Dim_Region] ([ID_Region])
GO
ALTER TABLE [dbo].[Dim_Magasin] CHECK CONSTRAINT [FK_Dim_Magasin_Dim_Region]
GO
ALTER TABLE [dbo].[Dim_Paiement_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_Dim_Paiement_Client_FACT_Facture_Client] FOREIGN KEY([ID_Facture_Client])
REFERENCES [dbo].[FACT_Facture_Client] ([ID_Facture])
GO
ALTER TABLE [dbo].[Dim_Paiement_Client] CHECK CONSTRAINT [FK_Dim_Paiement_Client_FACT_Facture_Client]
GO
ALTER TABLE [dbo].[Dim_Produit]  WITH NOCHECK ADD  CONSTRAINT [FK_Dim_Produit_Dim_Sous-Categorie] FOREIGN KEY([ID_sous_categorie])
REFERENCES [dbo].[Dim_Sous-Categorie] ([ID_sous_categorie])
GO
ALTER TABLE [dbo].[Dim_Produit] CHECK CONSTRAINT [FK_Dim_Produit_Dim_Sous-Categorie]
GO
ALTER TABLE [dbo].[Dim_Sous-Categorie]  WITH NOCHECK ADD  CONSTRAINT [FK_Dim_Sous-Categorie_Dim_Categorie] FOREIGN KEY([ID_Categorie])
REFERENCES [dbo].[Dim_Categorie] ([ID_Categorie])
GO
ALTER TABLE [dbo].[Dim_Sous-Categorie] CHECK CONSTRAINT [FK_Dim_Sous-Categorie_Dim_Categorie]
GO
ALTER TABLE [dbo].[FACT_ACHAT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ACHAT_Dim_Date] FOREIGN KEY([Date_achat])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_ACHAT] CHECK CONSTRAINT [FK_FACT_ACHAT_Dim_Date]
GO
ALTER TABLE [dbo].[FACT_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_ACHAT_DIM_DEPARTEMENT] FOREIGN KEY([ID_Dep])
REFERENCES [dbo].[DIM_DEPARTEMENT] ([ID_Dep])
GO
ALTER TABLE [dbo].[FACT_ACHAT] CHECK CONSTRAINT [FK_FACT_ACHAT_DIM_DEPARTEMENT]
GO
ALTER TABLE [dbo].[FACT_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_ACHAT_DIM_DETAIL_FACTURE_ACHAT] FOREIGN KEY([key_facture])
REFERENCES [dbo].[DIM_DETAIL_FACTURE_ACHAT] ([key_facture])
GO
ALTER TABLE [dbo].[FACT_ACHAT] CHECK CONSTRAINT [FK_FACT_ACHAT_DIM_DETAIL_FACTURE_ACHAT]
GO
ALTER TABLE [dbo].[FACT_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_ACHAT_Dim_FOURNISSEUR] FOREIGN KEY([Key_FOURNISSEUR])
REFERENCES [dbo].[Dim_FOURNISSEUR] ([Key_FOURNISSEUR])
GO
ALTER TABLE [dbo].[FACT_ACHAT] CHECK CONSTRAINT [FK_FACT_ACHAT_Dim_FOURNISSEUR]
GO
ALTER TABLE [dbo].[FACT_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_ACHAT_DIM_PRODUIT] FOREIGN KEY([Key_produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_ACHAT] CHECK CONSTRAINT [FK_FACT_ACHAT_DIM_PRODUIT]
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_DEPARTEMENT] FOREIGN KEY([ID_Dep])
REFERENCES [dbo].[DIM_DEPARTEMENT] ([ID_Dep])
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT] CHECK CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_DEPARTEMENT]
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_DETAIL_COMMANDE_ACHAT] FOREIGN KEY([Key_DC])
REFERENCES [dbo].[DIM_DETAIL_COMMANDE_ACHAT] ([Key_DC])
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT] CHECK CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_DETAIL_COMMANDE_ACHAT]
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMMANDE_ACHAT_Dim_FOURNISSEUR] FOREIGN KEY([Key_FOURNISSEUR])
REFERENCES [dbo].[Dim_FOURNISSEUR] ([Key_FOURNISSEUR])
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT] CHECK CONSTRAINT [FK_FACT_COMMANDE_ACHAT_Dim_FOURNISSEUR]
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_PRODUIT] FOREIGN KEY([Key_produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT] CHECK CONSTRAINT [FK_FACT_COMMANDE_ACHAT_DIM_PRODUIT]
GO
ALTER TABLE [dbo].[Fact_Commande_Vente]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Commande_Vente_Dim_Client] FOREIGN KEY([Key_Client])
REFERENCES [dbo].[Dim_Client] ([Key_Client])
GO
ALTER TABLE [dbo].[Fact_Commande_Vente] CHECK CONSTRAINT [FK_Fact_Commande_Vente_Dim_Client]
GO
ALTER TABLE [dbo].[Fact_Commande_Vente]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Commande_Vente_Dim_Date] FOREIGN KEY([Date_commande])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[Fact_Commande_Vente] CHECK CONSTRAINT [FK_Fact_Commande_Vente_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Commande_Vente]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Commande_Vente_Dim_Detail_Commande_Vente] FOREIGN KEY([Key_DC])
REFERENCES [dbo].[Dim_Detail_Commande_Vente] ([Key_DC])
GO
ALTER TABLE [dbo].[Fact_Commande_Vente] CHECK CONSTRAINT [FK_Fact_Commande_Vente_Dim_Detail_Commande_Vente]
GO
ALTER TABLE [dbo].[Fact_Commande_Vente]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Commande_Vente_Dim_Magasin] FOREIGN KEY([ID_Magasin])
REFERENCES [dbo].[Dim_Magasin] ([ID_Magasin])
GO
ALTER TABLE [dbo].[Fact_Commande_Vente] CHECK CONSTRAINT [FK_Fact_Commande_Vente_Dim_Magasin]
GO
ALTER TABLE [dbo].[Fact_Commande_Vente]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Commande_Vente_Dim_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[Fact_Commande_Vente] CHECK CONSTRAINT [FK_Fact_Commande_Vente_Dim_Produit]
GO
ALTER TABLE [dbo].[FACT_COMPETENCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMPETENCE_DIM_EMPLOYE] FOREIGN KEY([Key_employee])
REFERENCES [dbo].[DIM_EMPLOYEE] ([Key_employee])
GO
ALTER TABLE [dbo].[FACT_COMPETENCE] CHECK CONSTRAINT [FK_FACT_COMPETENCE_DIM_EMPLOYE]
GO
ALTER TABLE [dbo].[FACT_COMPETENCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_COMPETENCE_DIM_TYPE_COMPETENCE] FOREIGN KEY([Id_type_competence])
REFERENCES [dbo].[DIM_TYPE_COMPETENCE] ([Id_type_competence])
GO
ALTER TABLE [dbo].[FACT_COMPETENCE] CHECK CONSTRAINT [FK_FACT_COMPETENCE_DIM_TYPE_COMPETENCE]
GO
ALTER TABLE [dbo].[FACT_CONGE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONGE_DIM_DATE1] FOREIGN KEY([Date_debut])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_CONGE] CHECK CONSTRAINT [FK_FACT_CONGE_DIM_DATE1]
GO
ALTER TABLE [dbo].[FACT_CONGE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONGE_DIM_DATE2] FOREIGN KEY([Date_fin])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_CONGE] CHECK CONSTRAINT [FK_FACT_CONGE_DIM_DATE2]
GO
ALTER TABLE [dbo].[FACT_CONGE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONGE_DIM_EMPLOYEE] FOREIGN KEY([Key_employee])
REFERENCES [dbo].[DIM_EMPLOYEE] ([Key_employee])
GO
ALTER TABLE [dbo].[FACT_CONGE] CHECK CONSTRAINT [FK_FACT_CONGE_DIM_EMPLOYEE]
GO
ALTER TABLE [dbo].[FACT_CONTRAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE1] FOREIGN KEY([Date_debut])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_CONTRAT] CHECK CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE1]
GO
ALTER TABLE [dbo].[FACT_CONTRAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE2] FOREIGN KEY([Date_fin])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_CONTRAT] CHECK CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE2]
GO
ALTER TABLE [dbo].[FACT_CONTRAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE3] FOREIGN KEY([Date_fin_essai])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_CONTRAT] CHECK CONSTRAINT [FK_FACT_CONTRAT_DIM_DATE3]
GO
ALTER TABLE [dbo].[FACT_CONTRAT]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_CONTRAT_DIM_EMPLOYEE] FOREIGN KEY([Key_employee])
REFERENCES [dbo].[DIM_EMPLOYEE] ([Key_employee])
GO
ALTER TABLE [dbo].[FACT_CONTRAT] CHECK CONSTRAINT [FK_FACT_CONTRAT_DIM_EMPLOYEE]
GO
ALTER TABLE [dbo].[FACT_EVALUATION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_EVALUATION_DIM_DATE] FOREIGN KEY([Date])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_EVALUATION] CHECK CONSTRAINT [FK_FACT_EVALUATION_DIM_DATE]
GO
ALTER TABLE [dbo].[FACT_EVALUATION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_EVALUATION_DIM_EMPLOYEE] FOREIGN KEY([Key_employee])
REFERENCES [dbo].[DIM_EMPLOYEE] ([Key_employee])
GO
ALTER TABLE [dbo].[FACT_EVALUATION] CHECK CONSTRAINT [FK_FACT_EVALUATION_DIM_EMPLOYEE]
GO
ALTER TABLE [dbo].[FACT_Facture_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_Facture_Client_Dim_Client] FOREIGN KEY([Key_Client])
REFERENCES [dbo].[Dim_Client] ([Key_Client])
GO
ALTER TABLE [dbo].[FACT_Facture_Client] CHECK CONSTRAINT [FK_FACT_Facture_Client_Dim_Client]
GO
ALTER TABLE [dbo].[FACT_Facture_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_Facture_Client_Dim_Date] FOREIGN KEY([Date_dernier_paiement])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_Facture_Client] CHECK CONSTRAINT [FK_FACT_Facture_Client_Dim_Date]
GO
ALTER TABLE [dbo].[FACT_Facture_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_Facture_Client_Dim_Date1] FOREIGN KEY([Condition_Date_Paiement])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_Facture_Client] CHECK CONSTRAINT [FK_FACT_Facture_Client_Dim_Date1]
GO
ALTER TABLE [dbo].[FACT_Facture_FOURNISSEUR]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_Facture_FOURNISSEUR_Dim_FOURNISSEUR] FOREIGN KEY([Key_fournisseur])
REFERENCES [dbo].[Dim_FOURNISSEUR] ([Key_FOURNISSEUR])
GO
ALTER TABLE [dbo].[FACT_Facture_FOURNISSEUR] CHECK CONSTRAINT [FK_FACT_Facture_FOURNISSEUR_Dim_FOURNISSEUR]
GO
ALTER TABLE [dbo].[FACT_FINANCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_FINANCE_DIM_ACCOUNT] FOREIGN KEY([Id_account])
REFERENCES [dbo].[DIM_ACCOUNT] ([Id_account])
GO
ALTER TABLE [dbo].[FACT_FINANCE] CHECK CONSTRAINT [FK_FACT_FINANCE_DIM_ACCOUNT]
GO
ALTER TABLE [dbo].[FACT_FINANCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_FINANCE_DIM_DATE] FOREIGN KEY([Date])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_FINANCE] CHECK CONSTRAINT [FK_FACT_FINANCE_DIM_DATE]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_INVENTAIRE_Dim_Date] FOREIGN KEY([Date_inventaire])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE] CHECK CONSTRAINT [FK_FACT_INVENTAIRE_Dim_Date]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_INVENTAIRE_DIM_ENTREPOT] FOREIGN KEY([ID_Entrepot])
REFERENCES [dbo].[DIM_ENTREPOT] ([ID_Entrepot])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE] CHECK CONSTRAINT [FK_FACT_INVENTAIRE_DIM_ENTREPOT]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_INVENTAIRE_Dim_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE] CHECK CONSTRAINT [FK_FACT_INVENTAIRE_Dim_Produit]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS]  WITH NOCHECK ADD  CONSTRAINT [FK_Date] FOREIGN KEY([Date])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] CHECK CONSTRAINT [FK_Date]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS]  WITH NOCHECK ADD  CONSTRAINT [FK_DESTINATION] FOREIGN KEY([Destination])
REFERENCES [dbo].[DIM_ENTREPOT] ([ID_Entrepot])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] CHECK CONSTRAINT [FK_DESTINATION]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS]  WITH NOCHECK ADD  CONSTRAINT [FK_Key_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] CHECK CONSTRAINT [FK_Key_Produit]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS]  WITH NOCHECK ADD  CONSTRAINT [FK_Source] FOREIGN KEY([Source])
REFERENCES [dbo].[DIM_ENTREPOT] ([ID_Entrepot])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] CHECK CONSTRAINT [FK_Source]
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS]  WITH NOCHECK ADD  CONSTRAINT [FK_Type_ID] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[DIM_TYPE_EXPEDITION] ([Type_ID])
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] CHECK CONSTRAINT [FK_Type_ID]
GO
ALTER TABLE [dbo].[FACT_PRESENCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRESENCE_DIM_DATE1] FOREIGN KEY([Arrive_date])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRESENCE] CHECK CONSTRAINT [FK_FACT_PRESENCE_DIM_DATE1]
GO
ALTER TABLE [dbo].[FACT_PRESENCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRESENCE_DIM_DATE2] FOREIGN KEY([Sortie_date])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRESENCE] CHECK CONSTRAINT [FK_FACT_PRESENCE_DIM_DATE2]
GO
ALTER TABLE [dbo].[FACT_PRESENCE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRESENCE_DIM_EMPLOYEE] FOREIGN KEY([Key_employee])
REFERENCES [dbo].[DIM_EMPLOYEE] ([Key_employee])
GO
ALTER TABLE [dbo].[FACT_PRESENCE] CHECK CONSTRAINT [FK_FACT_PRESENCE_DIM_EMPLOYEE]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date] FOREIGN KEY([Date_debut_Fabrication])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date1] FOREIGN KEY([Date_debut_planifiee])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date1]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date2] FOREIGN KEY([Date_fin_Fabrication])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date2]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date3] FOREIGN KEY([Date_fin_planifiee])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Date3]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Machine] FOREIGN KEY([ID_Machine])
REFERENCES [dbo].[Dim_Machine] ([ID_Machine])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Machine]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Operation] FOREIGN KEY([ID_Operation])
REFERENCES [dbo].[Dim_Operation] ([ID_Operation])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Operation]
GO
ALTER TABLE [dbo].[FACT_PRODUCTION]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_PRODUCTION_Dim_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_PRODUCTION] CHECK CONSTRAINT [FK_FACT_PRODUCTION_Dim_Produit]
GO
ALTER TABLE [dbo].[FACT_SCM]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_SCM_Dim_Client] FOREIGN KEY([Key_Client])
REFERENCES [dbo].[Dim_Client] ([Key_Client])
GO
ALTER TABLE [dbo].[FACT_SCM] CHECK CONSTRAINT [FK_FACT_SCM_Dim_Client]
GO
ALTER TABLE [dbo].[FACT_SCM]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_SCM_Dim_Magasin] FOREIGN KEY([ID_Magasin])
REFERENCES [dbo].[Dim_Magasin] ([ID_Magasin])
GO
ALTER TABLE [dbo].[FACT_SCM] CHECK CONSTRAINT [FK_FACT_SCM_Dim_Magasin]
GO
ALTER TABLE [dbo].[FACT_SCM]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_SCM_Dim_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_SCM] CHECK CONSTRAINT [FK_FACT_SCM_Dim_Produit]
GO
ALTER TABLE [dbo].[FACT_SCM]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_SCM_Dim_Transport] FOREIGN KEY([ID_Transport])
REFERENCES [dbo].[Dim_Transport] ([ID_Transport])
GO
ALTER TABLE [dbo].[FACT_SCM] CHECK CONSTRAINT [FK_FACT_SCM_Dim_Transport]
GO
ALTER TABLE [dbo].[FACT_VENTE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_VENTE_Dim_Client] FOREIGN KEY([Key_Client])
REFERENCES [dbo].[Dim_Client] ([Key_Client])
GO
ALTER TABLE [dbo].[FACT_VENTE] CHECK CONSTRAINT [FK_FACT_VENTE_Dim_Client]
GO
ALTER TABLE [dbo].[FACT_VENTE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_VENTE_Dim_Date] FOREIGN KEY([Date_Vente])
REFERENCES [dbo].[Dim_Date] ([CleDate])
GO
ALTER TABLE [dbo].[FACT_VENTE] CHECK CONSTRAINT [FK_FACT_VENTE_Dim_Date]
GO
ALTER TABLE [dbo].[FACT_VENTE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_VENTE_Dim_Detail_Facture_Vente] FOREIGN KEY([key_facture])
REFERENCES [dbo].[Dim_Detail_Facture_Vente] ([key_facture])
GO
ALTER TABLE [dbo].[FACT_VENTE] CHECK CONSTRAINT [FK_FACT_VENTE_Dim_Detail_Facture_Vente]
GO
ALTER TABLE [dbo].[FACT_VENTE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_VENTE_Dim_Magasin] FOREIGN KEY([ID_Magasin])
REFERENCES [dbo].[Dim_Magasin] ([ID_Magasin])
GO
ALTER TABLE [dbo].[FACT_VENTE] CHECK CONSTRAINT [FK_FACT_VENTE_Dim_Magasin]
GO
ALTER TABLE [dbo].[FACT_VENTE]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_VENTE_Dim_Produit] FOREIGN KEY([Key_Produit])
REFERENCES [dbo].[Dim_Produit] ([Key_Produit])
GO
ALTER TABLE [dbo].[FACT_VENTE] CHECK CONSTRAINT [FK_FACT_VENTE_Dim_Produit]
GO
/****** Object:  Trigger [dbo].[tr_account]    Script Date: 11/26/2020 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_account]
ON [dbo].[DIM_ACCOUNT]
INSTEAD OF INSERT 
AS
BEGIN
	insert into DIM_ACCOUNT(Id_account,[Description],[Type])
	select i.Id_account, i.[Description], i.[Type]
	from inserted i 
	where NOT EXISTS(select * from DIM_ACCOUNT A where A.Id_account=i.Id_account )
END
GO
ALTER TABLE [dbo].[DIM_ACCOUNT] ENABLE TRIGGER [tr_account]
GO
/****** Object:  Trigger [dbo].[tr_categorie]    Script Date: 11/26/2020 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_categorie]
   ON  [dbo].[Dim_Categorie]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	


insert into Dim_Categorie (ID_Categorie,Nom_Categorie) select	I.ID_Categorie,I.Nom_Categorie
from inserted I
where( not exists (select * from DIM_Categorie D where D.ID_Categorie = I.ID_Categorie and D.Nom_Categorie = I.Nom_Categorie) )

	


END
GO
ALTER TABLE [dbo].[Dim_Categorie] ENABLE TRIGGER [tr_categorie]
GO
/****** Object:  Trigger [dbo].[tr_client]    Script Date: 11/26/2020 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_client]
   ON  [dbo].[Dim_Client] 
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

update Dim_Client
SET [Date_End] = GETDATE()
	,[is_current] = 0 
WHERE [Key_Client] IN (
	select d.[Key_Client]
	from inserted i , Dim_Client d
	WHERE i.ID_Client=d.ID_Client AND
	(
		i.Nom<>d.Nom OR (i.Nom IS NULL AND d.Nom IS NOT NULL) OR (i.Nom IS NOT NULL AND d.Nom IS NULL) OR
		i.Adresse<>d.Adresse OR (i.Adresse IS NULL AND d.Adresse IS NOT NULL) OR (i.Adresse IS NOT NULL AND d.Adresse IS NULL) OR
		i.Email<>d.Email OR (i.Email IS NULL AND d.Email IS NOT NULL) OR (i.Email IS NOT NULL AND d.Email IS NULL) OR
		i.types_societes<>d.types_societes OR (i.types_societes IS NULL AND d.types_societes IS NOT NULL) OR (i.types_societes IS NOT NULL AND d.types_societes IS NULL) OR
		i.Tel<>d.Tel OR (i.Tel IS NULL AND d.Tel IS NOT NULL) OR (i.Tel IS NOT NULL AND d.Tel IS NULL) OR
		i.Ville<>d.Ville OR (i.Ville IS NULL AND d.Ville IS NOT NULL) OR (i.Ville IS NOT NULL AND d.Ville IS NULL) OR
		i.Code_Postale<>d.Code_Postale OR (i.Code_Postale IS NULL AND d.Code_Postale IS NOT NULL) OR (i.Code_Postale IS NOT NULL AND d.Code_Postale IS NULL) OR
		i.Pays<>d.Pays OR (i.Pays IS NULL AND d.Pays IS NOT NULL) OR (i.Pays IS NOT NULL AND d.Pays IS NULL)
	)
)AND is_current = 1

insert into Dim_Client([ID_Client],[Nom],[types_societes],[Adresse],[Email],[Tel],[Ville],[Code_Postale],[Pays])
select	i.[ID_Client],[Nom],i.[types_societes],i.[Adresse],i.[Email],i.[Tel],i.[Ville],i.[Code_Postale],i.[Pays]
FROM inserted i
WHERE (NOT EXISTS (select * from Dim_Client D WHERE D.[ID_Client]=i.[ID_Client] AND D.is_current=1))

END
GO
ALTER TABLE [dbo].[Dim_Client] ENABLE TRIGGER [tr_client]
GO
/****** Object:  Trigger [dbo].[tr_departement]    Script Date: 11/26/2020 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_departement]
ON [dbo].[DIM_DEPARTEMENT]
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO DIM_DEPARTEMENT (ID_Dep,Nom)
    SELECT i.ID_Dep,i.Nom
    FROM inserted i 
    WHERE NOT EXISTS(select * from DIM_DEPARTEMENT D where D.ID_Dep=i.ID_Dep)
END 
GO
ALTER TABLE [dbo].[DIM_DEPARTEMENT] ENABLE TRIGGER [tr_departement]
GO
/****** Object:  Trigger [dbo].[tr_detail_commande_achat]    Script Date: 11/26/2020 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_detail_commande_achat]
ON [dbo].[DIM_DETAIL_COMMANDE_ACHAT]
INSTEAD OF INSERT 
AS 
BEGIN 
    SET NOCOUNT ON;
     UPDATE DIM_DETAIL_COMMANDE_ACHAT
    SET Date_end=GETDATE(), is_current=0
    WHERE ID_DC IN (
        SELECT D.ID_DC
        FROM DIM_DETAIL_COMMANDE_ACHAT D, inserted i 
        WHERE D.ID_DC=i.ID_DC AND
        (
        i.Reference<>D.Reference OR (i.Reference IS NULL AND D.Reference IS NOT NULL) OR (i.Reference IS NOT NULL AND D.Reference IS NULL) OR
		dbo.getEtat_Map_DETAIL_COMMANDE_ACHAT(i.Etat)<>D.Etat OR (i.Etat IS NULL AND D.Etat IS NOT NULL) OR (i.Etat IS NOT NULL AND D.Etat IS NULL) 
		)
    )
    AND is_current=1


    INSERT INTO DIM_DETAIL_COMMANDE_ACHAT (ID_DC,Reference,Etat)
    SELECT i.ID_DC,i.Reference,dbo.getEtat_Map_DETAIL_COMMANDE_ACHAT(i.Etat)
    FROM inserted i 
    WHERE NOT EXISTS(SELECT * FROM DIM_DETAIL_COMMANDE_ACHAT DC WHERE DC.ID_DC=i.ID_DC AND is_current=1)

END
GO
ALTER TABLE [dbo].[DIM_DETAIL_COMMANDE_ACHAT] ENABLE TRIGGER [tr_detail_commande_achat]
GO
/****** Object:  Trigger [dbo].[tr_DCV]    Script Date: 11/26/2020 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_DCV]
   ON  [dbo].[Dim_Detail_Commande_Vente]
   INSTEAD OF insert
AS 
BEGIN

	SET NOCOUNT ON;
	
update Dim_Detail_Commande_Vente 
SET [Date_End] = GETDATE()
	,[is_current] = 0 
WHERE 
Key_DC IN (
select D.Key_DC 
FROM Dim_Detail_Commande_Vente D, inserted I 
WHERE I.ID_DC=D.ID_DC AND 
D.Etat<>dbo.getEtat_Map_DETAIL_COMMANDE_Vente(I.Etat) OR ( I.Etat is not null AND D.Etat is null)
)
AND is_current=1;


insert into Dim_Detail_Commande_Vente(ID_DC,Reference,Etat)
select i.[ID_DC],i.[Reference],dbo.getEtat_Map_DETAIL_COMMANDE_Vente(i.[Etat])
from inserted i
WHERE (NOT EXISTS (select * from Dim_Detail_Commande_Vente D WHERE D.[ID_DC]=i.[ID_DC] AND D.is_current=1))

END
GO
ALTER TABLE [dbo].[Dim_Detail_Commande_Vente] ENABLE TRIGGER [tr_DCV]
GO
/****** Object:  Trigger [dbo].[tr_detail_facture_achat]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_detail_facture_achat]
ON [dbo].[DIM_DETAIL_FACTURE_ACHAT]
INSTEAD OF INSERT
AS 
BEGIN
	UPDATE DIM_DETAIL_FACTURE_ACHAT
	SET Date_end=GETDATE(), is_current=0
	WHERE Id_facture IN (
	SELECT D.Id_facture
	FROM DIM_DETAIL_FACTURE_ACHAT D, inserted i 
	WHERE D.Id_facture=i.Id_facture AND
	(
	i.Reference<>D.Reference OR (i.Reference IS NULL AND D.Reference IS NOT NULL) OR (i.Reference IS NOT NULL AND D.Reference IS NULL) OR
	dbo.getEtat_Map_DETAIL_Facture_Achat(i.Etat)<>D.Etat OR (i.Etat IS NULL AND D.Etat IS NOT NULL) OR (i.Etat IS NOT NULL AND D.Etat IS NULL) 
	)
	)
	AND is_current=1

    insert into DIM_DETAIL_FACTURE_ACHAT(Id_facture,Reference,Date_creation,Reference_commande,Etat)
    select i.Id_facture,i.Reference,i.Date_creation,i.Reference_commande,dbo.getEtat_Map_DETAIL_Facture_Achat(i.Etat)
    from inserted i 
    where NOT EXISTS(select * from DIM_DETAIL_FACTURE_ACHAT DA where DA.Id_facture=i.Id_facture AND DA.is_current=1)
END
GO
ALTER TABLE [dbo].[DIM_DETAIL_FACTURE_ACHAT] ENABLE TRIGGER [tr_detail_facture_achat]
GO
/****** Object:  Trigger [dbo].[tr_facture_detail]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_facture_detail]
   ON  [dbo].[Dim_Detail_Facture_Vente]
   INSTEAD OF INSERT
AS 
BEGIN
	
	UPDATE Dim_Detail_Facture_Vente
	SET Date_end=GETDATE(), is_current=0
	WHERE ID_Facture IN (
	SELECT D.ID_Facture
	FROM Dim_Detail_Facture_Vente D, inserted i 
	WHERE D.ID_Facture=i.ID_Facture AND
	(
	i.Ref<>D.Ref OR (i.Ref IS NULL AND D.Ref IS NOT NULL) OR (i.Ref IS NOT NULL AND D.Ref IS NULL) OR
	dbo.getEtat_Map_DETAIL_Facture_Vente(i.Etat)<>D.Etat OR (dbo.getEtat_Map_DETAIL_Facture_Vente(i.Etat) IS NULL AND D.Etat IS NOT NULL) OR (dbo.getEtat_Map_DETAIL_Facture_Vente(i.Etat) IS NOT NULL AND D.Etat IS NULL) 
	)
	)
	AND is_current=1
	

    insert into Dim_Detail_Facture_Vente (ID_Facture,Ref,Date_cree,Ref_Command,Etat)
	select I.ID_Facture,I.Ref,I.Date_cree,I.Ref_Command,dbo.getEtat_Map_DETAIL_Facture_Vente(I.Etat)
	from inserted I
	Where not exists (select * from Dim_Detail_Facture_Vente D WHERE D.ID_Facture=I.ID_Facture and D.is_current=1)

END
GO
ALTER TABLE [dbo].[Dim_Detail_Facture_Vente] ENABLE TRIGGER [tr_facture_detail]
GO
/****** Object:  Trigger [dbo].[tr_emploi]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_emploi]
ON [dbo].[DIM_EMPLOI]
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO DIM_EMPLOI (Id_emploi,Nom)
    SELECT i.Id_emploi,i.Nom
    FROM inserted i 
    WHERE NOT EXISTS(select * from DIM_EMPLOI EMP where EMP.Id_emploi=i.Id_emploi)
END 
GO
ALTER TABLE [dbo].[DIM_EMPLOI] ENABLE TRIGGER [tr_emploi]
GO
/****** Object:  Trigger [dbo].[tr_employee]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_employee]
ON [dbo].[DIM_EMPLOYEE]
INSTEAD OF INSERT 
AS
BEGIN 
    SET NOCOUNT ON;
    UPDATE DIM_EMPLOYEE
    SET Date_end=GETDATE(), is_current=0
    WHERE Id_employee IN (
        SELECT E.Id_employee
        FROM DIM_EMPLOYEE E, inserted i 
        WHERE E.Id_employee=i.Id_employee AND
        (
        i.Id_departement<>E.Id_departement OR (i.Id_departement IS NULL AND E.Id_departement IS NOT NULL) OR (i.Id_departement IS NOT NULL AND E.Id_departement IS NULL) OR
        i.Id_emploi<>E.id_emploi OR (i.Id_emploi IS NULL AND E.Id_emploi IS NOT NULL) OR (i.Id_emploi IS NOT NULL AND E.Id_emploi IS NULL) OR
		i.Nom<>E.Nom OR (i.Nom IS NULL AND E.Nom IS NOT NULL) OR (i.Nom IS NOT NULL AND E.Nom IS NULL) OR
		i.Date_naissance<>E.Date_naissance OR (i.Date_naissance IS NULL AND E.Date_naissance IS NOT NULL) OR (i.Date_naissance IS NOT NULL AND E.Date_naissance IS NULL) OR
		i.Genre<>E.Genre OR (i.Genre IS NULL AND E.Genre IS NOT NULL) OR (i.Genre IS NOT NULL AND E.Genre IS NULL) OR
		i.Telephone<>E.Telephone OR (i.Telephone IS NULL AND E.Telephone IS NOT NULL) OR (i.Telephone IS NOT NULL AND E.Telephone IS NULL) OR
		i.Email<>E.Email OR (i.Email IS NULL AND E.Email IS NOT NULL) OR (i.Email IS NOT NULL AND E.Email IS NULL) OR
		i.Niveau_etude<>E.Niveau_etude OR (i.Niveau_etude IS NULL AND E.Niveau_etude IS NOT NULL) OR (i.Niveau_etude IS NOT NULL AND E.Niveau_etude IS NULL) OR
		i.Etat_civil<>E.Etat_civil OR (i.Etat_civil IS NULL AND E.Etat_civil IS NOT NULL) OR (i.Etat_civil IS NOT NULL AND E.Etat_civil IS NULL) OR
        i.Adresse_domicile<>E.Adresse_domicile OR (i.Adresse_domicile IS NULL AND E.Adresse_domicile IS NOT NULL) OR (i.Adresse_domicile IS NOT NULL AND E.Adresse_domicile IS NULL)

        )
    )
    AND is_current=1

    insert into DIM_EMPLOYEE (Id_employee,Id_emploi,Id_departement,Nom,Date_naissance,Genre,Telephone,Email,Niveau_etude,Adresse_domicile,Etat_civil)
    select i.Id_employee,i.Id_emploi,i.Id_departement,i.Nom,i.Date_naissance,i.Genre,i.Telephone,i.Email,i.Niveau_etude,i.Adresse_domicile,i.Etat_civil
    From inserted i 
    Where NOT EXISTS(select * from DIM_EMPLOYEE E WHERE E.Id_employee=i.Id_employee AND is_current=1 )
END
GO
ALTER TABLE [dbo].[DIM_EMPLOYEE] ENABLE TRIGGER [tr_employee]
GO
/****** Object:  Trigger [dbo].[tr_Entrepot]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_Entrepot]
ON [dbo].[DIM_ENTREPOT]
INSTEAD OF INSERT
AS 
BEGIN
    INSERT INTO DIM_ENTREPOT (ID_Entrepot,Nom,Type_site)
    select  i.ID_Entrepot, i.Nom, i.Type_site
    from inserted i
    where NOT EXISTS(select * from DIM_ENTREPOT E where i.ID_Entrepot=E.ID_Entrepot)
END
GO
ALTER TABLE [dbo].[DIM_ENTREPOT] ENABLE TRIGGER [tr_Entrepot]
GO
/****** Object:  Trigger [dbo].[tr_fournisseur]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_fournisseur]
   ON  [dbo].[Dim_FOURNISSEUR]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

update Dim_Fournisseur
SET [Date_End] = GETDATE()
	,[is_current] = 0 
WHERE Key_FOURNISSEUR IN (
	select d.Key_FOURNISSEUR
	from inserted i , Dim_Fournisseur d
	WHERE i.[ID_FOURNISSEUR]=d.[ID_FOURNISSEUR] AND
	(
		i.Nom<>d.Nom OR (i.Nom IS NULL AND d.Nom IS NOT NULL) OR (i.Nom IS NOT NULL AND d.Nom IS NULL) OR
		i.Adresse<>d.Adresse OR (i.Adresse IS NULL AND d.Adresse IS NOT NULL) OR (i.Adresse IS NOT NULL AND d.Adresse IS NULL) OR
		i.Email<>d.Email OR (i.Email IS NULL AND d.Email IS NOT NULL) OR (i.Email IS NOT NULL AND d.Email IS NULL) OR
		i.types_societes<>d.types_societes OR (i.types_societes IS NULL AND d.types_societes IS NOT NULL) OR (i.types_societes IS NOT NULL AND d.types_societes IS NULL) OR
		i.Tel<>d.Tel OR (i.Tel IS NULL AND d.Tel IS NOT NULL) OR (i.Tel IS NOT NULL AND d.Tel IS NULL) OR
		i.Ville<>d.Ville OR (i.Ville IS NULL AND d.Ville IS NOT NULL) OR (i.Ville IS NOT NULL AND d.Ville IS NULL) OR
		i.Code_Postale<>d.Code_Postale OR (i.Code_Postale IS NULL AND d.Code_Postale IS NOT NULL) OR (i.Code_Postale IS NOT NULL AND d.Code_Postale IS NULL) OR
		i.Pays<>d.Pays OR (i.Pays IS NULL AND d.Pays IS NOT NULL) OR (i.Pays IS NOT NULL AND d.Pays IS NULL)
	)
)AND is_current = 1

insert into Dim_Fournisseur(
		   [ID_FOURNISSEUR]
		  ,[Nom]
		  ,[types_societes]
		  ,[Adresse]
		  ,[Email]
		  ,[Tel]
		  ,[Ville]
		  ,[Code_Postale]
		  ,[Pays])
select	I.[ID_FOURNISSEUR]
		  ,I.[Nom]
		  ,I.[types_societes]
		  ,I.[Adresse]
		  ,I.[Email]
		  ,I.[Tel]
		  ,I.[Ville]
		  ,I.[Code_Postale]
		  ,I.[Pays]
FROM inserted I
WHERE (NOT EXISTS (select * from Dim_Fournisseur D WHERE D.[ID_FOURNISSEUR]=I.[ID_FOURNISSEUR] AND D.is_current=1))

END
GO
ALTER TABLE [dbo].[Dim_FOURNISSEUR] ENABLE TRIGGER [tr_fournisseur]
GO
/****** Object:  Trigger [dbo].[tr_machin]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_machin]
   ON  [dbo].[Dim_Machine] 
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

	insert into Dim_Machine (ID_Machine,Nom,Ref,Type)
	select * 
	From inserted I
	Where Not Exists (select * from Dim_Machine D WHERE D.[ID_Machine]=I.[ID_Machine])

END
GO
ALTER TABLE [dbo].[Dim_Machine] ENABLE TRIGGER [tr_machin]
GO
/****** Object:  Trigger [dbo].[tr_magasin]    Script Date: 11/26/2020 12:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_magasin]
   ON  [dbo].[Dim_Magasin]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	

	insert into Dim_Magasin (ID_Magasin, ID_Region, Nom, Adresse, Ville, Code_postal, Pays)
	select ID_Magasin, ID_Region, Nom, Adresse, Ville, Code_postal, Pays
	from inserted I
	Where NOT EXISTS(select * from Dim_Magasin D where D.ID_Magasin = I.ID_Magasin)

END
GO
ALTER TABLE [dbo].[Dim_Magasin] ENABLE TRIGGER [tr_magasin]
GO
/****** Object:  Trigger [dbo].[tr_operation]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_operation]
   ON  [dbo].[Dim_Operation]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;


	insert into Dim_Operation (ID_Operation,Type,Code)
	select	ID_Operation,Type,Code
	from inserted I
	WHERE Not EXists (select * from dbo.Dim_Operation D where D.ID_Operation = I.ID_Operation)


END
GO
ALTER TABLE [dbo].[Dim_Operation] ENABLE TRIGGER [tr_operation]
GO
/****** Object:  Trigger [dbo].[tr_paiment_client]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_paiment_client]
   ON  [dbo].[Dim_Paiement_Client]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	UPDATE FACT_Facture_Client 
	SET Montant_restant = Montant_restant-I.mp,
		Regler=dbo.fun_regler_paiement(Montant_restant-I.mp),
		Date_dernier_paiement=I.DP
	FROM (
		SELECT N.[ID_Facture_Client],sum ([montant_Paiement]) as mp, MAX( [Date_Paiement]) as DP
		FROM inserted as N
		WHERE not exists (select * from Dim_Paiement_Client D where D.[ID_Paiement]=N.[ID_Paiement]) 
		group by N.[ID_Facture_Client]) AS I
	WHERE 
		I.ID_Facture_Client = FACT_Facture_Client.ID_Facture

	insert into Dim_Paiement_Client (
		[ID_Paiement]
      ,[Reference_Paiement]
      ,[montant_Paiement]
      ,[Type_Paiement]
      ,[Date_Paiement]
      ,[ID_Facture_Client])
	select [ID_Paiement]
      ,[Reference_Paiement]
      ,[montant_Paiement]
      ,[Type_Paiement]
      ,[Date_Paiement]
      ,[ID_Facture_Client]
	  from inserted I
	  WHERE not exists (select * from Dim_Paiement_Client D where D.[ID_Paiement]=I.[ID_Paiement])
    

END
GO
ALTER TABLE [dbo].[Dim_Paiement_Client] ENABLE TRIGGER [tr_paiment_client]
GO
/****** Object:  Trigger [dbo].[tr_paiement_fournisseur]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_paiement_fournisseur]
   ON  [dbo].[Dim_Paiement_Fournisseur]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	UPDATE FACT_Facture_Fournisseur
	SET Montant_restant = Montant_restant-I.mp,
		Regler=dbo.fun_regler_paiement(Montant_restant-I.mp),
		Date_dernier_paiement=I.DP
	FROM (
		SELECT N.[ID_Facture_Fournisseur],sum ([montant_Paiement]) as mp, MAX([Date_Paiement]) as DP
		FROM inserted as N
		WHERE not exists (select * from Dim_Paiement_Fournisseur D where D.[ID_Paiement]=N.[ID_Paiement]) 
		group by N.[ID_Facture_Fournisseur]) AS I
	WHERE 
		I.ID_Facture_Fournisseur = FACT_Facture_Fournisseur.ID_Facture

	insert into Dim_Paiement_Fournisseur (
		[ID_Paiement]
      ,[Reference_Paiement]
      ,[montant_Paiement]
      ,[Type_Paiement]
      ,[Date_Paiement]
      ,[ID_Facture_Fournisseur])
	select [ID_Paiement]
      ,[Reference_Paiement]
      ,[montant_Paiement]
      ,[Type_Paiement]
      ,[Date_Paiement]
      ,[ID_Facture_Fournisseur]
	  from inserted I
	  WHERE not exists (select * from Dim_Paiement_Fournisseur D where D.[ID_Paiement]=I.[ID_Paiement])

END
GO
ALTER TABLE [dbo].[Dim_Paiement_Fournisseur] ENABLE TRIGGER [tr_paiement_fournisseur]
GO
/****** Object:  Trigger [dbo].[tr_update_produit]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_update_produit]
   ON  [dbo].[Dim_Produit] 
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;

update Dim_Produit 
SET [Date_End] = GETDATE()
	,[is_current] = 0 
WHERE NOT EXISTS (select [ID_Produit]
						,[ID_sous_categorie]
						,[Reference]
						,[Nom]
						,[Type]
						,[Cout_produit]
						,[Couleur]
						,[Produit_achete]
						,[Produit_vendu]
						,[Produit_depenser]
				   FROM Dim_Produit
				   WHERE [is_current] = 1
				   INTERSECT
				   SELECT [ID_Produit]
						,[ID_sous_categorie]
						,[Reference]
						,[Nom]
						,[Type]
						,[Cout_produit]
						,[Couleur]
						,[Produit_achete]
						,[Produit_vendu]
						,[Produit_depenser]
					FROM inserted)


insert into Dim_Produit (
		[ID_Produit]
		,[ID_sous_categorie]
		,[Reference]
		,[Nom]
		,[Type]
		,[Cout_produit]
		,[Couleur]
		,[Produit_achete]
		,[Produit_vendu]
		,[Produit_depenser])
select	[ID_Produit]
		,[ID_sous_categorie]
		,[Reference]
		,[Nom]
		,[Type]
		,[Cout_produit]
		,[Couleur]
		,[Produit_achete]
		,[Produit_vendu]
		,[Produit_depenser]		
from inserted

WHERE NOT EXIStS (Select * From Dim_Produit D WHERE D.ID_Produit=ID_Produit AND D.is_current=1 )


END
GO
ALTER TABLE [dbo].[Dim_Produit] ENABLE TRIGGER [tr_update_produit]
GO
/****** Object:  Trigger [dbo].[tr_region]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_region]
   ON  [dbo].[Dim_Region] 
   instead of INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	

	insert into Dim_Region (ID_Region, Region)
	select	ID_Region,Region
	from inserted I
	WHERE NOT EXISTs (select * from Dim_Region D where D.ID_Region = I.ID_Region)

END
GO
ALTER TABLE [dbo].[Dim_Region] ENABLE TRIGGER [tr_region]
GO
/****** Object:  Trigger [dbo].[dbo.tr_sous-Categorie]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[dbo.tr_sous-Categorie]
   ON  [dbo].[Dim_Sous-Categorie]
   instead of INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	
insert into [Dim_Sous-Categorie] (ID_sous_categorie,sous_categorie,ID_Categorie) 
select	ID_sous_categorie,sous_categorie,ID_Categorie
from inserted I
where( not exists (select * from [Dim_Sous-Categorie] D where D.ID_sous_categorie = I.ID_sous_categorie) )

END
GO
ALTER TABLE [dbo].[Dim_Sous-Categorie] ENABLE TRIGGER [dbo.tr_sous-Categorie]
GO
/****** Object:  Trigger [dbo].[tr_transpot]    Script Date: 11/26/2020 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_transpot]
   ON  [dbo].[Dim_Transport]
   INSTEAD OF Insert 
AS 
BEGIN

	SET NOCOUNT ON;

	insert into Dim_Transport (ID_Transport,type_vehicule,cout_transport,matricule)
	select ID_Transport,type_vehicule,cout_transport,matricule
	from inserted I
	where not exists(select * from Dim_Transport D where D.ID_Transport=I.ID_Transport)
END
GO
ALTER TABLE [dbo].[Dim_Transport] ENABLE TRIGGER [tr_transpot]
GO
/****** Object:  Trigger [dbo].[Tr_type_competence]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tr_type_competence]
ON [dbo].[DIM_TYPE_COMPETENCE]
INSTEAD OF INSERT
AS 
BEGIN
    insert into DIM_TYPE_COMPETENCE (Id_type_competence,Nom_type_competence)
    select i.Id_type_competence,i.Nom_type_competence
    from inserted i 
    where  NOT EXISTS(select * from DIM_TYPE_COMPETENCE TC where TC.Id_type_competence=i.Id_type_competence)
END 

GO
ALTER TABLE [dbo].[DIM_TYPE_COMPETENCE] ENABLE TRIGGER [Tr_type_competence]
GO
/****** Object:  Trigger [dbo].[tr_type_expedition]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_type_expedition]
ON [dbo].[DIM_TYPE_EXPEDITION]
INSTEAD OF INSERT 
AS
BEGIN
    INSERT INTO DIM_TYPE_EXPEDITION (Type_ID,Nom)
    select i.Type_ID,i.Nom
    from inserted i
    where NOT EXISTS (select * from DIM_TYPE_EXPEDITION TE where i.Type_ID=TE.Type_ID)
END
GO
ALTER TABLE [dbo].[DIM_TYPE_EXPEDITION] ENABLE TRIGGER [tr_type_expedition]
GO
/****** Object:  Trigger [dbo].[Tr_achat]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tr_achat]
ON [dbo].[FACT_ACHAT]
INSTEAD OF INSERT 
AS
BEGIN 

    insert into FACT_ACHAT (ID,Key_FOURNISSEUR,Key_produit,ID_Dep,key_facture,Quantite_achete,Date_achat,Prix_unitaire,Prix_total_HT,Prix_total)
    select i.ID,dbo.return_Key_Fournisseur(i.Key_FOURNISSEUR),dbo.return_Key_Produit(i.Key_produit),ID_Dep,dbo.return_Key_DF_A(i.key_facture),i.Quantite_achete,i.Date_achat,i.Prix_unitaire,i.Prix_total_HT,i.Prix_total
    From inserted i 
    Where NOT EXISTS(select * from FACT_ACHAT F WHERE F.ID=i.ID)
	
END

GO
ALTER TABLE [dbo].[FACT_ACHAT] ENABLE TRIGGER [Tr_achat]
GO
/****** Object:  Trigger [dbo].[Tr_commande_achat]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tr_commande_achat]
ON [dbo].[FACT_COMMANDE_ACHAT]
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO FACT_COMMANDE_ACHAT (ID,Key_FOURNISSEUR,Key_produit,Key_DC,ID_Dep,Quantite_commande,Date_commande,Date_confirmation,
    Prix_unitaire,Prix_total_HT,Taxe,Prix_total)
    SELECT i.ID,dbo.return_Key_Fournisseur(i.Key_FOURNISSEUR),dbo.return_Key_Produit(i.Key_produit),dbo.return_Key_DC_A(i.Key_DC),i.ID_Dep,i.Quantite_commande,i.Date_commande,i.Date_confirmation,
    i.Prix_unitaire,i.Prix_total_HT,i.Taxe,i.Prix_total
    FROM inserted i 
    WHERE NOT EXISTS(SELECT * FROM FACT_COMMANDE_ACHAT FCA WHERE i.ID=FCA.ID)
END  
GO
ALTER TABLE [dbo].[FACT_COMMANDE_ACHAT] ENABLE TRIGGER [Tr_commande_achat]
GO
/****** Object:  Trigger [dbo].[tr_comm_vente]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_comm_vente]
   ON  [dbo].[Fact_Commande_Vente]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

	insert into	Fact_Commande_Vente ([ID]
				,[Key_Produit]
				,[Key_Client]
				,[Key_DC]
				,[ID_Magasin]
				,[Description]
				,[Quantite]
				,[Prix_Unitaire]
				,[Prix_HT]
				,[Remise]
				,[Prix_Total]
				,[Date_commande])
	select [ID]
		  ,dbo.return_Key_Produit([Key_Produit])
		  ,dbo.return_Key_Client([Key_Client])
		  ,dbo.return_Key_DC_V([Key_DC])
		  ,[ID_Magasin]
		  ,[Description]
		  ,[Quantite]
		  ,[Prix_Unitaire]
		  ,[Prix_HT]
		  ,[Remise]
		  ,[Prix_Total]
		  ,[Date_commande]	 
	from inserted I
	WHERE NOT EXISTS(
	select * 
	from dbo.Fact_Commande_Vente F,Dim_Detail_Commande_Vente D
	where F.ID = I.[ID] AND D.Key_DC=F.Key_DC AND D.is_current=1)

END


GO
ALTER TABLE [dbo].[Fact_Commande_Vente] ENABLE TRIGGER [tr_comm_vente]
GO
/****** Object:  Trigger [dbo].[Tr_competence]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tr_competence]
ON [dbo].[FACT_COMPETENCE]
INSTEAD OF INSERT
AS
BEGIN
    insert into FACT_COMPETENCE (ID,Key_employee,id_type_competence,Nom,Niveau)
    select i.ID,dbo.return_Key_employee(i.Key_employee),i.Id_type_competence,i.Nom,i.Niveau
    from inserted i 
    where NOT EXISTS(select * from FACT_COMPETENCE C where C.ID=i.ID )
END   
GO
ALTER TABLE [dbo].[FACT_COMPETENCE] ENABLE TRIGGER [Tr_competence]
GO
/****** Object:  Trigger [dbo].[tr_conge]    Script Date: 11/26/2020 12:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_conge]
ON [dbo].[FACT_CONGE]
INSTEAD OF INSERT 
AS
BEGIN
    UPDATE FACT_CONGE
    SET Date_end=GETDATE(),is_current=0
    WHERE ID IN (
        select C.ID
        FROM FACT_CONGE C, inserted i
        where i.ID=C.ID AND
        (
            C.Description<>i.Description OR (C.Description IS NULL AND i.Description IS NOT NULL) OR (C.Description IS NOT NULL AND i.Description IS NULL) OR
            C.Type_conge<>i.Type_conge OR (C.Type_conge IS NULL AND i.Type_conge IS NOT NULL) OR (C.Type_conge IS NOT NULL AND i.Type_conge IS NULL) OR
            C.Date_debut<>i.Date_debut OR
            C.Date_fin<>i.Date_fin OR
            C.Nombre_jour<>i.Nombre_jour OR (C.Nombre_jour IS NULL AND i.Nombre_jour IS NOT NULL) OR (C.Nombre_jour IS NOT NULL AND i.Nombre_jour IS NULL) OR
            C.Etat<>dbo.getEtat_Map_Fact_Conge(i.Etat) OR (C.Etat IS NULL AND i.Etat IS NOT NULL) OR (C.Etat IS NOT NULL AND i.Etat IS NULL)
        )
    ) AND is_current=1

    insert into FACT_CONGE (ID,Key_employee,Description,Type_conge,Date_debut,Date_fin,Nombre_jour,Etat)
    select i.ID,dbo.return_Key_employee(i.Key_employee),i.Description,i.Type_conge,i.Date_debut,i.Date_fin,i.Nombre_jour,dbo.getEtat_Map_Fact_Conge(i.Etat)
    from inserted i 
    where NOT EXISTS(select * from FACT_CONGE C where C.ID=i.ID)
END
GO
ALTER TABLE [dbo].[FACT_CONGE] ENABLE TRIGGER [tr_conge]
GO
/****** Object:  Trigger [dbo].[tr_contrat]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_contrat]
ON [dbo].[FACT_CONTRAT]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE FACT_CONTRAT
    SET Date_end=GETDATE(),is_current=0
    WHERE Id_contrat IN (
        SELECT CON.Id_contrat
        FROM FACT_CONTRAT CON, inserted i 
        WHERE CON.Id_contrat=i.Id_contrat AND 
        (
            i.Date_debut<>CON.date_debut OR 
            i.Date_fin<>CON.date_fin OR
            i.Salaire<>CON.Salaire OR (i.Salaire IS NULL AND CON.Salaire IS NOT NULL) OR (i.Salaire IS NOT NULL AND CON.Salaire IS NULL) OR
            dbo.getEtat_Map_Fact_Contrat(i.Etat)<>CON.Etat OR (i.Etat IS NULL AND CON.Etat IS NOT NULL ) OR (i.Etat IS NOT NULL AND CON.Etat IS NULL) OR
            i.Type<>CON.Type OR (i.Type IS NULL AND CON.Type IS NOT NULL) OR (i.Type IS NOT NULL AND CON.Type IS NULL)
        )
    )
    INSERT INTO FACT_CONTRAT (Id_contrat,Key_employee,Date_debut,Date_fin,Salaire,Type,Etat)
    SELECT Id_contrat,dbo.return_Key_employee(Key_employee),Date_debut,Date_fin,Salaire,Type,dbo.getEtat_Map_Fact_Contrat(Etat)
    FROM inserted i
    WHERE NOT EXISTS(SELECT * FROM FACT_CONTRAT CON WHERE CON.Id_contrat=i.Id_contrat AND CON.is_current=1);

END 
GO
ALTER TABLE [dbo].[FACT_CONTRAT] ENABLE TRIGGER [tr_contrat]
GO
/****** Object:  Trigger [dbo].[Tr_evaluation]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Tr_evaluation]
ON [dbo].[FACT_EVALUATION]
INSTEAD OF INSERT
AS 
BEGIN
    INSERT INTO FACT_EVALUATION (Id_evaluation,Note,Date,Key_employee)
    SELECT i.Id_evaluation,i.Note,i.Date,dbo.return_Key_employee(i.Key_employee)
    FROM inserted i 
    WHERE NOT EXISTS(SELECT * FROM FACT_EVALUATION E WHERE E.Id_evaluation=i.Id_evaluation)
END
GO
ALTER TABLE [dbo].[FACT_EVALUATION] ENABLE TRIGGER [Tr_evaluation]
GO
/****** Object:  Trigger [dbo].[tr_facture_client]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_facture_client]
   ON  [dbo].[FACT_Facture_Client]
   Instead OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into FACT_Facture_Client(
	[ID_Facture]
      ,[Key_Client]
      ,[Ref_Facture]
      ,[Taxes]
      ,[Montant_HT]
      ,[Montant_Total]
      ,[Montant_restant]
      ,[Regler]
      ,[Date_dernier_paiement]
      ,[Condition_Date_Paiement])
	select [ID_Facture]
      ,dbo.return_Key_Client([Key_Client])
      ,[Ref_Facture]
      ,[Taxes]
      ,[Montant_HT]
      ,[Montant_Total]
      ,[Montant_Total]
      ,0
      ,NULL
      ,[Condition_Date_Paiement]
	from inserted I
	where not exists (select * from FACT_Facture_Client F WHERE F.[ID_Facture] = I.[ID_Facture] )

END
GO
ALTER TABLE [dbo].[FACT_Facture_Client] ENABLE TRIGGER [tr_facture_client]
GO
/****** Object:  Trigger [dbo].[tr_facture_fournisseur]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_facture_fournisseur]
   ON  [dbo].[FACT_Facture_FOURNISSEUR]
   Instead OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	insert into FACT_Facture_Fournisseur(
	[ID_Facture]
      ,[Key_Fournisseur]
      ,[Ref_Facture]
      ,[Taxes]
      ,[Montant_HT]
      ,[Montant_Total]
      ,[Montant_restant]
      ,[Regler]
      ,[Date_dernier_paiement]
      ,[Condition_Date_Paiement])
	select [ID_Facture]
      ,dbo.return_Key_Fournisseur([Key_Fournisseur])
      ,[Ref_Facture]
      ,[Taxes]
      ,[Montant_HT]
      ,[Montant_Total]
      ,[Montant_Total]
      ,0
      ,NULL
      ,[Condition_Date_Paiement]
	from inserted I
	where not exists (select * from FACT_Facture_Fournisseur F WHERE F.[ID_Facture] = I.[ID_Facture] )


END
GO
ALTER TABLE [dbo].[FACT_Facture_FOURNISSEUR] ENABLE TRIGGER [tr_facture_fournisseur]
GO
/****** Object:  Trigger [dbo].[tr_finance]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_finance]
ON [dbo].[FACT_FINANCE]
INSTEAD OF INSERT
AS 
BEGIN
	INSERT INTO FACT_FINANCE (ID,Id_account,ID_Dep,Date,Montant)
	SELECT i.ID,i.Id_account,i.ID_Dep,i.Date,i.Montant
	FROM inserted i
	WHERE NOT EXISTS(select * from FACT_FINANCE F where F.ID=i.ID)
END	
GO
ALTER TABLE [dbo].[FACT_FINANCE] ENABLE TRIGGER [tr_finance]
GO
/****** Object:  Trigger [dbo].[tr_Inventaire]    Script Date: 11/26/2020 12:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_Inventaire] 
   ON  [dbo].[FACT_INVENTAIRE]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	UPDATE FACT_INVENTAIRE
	SET is_current=0
	WHERE ID_Inventaire IN (
		Select F.ID_Inventaire
        from FACT_INVENTAIRE F,inserted i 
        where F.ID_Inventaire=i.ID_Inventaire AND (
			F.Key_Produit<>dbo.return_Key_Produit(i.Key_Produit) AND 
			F.ID_Entrepot<>i.ID_Entrepot AND
			F.Quantite<>i.Quantite	
		)
	
	
	) AND is_current = 1


	insert into FACT_INVENTAIRE (ID_Inventaire,Key_Produit,ID_Entrepot,Quantite,Date_inventaire)
	select i.ID_Inventaire, dbo.return_Key_Produit(i.Key_Produit),i.ID_Entrepot,i.Quantite,i.Date_inventaire
	from inserted i
	where not exists (select * 
						from  FACT_INVENTAIRE F 
						where F.ID_Inventaire=i.ID_Inventaire AND 
							  F.Key_Produit=dbo.return_Key_Produit(i.Key_Produit) AND 
							  F.ID_Entrepot=i.ID_Entrepot AND
							  F.Quantite=i.Quantite AND
							  is_current = 1
					)



END
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE] ENABLE TRIGGER [tr_Inventaire]
GO
/****** Object:  Trigger [dbo].[tr_INVENTAIRE_MOUVEMENTS]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_INVENTAIRE_MOUVEMENTS]
ON [dbo].[FACT_INVENTAIRE_MOUVEMENTS]
INSTEAD OF INSERT
AS 
BEGIN
    UPDATE FACT_INVENTAIRE_MOUVEMENTS
    SET Date_end=GETDATE(),is_current=0
    WHERE ID IN(
        Select IM.ID 
        from FACT_INVENTAIRE_MOUVEMENTS IM,inserted i 
        where IM.ID=i.ID AND(
            i.Type_ID<>IM.Type_ID OR
            i.Source<>IM.Source OR
            i.Destination<>IM.Destination OR
            i.Quantite<>IM.Quantite OR(i.Quantite IS NULL AND IM.Quantite IS NOT NULL) OR (i.Quantite IS NOT NULL AND IM.Quantite IS NULL) OR
            i.Date <> IM.Date OR
            i.Type_mouvement<>IM.Type_mouvement OR(i.Type_mouvement IS NULL AND IM.Type_mouvement IS NOT NULL) OR (i.Type_mouvement IS NOT NULL AND IM.Type_mouvement IS NULL) OR
            dbo.getEtat_Map_FACT_INVENTAIRE_MOUVEMENTS(i.Etat)<>IM.Etat OR (i.Etat IS NULL AND IM.Etat IS NOT NULL) OR (i.Etat IS NOT NULL AND IM.Etat IS NULL)

        )
    ) AND is_current=1

    INSERT INTO FACT_INVENTAIRE_MOUVEMENTS (ID,Ref,Key_produit,Type_ID,Source,Destination,Quantite,Date,Type_mouvement,Etat)
    SELECT i.ID,i.Ref,dbo.return_Key_Produit(i.Key_produit),i.Type_ID,i.Source,i.Destination,i.Quantite,i.Date,Type_mouvement,dbo.getEtat_Map_FACT_INVENTAIRE_MOUVEMENTS(i.Etat)
    FROM inserted i 
    WHERE NOT EXISTS (select * from FACT_INVENTAIRE_MOUVEMENTS IM where i.ID=IM.ID and IM.is_current=1)

END
GO
ALTER TABLE [dbo].[FACT_INVENTAIRE_MOUVEMENTS] ENABLE TRIGGER [tr_INVENTAIRE_MOUVEMENTS]
GO
/****** Object:  Trigger [dbo].[tr_presence]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_presence]
ON [dbo].[FACT_PRESENCE]
INSTEAD OF INSERT
AS 
BEGIN
    INSERT INTO FACT_PRESENCE (Id_presence,Key_employee,Arrive_date,Sortie_date,Arrive_temps,Sortie_temps,Heures_de_travail,Periode)
    SELECT i.Id_presence,dbo.return_Key_employee(i.Key_employee),i.Arrive_date,i.Sortie_date, i.Arrive_temps, i.Sortie_temps,i.Heures_de_travail,i.Periode
    FROM inserted i 
    WHERE NOT EXISTS(SELECT * FROM FACT_PRESENCE P WHERE P.Id_presence=i.Id_presence )
END   
GO
ALTER TABLE [dbo].[FACT_PRESENCE] ENABLE TRIGGER [tr_presence]
GO
/****** Object:  Trigger [dbo].[tr_production]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_production] 
   ON  [dbo].[FACT_PRODUCTION]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

	update dbo.FACT_PRODUCTION
	SET [Etat]=I.Etat, 
		[Date_debut_planifiee]=I.[Date_debut_planifiee], 
		[Date_fin_planifiee]= I.[Date_fin_planifiee], 
		[Date_debut_Fabrication]= I.[Date_debut_Fabrication], 
		[Date_fin_Fabrication] = I.[Date_fin_Fabrication]
	from (
			select N.[ID_Production], N.[Etat],N.[Date_debut_planifiee],N.[Date_fin_planifiee],N.[Date_debut_Fabrication],N.[Date_fin_Fabrication]
			from inserted N ,FACT_PRODUCTION F
			where N.[ID_Production] = F.[ID_Production] AND 
			(
				dbo.getEtat_Map_Fact_Conge(N.Etat) <> F.[Etat] OR (N.Etat IS NULL AND F.Etat IS NOT NULL) OR (N.Etat IS NOT NULL AND F.Etat IS NULL) OR
				N.[Date_debut_planifiee]<>F.[Date_debut_planifiee] OR  (N.[Date_debut_planifiee] IS NULL AND F.[Date_debut_planifiee] IS NOT NULL) OR  (N.[Date_debut_planifiee] IS NOT NULL AND F.[Date_debut_planifiee] IS NULL) OR
				N.[Date_fin_planifiee]<>F.[Date_fin_planifiee] OR (N.[Date_fin_planifiee] is null AND F.[Date_fin_planifiee] is not null ) OR (N.[Date_fin_planifiee] is not null AND F.[Date_fin_planifiee] is null ) OR
				N.[Date_debut_Fabrication]<>F.[Date_debut_Fabrication] OR ( N.[Date_debut_Fabrication] is null AND F.[Date_debut_Fabrication] is not null ) OR ( N.[Date_debut_Fabrication] is not null AND F.[Date_debut_Fabrication] is null ) OR
				N.[Date_fin_Fabrication]<> F.[Date_fin_Fabrication] OR (N.[Date_fin_Fabrication] is null AND F.[Date_fin_Fabrication] is not null ) OR (N.[Date_fin_Fabrication] is not null AND F.[Date_fin_Fabrication] is null )
			)

		) AS I
	
	
	WHERE I.[ID_Production] = dbo.FACT_PRODUCTION.[ID_Production]


	insert into dbo.FACT_PRODUCTION (
							   [ID_Production]
							  ,[Key_Produit]
							  ,[ID_Operation]
							  ,[ID_Machine]
							  ,[Reference]
							  ,[Quantite]
							  ,[Etat]
							  ,[Date_debut_planifiee]
							  ,[Date_fin_planifiee]
							  ,[Date_debut_Fabrication]
							  ,[Date_fin_Fabrication])
	select [ID_Production]
			  ,dbo.[return_Key_Produit](Key_Produit)
			  ,[ID_Operation]
			  ,[ID_Machine]
			  ,[Reference]
			  ,[Quantite]
			  ,dbo.getEtat_Map_Fact_Conge([Etat])
			  ,[Date_debut_planifiee]
			  ,[Date_fin_planifiee]
			  ,[Date_debut_Fabrication]
			  ,[Date_fin_Fabrication]
		from inserted I
		WHERE NOT EXISTS (select * FROM FACT_PRODUCTION F WHERE F.ID_Production = I.ID_Production)

END

GO
ALTER TABLE [dbo].[FACT_PRODUCTION] ENABLE TRIGGER [tr_production]
GO
/****** Object:  Trigger [dbo].[tr_scm]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_scm]
   ON  [dbo].[FACT_SCM]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;

    insert into dbo.FACT_SCM(
		[ID]
      ,[Key_Produit]
      ,[ID_Transport]
      ,[ID_Magasin]
      ,[Key_Client]
      ,[Qnt_Lvr]
      ,[Date_Prevue]
      ,[Date_effective]
      ,[Ref_Commande]
      ,[Date_commande])
	select [ID]
	  ,dbo.return_Key_Produit([Key_Produit])
      ,[ID_Transport]
      ,[ID_Magasin]
	  ,dbo.return_Key_Client([Key_Client])
      ,[Qnt_Lvr]
      ,[Date_Prevue]
      ,[Date_effective]
      ,[Ref_Commande]
      ,[Date_commande]
	from inserted I
	where not exists (select * from dbo.FACT_SCM F where I.ID=F.ID)

END
GO
ALTER TABLE [dbo].[FACT_SCM] ENABLE TRIGGER [tr_scm]
GO
/****** Object:  Trigger [dbo].[tr_vente]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_vente]
   ON  [dbo].[FACT_VENTE]
   INSTEAD OF INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	
	insert into dbo.FACT_VENTE ([ID_Vente],[Key_Client],[Key_Produit],[ID_Magasin],[key_facture],[Quantite],[Prix_Unitaire],[Prix_HT],[Remise],[Prix_Total],[Date_Vente]) 
	select I.[ID_Vente], dbo.return_key_client(I.[Key_Client]),dbo.return_key_Produit(I.[Key_Produit]),I.[ID_Magasin],dbo.return_Key_DF_V(I.[key_facture]),I.[Quantite],I.[Prix_Unitaire],I.[Prix_HT],I.[Remise],I.[Prix_Total],I.[Date_Vente]
	from inserted I 
	where not exists (select * from FACT_VENTE F where F.ID_Vente = I.[ID_Vente] )
									
END
GO
ALTER TABLE [dbo].[FACT_VENTE] ENABLE TRIGGER [tr_vente]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_DETAIL_COMMANDE_ACHAT]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_Table_Map_DETAIL_COMMANDE_ACHAT]
   ON  [dbo].[Table_Map_DETAIL_COMMANDE_ACHAT]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_DETAIL_COMMANDE_ACHAT (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_DETAIL_COMMANDE_ACHAT WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_DETAIL_COMMANDE_ACHAT] ENABLE TRIGGER [tr_Table_Map_DETAIL_COMMANDE_ACHAT]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_Detail_Commande_Vente]    Script Date: 11/26/2020 12:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_Detail_Commande_Vente]
   ON  [dbo].[Table_Map_Detail_Commande_Vente]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_Detail_Commande_Vente (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_Detail_Commande_Vente WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_Detail_Commande_Vente] ENABLE TRIGGER [tr_Table_Map_Detail_Commande_Vente]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_Detail_Facture_Achat]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_Detail_Facture_Achat]
   ON  [dbo].[Table_Map_Detail_Facture_Achat]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_Detail_Facture_Achat (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_Detail_Facture_Achat WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_Detail_Facture_Achat] ENABLE TRIGGER [tr_Table_Map_Detail_Facture_Achat]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_Detail_Facture_Vente]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_Detail_Facture_Vente]
   ON  [dbo].[Table_Map_Detail_Facture_Vente]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_Detail_Facture_Vente (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_Detail_Facture_Vente WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_Detail_Facture_Vente] ENABLE TRIGGER [tr_Table_Map_Detail_Facture_Vente]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_FACT_CONGE]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_FACT_CONGE]
   ON  [dbo].[Table_Map_FACT_CONGE]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_FACT_CONGE (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_FACT_CONGE WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_FACT_CONGE] ENABLE TRIGGER [tr_Table_Map_FACT_CONGE]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_FACT_CONTRAT]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_FACT_CONTRAT]
   ON  [dbo].[Table_Map_FACT_CONTRAT]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_FACT_CONTRAT (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_FACT_CONTRAT WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_FACT_CONTRAT] ENABLE TRIGGER [tr_Table_Map_FACT_CONTRAT]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_FACT_INVENTAIRE_MOUVEMENTS]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_FACT_INVENTAIRE_MOUVEMENTS]
   ON  [dbo].[Table_Map_FACT_INVENTAIRE_MOUVEMENTS]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_FACT_INVENTAIRE_MOUVEMENTS (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_FACT_INVENTAIRE_MOUVEMENTS WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_FACT_INVENTAIRE_MOUVEMENTS] ENABLE TRIGGER [tr_Table_Map_FACT_INVENTAIRE_MOUVEMENTS]
GO
/****** Object:  Trigger [dbo].[tr_Table_Map_FACT_PRODUCTION]    Script Date: 11/26/2020 12:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tr_Table_Map_FACT_PRODUCTION]
   ON  [dbo].[Table_Map_FACT_PRODUCTION]
   INSTEAD OF INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Table_Map_FACT_PRODUCTION (Etat_reel,Etat_erp)
	select I.Etat_reel,I.Etat_erp
	from inserted I
	where not exists ( select Etat_reel,Etat_erp from dbo.Table_Map_FACT_PRODUCTION WHERE I.Etat_reel= Etat_reel AND I.Etat_erp= Etat_erp );

END
GO
ALTER TABLE [dbo].[Table_Map_FACT_PRODUCTION] ENABLE TRIGGER [tr_Table_Map_FACT_PRODUCTION]
GO
USE [master]
GO
ALTER DATABASE [ERP_DW] SET  READ_WRITE 
GO
