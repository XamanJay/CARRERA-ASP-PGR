
<html><head><title>Confirmación</title>
<style type="text/css">
<!--
.Estilo1 {color: #990000}
-->
</style>
</head>

<body>
<HR>
<center>
<%QUITAR =  REQUEST("QUITAR")
IF QUITAR = "SI" THEN 

%>
<label>
-- <span class="Estilo1">Registro Eliminado</span> --</label>
<BR><HR>
<%ELSE %>
<BR><HR>
<%END IF %>



<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a target="mainFrame" href="Consultas_CARdDatospersonales_RED.asp" >Nueva Busqueda </a>
  
</p>
</center>
<HR>
</body>
</html>
