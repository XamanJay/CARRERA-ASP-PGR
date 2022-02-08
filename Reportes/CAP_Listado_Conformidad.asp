<html><head><title>Listado Alumnos Inscritos</title></head>
<body background = "softgri1.jpg ">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">
<!-- #INCLUDE file="CAP_titulo.inc"  -->
<% ' Asignación de los parametros a variables
  ver_Id_curso_seleccionado = request.QueryString("vp_id_curso_seleccionado")
  ver_curso_seleccionado = request.Querystring("vp_curso_seleccionado")
  par_instructor_curso = request.Querystring("par_instructor_curso")
  par_NombreInstructor = request.Querystring("par_NInstructor")
  ver_sede = request.Querystring("vp_curso_sede")
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
<%
  Response.Write("DIPLOMAS ENTREGADOS DEL CURSO:   "+  ver_curso_seleccionado + "<br>")
  Response.Write("LUGAR: "+ver_sede+ "<br>")
  Response.Write("FECHA Y HORA: "+ "<br>")
  Response.Write("INSTRUCTOR:                         "+ par_NombreInstructor+ "<br>")
  %>
    <table width="60%" border="1" align="center" >
    <tr bgcolor="#3CA0BD"> 
      
    <td width="10%">No.</td>
    <td width="80%"><font color="#000000">NOMBRE DEL ALUMNO</font></td>
	<td width="10%">CONFORMIDAD</td>
	                 
    </tr>
    <% 
	NCont = 0
	do until (Ob_RS_cap.Eof) AND (NCont Mod 23 = 0)
	NCont = NCont + 1
	%>
    <tr valign="bottom"> 
      <td height="25"><%= NCont%></td>   
	  <% IF Ob_RS_cap.Eof THEN %>
         <td height="25">&nbsp;&nbsp;</td>
	  <% ELSE %>
         <td height="25"><%= Ob_RS_cap ("ApellidoPaterno")%>&nbsp;&nbsp; <%=Ob_RS_cap("ApellidoMaterno")%>&nbsp;&nbsp;<%=Ob_RS_cap("Nombre")%></td>
	  <% END IF %>
       <td height="25"></td>
    </tr>
    <%
	if (not Ob_RS_cap.Eof) then
	    Ob_RS_cap.MoveNext
    end IF		

  LOOP
  Ob_RS_cap.Close
  Ob_Conn_cap.Close
  '333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
  %>
  </table>

  <% 
  Response.Write("<H3>___________________________</H3>")
  Response.Write("<H3>    Firma del Instructor</H3>")
 'Response.Redirect("MixTextoDatos1.asp")
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''%>
  
	<body>
</html>
