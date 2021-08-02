--
-- Script To Create dbo.BK_CARcUSR Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARcUSR Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARcUSR] (
   [Id_CARcUSR] [int] NOT NULL,
   [CARcUSR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [PW] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcSubprocuradurias] [int] NULL CONSTRAINT [DF__BK_CARcUS__Id_CA__4F495C91] DEFAULT (0),
   [Id_CARcDG_o_Delegaciones] [int] NULL CONSTRAINT [DF__BK_CARcUS__Id_CA__503D80CA] DEFAULT (0),
   [Id_CARcDir_o_subsede] [int] NULL CONSTRAINT [DF__BK_CARcUS__Id_CA__5131A503] DEFAULT (0),
   [Id_CARcTipoUSR] [int] NULL CONSTRAINT [DF__BK_CARcUS__Id_CA__5225C93C] DEFAULT (4),
   [Nombre] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Micro] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Descripcion_usuario] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcDatosPersonales] [int] NULL,
   [Carrera] [int] NULL,
   [Activo] [int] NULL,
   [CARcUSR_deshabilitado] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARcUSR Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARcUSR Table'
END
GO


--
-- Script To Create dbo.BK_CARdAdscripciones Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdAdscripciones Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdAdscripciones] (
   [Id_CARdAdscripciones] [int] NOT NULL,
   [CARdAdscripciones] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaAdscripcion] [datetime] NULL,
   [Id_CARcTipoNombramiento] [int] NULL,
   [Ciudad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEntidadFederativa] [int] NULL,
   [Id_CARcActual] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdAd__Id_CA__70DF5A86] DEFAULT (2),
   [Id_CARcMotivoAdscripcion] [int] NULL,
   [IdAdscripcion] [int] NULL,
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdAd__Fecha__71D37EBF] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL CONSTRAINT [DF__BK_CARdAd__Id_CA__72C7A2F8] DEFAULT (0),
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdAdscripciones Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdAdscripciones Table'
END
GO


--
-- Script To Create dbo.BK_CardArmas Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CardArmas Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CardArmas] (
   [Id_CARdArmas] [int] NOT NULL,
   [CardArmas] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcArmaFuego] [int] NOT NULL,
   [NoOficio] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaOficio] [datetime] NULL,
   [NoLista] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NoOficioRecHum] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaOficioRH] [datetime] NULL,
   [FechaAsignacion] [datetime] NULL,
   [CUIP] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcAutorizacion] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CardAr__Id_CA__7A68C4C0] DEFAULT (2),
   [FechaCaptura] [datetime] NOT NULL CONSTRAINT [DF__BK_CardAr__Fecha__7B5CE8F9] DEFAULT (getdate()),
   [Id_CARdDatosPersonales] [int] NULL,
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CardArmas Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CardArmas Table'
END
GO


--
-- Script To Create dbo.BK_CARdCursosPersona Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdCursosPersona Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdCursosPersona] (
   [Id_CARdCursosPersona] [int] NOT NULL,
   [CARdCursosPersona] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoCapacitacion] [int] NULL,
   [NombreCurso] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaInicio] [datetime] NULL,
   [FechaTermino] [datetime] NULL,
   [Id_CARcTipoInstitucion] [int] NULL,
   [AreaInstituto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoDocumento] [int] NULL,
   [Calificacion] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Creditos] [int] NULL,
   [HorasCursadas] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdCu__Id_CA__05DA776C] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdCu__Fecha__06CE9BA5] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdCursosPersona Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdCursosPersona Table'
END
GO


--
-- Script To Create dbo.BK_CARdDatosPersonales Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdDatosPersonales Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdDatosPersonales] (
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [CARdDatosPersonales] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [RFC] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [ApellidoPaterno] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [ApellidoMaterno] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Nombre] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [D_CorreoE] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [D_TelefonoHogar] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [D_TelefonoMovil] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEntidadFederativa] [int] NULL,
   [Ciudad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [MunicipiooDel] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Nacionalidad] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [PaisNacimiento] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaNacimiento] [datetime] NULL,
   [Id_CarcEdoCivil] [int] NULL,
   [Id_CARcGenero] [int] NULL,
   [CURP] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [CartillaSMN] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [ClaveElector] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Licencia] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Foto] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NoFiliacion] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaFiliacion] [datetime] NULL,
   [DependenciaFiliacion] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdDa__Id_CA__22ABC044] DEFAULT (2),
   [CUIP] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Fecha_IngresoPGR] [datetime] NULL,
   [Autorizador] [bit] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [Carrera] [bit] NULL,
   [FechaCaptura] [datetime] NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdDatosPersonales Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdDatosPersonales Table'
END
GO


--
-- Script To Create dbo.BK_CARdDomicilios Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdDomicilios Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdDomicilios] (
   [Id_CARdDomicilios] [int] NOT NULL,
   [CARdDomicilios] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoDomicilio] [int] NULL,
   [Calle] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Numero] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NumeroInt] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Colonia] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [CodigoPostal] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Municipio] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Ciudad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEntidadFederativa] [int] NULL,
   [Telefono] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcActual] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdDo__Id_CA__656DA7DA] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NULL,
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaCaptura] [datetime] NULL CONSTRAINT [DF__BK_CARdDo__Fecha__6661CC13] DEFAULT (getdate()),
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdDomicilios Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdDomicilios Table'
END
GO


--
-- Script To Create dbo.BK_CARdEscolaridad Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdEscolaridad Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdEscolaridad] (
   [Id_CARdEscolaridad] [int] NOT NULL,
   [CARdEscolaridad] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcNivelEstudios] [int] NOT NULL,
   [NombreInstitucion] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [D_Nombreprograma] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [AnioInicio] [int] NULL,
   [AnioTermino] [int] NULL,
   [Id_CARcEstatus] [int] NULL,
   [Id_CARcDocumentoObtenido] [int] NULL,
   [NumeroCedula] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdEs__Id_CA__59FBF52E] DEFAULT (2),
   [D_Calificacion] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdEs__Fecha__5AF01967] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdEscolaridad Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdEscolaridad Table'
END
GO


--
-- Script To Create dbo.BK_CARdEstimulosReconocimientos Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdEstimulosReconocimientos Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdEstimulosReconocimientos] (
   [Id_CARdEstimulosReconocimientos] [int] NOT NULL,
   [CARdEstimulosReconocimientos] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoEstimuloRec] [int] NULL,
   [Id_CARcDetalle] [int] NULL,
   [Motivo] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Fecha] [datetime] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdEs__Id_CA__00219E16] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdEs__Fecha__0115C24F] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdEstimulosReconocimientos Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdEstimulosReconocimientos Table'
END
GO


--
-- Script To Create dbo.BK_CARdEvaluaArmaFuego Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdEvaluaArmaFuego Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdEvaluaArmaFuego] (
   [Id_CARdEvaluaArmaFuego] [int] NOT NULL,
   [CARdEvaluaArmaFuego] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcDesempeno] [int] NOT NULL,
   [Cartilla] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [Id_CARcMedico] [int] NULL,
   [Id_CARcToxicologico] [int] NULL,
   [Id_CARcDatosregistrales] [int] NULL,
   [Id_CARcPsicologico] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdEv__Id_CA__7D45316B] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdEv__Fecha__7E3955A4] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdEvaluaArmaFuego Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdEvaluaArmaFuego Table'
END
GO


--
-- Script To Create dbo.BK_CARdEvaluaciones Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdEvaluaciones Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdEvaluaciones] (
   [Id_CARdEvaluaciones] [int] NOT NULL,
   [CARdEvaluaciones] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoEvaluacion] [int] NOT NULL,
   [Id_CARcResultadoEva] [int] NULL,
   [Calificacion] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaEvaluacion] [datetime] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdEv__Id_CA__778C5815] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdEv__Fecha__78807C4E] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdEvaluaciones Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdEvaluaciones Table'
END
GO


--
-- Script To Create dbo.BK_CARdExperienciaLaboral Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdExperienciaLaboral Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdExperienciaLaboral] (
   [Id_CARdExperienciaLaboral] [int] NOT NULL,
   [CARdExperienciaLaboral] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoEmpresa] [int] NULL,
   [NombreEmpresa_Institucion] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [Puesto] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [AnioInicio] [int] NULL,
   [AnioTermino] [int] NULL,
   [MotivoSeparacion] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Logros] [varchar] (5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Calle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Numero] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NumeroExt] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Colonia] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [CodigoPostal] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Municipio] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Ciudad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEntidadFederativa] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdEx__Id_CA__5FB4CE84] DEFAULT (2),
   [D_RelacionconelCargo] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdEx__Fecha__60A8F2BD] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Actividades] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Id_Tipo Empresa/Institucion', 'User', N'dbo', 'Table', N'BK_CARdExperienciaLaboral', 'Column', N'Id_CARcTipoEmpresa'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdExperienciaLaboral Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdExperienciaLaboral Table'
END
GO


--
-- Script To Create dbo.BK_CARdFamilia Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdFamilia Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdFamilia] (
   [Id_CARdFamilia] [int] NOT NULL,
   [CARdFamilia] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcParentesco] [int] NULL,
   [Nombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [Id_CARcGenero] [int] NULL,
   [Ocupacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Telefono] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Calle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Numero] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NumeroInt] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Colonia] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [CodigoPostal] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Municipio] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Ciudad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEntidadFederativa] [int] NULL,
   [Id_CARcReferencia] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdFa__Id_CA__5CD861D9] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdFa__Fecha__5DCC8612] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdFamilia Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdFamilia Table'
END
GO


