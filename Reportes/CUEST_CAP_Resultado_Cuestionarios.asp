<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "../Seguridad/Perfil.inc" -->

<html><head><title>Listado de Respuestas de cuestionarios</title></head><body  bgproperties="fixed" background = "softgri1.jpg ">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css"><link href="css/bubbleicious.css" rel="stylesheet" type="text/css">
<!-- #INCLUDE file="CAP_titulo.inc"  -->
<% ' Asignación de los parametros recibidos a   variables
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
	  Set Ob_RS_sp = Server.CreateObject("ADODB.RecordSet")
      Set Ob_RS_cap = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_RS_cursos = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_RS_servicios = Server.CreateObject ("ADODB.RecordSet")
	  ''''''''''''''
	  '''''Observaciones
	  Set Ob_RS_Observaciones01 = Server.CreateObject("ADODB.RecordSet")
	  '''Totales finales'''''''''''''''''''''''''''''''''''''''''''''
	  Set Ob_Rs_sp_sumatoria = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_Rs_sel_sumatoria = Server.CreateObject ("ADODB.RecordSet")
	  
	  Set Ob_Rs_tot_i = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_Rs_tot_c = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_Rs_tot_s = Server.CreateObject ("ADODB.RecordSet")
	  
	  ''''''''Conneccion''''''''''''''''''''''''''''''''''''''''  
      Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor = session("IP_Servidor")
		      Ob_Conn_cap.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
	''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Sql_sp =   "exec sp_Conteo_res " & ver_Id_curso_seleccionado
	  Ob_RS_sp.Open Sql_sp, Ob_Conn_cap
	'''''''''''''''''''''''Estos dos son para mostrar los datos de la tabla concentradora  	  
	   var_query = "select * from CAPdConcentradora " & _
	              "where Id_CAPdCurso = "& ver_Id_curso_seleccionado & " and tipo = 'Preg. para Instructores' "
	  Ob_RS_cap.Open var_query, Ob_conn_cap
	   var_query1 = "select * from CAPdConcentradora " & _
	               "where Id_CAPdCurso = "& ver_Id_curso_seleccionado & " and tipo = 'Preg. para Curso' "
	   Ob_RS_cursos.Open var_query1, Ob_conn_cap
	    var_query2 = "select * from CAPdConcentradora " & _
		           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado & " and tipo = 'Preg. para Instalaciones y Servicios' "
		Ob_RS_servicios.Open var_query2, Ob_conn_cap
	  '''''''''''''''''''''''''''''''''''''''''''''''''''
	  ''''''' Este recordset solo es para mostrar los comentarios al final de todos los totales. De de la tabla de CAPcCuestInstServ
	   var_query5 = "Select Observaciones from dbo.CAPcCuestInstServ " & _
		           " where Id_CAPdCurso = " & ver_Id_curso_seleccionado 
		Ob_RS_Observaciones01.Open var_query5, Ob_conn_cap
		
		

		
		''''''''''''''''''''''''''''''''
	                            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	                                   Sql_sp_sumatoria = "exec sp_Sumatoria " & ver_Id_curso_seleccionado 
	                                   Ob_RS_sp_sumatoria.Open Sql_sp_sumatoria, Ob_conn_cap
								'''''''sentencias para mostrar los totales de c/u de las evaluaciones
	sql_tot_i = " select * from CAPdSumatoria where tipo = 'Preg. para Instructores' and Id_CAPdCurso = " & ver_Id_curso_seleccionado
			Ob_Rs_tot_i.Open sql_tot_i, Ob_conn_cap
	''''''''
	sql_tot_c = " select * from CAPdSumatoria where tipo = 'Preg. para Curso' and Id_CAPdCurso = " & ver_Id_curso_seleccionado
			Ob_Rs_tot_c.Open sql_tot_c, Ob_conn_cap
	''''''''
	sql_tot_s = " select * from CAPdSumatoria where tipo = 'Preg. para Instalaciones y Servicios' and Id_CAPdCurso = " & ver_Id_curso_seleccionado
			Ob_Rs_tot_s.Open sql_tot_s, Ob_conn_cap									 
								'''''Estas sentencias son para mostrar los totales de las tres evaluaciones
	                            Sql_sel_sumatoria = "select * from CAPdSumatoria  where tipo = 'Total General'" '& _
	                                '  "where Id_CAPdCurso = " & ver_Id_curso_seleccionado
	                              Ob_Rs_sel_sumatoria.Open Sql_sel_sumatoria, Ob_conn_cap
	                            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
	<br>
	<table width="786" border="1" align="center"><tr>
    <td width="776"><div align="center"><strong>EVALUACIÓN DEL INSTRUCTOR</strong></div></td>
    </tr></table>
	<!--   TABLA PARA MOSTRAR LAS PREGUNTAS HACIA EL INSTRUCTOR  -->
	<table border="1" align="center" >
	<tr bgcolor="#3CA0BD"> 
    <td width="273"><font color="#FFFFFF">PREGUNTA</font></td>
    <td width="88"><font color="#FFFFFF">EXCELENTE</font></td>
	<td width="72"><font color="#FFFFFF">BUENO</font></td>
    <td width="85"><font color="#FFFFFF">REGULAR</font></td>
	<td width="107"><font color="#FFFFFF">DEFICIENTE</font></td>
	<td width="90"><font color ="#FFFFFF">NULO</font></td>
	<td width="100"><font color ="#FFFFFF">TOTAL DE ALUMNOS</font></td>
	<td width="111"><font color ="#FFFFFF">RESULTADO</font></td>
    </tr>
    <% do until Ob_RS_cap.Eof %>
    <tr> 
	   <td><%= Ob_RS_cap ("Pregunta") %> </td>
       <td><%= Ob_RS_cap ("Excelente")%> </td>
	   <td><%= Ob_RS_cap("Bueno") %></td>
       <td><%= Ob_RS_cap ("Regular") %> </td>
	   <td><%= Ob_RS_cap ("Deficiente") %> </td>
	   <td><%= Ob_RS_cap ("Nulo") %> </td>
	   <td><%= Ob_RS_cap ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_RS_cap ("Excelente") * 4 
	     var2 =  Ob_RS_cap ("Bueno") * 3
		 var3 = Ob_RS_cap ("Regular") * 2
		 var4 = Ob_RS_cap ("Deficiente") * 1
		 var5 = Ob_RS_cap ("Nulo") * 0 
		 var6 = Ob_RS_cap ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_RS_cap.MoveNext
	LOOP
	
  Ob_RS_cap.Close
 'Ob_Conn_cap.Close %></table>
 <!-- Totales del instrucotr -->
     <!-- TABLA PARA MOSTRAR LOS TOTALES DEL INSTRUCTOR -->

   	<table border="1" align="center" >
	<tr bgcolor="#000000"> 
	<td width="273"><font color="#FFFFFF">Total</font></td>
    <td width="88"><font color="#FFFFFF">T. Excelente</font></td>
    <td width="72"><font color="#FFFFFF">T. Bueno</font></td>
	<td width="85"><font color="#FFFFFF">T. Regular</font></td>
    <td width="107"><font color="#FFFFFF">T. Deficiente</font></td>
	<td width="90"><font color="#FFFFFF">T. Nulo</font></td>
	<td width="100"><font color ="#FFFFFF">T. Respuestas</font></td>
	<td width="111"><font color ="#FFFFFF">Resultado</font></td>
    </tr>
    <% do until Ob_Rs_tot_i.Eof %>
    <tr> 
       <td><%= Ob_Rs_tot_i ("CAPdSumatoria")%> </td>	  
       <td><%= Ob_Rs_tot_i ("Excelente")%> </td>
	   <td><%= Ob_Rs_tot_i("Bueno") %></td>
       <td><%= Ob_Rs_tot_i ("Regular") %> </td>
	   <td><%= Ob_Rs_tot_i ("Deficiente") %> </td>
	   <td><%= Ob_Rs_tot_i ("Nulo") %> </td>
	   <td><%= Ob_Rs_tot_i ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_Rs_tot_i ("Excelente") * 4 
	     var2 =  Ob_Rs_tot_i ("Bueno") * 3
		 var3 = Ob_Rs_tot_i ("Regular") * 2
		 var4 = Ob_Rs_tot_i ("Deficiente") * 1
		 var5 = Ob_Rs_tot_i ("Nulo") * 0 
		 var6 = Ob_Rs_tot_i ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_Rs_tot_i.MoveNext
	LOOP
  'Ob_Rs_tot_i.Close
  'Ob_Conn_cap.Close 
  %>
  </table>

<br><br><hr>


<!-- TABLA PARA MOSTRAR LAS PREGUNTAS HACIA EL CURSO  -->

	<br>
	<table width="786" border="1" align="center"><tr>
    <td width="776"><div align="center"><strong>EVALUACIÓN DEL CURSO</strong></div></td>
    </tr></table>
  
	<table border="1" align="center" >
	<tr bgcolor="#3CA0BD"> 
    <td width="273"><font color="#FFFFFF">PREGUNTA</font></td>
    <td width="88"><font color="#FFFFFF">EXCELENTE</font></td>
	<td width="72"><font color="#FFFFFF">BUENO</font></td>
    <td width="85"><font color="#FFFFFF">REGULAR</font></td>
	<td width="107"><font color="#FFFFFF">DEFICIENTE</font></td>
	<td width="90"><font color ="#FFFFFF">NULO</font></td>
	<td width="100"><font color ="#FFFFFF">TOTAL DE ALUMNOS</font></td>
	<td width="111"><font color ="#FFFFFF">RESULTADO</font></td>
    </tr>
    <% do until Ob_RS_cursos.Eof %>
    <tr> 
	   <td><%= Ob_RS_cursos ("Pregunta") %> </td>
       <td><%= Ob_RS_cursos ("Excelente")%> </td>
	   <td><%= Ob_RS_cursos("Bueno") %></td>
       <td><%= Ob_RS_cursos ("Regular") %> </td>
	   <td><%= Ob_RS_cursos ("Deficiente") %> </td>
	   <td><%= Ob_RS_cursos ("Nulo") %> </td>
	   <td><%= Ob_RS_cursos ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_RS_cursos ("Excelente") * 4 
	     var2 =  Ob_RS_cursos ("Bueno") * 3
		 var3 = Ob_RS_cursos ("Regular") * 2
		 var4 = Ob_RS_cursos ("Deficiente") * 1
		 var5 = Ob_RS_cursos ("Nulo") * 0 
		 var6 = Ob_RS_cursos ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_RS_cursos.MoveNext
	LOOP
	
  Ob_RS_cursos.Close %></table>
  <!-- Totales del curso  --->
  
  	<table border="1" align="center" >
	<tr bgcolor="#000000"> 
	<td width="273"><font color="#FFFFFF">Total</font></td>
    <td width="88"><font color="#FFFFFF">T. Excelente</font></td>
    <td width="72"><font color="#FFFFFF">T. Bueno</font></td>
	<td width="85"><font color="#FFFFFF">T. Regular</font></td>
    <td width="107"><font color="#FFFFFF">T. Deficiente</font></td>
	<td width="90"><font color="#FFFFFF">T. Nulo</font></td>
	<td width="100"><font color ="#FFFFFF">T. Respuestas</font></td>
	<td width="111"><font color ="#FFFFFF">Resultado</font></td>
    </tr>
    <% do until Ob_Rs_tot_c.Eof %>
    <tr> 
	  <td><%= Ob_Rs_tot_c ("CAPdSumatoria")%> </td>
       <td><%= Ob_Rs_tot_c ("Excelente")%> </td>
	   <td><%= Ob_Rs_tot_c("Bueno") %></td>
       <td><%= Ob_Rs_tot_c ("Regular") %> </td>
	   <td><%= Ob_Rs_tot_c ("Deficiente") %> </td>
	   <td><%= Ob_Rs_tot_c ("Nulo") %> </td>
	   <td><%= Ob_Rs_tot_c ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_Rs_tot_c ("Excelente") * 4 
	     var2 =  Ob_Rs_tot_c ("Bueno") * 3
		 var3 = Ob_Rs_tot_c ("Regular") * 2
		 var4 = Ob_Rs_tot_c ("Deficiente") * 1
		 var5 = Ob_Rs_tot_c ("Nulo") * 0 
		 var6 = Ob_Rs_tot_c ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_Rs_tot_c.MoveNext
	LOOP
  'Ob_Rs_tot_c.Close
  'Ob_Conn_cap.Close 
  %>
  </table>

<br><br><hr>

<!-- TABLA PARA MOSTRAR LAS PREGUNTAS HACIA LAS INSTALACIONES Y LOS SERVICIOS -->

	<br>
	<table width="786" border="1" align="center"><tr>
    <td width="776"><div align="center"><strong>EVALUACIÓN DE LAS INSTALACIONES Y SERVICIOS</strong></div></td>
    </tr></table>
	
	<table border="1" align="center" >
	<tr bgcolor="#3CA0BD"> 
    <td width="273"><font color="#FFFFFF">Total</font></td>
    <td width="88"><font color="#FFFFFF">T. Excelente</font></td>
    <td width="72"><font color="#FFFFFF">T. Bueno</font></td>
	<td width="85"><font color="#FFFFFF">T. Regular</font></td>
    <td width="107"><font color="#FFFFFF">T. Deficiente</font></td>
	<td width="90"><font color="#FFFFFF">T. Nulo</font></td>
	<td width="100"><font color ="#FFFFFF">T. de Alumnos</font></td>
	<td width="111"><font color ="#FFFFFF">Resultado</font></td>
    </tr>
    <% do until Ob_RS_servicios.Eof %>
    <tr> 
	   <td><%= Ob_RS_servicios ("Pregunta") %> </td>
       <td><%= Ob_RS_servicios ("Excelente")%> </td>
	   <td><%= Ob_RS_servicios("Bueno") %></td>
       <td><%= Ob_RS_servicios ("Regular") %> </td>
	   <td><%= Ob_RS_servicios ("Deficiente") %> </td>
	   <td><%= Ob_RS_servicios ("Nulo") %> </td>
	   <td><%= Ob_RS_servicios ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_RS_servicios ("Excelente") * 4 
	     var2 =  Ob_RS_servicios ("Bueno") * 3
		 var3 = Ob_RS_servicios ("Regular") * 2
		 var4 = Ob_RS_servicios ("Deficiente") * 1
		 var5 = Ob_RS_servicios ("Nulo") * 0 
		 var6 = Ob_RS_servicios ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_RS_servicios.MoveNext
	LOOP
	
  Ob_RS_servicios.Close %></table>
  
  <!-- Tabla totales de Instalaciones y servicios  --->
    	<table border="1" align="center" >
	<tr bgcolor="#000000"> 
	<td width="202"><font color="#FFFFFF">Total</font></td>
    <td width="85"><font color="#FFFFFF">T. Excelente</font></td>
    <td width="78"><font color="#FFFFFF">T. Bueno</font></td>
	<td width="87"><font color="#FFFFFF">T. Regular</font></td>
    <td width="96"><font color="#FFFFFF">T. Deficiente</font></td>
	<td width="94"><font color="#FFFFFF">T. Nulo</font></td>
	<td width="120"><font color ="#FFFFFF">T. Respuestas</font></td>
	<td width="120"><font color ="#FFFFFF">Resultado</font></td>
    </tr>
    <% do until Ob_Rs_tot_s.Eof %>
    <tr> 
	  <td><%= Ob_Rs_tot_s ("CAPdSumatoria")%> </td>
       <td><%= Ob_Rs_tot_s ("Excelente")%> </td>
	   <td><%= Ob_Rs_tot_s("Bueno") %></td>
       <td><%= Ob_Rs_tot_s ("Regular") %> </td>
	   <td><%= Ob_Rs_tot_s ("Deficiente") %> </td>
	   <td><%= Ob_Rs_tot_s ("Nulo") %> </td>
	   <td><%= Ob_Rs_tot_s ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_Rs_tot_s ("Excelente") * 4 
	     var2 =  Ob_Rs_tot_s ("Bueno") * 3
		 var3 = Ob_Rs_tot_s ("Regular") * 2
		 var4 = Ob_Rs_tot_s ("Deficiente") * 1
		 var5 = Ob_Rs_tot_s ("Nulo") * 0 
		 var6 = Ob_Rs_tot_s ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_Rs_tot_s.MoveNext
	LOOP
  'Ob_Rs_tot_s.Close
  'Ob_Conn_cap.Close 
  %>
  </table>

<br>
<!-- --------------------------------------------------------------------------- -->
<!-- --------------------------------------------------------------------------- -->

<!-- TABLA PARA MOSTRAR LOS TOTALES  -->
<br>
   <table width="786" border="1" align="center">
   <tr> 
    <td><div align="center"><strong>PROMEDIO GENERAL DEL CURSO</strong></div></td>
    </tr></table>

  	<table border="1" align="center" >
	<tr bgcolor="#3CA0BD"> 
    <td width="273"><font color="#FFFFFF">Total</font></td>
    <td width="88"><font color="#FFFFFF">T. Excelente</font></td>
    <td width="72"><font color="#FFFFFF">T. Bueno</font></td>
	<td width="85"><font color="#FFFFFF">T. Regular</font></td>
    <td width="107"><font color="#FFFFFF">T. Deficiente</font></td>
	<td width="90"><font color="#FFFFFF">T. Nulo</font></td>
	<td width="100"><font color ="#FFFFFF">T. de Alumnos</font></td>
	<td width="111"><font color ="#FFFFFF">Resultado</font></td>
    </tr>
    <% do until Ob_Rs_sel_sumatoria.Eof %>
    <tr> 
	   <td><%= Ob_Rs_sel_sumatoria ("CAPdSumatoria")%> </td>
       <td><%= Ob_Rs_sel_sumatoria ("Excelente")%> </td>
	   <td><%= Ob_Rs_sel_sumatoria("Bueno") %></td>
       <td><%= Ob_Rs_sel_sumatoria ("Regular") %> </td>
	   <td><%= Ob_Rs_sel_sumatoria ("Deficiente") %> </td>
	   <td><%= Ob_Rs_sel_sumatoria ("Nulo") %> </td>
	   <td><%= Ob_Rs_sel_sumatoria ("Totalxpregunta") %></td>
	  
	  <% var1 =  Ob_Rs_sel_sumatoria ("Excelente") * 4 
	     var2 =  Ob_Rs_sel_sumatoria ("Bueno") * 3
		 var3 = Ob_Rs_sel_sumatoria ("Regular") * 2
		 var4 = Ob_Rs_sel_sumatoria ("Deficiente") * 1
		 var5 = Ob_Rs_sel_sumatoria ("Nulo") * 0 
		 var6 = Ob_Rs_sel_sumatoria ("Totalxpregunta")
		 
	     var_tot = var1 + var2 + var3 + var4 + var5 
	if Var6 <> 0 then 
		 var_tot = var_tot / var6
    else
	     var_tot = 0		 
    end if
	    %>		 
 	   <td><%=var_tot%></td>
	  </tr>
	 <% Ob_Rs_sel_sumatoria.MoveNext
	LOOP
  'Ob_Rs_sel_sumatoria.Close
  'Ob_Conn_cap.Close 
  %>
  </table>

<br><br><hr>
<!-- Comentarios 01010101010101010101010101010101010101010101010101010101010101010101 -->
<table width="786" border="1" align="center"><tr>
    <td width="776"><div align="center"><strong>COMENTARIOS DE LOS ALUMNOS ACERCA 
        DEL CURSO, DEL INSTRUCTOR Y DE LAS INSTALACIONES</strong></div></td>
    </tr></table>
	
	<table border="1" align="center" >
	<tr bgcolor="#3CA0BD"> 
    <td width="273"><font color="#FFFFFF">Comentarios</font></td>
    
    </tr>
    <% do until Ob_RS_Observaciones01.Eof %>
    <tr> 
	   <td><%= Ob_RS_Observaciones01 ("Observaciones") %> </td>
       	  </tr>
	 <%Ob_RS_Observaciones01.MoveNext
	LOOP
	
  Ob_RS_Observaciones01.Close %></table>
  
</body></html>
<!-- #INCLUDE File="../Error/errores.inc" -->