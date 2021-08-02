<HTML>
 <BODY>

 <%
 

   LocalArray = Session("Elementos")

   aux = TRIM(Session("Elementos")(Session("Contador")))
   Session("Contador") = Session("Contador")-1

   REDIM PRESERVE LocalArray(Session("Contador"))
   Session("Elementos") = LocalArray

   Response.Redirect(aux) %>


 </BODY>
</HTML>



