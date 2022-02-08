<html><head><title>Armazón de Resultados</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.Estilo1 {
	color: #000000;
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
 
 nombre = TRIM(Request.Form("nombre")) 
 ap = TRIM(REQUEST.FORM("ap"))
 am = TRIM(REQUEST.FORM("am"))
 rfc = TRIM(REQUEST.FORM("rfc"))
   
 %>
  <CENTER>
    <span class="Estilo1">PERSONAL SUSTANTIVO    </span>  
              </CENTER>
  
<%  SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

       	  CadenadeConsulta = "SELECT * FROM VISTA_DATOSPERSONALES1 " & _ 
	                         " WHERE Nombre LIKE '%"& nombre & "%'" & _
				    		 " AND ApellidoPaterno LIKE '%" & ap& "%'" & _ 
							 " AND ApellidoMaterno LIKE  '%" & am& "%'" & _ 
							 " AND RFC LIKE '%" & RFC & "%'"& _ 
							 " AND CARRERA = 1 AND Id_CARcTipoDomicilio = 1 ORDER BY ApellidoPaterno"
							 
							 
							
  						 
'''response.write 	 CadenadeConsulta
'''response.end 
		  
        Record.Open CadenadeConsulta, Coneccion		
 %>
  
<BR><BR>
  <center>
  
  
  
  
  
  
  <table width="687" border="1" class="SL"  >
  <tr class="Datos" >
  <td width="113"  ><div align="center" ><strong></strong></span></div></td>
  <td width="237"><div align="center" ><strong>NOMBRE COMPLETO</span></strong></div></td>
  <td width="166"  ><div align="center" ><strong>RFC</strong></div></td>
 
     
     
  
  
 
  

  <% do until Record.Eof %>
  <tr>
  <td valign="middle" align="center" >
     
<!--<center><input type="button" value="Ver Reporte" name="btnInscribir" onClick=" location.href= '  REP1_REPORTE_INDIVIDUAL.asp?Id_CARdDatosPersonales=<%'=Record ("Id_CARdDatosPersonales")%>' " ></center>-->

 <A target="mainFrame" HREF="REP1_REPORTE_INDIVIDUAL.asp?Id_CARdDatosPersonales= <% =Record ("Id_CARdDatosPersonales") %>&HABILITAR=1">Ver Reporte</A>

	
	</td>
    <td ><div align="left"> <%= Record ("ApellidoPaterno")  %>&nbsp;&nbsp; <%= Record ("ApellidoMaterno") %>&nbsp;&nbsp;<%= Record ("Nombre") %> </div></td>
  <td ><%= Record ("RFC") %></td>
  
  
   
  
   
  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table>
</center>

</FORM></body></html>