--
-- Script To Create dbo.BK_CARdFicha Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdFicha Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdFicha] (
   [Id_CARdFicha] [int] NOT NULL,
   [CARdFicha] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcBoca] [int] NULL,
   [Id_CARcCara] [int] NULL,
   [Id_CARcCejas] [int] NULL,
   [Id_CARcFrente] [int] NULL,
   [Id_CARcComplexion] [int] NULL,
   [Id_CARcColorCabello] [int] NULL,
   [Id_CARcCabelloCantidad] [int] NULL,
   [Id_CARcMenton] [int] NULL,
   [Id_CARcNariz] [int] NULL,
   [Id_CARcNarizAncho] [int] NULL,
   [Id_CARcNarizForma] [int] NULL,
   [Id_CARcOjos] [int] NULL,
   [Id_CARcOjosTamano] [int] NULL,
   [Id_CARcOrejas] [int] NULL,
   [Id_CARcColorTez] [int] NULL,
   [Id_CARcLabios] [int] NULL,
   [Estatura] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Peso] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoSangre] [int] NULL,
   [Firma] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Huellas] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [VOZ] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcAnteojos] [int] NULL,
   [SeniasParticulares] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcFormaCabello] [int] NULL,
   [Id_CARcFormaOjos] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdFi__Id_CA__571F8883] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdFi__Fecha__5813ACBC] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdFicha Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdFicha Table'
END
GO


--
-- Script To Create dbo.BK_CARdFormacionInicial Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdFormacionInicial Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdFormacionInicial] (
   [Id_CARdFormacionInicial] [int] NOT NULL,
   [CARdFormacionInicial] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Curso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [Id_CARcInstituto] [int] NULL,
   [Generacion] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaExamen] [datetime] NULL,
   [Id_CARcResultado] [int] NULL,
   [FechaIngresoInstituto] [datetime] NULL,
   [FechaEgresoInstituto] [datetime] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdFo__Id_CA__02FE0AC1] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdFo__Fecha__03F22EFA] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaExamenConocimientos] [datetime] NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdFormacionInicial Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdFormacionInicial Table'
END
GO


--
-- Script To Create dbo.BK_CARdIdiomas Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdIdiomas Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdIdiomas] (
   [Id_BK_CARdIdiomas] [int] IDENTITY (1, 1) NOT NULL,
   [Id_CARdIdiomas] [int] NOT NULL,
   [CARdIdiomas] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcIdioma] [int] NULL,
   [Lectura] [int] NULL,
   [Escritura] [int] NULL,
   [Conversacion] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdId__Id_CA__62913B2F] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdId__Fecha__63855F68] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [D_Escucha] [int] NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdIdiomas Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdIdiomas Table'
END
GO


--
-- Script To Create dbo.BK_CARdNombramientos Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdNombramientos Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdNombramientos] (
   [Id_CARdNombramientos] [int] NOT NULL,
   [CARdNombramientos] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoNombramiento] [int] NULL,
   [Id_CARcCategoria] [int] NULL,
   [Id_CARcEspecialidad] [int] NULL CONSTRAINT [DF__BK_CARdNo__Id_CA__684A1485] DEFAULT (1),
   [Id_CARcNivel] [int] NULL,
   [Id_CARcTipo_ingreso] [int] NULL,
   [Fecha_nombramiento] [datetime] NULL,
   [Cargo] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Fecha_ingreso] [datetime] NULL,
   [Adscripcion] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__BK_CARdNo__Adscr__693E38BE] DEFAULT (1),
   [Id_CARcSINO] [int] NULL CONSTRAINT [DF__BK_CARdNo__Id_CA__6A325CF7] DEFAULT (1),
   [NumeroGafete] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Clavepago] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdNo__Id_CA__6B268130] DEFAULT (2),
   [Id_CARcNombramiento] [int] NULL,
   [Oficio_Peticion] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Fecha_OF_Peticion] [datetime] NULL,
   [AreaSolicitante] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NombreSolicitante] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Noacuerdo] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaAcuerdo] [datetime] NULL,
   [FechaInicio] [datetime] NULL,
   [FechaTermino] [datetime] NULL,
   [NoSesion] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaSesion] [datetime] NULL,
   [Id_CARdDatosPersonales] [int] NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdNo__Fecha__6C1AA569] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdNombramientos Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdNombramientos Table'
END
GO


--
-- Script To Create dbo.BK_CARdProcedimientos Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdProcedimientos Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdProcedimientos] (
   [Id_CARdProcedimientos] [int] NOT NULL,
   [CARdProcedimientos] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoProcedimiento] [int] NOT NULL,
   [Imputacion] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NumeroProcedimiento] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [AutoridadInstuctora] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaProcedimiento] [datetime] NULL,
   [Id_CARcEstatusProcedimiento] [int] NULL,
   [Resolucion] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaResolucion] [datetime] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdPr__Id_CA__74AFEB6A] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [FechaCaptura] [datetime] NULL CONSTRAINT [DF__BK_CARdPr__Fecha__75A40FA3] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdProcedimientos Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdProcedimientos Table'
END
GO


--
-- Script To Create dbo.BK_CARdSituacionLaboral Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdSituacionLaboral Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdSituacionLaboral] (
   [Id_CARdSituacionLaboral] [int] NOT NULL,
   [CARdSituacionLaboral] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcEstatusLaboral] [int] NOT NULL,
   [Id_CARcDesignacionEspecial] [int] NULL,
   [NoOficioDocto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FechaoficioDocto] [datetime] NULL,
   [Periodo] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Sesion] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcCargoEstructura] [int] NULL,
   [AdscripcionEstructura] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcMotivoEstatus] [int] NULL,
   [FechaBaja] [datetime] NULL,
   [Id_CARcActual] [int] NULL,
   [Id_CARcValidado] [int] NULL CONSTRAINT [DF__BK_CARdSi__Id_CA__6E02EDDB] DEFAULT (2),
   [Id_CARdDatosPersonales] [int] NOT NULL,
   [Fecha_Captura] [datetime] NULL CONSTRAINT [DF__BK_CARdSi__Fecha__6EF71214] DEFAULT (getdate()),
   [Id_CARcSubprocuradurias] [int] NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL,
   [Id_CARcDir_o_subsede] [int] NULL,
   [IdLogin] [int] NULL,
   [IP_user] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [NoDocumento] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdSituacionLaboral Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdSituacionLaboral Table'
END
GO


--
-- Script To Create dbo.BK_CARdUsrPerfilGrupo Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_CARdUsrPerfilGrupo Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[BK_CARdUsrPerfilGrupo] (
   [Id_CARdUsrPerfilGrupo] [int] NOT NULL,
   [Id_CARcUsr] [int] NULL,
   [Id_CARcPerfilGrupo] [int] NULL,
   [Fecha] [datetime] NULL,
   [OPERACION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [FECHA_OPERACION_HISTORIAL] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_CARdUsrPerfilGrupo Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_CARdUsrPerfilGrupo Table'
END
GO


--
-- Script To Update dbo.CARcDir_o_subsede Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARcDir_o_subsede Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_CARcDir_o_subsede] (
   [Id_CARcDir_o_subsede] [int] NOT NULL,
   [CARcDir_o_subsede] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcDG_o_Delegaciones] [int] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_CARcDir_o_subsede] ([Id_CARcDir_o_subsede], [CARcDir_o_subsede], [Id_CARcDG_o_Delegaciones])
   SELECT [Id_CARcDir_o_subsede], [CARcDir_o_subsede], [Id_CARcDG_o_Delegaciones]
   FROM [dbo].[CARcDir_o_subsede]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[CARcDir_o_subsede]
GO

sp_rename N'[dbo].[tmp_CARcDir_o_subsede]', N'CARcDir_o_subsede'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARcDir_o_subsede] ADD CONSTRAINT [PK_CARcDir_o_subsede] PRIMARY KEY CLUSTERED ([Id_CARcDir_o_subsede]) WITH  FILLFACTOR = 90
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Dirección o subsede', 'User', N'dbo', 'Table', N'CARcDir_o_subsede', 'Column', N'CARcDir_o_subsede'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Id_Dirección General o Delegación', 'User', N'dbo', 'Table', N'CARcDir_o_subsede', 'Column', N'Id_CARcDG_o_Delegaciones'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'TI_CARcDir_o_subsede', 'User', N'dbo', 'Table', N'CARcDir_o_subsede', 'Column', N'Id_CARcDir_o_subsede'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARcDir_o_subsede Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARcDir_o_subsede Table'
END
GO


--
-- Script To Create dbo.CARcNombramiento Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CARcNombramiento Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[CARcNombramiento] (
   [Id_CARcNombramiento] [int] IDENTITY (0, 1) NOT NULL,
   [CARcNombramiento] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Nombramiento', 'User', N'dbo', 'Table', N'CARcNombramiento', 'Column', N'CARcNombramiento'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'TI_Tipo Nombramiento', 'User', N'dbo', 'Table', N'CARcNombramiento', 'Column', N'Id_CARcNombramiento'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARcNombramiento Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CARcNombramiento Table'
END
GO


--
-- Script To Create dbo.CARcTipoEmpresa Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CARcTipoEmpresa Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[CARcTipoEmpresa] (
   [Id_CARcTipoEmpresa] [int] IDENTITY (0, 1) NOT NULL,
   [CARcTipoEmpresa] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Empresa/Institución', 'User', N'dbo', 'Table', N'CARcTipoEmpresa', 'Column', N'CARcTipoEmpresa'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'TI_Tipo Empresa/Institucion', 'User', N'dbo', 'Table', N'CARcTipoEmpresa', 'Column', N'Id_CARcTipoEmpresa'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARcTipoEmpresa Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CARcTipoEmpresa Table'
END
GO


--
-- Script To Update dbo.CARdDatosPersonales Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdDatosPersonales Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdDatosPersonales]
      ADD [CUIP] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'CUIP', 'User', N'dbo', 'Table', N'CARdDatosPersonales', 'Column', N'CUIP'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdDatosPersonales Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdDatosPersonales Table'
END
GO


--
-- Script To Update dbo.CARdAdscripciones Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdAdscripciones Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'PK_CARdAdscripciones')
      ALTER TABLE [dbo].[CARdAdscripciones] DROP CONSTRAINT [PK_CARdAdscripciones]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdAdscripciones_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdAdscripciones] DROP CONSTRAINT [FK_CARdAdscripciones_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdAdscripciones]
      ADD [IdAdscripcion] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Adscripción', 'User', N'dbo', 'Table', N'CARdAdscripciones', 'Column', N'IdAdscripcion'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdAdscripciones Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdAdscripciones Table'
