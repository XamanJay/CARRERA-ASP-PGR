<html><head><title>De comprometido a ejercido</title><meta https-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body background="softgri1.jpg">
<div align="center"><label><strong><font size="4">REGISTROS DE PERSONAL</font></strong></label></div>
<form action="" method="post" >
<%
      Set Ob_Conn_pre = Server.CreateObject ("ADODB.Connection")
     Set Ob_RS_pre = Server.CreateObject ("ADODB.RecordSet")
      Ob_Conn_pre.Provider="sqloledb"
      IP_Servidor = session("IP_Servidor")
      Ob_Conn_pre.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")
  	  
	  var_query = "select * from CARdDatosPersonales" 
	 
	' response.write(var_query)
	  Ob_RS_pre.Open var_query, ob_conn_pre        
%>
<!-- Esto es para enviar como parametros el Id_ de la slcUnidad_ad y del inpejercicio despues de probar los cambio a hidden -->
<!--<input type="hidden" name="slcUnidad_ad" value=<% ' =request.form("slcUnidad_ad")%>>
<input type="hidden" name="inpejercicio" value=<% '=request.form("inpejercicio")%>> -->

<table  border="1" align="center" font size="2" color="#000080" >
<tr>
    <th width="112">GENERALES</th> 
    <th>A. PATERNO</th>
	<th width = "250">A. MATERNO</th>
	<th>NOMBRE</th>  
	
 </tr>
<% do until Ob_RS_pre.Eof %>
  <tr> 


<TD><a href="https://"+ session("IP_SERVER") +"/carrerapgr/CARR_detalle_generales.asp?Id_CARdDatosPersonales=<%=Ob_RS_pre("Id_CARdDatosPersonales")%>">Visualizar</a>

     <input type="hidden" name="Id_PSGdMovimientos" value="<%= Ob_RS_pre ("Id_CARdDatosPersonales") %>">
    
    
	<td><font size="2" color="#000080"><%= OB_RS_pre ("ApellidoPaterno") %> &nbsp;</font></td>
	<td width = "250"> <font size="2" color="#000080"><%= OB_RS_pre ("ApellidoMaterno") %> &nbsp;</font></td>
	<td><font size="2" color="#000080"><%= OB_RS_pre ("Nombre") %> &nbsp;</font></td>
	
      </tr>
	<% Ob_RS_pre.MoveNext
  LOOP
  Ob_RS_pre.Close
  Ob_Conn_pre.Close %>
 </table>
</form></body></html>