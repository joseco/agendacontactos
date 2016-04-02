USE [Agenda]
GO

/****** Object:  Table [dbo].[tbl_Version]    Script Date: 04/01/2016 20:38:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Version](
	[versionMayor] [int] NOT NULL,
	[versionMenor] [int] NOT NULL,
	[patch] [int] NOT NULL
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[tbl_Contacto]    Script Date: 04/01/2016 20:37:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Contacto](
	[contactoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[direccion] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_Contacto] PRIMARY KEY CLUSTERED 
(
	[contactoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [Agenda]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetContactos]    Script Date: 04/01/2016 20:37:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetContactos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetContactos]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetContactoById]    Script Date: 04/01/2016 20:37:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetContactoById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetContactoById]
GO

/****** Object:  StoredProcedure [dbo].[usp_EliminarContacto]    Script Date: 04/01/2016 20:37:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EliminarContacto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EliminarContacto]
GO

/****** Object:  StoredProcedure [dbo].[usp_ActualizarContacto]    Script Date: 04/01/2016 20:37:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ActualizarContacto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ActualizarContacto]
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertarContacto]    Script Date: 04/01/2016 20:37:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertarContacto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertarContacto]
GO

USE [Agenda]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetContactos]    Script Date: 04/01/2016 20:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 29/03/2016
-- Description:	Obtiene una lista de contactos
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetContactos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [contactoId],
		[nombre],
		[telefono],
		[direccion]
	FROM [dbo].[tbl_Contacto]
    
    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_GetContactoById]    Script Date: 04/01/2016 20:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 29/03/2016
-- Description:	Obtiene un contacto por
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetContactoById]
	@intContactoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [contactoId],
		[nombre],
		[telefono],
		[direccion]
	FROM [dbo].[tbl_Contacto]
	WHERE [contactoId] = @intContactoId
    
    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_EliminarContacto]    Script Date: 04/01/2016 20:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 29/03/2016
-- Description:	Elimina un contacto
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarContacto]
	@intContactoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [dbo].[tbl_Contacto]
	WHERE [contactoId] = @intContactoId
    
    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_ActualizarContacto]    Script Date: 04/01/2016 20:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 29/03/2016
-- Description:	Actualiza un contacto
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarContacto]
	@varNombre		NVARCHAR(250),
	@varTelefono	VARCHAR(50),
	@varDireccion	NVARCHAR(250),
	@intContactoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [dbo].[tbl_Contacto]
	   SET [nombre] = @varNombre
		  ,[telefono] = @varTelefono
		  ,[direccion] = @varDireccion
	 WHERE [contactoId] = @intContactoId
    
    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_InsertarContacto]    Script Date: 04/01/2016 20:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 29/03/2016
-- Description:	Inserta un contacto
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarContacto]
	@varNombre		NVARCHAR(250),
	@varTelefono	VARCHAR(50),
	@varDireccion	NVARCHAR(250),
	@intContactoId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tbl_Contacto]
           ([nombre]
           ,[telefono]
           ,[direccion])
     VALUES
           (@varNombre
           ,@varTelefono
           ,@varDireccion)
           
	SET @intContactoId = SCOPE_IDENTITY()
    
    
END

GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (0
           ,1
           ,0)
GO