END
GO


--
-- Script To Update dbo.CARdDomicilios Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdDomicilios Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdDomicilios_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdDomicilios] DROP CONSTRAINT [FK_CARdDomicilios_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdDomicilios Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdDomicilios Table'
END
GO


--
-- Script To Update dbo.CARdEscolaridad Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdEscolaridad Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdEscolaridad_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdEscolaridad] DROP CONSTRAINT [FK_CARdEscolaridad_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdEscolaridad Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdEscolaridad Table'
END
GO


--
-- Script To Create dbo.CARdEstados_de_Fuerza Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CARdEstados_de_Fuerza Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[CARdEstados_de_Fuerza] (
   [Id_CARdEstados_de_Fuerza] [int] IDENTITY (1, 1) NOT NULL,
   [CARdEstados_de_Fuerza] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARdDatosPersonales] [int] NULL,
   [ApellidoPaterno] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [ApellidoMaterno] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Nombre] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [RFC] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [Id_CARcTipoNombramiento] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [CARcTipoNombramiento] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdEstados_de_Fuerza] ADD CONSTRAINT [PK_CARdEstados_de_Fuerza] PRIMARY KEY CLUSTERED ([Id_CARdEstados_de_Fuerza]) WITH  FILLFACTOR = 90
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdEstados_de_Fuerza Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CARdEstados_de_Fuerza Table'
END
GO


--
-- Script To Update dbo.CARdEvaluaciones Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdEvaluaciones Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdEvaluaciones_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdEvaluaciones] DROP CONSTRAINT [FK_CARdEvaluaciones_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdEvaluaciones Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdEvaluaciones Table'
END
GO


--
-- Script To Update dbo.CARdExperienciaLaboral Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdExperienciaLaboral Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdExperienciaLaboral_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdExperienciaLaboral] DROP CONSTRAINT [FK_CARdExperienciaLaboral_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdExperienciaLaboral]
      ADD [Id_CARcTipoEmpresa] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Id_Tipo Empresa/Institución', 'User', N'dbo', 'Table', N'CARdExperienciaLaboral', 'Column', N'Id_CARcTipoEmpresa'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdExperienciaLaboral Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdExperienciaLaboral Table'
END
GO


--
-- Script To Update dbo.CARdFormacionInicial Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdFormacionInicial Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdFormacionInicial_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdFormacionInicial] DROP CONSTRAINT [FK_CARdFormacionInicial_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdFormacionInicial]
      ALTER COLUMN [Generacion] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdFormacionInicial Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdFormacionInicial Table'
END
GO


--
-- Script To Update dbo.CARdIdiomas Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdIdiomas Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdIdiomas_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdIdiomas] DROP CONSTRAINT [FK_CARdIdiomas_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdIdiomas Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdIdiomas Table'
END
GO


--
-- Script To Update dbo.CARdNombramientos Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdNombramientos Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdNombramientos_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdNombramientos] DROP CONSTRAINT [FK_CARdNombramientos_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [AreaSolicitante] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [Fecha_OF_Peticion] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [FechaAcuerdo] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [FechaInicio] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [FechaSesion] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [FechaTermino] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [Id_CARcNombramiento] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [Noacuerdo] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [NombreSolicitante] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [NoSesion] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[CARdNombramientos]
      ADD [Oficio_Peticion] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Area Solicitante', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'AreaSolicitante'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Fecha Oficio Petición', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'Fecha_OF_Peticion'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Fecha de Acuerdo', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'FechaAcuerdo'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Fecha de Inicio', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'FechaInicio'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Fecha de Sesión', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'FechaSesion'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Fecha de Término', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'FechaTermino'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Id_Nobramiento', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'Id_CARcNombramiento'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Número de Acuerdo', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'Noacuerdo'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Nombre del Solicitante', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'NombreSolicitante'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Número de Sesión', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'NoSesion'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   exec sp_addextendedproperty  N'MS_Description', N'Oficio de Petición', 'User', N'dbo', 'Table', N'CARdNombramientos', 'Column', N'Oficio_Peticion'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdNombramientos Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdNombramientos Table'
END
GO


--
-- Script To Delete jvazquez.CARdPantallasPaginas_Prueba Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting jvazquez.CARdPantallasPaginas_Prueba Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [jvazquez].[CARdPantallasPaginas_Prueba]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'jvazquez.CARdPantallasPaginas_Prueba Table Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete jvazquez.CARdPantallasPaginas_Prueba Table'
END
GO

--
-- Script To Update dbo.CARdSituacionLaboral Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdSituacionLaboral Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdSituacionLaboral_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdSituacionLaboral] DROP CONSTRAINT [FK_CARdSituacionLaboral_CARdDatosPersonales]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdSituacionLaboral Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdSituacionLaboral Table'
END
GO


--
-- Script To Create dbo.RE_VST_SITUACION_RAMA_CATEGORIA_BK View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.RE_VST_SITUACION_RAMA_CATEGORIA_BK View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.RE_VST_SITUACION_RAMA_CATEGORIA_BK
AS
SELECT     TOP 100 PERCENT dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual AS Actual, COUNT(*) AS Total
FROM         dbo.CARcDG_o_Delegaciones INNER JOIN
                      dbo.CARcCategoria INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARdNombramientos.Id_CARdDatosPersonales = dbo.CARdSituacionLaboral.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcTipoNombramiento ON dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento ON 
                      dbo.CARcCategoria.Id_CARcCategoria = dbo.CARdNombramientos.Id_CARcCategoria INNER JOIN
                      dbo.CARcSubprocuradurias ON dbo.CARdSituacionLaboral.Id_CARcSubprocuradurias = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias ON 
                      dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones = dbo.CARdSituacionLaboral.Id_CARcDG_o_Delegaciones INNER JOIN
                      dbo.CARcEstatusLaboral ON dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral INNER JOIN
                      dbo.CARcActual ON dbo.CARdSituacionLaboral.Id_CARcActual = dbo.CARcActual.Id_CARcActual
GROUP BY dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual
ORDER BY dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.RE_VST_SITUACION_RAMA_CATEGORIA_BK View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.RE_VST_SITUACION_RAMA_CATEGORIA_BK View'
END
GO

--
-- Script To Create dbo.VISTA_ESTADOS_FUERZO001 View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VISTA_ESTADOS_FUERZO001 View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VISTA_ESTADOS_FUERZO001
AS
SELECT     dbo.CARdDatosPersonales.Id_CARdDatosPersonales, dbo.CARdDatosPersonales.CARdDatosPersonales, 
                      dbo.CARdNombramientos.Id_CARdNombramientos, dbo.CARdNombramientos.CARdNombramientos, 
                      dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.Id_CARcCategoria, 
                      dbo.CARcCategoria.CARcCategoria, dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias, dbo.CARcSubprocuradurias.CARcSubprocuradurias, 
                      dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARdDatosPersonales.Fecha_IngresoPGR, dbo.CARdNombramientos.Id_CARcSINO, dbo.CARdDatosPersonales.ApellidoPaterno, 
                      dbo.CARdDatosPersonales.ApellidoMaterno, dbo.CARdDatosPersonales.Nombre, dbo.CARdDatosPersonales.RFC
FROM         dbo.CARdDatosPersonales INNER JOIN
                      dbo.CARdNombramientos ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARcSubprocuradurias ON 
                      dbo.CARdDatosPersonales.Id_CARcSubprocuradurias = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias INNER JOIN
                      dbo.CARcDG_o_Delegaciones ON 
                      dbo.CARdDatosPersonales.Id_CARcDG_o_Delegaciones = dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VISTA_ESTADOS_FUERZO001 View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VISTA_ESTADOS_FUERZO001 View'
END
GO

--
-- Script To Create dbo.VISTA_ESTADOSDEFUERZA01 View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VISTA_ESTADOSDEFUERZA01 View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VISTA_ESTADOSDEFUERZA01
AS
SELECT     dbo.CARdDatosPersonales.Id_CARdDatosPersonales, dbo.CARdDatosPersonales.ApellidoPaterno, dbo.CARdDatosPersonales.ApellidoMaterno, 
                      dbo.CARdDatosPersonales.Nombre, dbo.CARdDatosPersonales.RFC, dbo.CARdNombramientos.Id_CARdNombramientos, 
                      dbo.CARdNombramientos.CARdNombramientos
FROM         dbo.CARdDatosPersonales INNER JOIN
                      dbo.CARdNombramientos ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdNombramientos')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VISTA_ESTADOSDEFUERZA01 View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VISTA_ESTADOSDEFUERZA01 View'
END
GO

--
-- Script To Create dbo.VISTA_SUBPROCURADURIA_DELEGACION View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VISTA_SUBPROCURADURIA_DELEGACION View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VISTA_SUBPROCURADURIA_DELEGACION
AS
SELECT     dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias, dbo.CARcSubprocuradurias.CARcSubprocuradurias, 
                      dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones
FROM         dbo.CARcSubprocuradurias INNER JOIN
                      dbo.CARcDG_o_Delegaciones ON dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias = dbo.CARcDG_o_Delegaciones.Id_CARcSubprocuradurias')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VISTA_SUBPROCURADURIA_DELEGACION View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VISTA_SUBPROCURADURIA_DELEGACION View'
END
GO

--
-- Script To Create dbo.VST_Personal View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_Personal View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_Personal
AS
SELECT     Id_CARdDatosPersonales, Id_CARcGenero, 1 AS Total
FROM         dbo.CARdDatosPersonales')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_Personal View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_Personal View'
END
GO

--
-- Script To Create dbo.VST_RE_ADSCRIPCION_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_ADSCRIPCION_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_ADSCRIPCION_RAMA_CATEGORIA
AS
SELECT     TOP 100 PERCENT dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, 
                      dbo.CARcCategoria.CARcCategoria, dbo.CARcEstatusLaboral.CARcEstatusLaboral, COUNT(*) AS Total, dbo.CARcActual.CARcActual
