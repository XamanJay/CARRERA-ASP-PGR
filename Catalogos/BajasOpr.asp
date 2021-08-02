<html>

<body bgproperties="fixed" background="softgri1.jpg" topmargin="0" leftmargin="0">

<%
ParamID= Request.QueryString("ParamID")
Tabla = Request.QueryString("ParamTabla")
ODBC = SESSION("ODBC")

'var_pagina_regreso = "'Bajas_"+ TRIM(Tabla)  +".asp'"
var_pagina_regreso = "'ConsultasFiltro.asp?tabla_original="+Tabla+"'"
%>

<TITLE> 
 <%= "Bajas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>

<Center><b><h3>Borrar registro</h3></b></Center>
</head>

<body>
<script type="text/javascript">
if (confirm("Confirmar Borrado de Registro")==false)
{
alert("Operacion de borrado CANCELADA")
document.write(history.back())
}
</script>

</body>
<p>&nbsp;</p><center>
<Input Type="button" Value="Ver registros" OnClick="location.href=<%= var_pagina_regreso%>" ></center>
</body>
</html>
<%
'Response.write("<H3>BORRADO</H3>")
'response.end

Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")


Sql = "DELETE FROM " + Tabla + " WHERE (Id_" + Tabla + " = " + ParamID + ")" 

Ob_RS.Open Sql, ob_conn    %>

<BR><BR><BR>
<%
Response.write "<CENTER><H2>Los datos del registro seleccionado han sido eliminados</H2></CENTER>"
%>
<%
Set Ob_RS = Nothing
Ob_Conn.Close
%>

<script  language="javascript">
function disp_confirm()
{
var name=confirm("Confirmar Borrado de Registro")
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
