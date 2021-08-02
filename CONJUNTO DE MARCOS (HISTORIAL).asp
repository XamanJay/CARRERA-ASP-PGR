<%
Id_CARdDatosPersonales = TRIM(REQUEST("Id_Persona"))
Id_Persona     = TRIM(REQUEST("Id_Persona"))
ParamId        = TRIM(REQUEST("ParamId"))
tabla_original = TRIM(REQUEST("tabla_original")) 
parametroID    = TRIM(REQUEST("parametroID"))
TOper          = TRIM(REQUEST("TOper"))
HISTORIAL      = TRIM(REQUEST("HISTORIAL"))

%>
<html><head><title>Historial</title>
</head>

<frameset rows="106,*" cols="*" framespacing="0" frameborder="yes" border="1">
  <frame src="CARR_detalle_generales.asp?Id_CARdDatosPersonales=<%= Id_CARdDatosPersonales%>" name="Detalle de la persona" scrolling="yes" noresize="noresize" id="topFrame" title="topFrame" />
  <frame src="CAM_USU_PER/ConsultasFiltro.asp?Id_Persona=<%=Id_Persona%>&ParamId=<%= ParamId%>&tabla_original=<%= tabla_original%>&parametroID=<%= parametroID%>&TOper=<%=TOper%>" name="Historial del registro" id="mainFrame" title="mainFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
