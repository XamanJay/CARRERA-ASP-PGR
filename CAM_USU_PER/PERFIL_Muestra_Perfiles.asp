<!-- Include File = "../Session/ActiveSession.inc" -->
<html><head><title>Armazón de Resultados</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head><body background="../softgri1.jpg">
<link href="../Estilo.css" rel="stylesheet" type="text/css">
<FORM name="ARMA" action="123.asp" method="post" >

<%
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))

 nombre_perfil    = TRIM(Request.Form("nombre_perfil"))
  descrip_perfil    = TRIM(Request.Form("descrip_perfil"))
   
 %>
  <CENTER>
    <H2 >PERFILES</H2>  
  </CENTER>
 <a href="Definicion_Perfiles.asp">CREAR PERFILES</a> <BR>
 <BR>
<%SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

 
   
CadenadeConsulta = "SELECT * FROM CARcPerfilGrupo" & _ 
                  " WHERE CARcPerfilGrupo LIKE '%"& nombre_perfil &"%'" & _
                  " AND CARcDescripcion LIKE '%"& descrip_perfil &"%' AND Des_Esp = 1 AND Activo = 1 ORDER BY CARcPerfilGrupo " 
						 
'response.write 						 CadenadeConsulta & "<---->" 
'response.Write  v_ODBC 
''''response.end 
						 
	  
   
        Record.Open CadenadeConsulta, Coneccion		
 %>
  <center>
  
  <table class="SL" border="1"  >
  <tr class="Datos" >
  <td width="113"  ><div align="center" ><strong>Acción</strong></span>.</div></td>
  <td width="91"><div align="center" ><strong>NOMBRE DEL PERFIL .</span></strong></div></td>
  <td width="119" align="center" >  <strong>DESCRIPCIÓN DEL PERFIL</strong>  </td>
 
   

  <% 
  do until Record.Eof 
  %>
  		<tr>
		  <td ><div ="center">
     		<A target="Informacion" HREF="PERFIL_Modificacion_Perfiles.asp?Id_CARcPerfilGrupo=<%= Record ("Id_CARcPerfilGrupo") %>&HABILITAR=1">Modificar</A>
			</div></td>
		  <td ><%= Record ("CARcPerfilGrupo") %></td>
		  <td ><div align="center"><%= Record ("CARcDescripcion") %></div></td>
     
  <% 
  Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close 
  %>
  
  </table>
  
</center>

</FORM></body></html>
