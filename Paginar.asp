<%
Dim mostrar       'cantidad de registros a mostrar por página
Dim cant_paginas      'cantidad de páginas que recibimos
Dim pagina_actual      'La página que mostramos
Dim registro_mostrado      'Contador utilizado para mostrar las páginas
Dim I        'Variable Loop

mostrar = 10 ' Pueden modificar este número para cambiar la cantidad de registros por página

' IF para saber que página mostrar
If Request.QueryString("page") = "" Then
pagina_actual = 1
Else
pagina_actual = CInt(Request.QueryString("page"))
End If

strsql = "SELECT * FROM tabla"

' Creamos la conexion a la base de datos
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open StrConn

' Creamos el RecordSet y definimos la cantidad de registros a mostrar
Set RS = Server.CreateObject("ADODB.Recordset")
RS.PageSize = mostrar
RS.CacheSize = mostrar

' Abrimos la tabla...
RS.Open strSQL, oConn,3,1
'contamos las páginas que se formaron con la variable mostrar.
cant_paginas = RS.PageCount

' Si el pedido de página cae afuera del rango,
' lo modificamos para que caiga adentro
If pagina_actual > cant_paginas Then pagina_actual = cant_paginas
If pagina_actual < 1 Then pagina_actual = 1

' Si la cantidad de páginas da 0 es que no hay registros... por eso este IF
If cant_paginas = 0 Then
Response.Write "No hay registros..."
Else
' Nos movemos a la página elegida
RS.AbsolutePage = pagina_actual
' Mostramos el dato de que página estamos...
%>
<FONT SIZE="+1">Página <B><%= pagina_actual %></B> de <B><%= cant_paginas %></B></FONT>
<%
' Espacios
Response.Write "<BR><BR>" & vbCrLf
'iniciamos la tabla donde mostraremos todo
Response.Write "<TABLE BORDER=""1"">" & vbCrLf
' Mostramos los titulos de las columnas... (pueden sacar ese FOR para eliminar eso)
Response.Write vbTab & "<TR>" & vbCrLf
For I = 0 To RS.Fields.Count - 1
Response.Write vbTab & vbTab & "<TD><B>"
Response.Write RS.Fields(I).Name
Response.Write "<B></TD>" & vbCrLf
Next 'I
Response.Write vbTab & "</TR>" & vbCrLf

' Hacemos el bucle mostrando los datos del registro
registro_mostrado = 0
Do While registro_mostrado < mostrar And Not RS.EOF
Response.Write vbTab & "<TR>" & vbCrLf
For I = 0 To RS.Fields.Count - 1
Response.Write vbTab & vbTab & "<TD>"
Response.Write RS.Fields(I)
Response.Write "</TD>" & vbCrLf
Next 'I
Response.Write vbTab & "</TR>" & vbCrLf

' Sumamos 1 a los mostrados
registro_mostrado = registro_mostrado + 1
' Nos movemos al próximo registro...
RS.MoveNext
Loop

'listo...
Response.Write "</TABLE>" & vbCrLf
End If

' Cerramos y limpiamos...
RS.Close
Set RS = Nothing
oConn.Close
Set oConn = Nothing

' Ahora mostramos los enlaces a las otras páginas con el resto de los registros...
If pagina_actual > 1 Then
%>
<a href="./paginar.asp?eje=30&page=<%= pagina_actual - 1 %>">[<< Anterior]</a>
<%
End If

' mostramos la paginacion por numeros de página
For I = 1 To cant_paginas
If I = pagina_actual Then
%>
<%= I %>
<%
Else
%>
<a href="./paginar.asp?eje=30&page=<%= I %>"><%= I %></a>
<%
End If
Next 'I

If pagina_actual < cant_paginas Then
%>
<a href="./paginar.asp?eje=30&page=<%= pagina_actual + 1 %>">[Próximo >>]</a>
<%
End If
'Fin...
%>
