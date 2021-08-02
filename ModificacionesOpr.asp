<html>

<head>
<title>Opera Modificaciones</title>
</head>

<body bgproperties="fixed" background="softgri1.jpg" topmargin="0" leftmargin="0">
<!--#INCLUDE FILE="ADOVBS.INC"-->
<%

 var_pstabla = Request.Form("tabla_original")

 var_psODBC = Request.Form("ODBC")

 var_pagina_regreso = "'Modificaciones_"+ TRIM(var_pstabla)  +".asp'"

 var_pagina_catalogo = Request.Form("catalogo")
 
 lnkIdCarros = Request.Form("lnkIdCarros")
 
 
%>



  

 <%
     if Session("Contador")<>0 then
		b= Session("Elementos")(Session("Contador"))
	end if
	
  %>

<BR><BR><BR>

<%	
 Set Ob_Conn = Server.CreateObject("ADODB.Connection")
 Set Ob_RS = Server.CreateObject("ADODB.RecordSet")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ var_psODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

 Sql = "Select * From "& var_pstabla 

 Ob_Rs.Open Sql, Ob_Conn
%>


<% total_campos = Ob_RS.FIELDS.COUNT %>


<%
campos1 = ""
campos2 = ""

FOR x = 0 TO total_campos-1

	REDIM Matriz2 (x)

    IF (mid(Ob_RS(X).NAME,1,3) <> "Id_") THEN
		Matriz2(x) = REQUEST.FORM(Ob_RS(x).NAME)

		campos1 = Ob_RS(X).NAME+"="
		campos2 = ("'"+Matriz2(x)+"',")		
		campos3 = campos3 & campos1 & campos2
		
	ELSE
          
		var_combo = "cbx"+TRIM(MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) )
		Matriz2(x) = REQUEST.FORM(var_combo)


		IF UCASE(Ob_RS(x).NAME) <> UCASE("Id_") + UCASE(var_pstabla) THEN
			campos1 = Ob_RS(x).NAME+"="
			campos2 = ("'"+Matriz2(x)+"',")
			campos3 = campos3 & campos1 & campos2
		END IF
	END IF
%>

  
<%NEXT%> 

<%campos3=Mid(campos3,1,len(campos3)-1)%>


<%
'If Not Ob_Rs.Eof Then 
%>

<!--<center><H1><b>Los valores que acaba de introducir ya se encuentran registrados en el sistema</b></H1></center>-->
<!--<center><Input Type="button" Value="Capturar nuevo registro para la tabla <%= MID((var_pstabla),4,LEN(var_pstabla)) %>" OnClick="location.href=<%= var_pagina_regreso%>" ></CENTER>-->


<%'Else

Ob_Rs.Close

	Sqla = "UPDATE " & var_pstabla & " SET " & campos3 & " WHERE Id_" & var_pstabla & " = " & lnkIdCarros
'response.write(Sqla)
'response.end

Ob_Rs.Open Sqla, Ob_Conn
%>

<CENTER><H1>Tus datos ya fueron modificados</H1>
<!--Input Type="button" Value="Modificar nuevo registro para la tabla <%= MID((var_pstabla),4,LEN(var_pstabla)) %>" OnClick="location.href=<%= "'Modificaciones_" & var_pstabla & ".asp'"%>" -->
<BR>

<%
'If trim(var_pagina_catalogo) <> "" then %>
<%'15 Dic	If ""  <> "" then %>
<BR>
<Input Type="button" Value="Modificar nuevo registro" OnClick="location.href=<%= var_pagina_regreso%>">

<%'15 Dic End if%>
<%'End if
Set Ob_Rs= Nothing
Set Ob_Conn= Nothing

%>





 </body>
</html>