<!-- #INCLUDE File="Utilerias.vbs" -->
<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
  Tabla = "Tbl_personalPGR2"
  ODBC = "Orion1"
%>

<TITLE><%= "Consultas de " + request("TIT")%></TITLE>

<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")


   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER=DESE-desar01;DATABASE=orion1;UID=oro;PWD=oro1"

    consulta = "select * from Tbl_Laboral_E WHERE SUBSTRING(FechaInicio_A1,1,3)>= 'VEL' order by Filiacion"
    Ob_RS.OPEN consulta, Ob_Conn
	Ind = 0
	do until OB_RS.EOF
 IF left(OB_RS("filiacion"),3) >= "VEL"  AND OB_RS("FechaInicio_A1")<> "" THEN
'	  xFecha = mid(OB_RS("FechaNac"),5,2)+"/"+mid(OB_RS("FechaNac"),7,2)+"/"+mid(OB_RS("FechaNac"),1,4)
	  xSQL = "UPDATE Tbl_Laboral_E SET FECHAInicio = '"+Ob_RS("FechaInicio_A1")+"'"
	  xSQL = xSQL+" FROM Tbl_Laboral_E WHERE FILIACION = '" +OB_RS("FILIACION")+"'"
'	  RESPONSE.WRITE xSQL
'	  response.write "<BR>"
    Ob_RS2.OPEN xSQL, Ob_Conn
	  
 '     response.write xfecha
'	  response.write "<BR>" 
'	      RESPONSE.end
 END IF
	   OB_RS.MOVENEXT
	   Ind = Ind+1
'	   If IND > 100 THEN
'           response.end
'       eND IF 
	loop
		   response.write "F I N <BR>" 

%>

