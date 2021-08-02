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
</head><body background="softgri1.jpg">
<link href="Estilo.css" rel="stylesheet" type="text/css">
<FORM name="ARMA" action="123.asp" method="post" >

<%
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))

 numero_procedimiento = TRIM(Request.Form("numero_procedimiento"))
 
Subprocuraduria = Session("Subprocuraduria") 
Delegacion = Session("Delegacion")
   
 %>
  <CENTER>
    <span class="Estilo1">Seguimiento a procedimientos    </span>  
              </CENTER>
  
<%  SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

       	  CadenadeConsulta = "SELECT * FROM SEGUIMIENTO_PROCEDIMIENTOS " & _ 
	                         " WHERE NumeroProcedimiento LIKE '%"& numero_procedimiento & "%'" & _
							 " AND Id_CARcSubprocuradurias = "&Subprocuraduria&"  AND Id_CARcDG_o_Delegaciones ="&Delegacion
				    		 
							 
							
  						 
'''response.write 	 CadenadeConsulta
'response.end 
		  
        Record.Open CadenadeConsulta, Coneccion		
 %>
  
<BR><BR>
  <center>
  
  
  
  
  
  
  <table width="687" border="1" class="SL"  >
  <tr class="Datos" >
  <td width="113"  ><div align="center" ><strong></strong></span></div></td>
  <td width="237"><div align="center" ><strong>Número de procedimiento</span></strong></div></td>
  <td width="166"  ><div align="center" ><strong>Status</strong></div></td>
  <td width="166"  ><div align="center" ><strong>RFC de la persona</strong></div></td>
 
     
     
  
  
 
  

  <% do until Record.Eof %>
  <tr>
  <td valign="middle" align="center" >
     
<!--<center><input type="button" value="Ver Reporte" name="btnInscribir" onClick=" location.href= '  REP1_REPORTE_INDIVIDUAL.asp?Id_CARdDatosPersonales=<%'=Record ("Id_CARdDatosPersonales")%>' " ></center>-->

 <A target="mainFrame" HREF="Modificaciones_Especiales_CARdProcedimientos.asp?Id_Persona= <% =Record ("Id_CARdDatosPersonales") %>&ParamId= <% =Record ("Id_CARdProcedimientos") %>&parametroTabla=CARdProcedimientos&parametroODBC=SIIFP_CARRERA&TOper=MODI">Editar</A>
	
	</td>
    <td ><div align="left"> <%= Record ("NumeroProcedimiento")  %> </div></td>
  <td ><%= Record ("CARcEstatusProcedimiento") %></td>
  <td ><%= Record ("RFC") %></td>
  
  
   
  
   
  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table>
</center>

</FORM></body></html>
