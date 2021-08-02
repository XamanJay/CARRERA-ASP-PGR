<%
IF REQUEST("ParamId") = "" THEN 
   RESPONSE.WRITE "OPERACION DE BORRADO CANCELADA"
   RESPONSE.END
END IF
%>
<html>
<body bgproperties="fixed" background="Catalogos/softgri1.jpg" topmargin="0" leftmargin="0">
<%
ParamID= Request.QueryString("ParamID")
Tabla = Request.QueryString("ParamTabla")
ODBC = SESSION("ODBC")
'RESPONSE.WRITE TABLA
'var_pagina_regreso = "'Bajas_"+ TRIM(Tabla)  +".asp'"
var_pagina_regreso = "'ConsultasFiltro.asp?tabla_original="+Tabla+"'"
%>

<TITLE> 
 <%= "Bajas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>

</head>


<body>
<Center><b><h3>REGISTRO BORRADO</h3></b></Center>


<%
'Response.write("<H3>QUE ONDA</H3>")
'response.end

Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

Sql = "DELETE FROM " + Tabla + " WHERE (Id_" + Tabla + " = " + ParamID + ")" 
Ob_RS.Open Sql, ob_conn    %>
<%
Response.write "<CENTER><H2>El registro seleccionado ha sido eliminado</H2></CENTER>"
Set Ob_RS = Nothing
Ob_Conn.Close

%>

<script type="text/javascript">
//alert("El Registro ha sido eliminado")
//document.write(history.back())
</script>
