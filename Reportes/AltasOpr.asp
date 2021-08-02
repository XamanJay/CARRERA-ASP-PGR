<html>

<head>
<title>Opera Altas</title>
</head>

<body bgproperties="fixed" background="softgri1.jpg" topmargin="0" leftmargin="0">
<!--#INCLUDE FILE="ADOVBS.INC"-->
<%
 no_solicitud = Day(Now)&Month(Now)&Year(Now)&Hour(Time)&Minute(Time)&Second(Time) 

 var_psflag = Request.Form("Flag")

 var_pstabla = Request.Form("tabla_original")
 var_psODBC = Request.Form("ODBC")

 'var_pagina_regreso = "'Altas_"+ TRIM(var_pstabla)  +".asp'"
 var_pagina_regreso_ICA = "'ConsultasFiltro_Inscripcion.asp'"

 'var_pagina_regreso_CC = "'Consultas_CAPdConvocatoria_1.asp'"
 'var_pagina_regreso_CC = "'Consultas_CAPcAreas.asp'"
 var_pagina_regreso_CC = "'https://"+session("IP_SERVER")+"/cursos/'"

 var_pagina_catalogo = Request.Form("catalogo")
 
 var_idCurso = Request.Form("Id_CAPdCurso")  
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
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ var_psODBC +";UID=cursos;PWD=cursos"

 Sql = "Select * From "& var_pstabla 

 Ob_Rs.Open Sql, Ob_Conn
%>


<% total_campos = Ob_RS.FIELDS.COUNT %>


<%
campos1 = ""
campos2 = ""

FOR x = 0 TO total_campos-1

'response.write (Ob_RS(X).NAME & " --- " & Ob_RS(X) & "<BR><BR>")
	REDIM Matriz2 (x)

    IF (mid(Ob_RS(X).NAME,1,3) <> "Id_") AND (mid(Ob_RS(X).NAME,1,3) <> "CT_" AND (Ob_RS(X).NAME) <> "Id_CAPdCurso" AND (Ob_RS(X).NAME) <> "CAPNo_Solicitud") THEN
		Matriz2(x) = REQUEST.FORM(Ob_RS(x).NAME)

		campos1 = campos1+Ob_RS(X).NAME+","
		campos2 = campos2+"'"+Matriz2(x)+"',"
	ELSE
          
		If (UCASE(Ob_RS(x).NAME)<>"ID_"+ UCASE(var_pstabla) AND (Ob_RS(X).NAME) <> "Id_CAPdCurso" AND (Ob_RS(X).NAME) <> "CAPNo_Solicitud")  Then
		
			var_combo = "cbx"+TRIM(MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) )
			Matriz2(x) = REQUEST.FORM(var_combo)

			campos1 = campos1+Ob_RS(x).NAME+","
			campos2 = campos2+"'"+Matriz2(x)+"',"
		end if
		
			If 	(Ob_RS(X).NAME = "Id_CAPdCurso") THEN

				campos1 = campos1+Ob_RS(x).NAME+","
				campos2 = campos2+"'"+var_idCurso+"',"
			END IF

			If 	(Ob_RS(X).NAME = "CAPNo_Solicitud") THEN

				campos1 = campos1+Ob_RS(x).NAME+","
				campos2 = campos2+"'"+no_solicitud+"',"
			END IF
		
	END IF
%>

<%NEXT%> 

<%campos1=Mid(campos1,1,len(campos1)-1)%>

<%campos2=Mid(campos2,1,len(campos2)-1)%>

<%
'If Not Ob_Rs.Eof Then 
%>

<!--<center><H1><b>Los valores que acaba de introducir ya se encuentran registrados en el sistema</b></H1></center>-->
<!--<center><Input Type="button" Value="Capturar nuevo registro para la tabla <%= MID((var_pstabla),4,LEN(var_pstabla)) %>" OnClick="location.href=<%= var_pagina_regreso%>" ></CENTER>-->


<%'Else

Ob_Rs.Close

	Sqla = "Insert Into "& var_pstabla & " ("&campos1&") "
	Sqla = Sqla + " Values ("& campos2&")"

	'response.write (Sqla)
	'response.end

	Ob_Rs.Open Sqla, Ob_Conn
%>

<CENTER><H1>Tus datos ya fueron registrados <strong><%= vl_nombre_usuario%></strong></H1>
<BR><BR>
<CENTER><H1>Tus número de solicitud es: <font color="#0033CC"> <%= no_solicitud%> </font> </H1>

<% IF var_psflag = "Altas_ICA" THEN %>
<Input Type="button" Value="Capturar nuevo registro" OnClick="location.href=<%= var_pagina_regreso_ICA%>" >
<BR>

<%ELSE%>
<Input Type="button" Value="Consultar convocatorias" OnClick="top.location.href=<%= var_pagina_regreso_CC%>">
<BR>

<%END IF%>

<%
'If trim(var_pagina_catalogo) <> "" then %>
<%If ""  <> "" then %>
<BR>
<Input Type="button" Value="Regresar a <%= b%>" OnClick="location.href='Operador_2.ASP'   ">

<%End if%>
<%'End if
Set Ob_Rs= Nothing
Set Ob_Conn= Nothing

%>





 </body>
</html>