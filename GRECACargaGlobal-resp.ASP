<HTML>
 <BODY>

 <%
 Session("UserID") = Request.Form("UserID")
 Session("Password") = Request.Form("Password")
 
 
     
 
 RESPONSE.Redirect("https://"+ session("IP_SERVER") +"/CARRERAPGR/CARR_INDEX.ASP")
 %>
 
<CENTER>

   <HR width=40%>
    <H2> 
     Teclee en la barra de URL del browser, la página a la cuál desea ingresar.
    </H2>
   <HR WIDTH=40%>

 </BODY>
</HTML>