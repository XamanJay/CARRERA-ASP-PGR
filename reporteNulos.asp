<%'On Error Resume Next
'response.write "1"
    v_ODBC  = "SIIFP"
    IdUSR = SESSION("IdLogin")
	IDPer = request("IDPEr")
	OP = REQUEST("OP")
'	response.write "v_PER.."
'IDPer= request("Id_CARdDatosPersonales")
'	response.write IDPer
'	response.end
%>
<%     Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
     SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     Set Ob_RS_pre = Server.CreateObject ("ADODB.RecordSet")
      Ob_Conn.Provider="sqloledb"
     IP_Servidor = session("IP_Servidor")
'     Ob_Conn.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")
    Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body topmargin="0" bgcolor="#E5E5E5">
<form action="" method="post" >
   

  <table border="0" cellspacing="1" width="99%" id="AutoNumber1" height="295" class="SL">
    <tr>
<%
IF OP = "PER" THEN
   CALL PantallaValida("CARdDatosPersonales", "Datos Personales")
   CALL PantallaValida("CARdFicha", "Media Filiación")
   CALL PantallaValida("CARdEscolaridad", "Historial Academico")
   CALL PantallaValida("CARdFamilia", "Referencias")
   CALL PantallaValida("CARdExperienciaLaboral", "Historial Laboral")
   CALL PantallaValida("CARdIdiomas", "Idiomas")

ELSEIF OP = "TRA" THEN 

   CALL PantallaValida("CARdNombramientos", "Nombramientos")
   CALL PantallaValida("CARdSituacionLaboral", "Situación Laboral")
   CALL PantallaValida("CARdAdscripciones", "Adscripciones")
   CALL PantallaValida("CARdProcedimientos", "Procedimientos")
   CALL PantallaValida("CARdEvaluaciones", "Eval. CeDH")
   CALL PantallaValida("CARdArmas", "Armas")
   CALL PantallaValida("CARdEstimulosReconocimientos", "Estimulos y Rec.")
   CALL PantallaValida("CARdFormacionInicial", "Formación Ini.")

ELSEIF OP = "CAP" THEN 
   CALL PantallaValida("CARdCursosPersona", "Seguimiento")
END IF 

%>      <!--td width="18%" height="14" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="center"><font size="-1"><b>DATOS GENERALES</b></font> </div></td>
      <td width="25%" height="14" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="center"><font size="-1"><b>TRAYECTORIA PGR </b></font> </div></td-->
      <a target="topFrame2" href="CARR_MENU2.asp">
	  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF"> </font></a> </div></td>
    </tr>
  </table>
<INPUT TYPE="Hidden" id=IDPER NAME='idPersona' Value = <%request("Id_CARdDatosPersonales")%> >
</form>
</body>
 </html>
 <!-- #INCLUDE File="errores.inc" -->
 <%
 SUB PantallaValida(Pantalla, Letrero)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%Consultas_"+Pantalla+"%'"
'  response.write "idper:"
'  response.write idper
 '  response.end
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "" 
        xCAD = xCAD + "&nbsp;&nbsp;&nbsp;<a  target='mainFrame4' href='MFiltro.asp?tabla_original="+Pantalla+"&ODBC=SIIFP&IdMaestro=CARdDatosPersonales&Id_CARdDatosPersonales="+IDPER+"&TIT="+Letrero+"'><Font size = 2>"+Letrero+"</font></a>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB
 %>