FROM         dbo.CARcEstatusLaboral INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral = dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARdAdscripciones ON dbo.CARdNombramientos.Id_CARdDatosPersonales = dbo.CARdAdscripciones.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcActual ON dbo.CARdAdscripciones.Id_CARcActual = dbo.CARcActual.Id_CARcActual INNER JOIN
                      dbo.CARcSubprocuradurias ON dbo.CARdAdscripciones.IdAdscripcion = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias ON 
                      dbo.CARdSituacionLaboral.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales
WHERE     (dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = 1) AND (dbo.CARdSituacionLaboral.Id_CARcActual = 1) AND 
                      (dbo.CARdNombramientos.Id_CARcSINO = 1) AND (dbo.CARdAdscripciones.Id_CARcActual = 1)
GROUP BY dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual, dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcActual.CARcActual
ORDER BY dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_ADSCRIPCION_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_ADSCRIPCION_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.VST_RE_GENERO_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_GENERO_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_GENERO_RAMA_CATEGORIA
AS
SELECT     TOP 100 PERCENT dbo.CARcGenero.CARcGenero, dbo.CARcTipoNombramiento.CARcTipoNombramiento AS RAMA, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral, COUNT(*) AS Total
FROM         dbo.CARcGenero INNER JOIN
                      dbo.CARdDatosPersonales ON dbo.CARcGenero.Id_CARcGenero = dbo.CARdDatosPersonales.Id_CARcGenero INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARcEstatusLaboral INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral = dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral ON 
                      dbo.CARdNombramientos.Id_CARdDatosPersonales = dbo.CARdSituacionLaboral.Id_CARdDatosPersonales ON 
                      dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales
WHERE     (dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = 1) AND (dbo.CARdNombramientos.Id_CARcSINO = 1)
GROUP BY dbo.CARcGenero.CARcGenero, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral
ORDER BY dbo.CARcGenero.CARcGenero, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_GENERO_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_GENERO_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA
AS
SELECT     TOP 100 PERCENT dbo.CARcNombramiento.CARcNombramiento, dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, 
                      dbo.CARcCategoria.CARcCategoria, dbo.CARcSINO.CARcSINO AS ACTUAL, dbo.CARcEstatusLaboral.CARcEstatusLaboral, COUNT(*) AS Total
FROM         dbo.CARcEstatusLaboral INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral = dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcNombramiento ON dbo.CARdNombramientos.Id_CARcNombramiento = dbo.CARcNombramiento.Id_CARcNombramiento INNER JOIN
                      dbo.CARcSINO ON dbo.CARdNombramientos.Id_CARcSINO = dbo.CARcSINO.Id_CARcSINO ON 
                      dbo.CARdSituacionLaboral.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales
WHERE     (dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = 1) AND (dbo.CARdNombramientos.Id_CARcSINO = 1) AND 
                      (dbo.CARcNombramiento.Id_CARcNombramiento <> 1)
GROUP BY dbo.CARcNombramiento.CARcNombramiento, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcSINO.CARcSINO, dbo.CARcEstatusLaboral.CARcEstatusLaboral
ORDER BY dbo.CARcNombramiento.CARcNombramiento, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcSINO.CARcSINO')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.VST_RE_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_RAMA_CATEGORIA
AS
SELECT     TOP 100 PERCENT dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcSINO.CARcSINO AS Actual, dbo.CARcEstatusLaboral.CARcEstatusLaboral, COUNT(*) AS Total
FROM         dbo.CARcEstatusLaboral INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral = dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARcSINO ON dbo.CARdNombramientos.Id_CARcSINO = dbo.CARcSINO.Id_CARcSINO ON 
                      dbo.CARdSituacionLaboral.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales
WHERE     (dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = 1) AND (dbo.CARdNombramientos.Id_CARcSINO = 1)
GROUP BY dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, dbo.CARcSINO.CARcSINO, 
                      dbo.CARcEstatusLaboral.CARcEstatusLaboral
ORDER BY dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, dbo.CARcSINO.CARcSINO')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.VST_RE_SITUACION_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_SITUACION_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_SITUACION_RAMA_CATEGORIA
AS
SELECT     TOP 100 PERCENT dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, 
                      dbo.CARcCategoria.CARcCategoria, dbo.CARcActual.CARcActual AS Actual, COUNT(*) AS Total
FROM         dbo.CARcCategoria INNER JOIN
                      dbo.CARdNombramientos INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARdNombramientos.Id_CARdDatosPersonales = dbo.CARdSituacionLaboral.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcTipoNombramiento ON dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento ON 
                      dbo.CARcCategoria.Id_CARcCategoria = dbo.CARdNombramientos.Id_CARcCategoria INNER JOIN
                      dbo.CARcEstatusLaboral ON dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral INNER JOIN
                      dbo.CARcActual ON dbo.CARdSituacionLaboral.Id_CARcActual = dbo.CARcActual.Id_CARcActual
WHERE     (dbo.CARdNombramientos.Id_CARcSINO = 1) AND (dbo.CARdSituacionLaboral.Id_CARcActual = 1)
GROUP BY dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual
ORDER BY dbo.CARcEstatusLaboral.CARcEstatusLaboral, dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, 
                      dbo.CARcActual.CARcActual')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_SITUACION_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_SITUACION_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.VST_RE_URESPONSABLE_RAMA_CATEGORIA View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.VST_RE_URESPONSABLE_RAMA_CATEGORIA View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.VST_RE_URESPONSABLE_RAMA_CATEGORIA
AS
SELECT     dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARcTipoNombramiento.CARcTipoNombramiento AS Rama, dbo.CARcCategoria.CARcCategoria, dbo.CARcEstatusLaboral.CARcEstatusLaboral, 
                      COUNT(*) AS Total
FROM         dbo.CARdDatosPersonales INNER JOIN
                      dbo.CARdNombramientos ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARdSituacionLaboral ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdSituacionLaboral.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcEstatusLaboral ON dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral RIGHT OUTER JOIN
                      dbo.CARcDG_o_Delegaciones ON 
                      dbo.CARdDatosPersonales.Id_CARcDG_o_Delegaciones = dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones RIGHT OUTER JOIN
                      dbo.CARcSubprocuradurias ON dbo.CARdDatosPersonales.Id_CARcSubprocuradurias = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias
WHERE     (dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = 1) AND (dbo.CARdNombramientos.Id_CARcSINO = 1)
GROUP BY dbo.CARcSubprocuradurias.CARcSubprocuradurias, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, 
                      dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.CARcCategoria, dbo.CARcEstatusLaboral.CARcEstatusLaboral')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.VST_RE_URESPONSABLE_RAMA_CATEGORIA View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.VST_RE_URESPONSABLE_RAMA_CATEGORIA View'
END
GO

--
-- Script To Create dbo.vst_Usuarios_BK View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.vst_Usuarios_BK View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.vst_Usuarios_BK
AS
SELECT     dbo.BK_CARcUSR.CARcUSR AS Usuario, dbo.CARcSubprocuradurias.CARcSubprocuradurias AS SubProcuraduria, 
                      dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones AS DG_Delegacion, dbo.CARcDir_o_subsede.CARcDir_o_subsede AS DIR_Subsede, 
                      dbo.BK_CARcUSR.Nombre, dbo.BK_CARcUSR.Micro, dbo.BK_CARcUSR.Descripcion_usuario AS Descripción, 
                      dbo.CARcPerfilGrupo.CARcPerfilGrupo AS Perfil, dbo.BK_CARcUSR.OPERACION, dbo.BK_CARcUSR.FECHA_OPERACION_HISTORIAL, 
                      dbo.BK_CARcUSR.Id_CARcUSR
FROM         dbo.BK_CARcUSR LEFT OUTER JOIN
                      dbo.CARcSubprocuradurias ON dbo.BK_CARcUSR.Id_CARcSubprocuradurias = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias LEFT OUTER JOIN
                      dbo.CARcDir_o_subsede ON dbo.BK_CARcUSR.Id_CARcDir_o_subsede = dbo.CARcDir_o_subsede.Id_CARcDir_o_subsede LEFT OUTER JOIN
                      dbo.CARcDG_o_Delegaciones ON 
                      dbo.BK_CARcUSR.Id_CARcSubprocuradurias = dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones LEFT OUTER JOIN
                      dbo.BK_CARdUsrPerfilGrupo ON dbo.BK_CARcUSR.Id_CARcUSR = dbo.BK_CARdUsrPerfilGrupo.Id_CARcUsr LEFT OUTER JOIN
                      dbo.CARcPerfilGrupo ON dbo.BK_CARdUsrPerfilGrupo.Id_CARcPerfilGrupo = dbo.CARcPerfilGrupo.Id_CARcPerfilGrupo')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.vst_Usuarios_BK View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.vst_Usuarios_BK View'
END
GO

--
-- Script To Create dbo.vwDatosPersonales View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.vwDatosPersonales View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE VIEW dbo.vwDatosPersonales
AS
SELECT     dbo.CARdDatosPersonales.Id_CARcEntidadFederativa, dbo.CARdDatosPersonales.Id_CarcEdoCivil, dbo.CARdDatosPersonales.Id_CARcGenero, 
                      dbo.CARdDatosPersonales.Id_CARcSubprocuradurias, dbo.CARdDatosPersonales.Id_CARcDG_o_Delegaciones, 
                      dbo.CARdDatosPersonales.Id_CARcDir_o_subsede, dbo.CARdAdscripciones.Id_CARcActual, 1 AS Tot, 
                      dbo.CARdAdscripciones.Id_CARcMotivoAdscripcion, dbo.CARdNombramientos.Id_CARcTipoNombramiento, 
                      dbo.CARdNombramientos.Id_CARcCategoria, dbo.CARdNombramientos.Id_CARcNivel, dbo.CARdAdscripciones.IdAdscripcion
