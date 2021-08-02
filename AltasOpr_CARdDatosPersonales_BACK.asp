<html>

<head>
<title>Opera Altas</title>
</head>

<body bgproperties="fixed" background="softgri1.jpg" topmargin="0" leftmargin="0">
<!--#INCLUDE FILE="ADOVBS.INC"-->
<!--#include file="DSUpload.inc"-->

<%'******************** SE EFECTUA EL ALMACENAMIENTO DEL ARCHIVO AL SERVIDOR Y DE LA RUTA DEL MISMO *********************
    v_ODBC  = SESSION("ODBC")
on error resume next

'check if there is an error, if so then inform user of error. 
private sub CheckErr
	if Err <> 0 then
		' Display error message
		Response.Write "<P style='BACKGROUND-COLOR: #a52a2a'><FONT color=#ffffff>"
		Response.Write "&nbsp;&nbsp;" & "ERROR:  " & Err.description & "</FONT></P>"
		' Clear error
		Err.Clear
	end if
end sub

'create upload component instance
set objUpload = Server.CreateObject("Dundas.Upload")

	'initialize the root & temp folders names
	'Direc = Request.ServerVariables("APPL_PHYSICAL_PATH")

	'RootFolderName = Request.ServerVariables("APPL_PHYSICAL_PATH") + "ArchivosAcuerdos\"
	'RootFolderName = Direc + "_PRUEBA_Documentacion\"

	RootFolderName = "D:\AppsDesa\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\"
'	RootFolderName = "D:\AppsDesa\COPLADII\"+ session("odbc") +"\Desarrollo\Datos\"
	TempFolderName = RootFolderName & objUpload.GetUniqueName
'	response.write TempFolderName

	'don't use unique file names in the beginning
	objUpload.UseUniqueNames = false

	'upload data till first uploaded file is encountered
	set NextFile = objUpload.GetNextFile	
	call CheckErr

	'set the various properties specified by the user
	if IsEmpty(objUpload.Form("UniqueNames")) then
		objUpload.UseUniqueNames = false
	else
		'if "unique file names" are selected set the flag
		objUpload.UseUniqueNames = true

		'change the NextFile object's name to be unique 
		if not(NextFile is nothing) then	
			NextFile.FileName = objUpload.GetUniqueName & "_" &	NextFile.FileName			
		end if
	end if 

'-------------------------------------------------------------------------------------------------------------------------
Nombre_Archivo_Original = NextFile.FileName
pos = InStrRev(Nombre_Archivo_Original, ".") +1
Ext = MID(Nombre_Archivo_Original, pos)
Nombre_Archivo = MID(Nombre_Archivo_Original, 1, pos-2) 
'&"_"&DAY(DATE)&"_"&MONTH(DATE)&"_"&YEAR(DATE)&"_"&HOUR(TIME)&"_"&MINUTE(TIME)&"_"&SECOND(TIME)&"."&Ext


NextFile.FileName = Nombre_Archivo_Original
'-------------------------------------------------------------------------------------------------------------------------


	'set the temp. folder name
	if not(IsEmpty(objUpload.Form("FolderName"))) then
		TempFolderName = RootFolderName & objUpload.Form.Item("FolderName")
	end if 
	'create temp folder
'	RESPONSE.WRITE TempFolderName
	objUpload.DirectoryCreate TempFolderName
	call CheckErr
	
	'upload the rest of the files one by one
	do until NextFile is nothing
		'save file into the temp. folder
		NextFile.Save TempFolderName
	
		'get Nextfile object
		set NextFile = nothing
		set NextFile = objUpload.GetNextFile

		'exit the loop in case of error	
		if Err <> 0 then
			call CheckErr
			exit do
		end if
	loop
	
	
''	var_pstabla = objUpload.Form("tabla_original")
	var_pstabla = "CARDDATOSPERSONALES"
''	var_psODBC = objUpload.Form("ODBC")
	var_psODBC = "CarreraPGR"
	var_pagina_catalogo = objUpload.Form("catalogo")
'	objUpload.Form("ID")
	
%>	
	
	
	
	
	
<%


 'var_pagina_regreso = "'Altas_"+ TRIM(var_pstabla)  +".asp'"


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
'   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ session("odbc") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
 Sql = "Select * From "& var_pstabla 
'response.write ">>>"+var_pstabla

 Ob_Rs.Open Sql, Ob_Conn
%>


<% total_campos = Ob_RS.FIELDS.COUNT %>


<%
campos1 = ""
campos2 = ""

idArea = objUpload.Form("Par_idArea")

Usuario = Session("Usuario")
NombreArea = Session("NombreArea")

'Path = "https://localhost/"+session("CarreraDocs")+"/" + Nombre_Archivo_Original
Path = Nombre_Archivo_Original
'response.write path
'Path = "https://"+SESSION("IP_SERVER")+"/"+session("CarreraDocs")+"/" + Nombre_Archivo
FOR x = 0 TO total_campos-1
	REDIM Matriz2 (x)


    IF (mid(Ob_RS(X).NAME,1,3) <> "Id_") THEN
	   if (UCASE(Ob_RS(X).NAME) <> "FOTO") THEN
	   ' AND (UCASE(Ob_RS(X).NAME) <> "FECHA_GRAB_ARCH") AND (UCASE(Ob_RS(X).NAME) <> "HORA_GRAB_ARCH")THEN
			Matriz2(x) = objUpload.Form(Ob_RS(x).NAME)
			campos1 = campos1+Ob_RS(X).NAME+","
			campos2 = campos2+"'"+Matriz2(x)+"',"
	   end if		
	ELSE
          

		IF UCASE(Ob_RS(x).NAME)<>"ID_"+ var_pstabla THEN
			Matriz2(x) = objUpload.Form(Ob_RS(x).NAME)
			campos1 = campos1+Ob_RS(x).NAME+","
'			campos2 = campos2+Matriz2(x)+","
			campos2 = campos2+"'"+Matriz2(x)+"',"
			
		END IF
	END IF


IF UCASE(Ob_RS(X).NAME) = "FOTO" THEN
			campos1 = campos1+Ob_RS(x).NAME+","
			campos2 = campos2+"'"+Path+"',"
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
	Sqla = "Insert Into CARdDatosPersonales ("&campos1&") "
	Sqla = Sqla + " Values ("& campos2&")"

response.write (Sqla)
'response.end

Ob_Rs.Open Sqla, Ob_Conn
'Set objUpload = nothing
var_pagina_regreso = "'Altas_"& TRIM(var_pstabla)  &".asp?idArea=" & idArea & "'"

%>

<CENTER><H1>Tus datos ya fueron registrados</H1>
<Input Type="button" Value="Capturar nuevo registro" OnClick="location.href=<%= var_pagina_regreso%>" >
<BR>

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