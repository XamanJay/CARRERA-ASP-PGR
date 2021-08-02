<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta https-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Lista de Presuntos</title>
<script>
function window_open(pagina, edo, cvepres)
{
var pagina = pagina
var edo = edo
var cvepres = cvepres

var newWindow;
var urlstring = pagina + "?NumEdo="+ edo +  "&Cve_Del=" + cvepres
newWindow = window.open(urlstring,'detalle','height=500,width=600,toolbar=no,minimize=no,status=yes,memubar=no,location=no,scrollbars=yes')
}
</SCRIPT>
</head>

<body background="fondo.jpg">
<%
if request.form <> "" then
	rdTipo = request.form("rdTipo")
	rdOrden = request.form("rdOrden")
	rdGen = request.Form("rdGen")
	NumEdo = request.Form("hdnNumEdo")
	rdEst = request.form("rdEst")
	sPaterno = request.form("txtPaterno")
	sMaterno = request.form("txtMaterno")
	sNombre = request.form("txtNombre")	
else
	rdTipo = request.queryString("Tipo")
	rdOrden = request.form("rdOrden")
	rdGen = request.Form("rdGen")
	NumEdo = request.Form("hdnNumEdo")
	rdEst = request.form("rdEst")
	sPaterno = request.form("txtPaterno")
	sMaterno = request.form("txtMaterno")
	sNombre = request.form("txtNombre")	
end if	



'response.write UCASE(rdEst)
Set Conex = Server.CreateObject ("ADODB.Connection")
Set rsDet = Server.CreateObject ("ADODB.RecordSet") %>

<!-- #INCLUDE File="Conecta.inc" -->
<%
rSql = "Select * from Delincuente "
rSql = rSql + " WHERE Estado = "& NumEdo &" "

'UCASE(rdEst)
Select case rdEst
	Case "Profugo"
		Criterio2 = "And Capturado = ('"&rdEst&"')  "
	Case "Capturado"
		Criterio2 = "And Capturado = ('"&rdEst&"')  "
	Case "Ambos"
		Criterio2 = "And Capturado Not in ('Baja')"
End Select

Select case UCASE(rdGen)
	Case "MASCULINO"
		Criterio = "And Genero = '"& rdGen &"' "
	Case "FEMENINO"
		Criterio = "And Genero = '"& rdGen &"' "
	Case "AMBOS"
		Criterio = ""
End Select

	Criterio3=""
	if sPaterno <> "" then
		Criterio3 = Criterio3 + "And Paterno like '%"&sPaterno&"%'  "
	end if

	if sMaterno <> "" then
		Criterio3 = Criterio3 + "And Materno like '%"&sMaterno&"%'  "
	end if

	if sNombre <> "" then
		Criterio3 = Criterio3 + "And Nombre like '%"&sNombre&"%'  "
	end if


Select Case rdOrden
	Case "Paterno"
		Orden = "Order by Paterno"
	Case "Nombre"
		Orden = "Order by Nombre"
End Select
rSql = rSql + Criterio2 + Criterio + Criterio3 + Orden

'response.write rSql
rsDet.open rSql, Conex

if not rsDet.eof then

ArrayDet = rsDet.GetRows
Set rsDet = Nothing
Set Conex = Nothing

'Obtengo la página a mostrar de 
'la querystring

ipag = CInt(Request.QueryString("P"))
'response.write(pag)

iRegsPorPag = 9
'I, J se utilizan para recorrer el ArrayDet
Dim I, J 
'Total de páginas y la página que queremos mostrar
Dim iPaginas, iPagActual
'Total de registros, registro en que empezamos y registro en que terminamos
Dim iTotal, iComienzo, iFin

'Hallo el total de registros devueltos
iTotal = UBound(ArrayDet,2)+1
'Calculo el numero de páginas que tenemos
iPaginas = (iTotal \ iRegsPorPag)
'Si daba decimales, añado una más
'para mostrar los últimos registros
if iTotal mod iRegsPorPag > 0 then
	iPaginas = iPaginas + 1
end if
'Si no es una página válida, comienzo en la primera
if iPag < 1 then
	iPag = 1
end if
'Si es una página mayor al nº de páginas, comienzo en la última
if iPag > iPaginas then
	iPag = iPaginas
end if
Response.Write("Página " & iPag & " de " & iPaginas & " (" & iTotal & " registros)<br>")
'Calculo el índice donde comienzo:
iComienzo = (iPag-1)*iRegsPorPag
'y donde termino:
iFin = iComienzo + (iRegsPorPag-1)
'Si no tengo suficientes registros restantes,
'voy hasta el final
if iFin > UBound(ArrayDet, 2) then
	iFin = UBound(ArrayDet, 2)
end if

'Pinto la tabla
'Response.Write("<TABLE BORDER=""1"">")
'for I= iComienzo to iFin
'	Response.Write("<TR>")
'	for J=0 to UBound(ArrayDet,1)
'		Response.Write("<TD>" & vector(J,I) & "</TD>")
	
'	next
'next
Response.Write("</TABLE>")