FROM         dbo.CARdDatosPersonales INNER JOIN
                      dbo.CARdAdscripciones ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdAdscripciones.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARdNombramientos ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales INNER JOIN
                      dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN
                      dbo.CARcNivel ON dbo.CARdNombramientos.Id_CARcNivel = dbo.CARcNivel.Id_CARcNivel INNER JOIN
                      dbo.CARcTipoNombramiento ON 
                      dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento
WHERE     (dbo.CARdAdscripciones.Id_CARcActual = 1)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.vwDatosPersonales View Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.vwDatosPersonales View'
END
GO

--
-- Script To Update dbo.vwEstAdscCount View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.vwEstAdscCount View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER VIEW dbo.vwEstAdscCount
AS
SELECT     dbo.CARdAdscripciones.Id_CARdDatosPersonales, dbo.vwEstFechaAdscrip.FechaAdscripcion, 
                      dbo.CARdAdscripciones.IdAdscripcion AS Id_CARcAdscripciones, 
                      CASE WHEN dbo.CARdAdscripciones.IdAdscripcion < 33 THEN ''D'' ELSE ''U'' END AS TipoAreaAdsc
FROM         dbo.vwEstFechaAdscrip INNER JOIN
                      dbo.CARdAdscripciones ON dbo.vwEstFechaAdscrip.Id_CARdDatosPersonales = dbo.CARdAdscripciones.Id_CARdDatosPersonales AND 
                      dbo.vwEstFechaAdscrip.FechaAdscripcion = dbo.CARdAdscripciones.FechaAdscripcion')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.vwEstAdscCount View Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.vwEstAdscCount View'
END
GO

--
-- Script To Update dbo.vwEstFechaAdscrip View In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.vwEstFechaAdscrip View'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER VIEW dbo.vwEstFechaAdscrip
AS
SELECT     TOP 100 PERCENT dbo.CARdAdscripciones.Id_CARdDatosPersonales, MAX(dbo.CARdAdscripciones.FechaAdscripcion) AS FechaAdscripcion
FROM         dbo.CARdAdscripciones INNER JOIN
                      dbo.CARcAdscripciones ON dbo.CARdAdscripciones.IdAdscripcion = dbo.CARcAdscripciones.Id_CARcAdscripciones INNER JOIN
                      dbo.CARdDatosPersonales ON dbo.CARdAdscripciones.Id_CARdDatosPersonales = dbo.CARdDatosPersonales.Id_CARdDatosPersonales
GROUP BY dbo.CARdAdscripciones.Id_CARdDatosPersonales
HAVING      (MAX(dbo.CARdAdscripciones.FechaAdscripcion) IS NOT NULL)
ORDER BY dbo.CARdAdscripciones.Id_CARdDatosPersonales')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.vwEstFechaAdscrip View Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.vwEstFechaAdscrip View'
END
GO

--
-- Script To Update dbo.PA_MOD_CARDDATOSPERSONALES Procedure In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.PA_MOD_CARDDATOSPERSONALES Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
exec('ALTER PROCEDURE dbo.PA_MOD_CARDDATOSPERSONALES

@RFC varchar(20),
@ApellidoPaterno varchar(50),
@ApellidoMaterno varchar(50),
@Nombre varchar(50),
@PaisNacimiento varchar(30),
@Id_CARcEntidadFederativa int,
@Ciudad varchar(100),
@MunicipiooDel varchar(100),
@Nacionalidad  varchar(100),
@FechaNacimiento datetime,
@Id_CarcEdoCivil int,
@Id_CARcGenero  int,
@CURP varchar(100),
@CartillaSMN varchar(100),
@ClaveElector varchar(100),
@Licencia varchar(100),
@Fecha_IngresoPGR datetime,
@NoFiliacion  varchar(100),
@FechaFiliacion datetime,
@DependenciaFiliacion varchar(100),
@CARdDatosPersonales varchar(100),
@ParamID int,
@IdLogin int   
 
 AS
BEGIN
    BEGIN TRANSACTION

DECLARE @FECHA_I datetime, @FECHA_F datetime

SET @FECHA_I =  @Fecha_IngresoPGR

IF @FECHA_I = ''''
 BEGIN
    SET @Fecha_IngresoPGR = NULL
 END
ELSE
BEGIN
   SET @Fecha_IngresoPGR = @Fecha_IngresoPGR
END
  

SET @FECHA_F =  @FechaFiliacion

IF @FECHA_F = ''''
 BEGIN
    SET @FechaFiliacion = NULL
 END
ELSE
BEGIN
   SET @FechaFiliacion = @FechaFiliacion
END



DECLARE  @Id_ INT

UPDATE CARdDatosPersonales
SET RFC =  @RFC,
ApellidoPaterno =  @ApellidoPaterno,
ApellidoMaterno =  @ApellidoMaterno,
Nombre =  @Nombre,
PaisNacimiento =  @PaisNacimiento,
Id_CARcEntidadFederativa =  @Id_CARcEntidadFederativa,
Ciudad =  @Ciudad,
MunicipiooDel =  @MunicipiooDel,
Nacionalidad =  @Nacionalidad,
FechaNacimiento =  @FechaNacimiento,
Id_CarcEdoCivil =  @Id_CarcEdoCivil,
Id_CARcGenero =  @Id_CARcGenero,
CURP =  @CURP,
CartillaSMN =  @CartillaSMN,
ClaveElector =  @ClaveElector,
Licencia =  @Licencia,
Fecha_IngresoPGR =  @Fecha_IngresoPGR,
NoFiliacion =  @NoFiliacion,
FechaFiliacion =  @FechaFiliacion,
DependenciaFiliacion =  @DependenciaFiliacion,
CARdDatosPersonales =  @CARdDatosPersonales,
IdLogin = @IdLogin
WHERE Id_CARdDatosPersonales = @ParamID
   
/*


*/

      -- SET @Id_ = 0 
  --     SET @Id_CardFicha = SCOPE_IDENTITY()
       SET @Id_ =  @ParamID

	SELECT @Id_ AS Id_,  11 AS Bandera 
            
       


 IF @@ERROR <>0
    BEGIN
      ROLLBACK TRANSACTION
    END
  ELSE
   BEGIN
    COMMIT TRANSACTION
   END



END')
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PA_MOD_CARDDATOSPERSONALES Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.PA_MOD_CARDDATOSPERSONALES Procedure'
END
GO

--
-- Script To Update dbo.AltadeUsuarios Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.AltadeUsuarios Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[AltadeUsuarios] ON dbo.CARcUSR 
FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          
    SELECT  @IdUtilizado = Id_CARcUSR
    FROM INSERTED


 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,     Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES          ( NULL,                              NULL,  NULL,     @FECHA,  ''Alta'',       ''CARcUSR'',  @IdUtilizado, NULL )


 INSERT  BK_CARcUSR SELECT *, ''ALTA'',getdate() FROM INSERTED


 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.AltadeUsuarios Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.AltadeUsuarios Trigger'
END
GO

--
-- Script To Create dbo.CAMBIO_USR Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CAMBIO_USR Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[CAMBIO_USR] ON [dbo].[CARcUSR] 

FOR UPDATE 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          
    SELECT  @IdUtilizado = Id_CARcUSR
    FROM INSERTED


 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,     Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES          ( NULL,                              NULL,  NULL,     @FECHA,  ''CAMBIO'',       ''CARcUSR'',  @IdUtilizado, NULL )


 INSERT  BK_CARcUSR SELECT *, ''CAMBIO'', getdate() FROM INSERTED


 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CAMBIO_USR Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CAMBIO_USR Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdAdscripciones Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdAdscripciones Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdAdscripciones] ON dbo.CARdAdscripciones 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30) ,@var_SitAct int        
    DECLARE   @Id_CARcSubprocuradurias int,        @Id_CARcDG_o_Delegaciones int
                

    SELECT  @IdUtilizado = Id_CARdAdscripciones, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual, @Id_CARcSubprocuradurias = Id_CARcSubprocuradurias, @Id_CARcDG_o_Delegaciones = Id_CARcDG_o_Delegaciones 
    FROM INSERTED

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10),@FECHADT datetime

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales 

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
   


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdAdscripciones'',  @IdUtilizado, @RFC )
   
    if @var_SitAct=1
     BEGIN
		     update CARdAdscripciones set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdAdscripciones set Id_CARcActual=1 where Id_CARdAdscripciones=@IdUtilizado

                                    UPDATE CARdDatosPersonales SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

  		 UPDATE CARdFicha SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


		UPDATE CARdEscolaridad  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


 		UPDATE CARdFamilia SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                 WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdExperienciaLaboral SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdIdiomas SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdDomicilios  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


                                  UPDATE CARdNombramientos  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


 		UPDATE CARdSituacionLaboral  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

                         /*  Procedimientos       
                               UPDATE CARdProcedimientos SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales LOS PROCEDEIMIENTO NO SE CAMBIAN  */


		 UPDATE CARdEvaluaciones SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdArmas SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		
 		UPDATE CARdEvaluaArmaFuego SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdEstimulosReconocimientos SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdFormacionInicial SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdCursosPersona SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

   END

INSERT BK_CARdAdscripciones SELECT *, ''ALTA'' ,getdate() FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
        --- RAISERROR (''Error al guardar 1 expects the default level of 10.'', 16, 1)
      	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdAdscripciones Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdAdscripciones Trigger'
END
GO

--
-- Script To Create dbo.BAJA_ADSCRIP Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_ADSCRIP Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE TRIGGER [dbo].[BAJA_ADSCRIP] ON [dbo].[CARdAdscripciones] 
 

FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdAdscripciones SELECT *, ''BAJA'' ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_ADSCRIP Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_ADSCRIP Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdAdscripciones Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdAdscripciones Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdAdscripciones] ON dbo.CARdAdscripciones 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)    ,     @Id_CARdDatosPersonales int,     @RFC varchar(30) ,@var_SitAct int                                       
    DECLARE   @Id_CARcSubprocuradurias int,        @Id_CARcDG_o_Delegaciones int

    SELECT  @IdUtilizado = Id_CARdAdscripciones, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual, @Id_CARcSubprocuradurias = Id_CARcSubprocuradurias, @Id_CARcDG_o_Delegaciones = Id_CARcDG_o_Delegaciones 
    FROM INSERTED

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

 SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales 

  SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
   


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdAdscripciones'',  @IdUtilizado, @RFC )


    if @var_SitAct=1
	begin
		     update CARdAdscripciones set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdAdscripciones set Id_CARcActual=1 where Id_CARdAdscripciones=@IdUtilizado


                               UPDATE CARdDatosPersonales SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


		 UPDATE CARdFicha SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


		UPDATE CARdEscolaridad  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


 		UPDATE CARdFamilia SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                   WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdExperienciaLaboral SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdIdiomas SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdDomicilios  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

                        
                                  UPDATE CARdNombramientos  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdSituacionLaboral  SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales


                       /*  Procedimientos         
                               UPDATE CARdProcedimientos SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales*/

		 UPDATE CARdEvaluaciones SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdArmas SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		
 		UPDATE CARdEvaluaArmaFuego SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdEstimulosReconocimientos SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

		 UPDATE CARdFormacionInicial SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

 		UPDATE CARdCursosPersona SET Id_CARcSubprocuradurias  = @Id_CARcSubprocuradurias,  Id_CARcDG_o_Delegaciones = @Id_CARcDG_o_Delegaciones
                                    WHERE Id_CARdDatosPersonales=@Id_CARdDatosPersonales

	end

INSERT BK_CARdAdscripciones SELECT *, ''CAMBIO'' ,getdate()  FROM INSERTED 


 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdAdscripciones Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdAdscripciones Trigger'
END
GO

--
-- Script To Update dbo.Alta_CardArmas Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CardArmas Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CardArmas] ON dbo.CardArmas 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                           

    SELECT  @IdUtilizado = Id_CardArmas, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales 

DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CardArmas'',  @IdUtilizado, @RFC )

INSERT BK_CardArmas SELECT * ,''ALTA'', getdate() FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CardArmas Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CardArmas Trigger'
END
GO

--
-- Script To Create dbo.BK_ELIMINADOS_CARDARMAS Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BK_ELIMINADOS_CARDARMAS Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BK_ELIMINADOS_CARDARMAS] ON [dbo].[CardArmas] 
FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CardArmas SELECT *, ''BAJA'' ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BK_ELIMINADOS_CARDARMAS Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BK_ELIMINADOS_CARDARMAS Trigger'
END
GO

--
-- Script To Update dbo.Mod_CardArmas Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CardArmas Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CardArmas] ON dbo.CardArmas 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)       ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                    

    SELECT  @IdUtilizado = Id_CardArmas, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales 

DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado , RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CardArmas'',  @IdUtilizado, @RFC )


 INSERT BK_CardArmas SELECT * , ''CAMBIO''  ,getdate() FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CardArmas Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CardArmas Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdCursosPersona Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdCursosPersona Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdCursosPersona] ON dbo.CARdCursosPersona 

FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                        
    SELECT  @IdUtilizado = Id_CARdCursosPersona, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
	
SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdCursosPersona'',  @IdUtilizado, @RFC )

INSERT BK_CARdCursosPersona SELECT *,''ALTA''  ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdCursosPersona Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdCursosPersona Trigger'
END
GO

--
-- Script To Create dbo.BAJAS_ CURSOSPERSONAS Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJAS_ CURSOSPERSONAS Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJAS_ CURSOSPERSONAS] ON [dbo].[CARdCursosPersona] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdCursosPersona SELECT *, ''BAJA'' ,getdate()  FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJAS_ CURSOSPERSONAS Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJAS_ CURSOSPERSONAS Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdCursosPersona Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdCursosPersona Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdCursosPersona] ON dbo.CARdCursosPersona 


FOR UPDATE
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                        
    SELECT  @IdUtilizado = Id_CARdCursosPersona, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
	
SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdCursosPersona'',  @IdUtilizado, @RFC )


INSERT BK_CARdCursosPersona SELECT *, ''CAMBIO'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdCursosPersona Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdCursosPersona Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdDatosPersonales Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdDatosPersonales Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdDatosPersonales] ON dbo.CARdDatosPersonales
FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30), @Carrera int                                           
    SELECT  @IdUtilizado = Id_CARdDatosPersonales, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC, @Carrera=Carrera FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdDatosPersonales'',  @IdUtilizado, @RFC )



     INSERT BK_CARdDatosPersonales SELECT *, getdate(),''ALTA'',getdate() FROM INSERTED

  
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdDatosPersonales Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdDatosPersonales Trigger'
END
GO

--
-- Script To Create dbo.BAJAS_PERSONAS Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJAS_PERSONAS Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJAS_PERSONAS] ON [dbo].[CARdDatosPersonales] 

FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdDatosPersonales SELECT *,getdate(), ''BAJA'',getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJAS_PERSONAS Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJAS_PERSONAS Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdDatosPersonales Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdDatosPersonales Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdDatosPersonales] ON dbo.CARdDatosPersonales 
FOR UPDATE
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30),  @Carrera int                                        
    SELECT  @IdUtilizado = Id_CARdDatosPersonales, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC, @Carrera=Carrera FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

    

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdDatosPersonales'',  @IdUtilizado, @RFC )
   

     INSERT BK_CARdDatosPersonales SELECT *, getdate(),''CAMBIO'',getdate() FROM INSERTED   

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdDatosPersonales Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdDatosPersonales Trigger'
END
GO

--
-- Script To Update dbo.ALTA_CARdDomicilios Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.ALTA_CARdDomicilios Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[ALTA_CARdDomicilios] ON dbo.CARdDomicilios 
FOR INSERT
AS
  BEGIN
   BEGIN TRANSACTION
	
   

DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30),  @var_SitAct int , @Carrera int                                 

    SELECT  @IdUtilizado = Id_CARdDomicilios, @IdLogin = IdLogin,    @IP_user = IP_user, @Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual
    FROM INSERTED



    


    if @var_SitAct=1
	begin
	     update CARdDomicilios set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
	     update CARdDomicilios set Id_CARcActual=1 where Id_CARdDomicilios=@IdUtilizado
	end



SELECT @RFC=RFC, @Carrera=Carrera  FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



    IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdDomicilios'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdDomicilios'',  @IdUtilizado )
  END

INSERT BK_CARdDomicilios SELECT *,''ALTA'' ,getdate() FROM INSERTED

    IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.ALTA_CARdDomicilios Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.ALTA_CARdDomicilios Trigger'
END
GO

--
-- Script To Create dbo.BAJA_DOMI Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_DOMI Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_DOMI] ON [dbo].[CARdDomicilios] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdDomicilios SELECT *, ''BAJA'' ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_DOMI Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_DOMI Trigger'
END
GO

--
-- Script To Update dbo.Modificacion_CARdDomicilios Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Modificacion_CARdDomicilios Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Modificacion_CARdDomicilios] ON dbo.CARdDomicilios 
FOR UPDATE
AS
  BEGIN
   BEGIN TRANSACTION

DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30),  @var_SitAct int , @Carrera int                                                                         
	
     

    SELECT  @IdUtilizado = Id_CARdDomicilios, @IdLogin = IdLogin,    @IP_user = IP_user, @Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual
    FROM INSERTED




    if @var_SitAct=1
	begin
	     update CARdDomicilios set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
	     update CARdDomicilios set Id_CARcActual=1 where Id_CARdDomicilios=@IdUtilizado
	end



SELECT @RFC=RFC, @Carrera=Carrera FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



   IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdDomicilios'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdDomicilios'',  @IdUtilizado )
  END

INSERT BK_CARdDomicilios SELECT *, ''CAMBIO'' ,getdate() FROM INSERTED
    IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Modificacion_CARdDomicilios Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Modificacion_CARdDomicilios Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdEscolaridad Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdEscolaridad Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdEscolaridad] ON dbo.CARdEscolaridad
FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30), @Carrera int                                             
    SELECT  @IdUtilizado = Id_CARdEscolaridad, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC, @Carrera=Carrera FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

   IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEscolaridad'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEscolaridad'',  @IdUtilizado )

    

  END

 INSERT BK_CARdEscolaridad SELECT *,''ALTA'' ,getdate() FROM INSERTED  
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdEscolaridad Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdEscolaridad Trigger'
END
GO

--
-- Script To Create dbo.BAJA_ESCOLARIDAD Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_ESCOLARIDAD Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_ESCOLARIDAD] ON [dbo].[CARdEscolaridad] 

FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdEscolaridad SELECT *, ''BAJA'',getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_ESCOLARIDAD Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_ESCOLARIDAD Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdEscolaridad Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdEscolaridad Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdEscolaridad] ON dbo.CARdEscolaridad
FOR UPDATE
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30), @Carrera int                                       
    SELECT  @IdUtilizado = Id_CARdEscolaridad, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC, @Carrera=Carrera  FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

    IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEscolaridad'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEscolaridad'',  @IdUtilizado )



  END

 INSERT BK_CARdEscolaridad SELECT *,''CAMBIO'',getdate()  FROM INSERTED 
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdEscolaridad Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdEscolaridad Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdEstimulosReconocimientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdEstimulosReconocimientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdEstimulosReconocimientos] ON dbo.CARdEstimulosReconocimientos 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdEstimulosReconocimientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEstimulosReconocimientos'',  @IdUtilizado, @RFC )

INSERT BK_CARdEstimulosReconocimientos SELECT *, ''ALTA'' ,getdate()  FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdEstimulosReconocimientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdEstimulosReconocimientos Trigger'
END
GO

--
-- Script To Create dbo.BAJA_ESTIMULO Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_ESTIMULO Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_ESTIMULO] ON [dbo].[CARdEstimulosReconocimientos] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdEstimulosReconocimientos SELECT *, ''BAJA'' ,getdate()  FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_ESTIMULO Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_ESTIMULO Trigger'
END
GO

