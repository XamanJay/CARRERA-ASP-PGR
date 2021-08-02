<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html><head><title>Untitled Document</title><meta https-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.Estilo2 {
	color: #CCCCCC;
	font-size: 11px;
	font-family: Tahoma;
}
.Estilo5 {color: #CCCCCC;
     font-size: 8px;
	font-family: Tahoma;}
-->
</style></head>

<body background="Multimedia/imagenes/CARR_superior_011.jpg" topmargin="0">
<%
Set CONECTA = Server.CreateObject("ADODB.Connection")
Set RESULTADOS = Server.CreateObject("ADODB.RecordSet")
   CONECTA.PROVIDER="sqloledb"
   CONECTA.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
 CONSULTA = "Select * from VISTA_ENCABEZADOS_SUB_DELEG where Id_CARcUSR = " & Session("IdLogin")
 RESULTADOS.Open CONSULTA, CONECTA
 
 CARcSubprocuradurias = RESULTADOS("CARcSubprocuradurias") 
 CARcDG_o_Delegaciones = RESULTADOS("CARcDG_o_Delegaciones") 
%>

<div align="right">
<%  
   Id_CARcSubprocuradurias = RESULTADOS("Id_CARcSubprocuradurias")
   IF Id_CARcSubprocuradurias = 0 THEN
      CARcSubprocuradurias = "" 
   ELSE	 
       CARcSubprocuradurias = CARcSubprocuradurias
   END IF
	 %>
    <span class="Estilo5"><strong><%RESPONSE.WRITE CARcSubprocuradurias %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
</div>

<div align="right">
   <%  
   Id_CARcDG_o_Delegaciones = RESULTADOS("Id_CARcDG_o_Delegaciones")
   IF Id_CARcDG_o_Delegaciones = 0 THEN
      CARcDG_o_Delegaciones = "" 
   ELSE	 
       CARcDG_o_Delegaciones = CARcDG_o_Delegaciones
   END IF
	 %>
    <span class="Estilo5"><strong><%RESPONSE.WRITE CARcDG_o_Delegaciones %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
</div>

<div align="right">
    <span class="Estilo5"><strong><%=Session("UserLogin")%></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
</div>


<!----------==============----------==============----------==============----------==============----------==============-->
<div align="right">
<A target='mainFrame' class="Estilo5 " HREF="CAM_USU_PER/Passwordd.asp?Id_CARcUSR=<%= RESULTADOS ("Id_CARcUSR") %>&HABILITAR=0">CAMBIO DE CONTRASEÑA</A>
</div>
<!----------==============----------==============----------==============----------==============----------==============-->
<!--<%

IF  Session("TipoUSR") = 4   THEN %>

<div align="right"><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
    <a href="CAM_USU_PER/cam_usu.asp" target='mainFrame' class="Estilo5 ">Cambio de Usuario</a>
</div>

	<% ELSEIF  Session("TipoUSR") = 5  THEN %>
	<div align="right">
		<a href="CAM_USU_PER/cam_usu_sub.asp" target='mainFrame' class="Estilo5 ">Cambio de Usuario</a>
	</div>
	<% ELSEIF  Session("TipoUSR") = 6  THEN %>
	<div align="right">
		<a href="CAM_USU_PER/cam_usu_sub.asp" target='mainFrame' class="Estilo5 ">Cambio de Usuario</a>
	</div>
	<% ELSEIF  Session("TipoUSR") = 7  THEN %>
	<div align="right">
		<a href="CAM_USU_PER/cam_usu_sub.asp" target='mainFrame' class="Estilo5 ">Cambio de Usuario</a>
	</div>

  <% ELSE %>

 <div align="right">
   <%Response.Write("-----")  ''' ingreso un usuario comun %>
</div>
   
    
<% END IF %>

-->











<div align="right"><BR><BR>
<!--    <a href="PerfilesAcceso/Default.asp" target='mainFrame' class="Estilo2 ">Admon. Usuarios</a>
--></div>
</body>
</html>
