<%On Error Resume Next
'response.write "1"
%>

<!-- Include File = "../Seguridad/Perfil.inc" -->

<html><head><title>Listado Alumnos Inscritos</title></head>
<body background = "softgri1.jpg ">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">
<!-- #INCLUDE file="CAP_titulo.inc"  -->
<% ' Asignación de los parametros a variables
  Response.Write("<H3><center>REGISTRO DE ASISTENTES AL CURSO </H3>")
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
	'============= impression de Registro de Asitentes
	 %>
	      
<table border="1" align="center" >
  <tr bgcolor="#3CA0BD"> 
    <td width="74"><font color="#000000">No. </font></td>
    <td width="74"><font color="#000000">AREA</font></td>
    <td width="122"><font color="#000000">NOMBRE DEL ALUMNO</font></td>
    <!--td width="76"><font color="#FFFFFF">RFC</font></td -->
    <td width="176"><font color="#000000">PUESTO</font></td>
    <td width="176"><font color="#000000">E-MAIL</font></td>
    <td width="176"><font color="#000000">MICRO</font></td>
  </tr>
  <%
	 NCont = 0 
	do until (Ob_RS_cap.Eof) AND (NCont Mod 10 = 0)
	 NCont = NCont + 1
	 %>
  <tr> 
    <td height="30" ><%= NCont %> </td>
  <% IF not Ob_RS_cap.Eof THEN %>
       <td height="30"><%= Ob_RS_cap ("UnidadAdscripcion") %> </td>
       <td height="30"><%= Ob_RS_cap ("ApellidoPaterno")%>&nbsp;&nbsp; <%=Ob_RS_cap("ApellidoMaterno")%>&nbsp;&nbsp;<%=Ob_RS_cap("Nombre")%></td>
       <!--td><%= Ob_RS_cap("RFC") %></td -->
       <td height="30"><%= Ob_RS_cap ("CARdEncargoActual") %> </td>
   <% ELSE %>
          <td height="30"><%= " "%> </td>
          <td height="30"><%= " " %> </td>
          <td height="30"><%= " "%> </td>
  <% END IF %>
   <td height="30"><%= " " %> </td>
    <td height="30"><%= " "%> </td>
  </tr>
  <%
  	if (not Ob_RS_cap.Eof) then
	    Ob_RS_cap.MoveNext
    end IF		
  LOOP

  Ob_RS_cap.Close
  Ob_Conn_cap.Close 
  '111111111111111111111111111111111111111111111111111111
'   Response.Write _
 '      "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName & """>"  

  
  '11111111111111111111111111111111111111111111111111111%>
</table>
  <%
  Response.Write("<H3>___________________________</H3>")
  Response.Write("<H3>    Firma del Instructor</H3>")
  


 Response.Redirect("MixTextoDatos1.asp")
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''%>
  
	<body>
</html>
<!-- #INCLUDE File="../Error/errores.inc" -->