--
-- Script To Update dbo.Modificacion_CARdEstimulosReconocimientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Modificacion_CARdEstimulosReconocimientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Modificacion_CARdEstimulosReconocimientos] ON dbo.CARdEstimulosReconocimientos 
FOR UPDATE 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdEstimulosReconocimientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEstimulosReconocimientos'',  @IdUtilizado, @RFC )

INSERT BK_CARdEstimulosReconocimientos SELECT *,''CAMBIO'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Modificacion_CARdEstimulosReconocimientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Modificacion_CARdEstimulosReconocimientos Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdEvaluaArmaFuego Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdEvaluaArmaFuego Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdEvaluaArmaFuego] ON dbo.CARdEvaluaArmaFuego
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdEvaluaArmaFuego, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEvaluaArmaFuego'',  @IdUtilizado, @RFC )


  INSERT BK_CARdEvaluaArmaFuego SELECT *,''ALTA'' ,getdate() FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdEvaluaArmaFuego Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdEvaluaArmaFuego Trigger'
END
GO

--
-- Script To Create dbo.B_FUEGO Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.B_FUEGO Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[B_FUEGO] ON [dbo].[CARdEvaluaArmaFuego] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdEvaluaArmaFuego SELECT *, ''BAJA'' ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.B_FUEGO Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.B_FUEGO Trigger'
END
GO

--
-- Script To Update dbo.CAMBIO_CARdEvaluaArmaFuego Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CAMBIO_CARdEvaluaArmaFuego Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[CAMBIO_CARdEvaluaArmaFuego] ON dbo.CARdEvaluaArmaFuego 

FOR UPDATE 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdEvaluaArmaFuego, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEvaluaArmaFuego'',  @IdUtilizado, @RFC )


  INSERT BK_CARdEvaluaArmaFuego SELECT *,''CAMBIO'' ,getdate() FROM INSERTED 

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CAMBIO_CARdEvaluaArmaFuego Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CAMBIO_CARdEvaluaArmaFuego Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdEvaluaciones Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdEvaluaciones Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdEvaluaciones] ON dbo.CARdEvaluaciones 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)    ,     @Id_CARdDatosPersonales int,     @RFC varchar(30), @Carrera int                                        

    SELECT  @IdUtilizado = Id_CARdEvaluaciones, @IdLogin = IdLogin,    @IP_user = IP_user ,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC, @Carrera=Carrera  FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

 IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEvaluaciones'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdEvaluaciones'',  @IdUtilizado )
  END


INSERT BK_CARdEvaluaciones SELECT *,''ALTA'' ,getdate()  FROM INSERTED
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdEvaluaciones Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdEvaluaciones Trigger'
END
GO

--
-- Script To Create dbo.BAJA_EVA Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_EVA Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_EVA] ON [dbo].[CARdEvaluaciones] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdEvaluaciones SELECT *, ''BAJA '' ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_EVA Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_EVA Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdEvaluaciones Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdEvaluaciones Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdEvaluaciones] ON dbo.CARdEvaluaciones 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)     ,     @Id_CARdDatosPersonales int,     @RFC varchar(30) , @Carrera int                                           

    SELECT  @IdUtilizado = Id_CARdEvaluaciones, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC, @Carrera=Carrera FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

    IF @Carrera = 1
     BEGIN

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEvaluaciones'',  @IdUtilizado, @RFC )
   END
ELSE
  BEGIN
 
    INSERT INTO DESdBitacora       ( IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado ) 
                                                 VALUES         ( @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdEvaluaciones'',  @IdUtilizado )
  END


 INSERT BK_CARdEvaluaciones SELECT *, ''CAMBIO'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdEvaluaciones Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdEvaluaciones Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdExperienciaLaboral Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdExperienciaLaboral Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdExperienciaLaboral] ON dbo.CARdExperienciaLaboral 
FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)   ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                        
    SELECT  @IdUtilizado = Id_CARdExperienciaLaboral, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
        INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado,  RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdExperienciaLaboral'',  @IdUtilizado, @RFC )

 INSERT BK_CARdExperienciaLaboral  SELECT *, ''ALTA'' ,getdate() FROM INSERTED
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdExperienciaLaboral Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdExperienciaLaboral Trigger'
END
GO

--
-- Script To Create dbo.BAJA_ELABORAL Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_ELABORAL Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE TRIGGER [dbo].[BAJA_ELABORAL] ON dbo.CARdExperienciaLaboral 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdExperienciaLaboral SELECT *, ''BAJA'',getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_ELABORAL Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_ELABORAL Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdExperienciaLaboral Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdExperienciaLaboral Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdExperienciaLaboral] ON dbo.CARdExperienciaLaboral 
FOR UPDATE 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                           
    SELECT  @IdUtilizado = Id_CARdExperienciaLaboral, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
        INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user, @FECHA,  ''Cambio'', ''CARdExperienciaLaboral'',  @IdUtilizado, @RFC )
 INSERT BK_CARdExperienciaLaboral  SELECT *, ''CAMBIO'',getdate() FROM INSERTED
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdExperienciaLaboral Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdExperienciaLaboral Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdFamilia Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdFamilia Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
SET QUOTED_IDENTIFIER OFF
GO
exec('ALTER TRIGGER [dbo].[Alta_CARdFamilia] ON dbo.CARdFamilia 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                           

    SELECT  @IdUtilizado = Id_CARdFamilia, @IdLogin = IdLogin,    @IP_user = IP_user, @Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED


SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdFamilia'',  @IdUtilizado,  @RFC )

    INSERT BK_CARdFamilia SELECT *,''ALTA'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdFamilia Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdFamilia Trigger'
END
GO

--
-- Script To Create dbo.BAJA_FAMILIA Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_FAMILIA Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

exec('CREATE TRIGGER [dbo].[BAJA_FAMILIA] ON [dbo].[CARdFamilia] 



FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdFamilia SELECT *, ''BAJA'',getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_FAMILIA Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_FAMILIA Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdFamilia Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdFamilia Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
SET QUOTED_IDENTIFIER OFF
GO
exec('ALTER TRIGGER [dbo].[Mod_CARdFamilia] ON dbo.CARdFamilia 
FOR UPDATE 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                           

    SELECT  @IdUtilizado = Id_CARdFamilia, @IdLogin = IdLogin,    @IP_user = IP_user, @Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdFamilia'',  @IdUtilizado, @RFC )

 INSERT BK_CARdFamilia SELECT *, ''CAMBIO'',getdate()  FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdFamilia Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdFamilia Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdFicha Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdFicha Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdFicha] ON dbo.CARdFicha 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)       ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                    

    SELECT  @IdUtilizado = Id_CARdFicha, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdFicha'',  @IdUtilizado, @RFC )

   
     INSERT BK_CARdFicha SELECT *,''ALTA'',getdate() FROM INSERTED     

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdFicha Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdFicha Trigger'
END
GO

--
-- Script To Create dbo.BAJA_FICHA Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_FICHA Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_FICHA] ON [dbo].[CARdFicha] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdFicha SELECT *, ''BAJA'',getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_FICHA Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_FICHA Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdFicha Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdFicha Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdFicha] ON dbo.CARdFicha 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15),     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                           

    SELECT  @IdUtilizado = Id_CARdFicha, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

   SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdFicha'',  @IdUtilizado, @RFC )

     INSERT BK_CARdFicha SELECT *, ''CAMBIO'',getdate() FROM INSERTED   

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdFicha Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdFicha Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdFormacionInicial Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdFormacionInicial Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdFormacionInicial] ON dbo.CARdFormacionInicial 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdFormacionInicial, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdFormacionInicial'',  @IdUtilizado, @RFC )

    INSERT BK_CARdFormacionInicial  SELECT  *,''ALTA'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdFormacionInicial Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdFormacionInicial Trigger'
END
GO

--
-- Script To Create dbo.BAJA_INICIAL Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_INICIAL Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_INICIAL] ON [dbo].[CARdFormacionInicial] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdFormacionInicial SELECT *, ''BAJA'' ,getdate()  FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_INICIAL Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_INICIAL Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdFormacionInicial Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdFormacionInicial Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdFormacionInicial] ON dbo.CARdFormacionInicial 

FOR UPDATE  
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                          

    SELECT  @IdUtilizado = Id_CARdFormacionInicial, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio



     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdFormacionInicial'',  @IdUtilizado, @RFC )

 INSERT BK_CARdFormacionInicial  SELECT  *, ''CAMBIO'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdFormacionInicial Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdFormacionInicial Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdIdiomass Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdIdiomass Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdIdiomass] ON dbo.CARdIdiomas
FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30) , @Carrera int                                         
    SELECT  @IdUtilizado = Id_CARdIdiomas, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
SELECT @RFC=RFC, @Carrera=Carrera  FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
 
    

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdIdiomas'',  @IdUtilizado, @RFC )

    INSERT BK_CARdIdiomas SELECT *,''ALTA'', getdate() FROM INSERTED
  
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdIdiomass Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdIdiomass Trigger'
END
GO

--
-- Script To Create dbo.BAJA_IDIOMAS Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_IDIOMAS Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_IDIOMAS] ON [dbo].[CARdIdiomas] 
 

FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdIdiomas SELECT *, ''BAJA'', getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_IDIOMAS Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_IDIOMAS Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdIdiomass Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdIdiomass Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdIdiomass] ON dbo.CARdIdiomas 
FOR UPDATE
AS
  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)  ,     @Id_CARdDatosPersonales int,     @RFC varchar(30), @Carrera int                                           
    SELECT  @IdUtilizado = Id_CARdIdiomas, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED
   SELECT @RFC=RFC, @Carrera=Carrera  FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales  
 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)
 SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
   

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,       Fecha,        Operacion,  TablaUtilizada,     IdUtilizado,        RFC ) 
                                                 VALUES          ( NULL,                       @IdLogin,  @IP_user,  @FECHA,  ''Cambio'',     ''CARdIdiomas'',  @IdUtilizado, @RFC )


   INSERT BK_CARdIdiomas SELECT *,''CAMBIO'', getdate() FROM INSERTED 
 
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdIdiomass Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdIdiomass Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdNombramientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdNombramientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdNombramientos] ON dbo.CARdNombramientos 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15) ,     @Id_CARdDatosPersonales int,     @RFC varchar(30) , @var_SitAct int                                    

    SELECT  @IdUtilizado = Id_CARdNombramientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcSINO
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET  @dia= day(getdate())
   SET  @mes= month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio

  INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdNombramientos'',  @IdUtilizado, @RFC )


     if @var_SitAct=1
	begin
		     update CARdNombramientos set Id_CARcSINO=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdNombramientos set Id_CARcSINO=1 where Id_CARdNombramientos=@IdUtilizado
	end


 INSERT BK_CARdNombramientos SELECT *, ''ALTA'',getdate() FROM INSERTED 

   
 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdNombramientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdNombramientos Trigger'
