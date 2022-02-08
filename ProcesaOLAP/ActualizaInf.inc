<%
Dim IPSOURSE
IPSOURSE = "10.3.194.244\PROD"
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")
conn.open "PROVIDER=SQLOLEDB;DATA SOURCE="& IPSOURSE &";UID=UserSIIFPOLAP;PWD=UserSIIFPOLAP;DATABASE=SIIFPOLAP"

'Server.ScriptTimeout = 240

IPFuente = "10.1.4.11"

'--**Actualización de la Tabla de Datos vwDimDatosPersonalesFact ***
Sql = "truncate table vwDimDatosPersonalesFact "
Sql = Sql & "Insert into vwDimDatosPersonalesFact "
Sql = Sql & "select * from  " 
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimDatosPersonalesFact') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimCategorias ***
Sql = Sql & "Truncate Table vwDimCategorias "
Sql = Sql & "Insert into vwDimCategorias "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimCategorias') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimDependencias ***
Sql = Sql & "Truncate Table vwDimDependencias "
Sql = Sql & "Insert into vwDimDependencias "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimDependencias') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimEdad ***
Sql = Sql & "Truncate Table vwDimEdad "
Sql = Sql & "Insert into vwDimEdad "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimEdad') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimGenero ***
Sql = Sql & "Truncate Table vwDimGenero "
Sql = Sql & "Insert into vwDimGenero "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimGenero') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimInstitutos ***
Sql = Sql & "Truncate Table vwDimInstitutos "
Sql = Sql & "Insert into vwDimInstitutos "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimInstitutos') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimStatusInstituto ***
Sql = Sql & "Truncate Table vwDimStatusInstituto "
Sql = Sql & "Insert into vwDimStatusInstituto "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimStatusInstituto') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimTipoEvaluaciones ***
Sql = Sql & "Truncate Table vwDimTipoEvaluaciones "
Sql = Sql & "Insert into vwDimTipoEvaluaciones "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimTipoEvaluaciones') "
'--***
Sql = Sql & "                       "

'--**Actualización de la Tabla de Dimensiones vwDimTipoNombramientos ***
Sql = Sql & "Truncate Table vwDimTipoNombramientos "
Sql = Sql & "Insert into vwDimTipoNombramientos "
Sql = Sql & "select * from    "
Sql = Sql & "OPENROWSET('SQLOLEDB','"& IPFuente &"';'UserCarreraSql';'b7b592504f95b4dab4a3d7225bb9655f','SELECT * FROM SIIFP.dbo.vwDimTipoNombramientos') "
'--***

rs.Open Sql, conn

Set rs = nothing
Set conn = nothing
%>