<html><head><title>Armazón de Resultados</title>
<style type="text/css">
<!--
.Estilo5 {color: #FFFFFF; font-weight: bold; }
.Estilo6 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<body background="softgri1.jpg">
<FORM name="ARMA" action="123.asp"  method="post" >
<% 
   ParamId  = Request.QueryString ("ParamId")
   Id_Persona = Request.QueryString ("Id_Persona")
   parametroTabla = Request.QueryString("parametroTabla")
   ''''response.write ParamId & "<----"
   SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET RS_Insert = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Record    = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="&Session("IP_SERVER")&";DATABASE="+ SESSION("V_ODBC") +";UID="+ SESSION("UserID") +";PWD="+ SESSION("Password")
 '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CadenadeConsulta="SELECT * FROM BK_"&parametroTabla&" WHERE Id_"&parametroTabla&"= "&ParamId
 '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
response.write CadenadeConsulta
'response.end   					  
   Record.Open CadenadeConsulta, Coneccion
    %>
   <center>    
  <table width="763" border="1" class="SL">
  <tr>
  <td class="Encabezados" width="544"><div align="center"><span class="Estilo5">DETALLE</span></div></td>
  <td class="Encabezados" width="544"><div align="center"><span class="Estilo5">OPERACION</span></div></td>
  <td class="Encabezados" width="821"><div align="center"><span class="Estilo5">FECHA DE LA OPERACIÓN</span></div></td>
    <% do until Record.Eof %>
  <tr class="DATOS">
  <td> <div align="center">	<a href="Modificaciones_BK_<%=parametroTabla%>.asp?Id_Persona=<%= Id_Persona%>&ParamId=<%=ParamId %>&parametroTabla=<%= parametroTabla%>&parametroID=<%= ID%>&TOper=VER&HISTORIAL=1000&FECHA_OPERACION_HISTORIAL=<%= Record("FECHA_OPERACION_HISTORIAL")%>"><font size="2">Detalle del Registro</font></a>	</div></td>

  <td> <div align="center"><%= Record("OPERACION")%>  </div></td>
  <td> <div align="center"><%= Record("FECHA_OPERACION_HISTORIAL") %>  </div></td>

  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table></center></FORM></body></html>