If rdTipo = "Imagen" Then%>	
  	<Center>
  	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="60%" id="AutoNumber1">
  	<% top=15
  	For I= iComienzo to iFin%>
  		<tr>
    	<td width="33%"><a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
    	<img src="<%=ArrayDet(7,i)%>" width="136" height="155"></a>
    <%
    	If ArrayDet(10,i)="Capturado" or ArrayDet(10,i)="CAPTURADO" Then %>
    		<center>
    		<Table  cellpadding="0" cellspacing="0"  style="position: absolute; left: 20%; top: <%=top%>%; border-collapse: collapse" bordercolor="#111111">
    		<tr>
    		<td align="center">&nbsp;</td>
    		</tr>
    		<tr>
    		<td align="center">
    		<p align="center"><b><font face="Arial" color="#FF0000" size="5">
    		CAPTURADO</font></b></td>
    
    		</tr>
    		<tr>
    		<td align="center">&nbsp;</td>
    		</tr>
    		</Table></center>
    	<%End If %>
    	<BR>
   		<%=ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%><BR>  		
    	</td>
    	<td width="33%">   		
    	<%i=i+1
    	If i <= iFin Then%>
    		<a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
    		<img src="<%=ArrayDet(7,i)%>" width="136" height="155"></a>
    		<%	If ArrayDet(10,i)="Capturado" or ArrayDet(10,i)="CAPTURADO" Then %>
    				<Table  cellpadding="0" cellspacing="0"  style="position: absolute; left: 40%; top: <%=top%>%; border-collapse: collapse" bordercolor="#111111">
    				<tr>
    				<td>&nbsp;</td>
    				</tr>
    				<tr>
    				<td>
    				<p align="center"><b><font face="Arial" color="#FF0000" size="5">
    				CAPTURADO</font></b></td>
        				</tr>
    				<tr>
    				<td>&nbsp;</td>
    				</tr>
    				</Table>
    			<% End If %>
    			<BR>
    			<%=ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%><BR>
    		<%End If%>
   			</td>
    		<td width="34%">
    		<%i=i+1
    		If i <= iFin Then%>
    		<a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
    			<img src="<%=ArrayDet(7,i)%>" width="136" height="155"></a>
    			<%
    			If ArrayDet(10,i)="Capturado" or ArrayDet(10,i)="CAPTURADO" Then %>
    				<Table  cellpadding="0" cellspacing="0"  style="position: absolute; left: 60%; top: <%=top%>%;">
    				<tr>
    				<td height="19">&nbsp;</td>
    				</tr>
    				<tr>
    				<td height="29">
    				<p align="center"><b><font face="Arial" color="#FF0000" size="5">
   	 				CAPTURADO</font></b></td>
       				</tr>
    				<tr>
    				<td height="18"></td>
    				</tr>
    				</Table>
    			<% End If %>
	   			<BR>
    			<%=ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%><BR>
    		<%End If%>
    		</td>
  			</tr>
  		<%top=top+30
  		Next%>
  		</Table>
	<%Else%>
		<CENTER><font face = "arial" color = "4459BF" size = "2" >ÍNDICE</font></center>
		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="60%" id="AutoNumber1" height="45%">
  		<%For I= iComienzo to iFin%>
  			<tr>
    			<td valign="Middle" aling="Center" height="15%">
    				<img src="viñeta.gif" width="15" height="15">    		
    				<a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
					<font face = "arial" size = 2><%="  "+ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%></font></a>
    			</td>
    			<td valign="Middle" aling="Center" height="15%">
    				<%i=i+1
    				If i <= Ubound(ArrayDet,2) Then%>
    					<img src="viñeta.gif" width="15" height="15">
		    				<a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
    					<font face = "arial" size = 2><%="  "+ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%></font></a>
    				<%End If%>
   				</td>
    			<td valign="Middle" aling="Center" height="15%">
    				<%i=i+1
    				If i <= Ubound(ArrayDet,2) Then%>
    					<img src="viñeta.gif" width="15" height="15">
		    				<a style="text-decoration: none; font-weight:700" href="javascript:window_open('<%= "DetalleDelin01.asp"%>','<%= ArrayDet(1,i)%>','<%=ArrayDet(0,i)%>');" >
    					<font face = "arial" size = 2><%="  "+ArrayDet(3,i)+ " " + ArrayDet(4,i) +" "+ArrayDet(5,i)%></font></a>
    				<%End If%>
    			</td>
  			</tr>
  		<%Next%>
  		</Table>
  	<%End If%>
  <BR><BR>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111"  id="AutoNumber1">
	<tr>
		<td>
		<%
		if iPag > 1 then
			'Response.Write("<center><A HREF=""ListaDelin01.asp?P="&iPag-1&"&Tipo="&rdTipo&">Anterior</A></center>&nbsp;&nbsp;")%>
			<center><A HREF = "ListaDelin02.asp?P=<%=iPag-1%>&Tipo=<%=rdTipo%>&rdOrden=<%=rdOrden%>&rdGen=<%=rdGen%>&hdnNumEdo=<%=nNumEdo%>&rdEst=<%=rdEst%>&txtPaterno=<%=sPaterno%>&txtMaterno=<%=sMaterno%>&txtNombre=<%=sNombre%>">Anterior</a></center>
		<% end if
		if iPag < iPaginas then
			'Response.Write("<center><A HREF=""ListaDelin01.asp?P="&iPag+1&""">Siguiente</A></center>&nbsp;")
			iPag = iPag+1%>
			<center><A HREF = "ListaDelin02.asp?P=<%=CStr(iPag)%>&Tipo=<%=rdTipo%>&rdOrden=<%=rdOrden%>&rdGen=<%=rdGen%>&hdnNumEdo=<%=nNumEdo%>&rdEst=<%=rdEst%>&txtPaterno=<%=sPaterno%>&txtMaterno=<%=sMaterno%>&txtNombre=<%=sNombre%>">Siguiente</a></center>			
		<%end if%>

		</td>
	</tr>
  </Table>
</Center>
<%Else%>
	<p align="center"><b>No existen delincuentes con el criterio seleccionado</b></p>
	<%Set rsDet = Nothing
	Set Conex = Nothing
End If%> 
<br><br>
<center><input type = "button" value = "Regresar" onClick = "history.back();"></center>
</body>

</html>