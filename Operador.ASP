<HTML>
 <BODY>

 <%
     
   Link1 = REQUEST.QUERYSTRING("Link1")
   Link2 = REQUEST.QUERYSTRING("Link2")
  
   if Session("Contador")=0 then
		Dim LocalArray()
		REDIM PRESERVE LocalArray(1)
	else
		LocalArray = Session("Elementos")
		
	end if
   
   Session("Contador") = Session("Contador")+1

   REDIM PRESERVE LocalArray(Session("Contador"))
   LocalArray(Session("Contador")) = Link1

   Session("Elementos") = LocalArray

   Response.Redirect(Link2 & ".ASP")
 %>
 </BODY>
</HTML>