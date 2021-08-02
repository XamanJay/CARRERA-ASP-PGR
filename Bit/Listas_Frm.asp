<html><head><title>Seguimiento y Evaluación</title></head>
<%'''''
  FECHA = NOW
  DIA = TRIM(DAY(FECHA))
  MES = TRIM(MONTH(FECHA))
  ANIO = CSTR(TRIM(YEAR(FECHA)))
  FechaEvaAct = CSTR(TRIM(DIA&"/"&MES&"/"&ANIO)) ''' Para que se presenten los de la fecha actual 
 '''''Response.write(FechaEvaAct)

%>

  <frameset rows="36%,64%" cols="*" framespacing="0" frameborder="1" border="1">
  
   <frame src="FiltroFecha.asp?tabla_original=<%=request("tabla_original")%>&TIT=<%=request("TIT") %>&TipoExamen=<%=request("TipoExamen") %>" name="Filtro" noresize  frameborder="1" framespacing="1" scrolling="No" bordercolor="#3a6ca3"  >
   
   <frame src="ConsultasListaPersonas.asp?tabla_original=<%=request("tabla_original")%>&TIT=<%=request("TIT") %>&TipoExamen=<%=request("TipoExamen")%>&FechaEvaAct=<%=FechaEvaAct%>" name="Informacion" frameborder="1" framespacing="1" bordercolor="#3a6ca3" scrolling="auto">
   
  </frameset>
  <noframes></noframes>
  
 </frameset>
 
 
</html>