END
GO

--
-- Script To Create dbo.BAJA_ESCO Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_ESCO Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_ESCO] ON [dbo].[CARdNombramientos] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdNombramientos SELECT *, ''BAJA'' , getdate()  FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_ESCO Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_ESCO Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdNombramientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdNombramientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdNombramientos] ON dbo.CARdNombramientos 
FOR UPDATE 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)  ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)  ,@var_SitAct int

    SELECT  @IdUtilizado = Id_CARdNombramientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcSINO
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10),@FECHADT datetime

   SET  @dia= day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
  

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user, @FECHA,  ''Cambio'', ''CARdNombramientos'',  @IdUtilizado, @RFC )


     if @var_SitAct=1
	begin
		     update CARdNombramientos set Id_CARcSINO=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdNombramientos set Id_CARcSINO=1 where Id_CARdNombramientos=@IdUtilizado
	end
	
  INSERT BK_CARdNombramientos SELECT *,''CAMBIO'', getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdNombramientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdNombramientos Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdProcedimientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdProcedimientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdProcedimientos] ON dbo.CARdProcedimientos 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)    ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                       

    SELECT  @IdUtilizado = Id_CARdProcedimientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Alta'', ''CARdProcedimientos'',  @IdUtilizado, @RFC )

 INSERT BK_CARdProcedimientos SELECT *, ''ALTA'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdProcedimientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdProcedimientos Trigger'
END
GO

--
-- Script To Create dbo.BAJA_PROCE Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_PROCE Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_PROCE] ON [dbo].[CARdProcedimientos] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdProcedimientos SELECT *, ''BAJA''  ,getdate() FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_PROCE Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_PROCE Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdProcedimientos Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdProcedimientos Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdProcedimientos] ON dbo.CARdProcedimientos 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)     ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)                                       

    SELECT  @IdUtilizado = Id_CARdProcedimientos, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user, @FECHA,  ''Cambio'', ''CARdProcedimientos'',  @IdUtilizado, @RFC )


 INSERT BK_CARdProcedimientos SELECT *,''CAMBIO'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdProcedimientos Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdProcedimientos Trigger'
END
GO

--
-- Script To Update dbo.Alta_CARdSituacionLaboral Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Alta_CARdSituacionLaboral Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Alta_CARdSituacionLaboral] ON dbo.CARdSituacionLaboral 
FOR INSERT 
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)  ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)  ,@var_SitAct int

    SELECT  @IdUtilizado = Id_CARdSituacionLaboral, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio


     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user, @FECHA,  ''Alta'', ''CARdSituacionLaboral'',  @IdUtilizado, @RFC )


     if @var_SitAct=1
	begin
		     update CARdSituacionLaboral set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdSituacionLaboral set Id_CARcActual=1 where Id_CARdSituacionLaboral=@IdUtilizado
	end
	

 INSERT BK_CARdSituacionLaboral  SELECT *, ''ALTA'' ,getdate() FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Alta_CARdSituacionLaboral Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Alta_CARdSituacionLaboral Trigger'
END
GO

--
-- Script To Create dbo.BAJA_SITUACIONLABORAL Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.BAJA_SITUACIONLABORAL Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[BAJA_SITUACIONLABORAL] ON [dbo].[CARdSituacionLaboral] 


FOR  DELETE 
AS
BEGIN
   BEGIN TRANSACTION
	
INSERT BK_CARdSituacionLaboral SELECT *, ''BAJA'' ,getdate()  FROM DELETED 



 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.BAJA_SITUACIONLABORAL Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.BAJA_SITUACIONLABORAL Trigger'
END
GO

--
-- Script To Update dbo.Mod_CARdSituacionLaboral Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.Mod_CARdSituacionLaboral Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
exec('ALTER TRIGGER [dbo].[Mod_CARdSituacionLaboral] ON dbo.CARdSituacionLaboral 
FOR UPDATE
AS

  BEGIN
   BEGIN TRANSACTION
	
    DECLARE    @IdUtilizado int,    @IdLogin int,      @IP_user varchar (15)       ,     @Id_CARdDatosPersonales int,     @RFC varchar(30)   ,@var_SitAct INT                                  

    SELECT  @IdUtilizado = Id_CARdSituacionLaboral, @IdLogin = IdLogin,    @IP_user = IP_user,@Id_CARdDatosPersonales = Id_CARdDatosPersonales, @var_SitAct=Id_CARcActual
    FROM INSERTED

SELECT @RFC=RFC FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = @Id_CARdDatosPersonales

 DECLARE @dia char(2), @mes char(2), @anio char(4), @FECHA char(10)

   SET @dia = day(getdate())
   SET @mes = month (getdate())
   SET @anio = year (getdate())  
   SET @FECHA = @dia+''/''+@mes+''/''+@anio
  

     INSERT INTO CARdRastreo_bit       ( CARdRastreo_bit,   IdLogin,   IP_user,  Fecha,  Operacion,  TablaUtilizada,  IdUtilizado, RFC ) 
                                                 VALUES ( NULL,             @IdLogin,  @IP_user,  @FECHA,  ''Cambio'', ''CARdSituacionLaboral'',  @IdUtilizado,@RFC )

     if @var_SitAct=1
	begin
		     update CARdSituacionLaboral set Id_CARcActual=2 where Id_CARdDatosPersonales=@Id_CARdDatosPersonales
		     update CARdSituacionLaboral set Id_CARcActual=1 where Id_CARdSituacionLaboral=@IdUtilizado
	end


  INSERT BK_CARdSituacionLaboral  SELECT *,''CAMBIO'' ,getdate()  FROM INSERTED

 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END


END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.Mod_CARdSituacionLaboral Trigger Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.Mod_CARdSituacionLaboral Trigger'
END
GO

--
-- Script To Create dbo.ALTA_PERFILGRUPO Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.ALTA_PERFILGRUPO Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[ALTA_PERFILGRUPO] ON [dbo].[CARdUsrPerfilGrupo] 

FOR INSERT 
AS
  BEGIN
   BEGIN TRANSACTION
	
    
 INSERT BK_CARdUsrPerfilGrupo SELECT *, ''ALTA'',getdate() FROM INSERTED


 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.ALTA_PERFILGRUPO Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.ALTA_PERFILGRUPO Trigger'
END
GO

--
-- Script To Create dbo.CAMBIO_PERFILGRUPO Trigger In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CAMBIO_PERFILGRUPO Trigger'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET QUOTED_IDENTIFIER OFF
GO
exec('CREATE TRIGGER [dbo].[CAMBIO_PERFILGRUPO] ON [dbo].[CARdUsrPerfilGrupo] 


FOR UPDATE 
AS
  BEGIN
   BEGIN TRANSACTION
	
    
 INSERT BK_CARdUsrPerfilGrupo SELECT *, ''CAMBIO'',getdate() FROM INSERTED


 IF @@ERROR <> 0
      BEGIN
       	 ROLLBACK TRANSACTION 
      END 
    ELSE
      BEGIN
	  COMMIT TRANSACTION 
      END
END')
GO
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CAMBIO_PERFILGRUPO Trigger Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CAMBIO_PERFILGRUPO Trigger'
END
GO

--
-- Script To Update dbo.CARdDomicilios Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdDomicilios Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdDomicilios_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdDomicilios] WITH NOCHECK ADD CONSTRAINT [FK_CARdDomicilios_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdDomicilios Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdDomicilios Table'
END
GO


--
-- Script To Update dbo.CARdEscolaridad Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdEscolaridad Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdEscolaridad_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdEscolaridad] WITH NOCHECK ADD CONSTRAINT [FK_CARdEscolaridad_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdEscolaridad Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdEscolaridad Table'
END
GO


--
-- Script To Update dbo.CARdEvaluaciones Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdEvaluaciones Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdEvaluaciones_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdEvaluaciones] WITH NOCHECK ADD CONSTRAINT [FK_CARdEvaluaciones_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdEvaluaciones Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdEvaluaciones Table'
END
GO


--
-- Script To Update dbo.CARdFormacionInicial Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdFormacionInicial Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdFormacionInicial_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdFormacionInicial] WITH NOCHECK ADD CONSTRAINT [FK_CARdFormacionInicial_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdFormacionInicial Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdFormacionInicial Table'
END
GO


--
-- Script To Update dbo.CARdIdiomas Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdIdiomas Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdIdiomas_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdIdiomas] WITH NOCHECK ADD CONSTRAINT [FK_CARdIdiomas_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdIdiomas Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdIdiomas Table'
END
GO


--
-- Script To Update dbo.CARdNombramientos Table In 10.1.4.51.SIIFP
-- Generated Viernes, Abril 11, 2008, at 11:52 AM
--
-- Please backup 10.1.4.51.SIIFP before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CARdNombramientos Table'
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF NOT EXISTS (SELECT name FROM sysobjects WHERE name = N'FK_CARdNombramientos_CARdDatosPersonales')
      ALTER TABLE [dbo].[CARdNombramientos] WITH NOCHECK ADD CONSTRAINT [FK_CARdNombramientos_CARdDatosPersonales] FOREIGN KEY ([Id_CARdDatosPersonales]) REFERENCES [dbo].[CARdDatosPersonales] ([Id_CARdDatosPersonales]) ON DELETE CASCADE
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CARdNombramientos Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CARdNombramientos Table'
END
GO
