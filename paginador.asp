<html>
<head><title>Paginar resultados de consulta</title></head>
<%
v_ODBC = "SIIFP"
v_Tabla = "CARdDatosPersonales"

'Consulta SQL
sql = "SELECT * FROM " & v_Tabla 
'Configurar aqui los registros por página
num_registros = 15

'actualizamos la pagina actual
if (request.queryString("pag") <> "") then 
	pagina_actual = request.queryString("pag")
else
	pagina_actual = 1
end if

Set oConn = Server.CreateObject("ADODB.Connection")
'oConn.Open StrConn
Set RS = Server.CreateObject("ADODB.RecordSet")

oConn.PROVIDER="sqloledb"
oConn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ v_ODBC +";UID=cursos;PWD=cursos"

RS.Open sql,oConn,3,1

RS.pageSize = num_registros
RS.absolutePage = pagina_actual
cantidad_campos = RS.Fields.Count
%>

<body>
<div align="center">
Página actual: <b><%= pagina_actual %></b><br>
Cantidad de páginas: <b><%= RS.PageCount %></b><br>
Registros por página: <b><%= RS.PageSize %></b><br>
Registros totales: <b><%= RS.RecordCount %></b>
</div>
<br><br>

<table cellspacing="2" cellpadding="2" border="1" align="center">
<tr>
<%
For campo = 0 to cantidad_campos - 1 %>
   <td align="center"><%=RS(campo).Name%>&nbsp;</td>
<% Next %>
</tr>
<%
registros_mostrados = 0
While (Not RS.eof And registros_mostrados < num_registros)
   registros_mostrados = registros_mostrados +1
%> 
<tr>
   <%For campo=0 to cantidad_campos - 1 %>
      <td align="center"><%=RS(campo)%>&nbsp;</td>
   <%Next%>
</tr>
<%
   RS.MoveNext
Wend
%>
<tr>
<td colspan="<%=cantidad_campos%>" align="left">
<%
i=1
Do While i < RS.PageCount + 1
%>
   <b><a href="paginador.asp?pag=<%=i%>"><%=i & "  -  "%></a></b>
<%
	i=i+1
Loop
%> &nbsp;</td>
</tr>
</table>
<%
'Limpiamos los objetos (SIEMPRE)
RS.Close
Set RS = Nothing
oConn.Close
Set oConn = Nothing
%>
</body>
</html>