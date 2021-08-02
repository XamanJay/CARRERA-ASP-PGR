<html><head><title>Listado Alumnos Inscritos</title></head>
<body background = "softgri1.jpg ">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">
<!-- #INCLUDE file="CAP_titulo.inc"  -->
<% 
  ' Asignación de los parametros a variables
  ver_Id_curso_seleccionado = request.QueryString("vp_id_curso_seleccionado")
  ver_curso_seleccionado = request.Querystring("vp_curso_seleccionado")
  ver_sede = request.Querystring("vp_curso_sede")
  par_instructor_curso = request.Querystring("par_instructor_curso")
  par_ins_capacitadora = request.Querystring("par_ins_capacitadora")
  par_ins_aula = request.QueryString("par_ins_aula")
  vp_curso_horario = request.QueryString("vp_curso_horario")
  vp_curso_fecha_inicio = request.QueryString("vp_curso_fecha_inicio")
  vp_curso_fecha_fin = request.QueryString("vp_curso_fecha_fin")
  
  tipo_rep = request.QueryString("tipo_rep")' a esta variable le asigno el parametro de tipo de reporte
   'response.write(tipo_rep)
  'response.write(par_ins_capacitadora)
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      Set Ob_Conn_cap = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_cap = Server.CreateObject ("ADODB.RecordSet")
      Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor = session("IP_Servidor")
		  Ob_Conn_cap.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
		  
	 var_query = "select * from vst_Listado_inscritos " & _
	           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado
			   
	Ob_RS_cap.Open var_query, Ob_conn_cap
	%>
<table border = "1">
	<tr><td width="164">Lugar</td><td width="658"><%=par_ins_aula%></td></tr>
	<tr><td width="164">Instalaciones</td ><td width="658"><%=ver_sede%></td></tr>
	<tr><td width="164">Nombre del curso</td ><td width="658"><%=ver_curso_seleccionado%></td></tr>
	<tr><td width="164">Instructor</td><td width="658"><%=par_instructor_curso %></td></tr>
	<tr><td width="164">Institución que imparte</td><td width="658"><%= par_ins_capacitadora%></td></tr>
	<tr><td width="164">Perido del curso</td><td width="658">del: <%= vp_curso_fecha_inicio%> al: <%= vp_curso_fecha_fin%></td></tr>
	<tr><td width="164">Horario</td><td width="658"><%= vp_curso_horario%></td></tr>
	</table>
	
<%'=TIME()%>
	<br>
	<%
	 select case tipo_rep
	  case 1 %>
	      <table border="1" align="center" >
    <tr bgcolor="#3CA0BD"> 
    <td width="74"><font color="#FFFFFF">AREA</font></td>
    <td width="122"><font color="#FFFFFF">NOMBRE DEL ALUMNO</font></td>
	<td width="76"><font color="#FFFFFF">RFC</font></td>
    <td width="176"><font color="#FFFFFF">PUESTO ACTUAL</font></td>
    </tr>
    <% do until Ob_RS_cap.Eof %>
    <tr> 
	   <td><%= Ob_RS_cap ("UnidadAdscripcion") %> </td>
       <td><%= Ob_RS_cap ("ApellidoPaterno")%>&nbsp;&nbsp; <%=Ob_RS_cap("ApellidoMaterno")%>&nbsp;&nbsp;<%=Ob_RS_cap("Nombre")%></td>
	   <td><%= Ob_RS_cap("RFC") %></td>
       <td><%= Ob_RS_cap ("CARdEncargoActual") %> </td>
	  </tr>
    <% Ob_RS_cap.MoveNext
  LOOP
  Ob_RS_cap.Close
  Ob_Conn_cap.Close 
  '111111111111111111111111111111111111111111111111111111
  Dim sRTF, sFileName, sConn, varTexto
   Response.Buffer = True
' crea el archivo de salida RTF
   Dim fso, MyFile
   Set fso = server.CreateObject("Scripting.FileSystemObject")
   sFileName = "Reporte_Salida.txt"
   Set MyFile = fso.createTextFile(Server.MapPath(".") & "\" & sFileName, True)
'  texto extra
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Server.MapPath("Reporte_Base.txt"), 1)
'  Inicializa el archivo de salida a RTF
  ' MyFile.WriteLine("")
      MyFile.WriteLine("{\rtf1")
