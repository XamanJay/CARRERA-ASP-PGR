<!-- #Include File = "Session/ActiveSession.inc" -->
<html>

<body bgproperties="fixed" background="Catalogos/softgri1.jpg" topmargin="0" leftmargin="0">

<%
ParamID= Request.QueryString("ParamID")
Tabla = Request.QueryString("ParamTabla")
ODBC = SESSION("ODBC")
'response.write(">>Tabla>>:"+tabla)

var_pagina_regreso = "'ConsultasFiltro.asp?tabla_original="+Tabla+"'"
%>

<TITLE> 
 <%= "Bajas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>

<Center><b><h3>Validar registro</h3></b></Center>
</head>

<body>
<script type="text/javascript">
if (confirm("Confirmar VALIDACIÓN de Registro")==false)
{
alert("Operacion de Validación CANCELADA")
document.write(history.back())
}
</script>

</body>
<p>&nbsp;</p><center>
<!--Input Type="button" Value="Ver registros" OnClick="location.href=<%= var_pagina_regreso%>" ></center-->
</body>
</html>
<%
'Response.write("<H3>BORRADO</H3>")
'response.end

Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")


Sql = "UPDATE " +Tabla+" SET Id_CARcValidado = 1  WHERE Id_"+Tabla+" = " + ParamID 
'Response.write sql
'response.end


Ob_RS.Open Sql, ob_conn    %>

<BR><BR><BR>
<%
Response.write "<CENTER><H2>Los datos del registro seleccionado se han Validado</H2></CENTER>"
%>
<%
Set Ob_RS = Nothing
Ob_Conn.Close
%>

<script  language="javascript">
function disp_confirm()
{
var name=confirm("Confirmar Registro Validado")
if (name==true)
{
   document.write("OK button!")
   return true;
}
else
{
document.write(" Cancel button!")
   return false;
}
}
</script>
