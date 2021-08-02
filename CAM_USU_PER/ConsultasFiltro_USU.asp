<!-- #INCLUDE File="Paginas.inc"-->
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO
NumPerPage = 15
''response.write request.form
%>
<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
  Tabla = "VST_USUARIOS_BK"
  var_pagina_regreso = "'FILTRO_USUARIOS.asp'"
  xRaiz = 8    ' Numero de Caracteres que componen la raiz del Nombre Id_CARd
'  response.write Tabla
%>

<TITLE><%= "Consultas de " + (MID((Tabla),4,LEN(TABLA))) %></TITLE>

<%
'response.write(request.form)
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")

	
   ODBC = SESSION("ODBC")
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ Session("IP_SERVER")+";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

  consulta = "SELECT * FROM " & Tabla 
  Ob_RS.OPEN consulta, Ob_Conn

total_campos = Ob_RS.FIELDS.COUNT

'========================== Construcción de la cadena de consulta
   sql =consulta+ " WHERE Id_CarcUsr  <> 0 "
xCARcUsr = request("CARcUSR1")   
FechaEvaluacion2 = request("FechaEvaluacion2")
IF request("FechaEvaluacion") <> "" then
   sql = SQL + " AND FECHA_OPERACION_HISTORIAL  >= '"+ request("FechaEvaluacion")+ "'"
end if 
IF request("FechaEvaluacion2") <> "" then
   sql = SQL + " AND FECHA_OPERACION_HISTORIAL <='"+ CSTR(CDATE(FechaEvaluacion2)+1)+ "'"
end if 
' ==============  FIN DE CONSTRUCCION DE CADENA

'''response.write ">>>>"
'''response.write (sql)
'response.end

' ==============  Se agrego , 1,1 para la paginacion  u la llamada a la rutina INICIAPAG	
Ob_RS2.Open Sql, Ob_Conn, 1,1
CALL INICIAPAGINA 

Num_Campos= Ob_RS2.FIELDS.COUNT 

IF NOT Ob_RS2.EOF THEN %>
 	
<CENTER><H2>Registros encontrados en USUARIOS MODIFICADOS </H2><CENTER>
 
<%x = -1 %>

  <TABLE class="SL" border="1">
  <TR>
 	<TD> No. </TD>

 <% FOR x = 0 TO total_campos-2 %>
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=Ob_RS2(x).name %>  </font>	</B> 
 <%NEXT %>

  </TR>

  <%
	nRen = 0 
' ==============  Se agrego "and nRen < Ob_RS2.PageSize" PARA LA PAGINACION	
   DO WHILE NOT Ob_RS2.EOF and nRen < Ob_RS2.PageSize
    nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%>
  <TR class="Datos"> 
    <% else %>
  <TR  class="Encabezados" > 
    <% end if %>
			<TD> <%=nRen %> &nbsp;</TD>

		<% 
		FOR Campo = 0 TO Num_Campos - 2 %>			
			<TD> <%= Ob_RS2(Campo) %> &nbsp;</TD>
<%		NEXT
		Ob_RS2.MOVENEXT
  LOOP
	
  CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
  
ELSE
	RESPONSE.WRITE "<BR>"
	RESPONSE.WRITE "<CENTER> <H3> No existe ningún registro que cumpla con los parámetros de búsqueda </H3> </CENTER>"
END IF
%>

</TABLE>

<CENTER>
<BR>
<INPUT TYPE="button" VALUE="Buscar otro registro" ONCLICK="location.href=<%= var_pagina_regreso%>" >
<INPUT TYPE="button" VALUE="Agregar registro" ONCLICK="location.href=<%= "'Altas_"+Tabla+".ASP'"%>" >

<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>

 </BODY>
</HTML>