'  Encabezado y pie de página
 '''''''''''''''''''
	  Set rs = Server.CreateObject ("ADODB.RecordSet")
	     Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor = session("IP_Servidor")
		  Ob_Conn_cap.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
	 var_query1 = "select * from vst_Listado_inscritos " & _
	           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado
	rs.Open var_query1, Ob_conn_cap
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   varTexto = f.ReadAll
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		rs.movefirst
		cad_sustitucion=""
			do until rs.Eof
				cad_sustitucion=cad_sustitucion+rs("UnidadAdscripcion")+" "+rs("ApellidoPaterno").value+" "+rs("ApellidoMaterno").value+" "+rs("Nombre").value+","+CHR(13)+CHR(10)
				rs.MoveNext                                                                                  
			loop
		cad_sustitucion1=cad_sustitucion
		varTexto = replace(varTexto,"<opcion>",cad_sustitucion1)
    MyFile.WriteLine(varTexto) 
' Cierra el archivo de machote
    f.Close
    Set f=Nothing
   rs.Close
   Set rs = Nothing
   '  Cierra el archivo de saliMyFile.WriteLine("{\rtf1")
   MyFile.WriteLine("}")
   MyFile.Close
   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName & """>"  

  
  '11111111111111111111111111111111111111111111111111111%>
  </table>
  
<%  CASE 2 %>

    <table width="534" border="1" align="center" >
    <tr bgcolor="#3CA0BD"> 
      
    <td width="148"><font color="#FFFFFF">AREA</font></td>
	<td width="111"><font color="#FFFFFF">NOMBRE DEL ALUMNO</font></td>
    <td width="81"><font color="#FFFFFF">&nbsp;</font></td>
     <td width="76"><font color="#FFFFFF">&nbsp;</font></td>
       <td width="84"><font color="#FFFFFF">&nbsp;</font></td>
    </tr>
    <% do until Ob_RS_cap.Eof %>
    <tr> 
      
    <td><%= Ob_RS_cap ("UnidadAdscripcion") %></td>
	  <td><%= Ob_RS_cap ("ApellidoPaterno")%>&nbsp;&nbsp; <%=Ob_RS_cap("ApellidoMaterno")%>&nbsp;&nbsp;<%=Ob_RS_cap("Nombre")%></td>
      <td></td>
	  <td></td>
	  <td></td>
    </tr>
    <% Ob_RS_cap.MoveNext
  LOOP
  Ob_RS_cap.Close
  Ob_Conn_cap.Close
  '2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
Dim sRTF2, sFileName2, sConn2, varTexto2
   Response.Buffer = True
' crea el archivo de salida RTF
   Dim fso2, MyFile2
   Set fso2 = server.CreateObject("Scripting.FileSystemObject")
   sFileName2 = "SalidaRTF.rtf"
   Set MyFile2 = fso2.createTextFile(Server.MapPath(".") & "\" & sFileName2, True)
'  texto extra
   Set fs2=Server.CreateObject("Scripting.FileSystemObject")
   Set f2=fs2.OpenTextFile(Server.MapPath("Reporte.txt"), 1)
'  Inicializa el archivo de salida a RTF
   MyFile2.WriteLine("{\rtf1")
'  Encabezado y pie de página
   MyFile2.WriteLine("{\header\pard\qc{\fs50 " & _
                    " PGR   COPLADII   DGFP\par}{\fs18\chdate\par}\par\par}")
      MyFile2.WriteLine("{\footer\pard\qc\brdrt\brdrs\brdrw10\brsp100" & _
                    "\fs18 Page " & _
                    "{\field{\*\fldinst PAGE}{\fldrslt 1}} of " & _
                    "{\field{\*\fldinst NUMPAGES}{\fldrslt 1}} \par}")
				%>
 <%
 
 
	  		  
 '''''''''''''''''''
	  Set rs2 = Server.CreateObject ("ADODB.RecordSet")
	     Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor2 = session("IP_Servidor")
		  Ob_Conn_cap.Open="Server="&IP_Servidor2&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
	 var_query12 = "select * from vst_Listado_inscritos " & _
	           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado
	rs2.Open var_query12, Ob_conn_cap
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   varTexto2 = f2.ReadAll
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		rs2.movefirst
		cad_sustitucion2=""
			do until rs2.Eof
				cad_sustitucion2=cad_sustitucion2+rs2("ApellidoPaterno").value+" "+rs2("ApellidoMaterno").value+" "+rs2("Nombre").value
				rs2.MoveNext                                                                                  
			loop
		cad_sustitucion12=cad_sustitucion2
		varTexto2 = replace(varTexto2,"<opcion>",cad_sustitucion12)
    MyFile2.WriteLine("{"& varTexto2 &"}") 
' Cierra el archivo de machote
    f2.Close
    Set f=Nothing
   rs2.Close
   Set rs2 = Nothing
   '  Cierra el archivo de salida Formato RTF 
   MyFile2.WriteLine("}")
   MyFile2.Close
   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName2 & """>"  

    '2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222 %>
  </table>
  
  <%  CASE 3 %>

    <table border="1" align="center" >
    <tr bgcolor="#3CA0BD"> 
      
    <td width="151"><font color="#FFFFFF">NOMBRE DEL ALUMNO</font></td>
	<td width="101">&nbsp; </td>
	                 
    <td width="97">&nbsp;</td>
     
    <td width="84">&nbsp;</td>
       
    <td width="85">&nbsp;</td>
	  
    <td width="80">&nbsp;</td>
    </tr>
    <% do until Ob_RS_cap.Eof %>
    <tr> 
      <td><%= Ob_RS_cap ("ApellidoPaterno")%>&nbsp;&nbsp; <%=Ob_RS_cap("ApellidoMaterno")%>&nbsp;&nbsp;<%=Ob_RS_cap("Nombre")%></td>
	   
        <td width="101"></td>
       <td width="97"> </td>
	   <td width="84"></td>
	   <td width="85"> </td>
	   <td width="80"> </td>
    </tr>
    <% Ob_RS_cap.MoveNext
  LOOP
  Ob_RS_cap.Close
  Ob_Conn_cap.Close
  '333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
