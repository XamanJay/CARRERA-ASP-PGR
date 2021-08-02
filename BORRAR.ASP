<!--#INCLUDE FILE="ADOVBS.INC"-->
<!--#include file="DSUpload.inc"-->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    v_ODBC  = SESSION("ODBC")
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

'QRY = "   Insert Into CARdDatosPersonales "
'qry = QRY + "   (CARdDatosPersonales,RFC,ApellidoPaterno,ApellidoMaterno,Nombre,Id_CARcEntidadFederativa,FechaNacimiento,Id_CarcEdoCivil,Id_CARcGenero,CURP,CartillaSMN,ClaveElector,Foto,NoFiliacion,FechaFiliacion,DependenciaFiliacion,Autorizador,Fecha_Captura,IdLogin,IP_user) "
'qry = QRY + "    Values ('','BBAA222222','KKKK','KKK','KKK','3','15/2/2006',2,1,'KKKK','KKKK','KKKK','DtopZen.ico','KKKK','16/2/2006','KKKKK','','','21','10.1.207.201') "

QRY = " Insert Into CARdDatosPersonales " 
qry = QRY + " (CARdDatosPersonales,RFC,ApellidoPaterno,ApellidoMaterno,Nombre,Id_CARcEntidadFederativa,FechaNacimiento,Id_CarcEdoCivil,Id_CARcGenero,CURP,CartillaSMN,ClaveElector,Foto,NoFiliacion,FechaFiliacion,DependenciaFiliacion,Autorizador,Fecha_Captura,IdLogin,IP_user) "
qry = QRY + " Values ('','DDDD3333333','DDD','DDD','DDD','3','14/02/2006','2','1','DDD','DDD','DDD','ZenNX.ICO','DDDD','15/02/2006','DDDD','','30/12/1899','21','10.1.207.201') "
response.write (Sqla)
'response.end

Ob_Rs.Open QRY, Ob_Conn
Set Ob_Rs= Nothing
Set Ob_Conn= Nothing

%>