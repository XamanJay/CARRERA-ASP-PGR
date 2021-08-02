<html>

<body bgproperties="fixed" background="softgri1.jpg" topmargin="0" leftmargin="0">

<%
ParamID= Request.QueryString("ParamID")
Tabla = Request.QueryString("ParamTabla")
ODBC = SESSION("ODBC")

var_pagina_regreso = "'Bajas_"+ TRIM(Tabla)  +".asp'"
%>

<TITLE> 
 <%= "Bajas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>

<Center><b><h3>Asignar Regalos</h3></b></Center>
</head>

<body>
<script type="text/javascript">
if (confirm("Confirmar Asignación de Regalos")==false)
{
alert("Operacion  CANCELADA")
document.write(history.back())
}
</script>

</body>
<p>&nbsp;</p><center>
<Input Type="button" Value="Regresar" OnClick="location.href=<%= var_pagina_regreso%>" ></center>
</body>
</html>
<%
Response.write("<H3>BORRADO</H3>")
response.end

  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  Ob_Conn.PROVIDER="sqloledb"
  Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

	 var_sp = "exec sp_AsignaRegaloPersona " 
     Ob_RS.Open var_sp, ob_conn_po 
 %>

<BR><BR><BR>
<%
Response.write "<CENTER><H1>Los Regalos han sido distribuidos ALEATORIAMENTE</H1></CENTER>"
%>
<%
Set Ob_RS = Nothing
Ob_Conn.Close
%>

<% 
%>