Dim sRTF3, sFileName3, sConn3, varTexto3
   Response.Buffer = True
' crea el archivo de salida RTF
   Dim fso3, MyFile3
   Set fso3 = server.CreateObject("Scripting.FileSystemObject")
   sFileName3 = "SalidaRTF.rtf"
   Set MyFile3 = fso3.createTextFile(Server.MapPath(".") & "\" & sFileName3, True)
'  texto extra
   Set fs3=Server.CreateObject("Scripting.FileSystemObject")
   Set f3=fs3.OpenTextFile(Server.MapPath("Reporte.txt"), 1)
'  Inicializa el archivo de salida a RTF
   MyFile3.WriteLine("{\rtf1")
'  Encabezado y pie de página
   MyFile3.WriteLine("{\header\pard\qc{\fs50 " & _
                    " PGR   COPLADII   DGFP\par}{\fs18\chdate\par}\par\par}")
      MyFile3.WriteLine("{\footer\pard\qc\brdrt\brdrs\brdrw10\brsp100" & _
                    "\fs18 Page " & _
                    "{\field{\*\fldinst PAGE}{\fldrslt 1}} of " & _
                    "{\field{\*\fldinst NUMPAGES}{\fldrslt 1}} \par}")
				%>
 <%
 
 
	  		  
 '''''''''''''''''''
	  Set rs3 = Server.CreateObject ("ADODB.RecordSet")
	     Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor3 = session("IP_Servidor")
		  Ob_Conn_cap.Open="Server="&IP_Servidor3&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
	 var_query13 = "select * from vst_Listado_inscritos " & _
	           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado
	rs3.Open var_query13, Ob_conn_cap
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   varTexto3 = f3.ReadAll
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		rs3.movefirst
		cad_sustitucion3=""
			do until rs3.Eof
				cad_sustitucion3=cad_sustitucion3+" "+rs3("ApellidoMaterno").value+" "+rs3("Nombre").value
				rs3.MoveNext                                                                                  
			loop
		cad_sustitucion13=cad_sustitucion3
		varTexto3 = replace(varTexto3,"<opcion>",cad_sustitucion13)
    MyFile3.WriteLine("{"& varTexto3 &"}") 
' Cierra el archivo de machote
    f3.Close
    Set f=Nothing
   rs3.Close
   Set rs3 = Nothing
   '  Cierra el archivo de salida Formato RTF 
   MyFile3.WriteLine("}")
   MyFile3.Close
   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName3 & """>"  
  '333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333 %>
  </table>

  <% END SELECT 
 'Response.Redirect("MixTextoDatos1.asp")
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''%>
  
	<body>
</html>
