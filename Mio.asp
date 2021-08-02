<% 
Salir = False
opcion = 1
do until Salir 
   if opcion = 1 then
 %>
<HTML>
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">


<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<h1>que onda</h1>

  

<%

RESPONSE.WRITE "<BR>"
RESPONSE.WRITE "<CENTER><H3>No existen registros</H3></CENTER>"
 %>


 </BODY>
</HTML>
<%
else %>
<HTML>
<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
ya pasooooooo	

 </BODY>
</HTML>

<%end if %>
<INPUT TYPE="button" VALUE="opcion uno" ONCLICK="location.href='<%= opcionAlta%>?<%= IdMaestro%>=<%= idPer %>&oper=ALTA'" >
salir = True
<%LOOP
%>
