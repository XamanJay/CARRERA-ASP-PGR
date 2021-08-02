<% 
   HISTORIAL  = REQUEST.QUERYSTRING ("HISTORIAL")
   Id_Persona = REQUEST.QUERYSTRING ("Id_Persona")
   ParamID    = request("ParamID")
   parametroTabla = REQUEST.QUERYSTRING ("parametroTabla")
  ''''' response.write ParamID & "<<<<-----"
  IF HISTORIAL = 1000  THEN  %>
     <INPUT TYPE="button" VALUE="HISTORIAL" ONCLICK="location.href='HISTORIAL_CARdIdiomas.asp?ParamId=<%=ParamID%>&parametroTabla=<%= parametroTabla%>&Id_Persona=<%=Id_Persona%>'" >
<%END IF   %>
