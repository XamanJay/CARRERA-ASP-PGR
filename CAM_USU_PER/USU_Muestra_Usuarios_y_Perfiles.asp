<!-- Include File = "../Session/ActiveSession.inc" -->
<html><head><title>Armazón de Resultados</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.Estilo1 {
	color: #00CCCC;
	font-weight: bold;
	font-size: 18px;
}
-->
</style>
</head><body background="../softgri1.jpg">
<link href="../Estilo.css" rel="stylesheet" type="text/css">
<FORM name="ARMA" action="123.asp" method="post" >

<%
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))

 'usuario    = TRIM(Request.Form("usuario"))
  responsable    = TRIM(Request.Form("responsable"))
   Id_CARcPerfilGrupo    = TRIM(Request.Form("Id_CARcPerfilGrupo"))
 %>
  <CENTER>
    <span class="Estilo1">USUARIOS    </span>  
              </CENTER>
 <a href="Definicion_Usuarios_Finales.asp">CREAR USUARIOS</a> <BR><BR>

 
<%SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

  IF  Id_CARcPerfilGrupo = 0 THEN
   
	  CadenadeConsulta = "SELECT ISNULL (CARcUSR,'USUARIO DESHABILITADO')AS USUARIO, * FROM VISTA_INHABILITACION_USUARIOS " & _ 
	                     " WHERE Nombre LIKE '%"& responsable &"%' AND CARRERA = 1 ORDER BY CARcUSR" 
'''response.write  CadenadeConsulta

  ELSE 
  
     	  CadenadeConsulta = "SELECT ISNULL (CARcUSR,'USUARIO DESHABILITADO')AS USUARIO, * FROM VISTA_INHABILITACION_USUARIOS " & _ 
	                         " WHERE Nombre LIKE '%"& responsable &"%'" & _
				    		 " AND Id_CARcPerfilGrupo = "& Id_CARcPerfilGrupo &" AND CARRERA = 1 ORDER BY CARcUSR"
  END IF 
  						 
'response.write 						 CadenadeConsulta
'response.end 
						 
	  
   
        Record.Open CadenadeConsulta, Coneccion		 %>
        
  <%If Record.Eof Then%>
  		<script>
  			alert('No existen datos relacionados con los criterios de búsqueda especificados.');
  		</script>
		<%
  		Response.End
  	End If%>        

  <A HREF="Passwordd.asp?Id_CARcUSR=<%= Record ("Id_CARcUSR") %>&HABILITAR=0">CAMBIO DE CONTRASEÑA</A>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <A HREF="Filtro_usuarios.asp?Id_CARcUSR=<%= Record ("Id_CARcUSR") %>&HABILITAR=0">BITACORA USUARIOS</A>
<BR><BR>
  <center>
  
  <table class="SL" border="1"  >
  <tr class="Datos" >
  <td width="113"  ><div align="center" ><strong>Acción</strong></span>.</div></td>
  <td width="91"><div align="center" ><strong>USUARIO.</span></strong></div></td>
  <td width="178"  ><div align="center" ><strong>PERFIL</span></strong></div></td>
  <td width="140" ><div align="center" ><strong>MICRO</span></strong></div></td>
     <td width="119" ><div align="left"><strong>NOMBRE DE LA PERSONA RESPONSABLE.</span></strong></div></td>
     <td width="119" ><div align="left"><strong>DESCRIPCIÓN DEL USUARIO.</span></strong></div></td>

   <td width="116"  ><div align="center" >
     <p align="left"><strong>STATUS </strong></p>
     <p align="left"><strong>DEL USUARIO</span></strong></p>
   </div></td>
  
  
 
  <% do until Record.Eof %>
  <tr>
  <td >
      <!--target="mainFrame" --->
	  <%  Act = Record ("Activo")
  IF Act = 0 THEN
      leyenda = "NO ACTIVO"  %>
	  	  <A target="Informacion" HREF="USU_Habilitar_usuario.asp?Id_CARcUSR=<%= Record ("Id_CARcUSR") %>&HABILITAR=1">Habilitar</A>
<%
  ELSE 
      Leyenda = "ACTIVO" %>
	  	  	  <A target="Informacion" HREF="USU_Habilitar_usuario.asp?Id_CARcUSR=<%= Record ("Id_CARcUSR") %>&HABILITAR=0">Deshabilitar</A>

<%  END IF 	  %>
<BR> <A target="Informacion" HREF="Modificaciones_CARcUSR.asp?TOper=VER&Id_CARcUSR=<%= Record ("Id_CARcUSR") %>">Ver</A>
<% IF  Record ("USUARIO") <> "USUARIO DESHABILITADO"  THEN %>
<BR> <A target="Informacion" HREF="Modificaciones_CARcUSR.asp?TOper=MOD&Id_CARcUSR=<%= Record ("Id_CARcUSR") %>">Modificar</A>
<% END IF %>


	</td>
<!--  <td ><%'= Record ("CARcUSR") %></td>
-->  <td ><div align="center"><%= Record ("USUARIO") %></div></td>
  <td ><%= Record ("CARcPerfilGrupo") %></td>
  
  <td ><%= Record ("Micro") %></td>
  <td ><%= Record ("Nombre") %></td>
  <td ><%= Record ("Descripcion_usuario") %></td>

  <td ><div align="center"><%= Leyenda %></div></td>
   
  
   
  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table>
</center>

</FORM></body></html>
