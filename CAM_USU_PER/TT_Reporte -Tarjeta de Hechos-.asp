<html><head><title>Armazón de Resultados</title>
<style type="text/css">
<!--
.Estilo4 {color: #0000CC}
.Estilo5 {
	color: #FFFFFF;
	font-weight: bold;
}
a:link {
	color: #000066;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head><body background="softgri1.jpg">
<!--<link href="Estilo.css" rel="stylesheet" type="text/css">-->
<FORM name="ARMA" action="123.asp" method="post" >
<link href="Estilo.css" rel="stylesheet" type="text/css">


 <CENTER><BR><H2 class="Estilo4"> T A R J E T A   &nbsp;&nbsp;DE&nbsp;&nbsp;   H E C H O S</H2>  </CENTER>
<%SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 SET Record1   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 
	 SET Record10   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	
	 
   Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
   Id_DESdDatosDesignacion = Request.QueryString("Id_DESdDatosDesignacion")
     	
 CadenadeConsulta1 = "SELECT * FROM VISTA_JUSTIFICACION_DESIGNA Where Id_DESdDatosDesignacion = " & Id_DESdDatosDesignacion
 ''response.Write CadenadeConsulta1
	''					 response.end 
 Record1.Open CadenadeConsulta1, Coneccion, 3, 1
		TotdeRegistros = Record1.RECORDCOUNT
		
		IF TotdeRegistros = 0 THEN
		    Response.Write("<BR><BR><BR><HR>")
			Response.Write("No existen datos de Justificación para esta designación")
			Response.end 
		END IF 
		
		
 %>
   
  <div class="Estilo4"><strong>Justificación de la Excepcionalidad</strong></div>
      <%= Record1("J_Excepcionalidad") %><BR>
   <div class="Estilo4"><strong>Justificación de la Experiencia</strong></div>
   &nbsp;&nbsp;&nbsp;  <%= Record1("J_Exp_profesional") %><BR>
	<div class="Estilo4"><strong>Constancia de no Inhabilitación</strong></div>
	  &nbsp;&nbsp;&nbsp; <%= Record1("Cons_no_inhabilitacion") %>
   
   <!--------------------------------------------------------==========================================-->
   
   <% CadenadeConsulta10 = "SELECT NumExpe_SegAntecedente, Causa, DEScEstatusAntecedente " & _
                         ", DEScEstatusAntecedente, DEScArea, DEScSubArea, DEScAntecedentes" & _
                         " FROM VISTA_DESPLIEGUE_HECHOS WHERE Id_DESdDatosDesignacion = " & Id_DESdDatosDesignacion & _
						 " ORDER BY Id_DEScArea"
						 
						 
						               						   
       Record10.Open CadenadeConsulta10, Coneccion, 3, 1
	   
	   TotdeRegistros = Record10.RECORDCOUNT
		
		IF TotdeRegistros = 0 THEN
			Response.Write("No existen registros")
			Response.write("<BR>")
		END IF %>
		
		
		<div align="center"> <TABLE  border cellspacing=0 class='SL'>
         <TR>
           <TD>&Aacute;rea: </font><BR> </TD>
	   		 <TD>SubArea: <font color="0000cc"></font><BR></TD>
	   		 <TD>No. Expediente:  <font color="0000cc"></font><BR></TD>
       		<TD>Causa:   <font color="0000cc"></font><BR></TD>
	   		<TD>Antecedentes: <font color="0000cc"></font><BR></TD>
			<TD>Estatus del Asunto:  <font color="0000cc"></font>
	   </TD></TR>

 <%
  xDEScArea = 0
  do until Record10.Eof 
	  IF xDEScArea <> Record10("DEScArea") THEN
	     xDEScArea=Record10("DEScArea")
         response.write("<TR><TD COLSPAN=2><font color='0000cc'>")
         response.write(Record10("DEScArea"))
         response.write("</font></TD>")%>
         <!--TR><TD> <font color="0000cc"><%=Record10 ("DEScArea") %></font><BR> </TD-->
	   		<TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>
<%    END IF %>
            <TR><TD>&nbsp;</TD>
	   		<TD><font color="0000cc"><%=Record10 ("DEScSubArea")%></font><BR></TD><TD>
       		 <font color="0000cc"><%=Record10 ("NumExpe_SegAntecedente") %></font><BR></TD><TD>
	   		 <font color="0000cc"><%=Record10 ("Causa") %></font><BR></TD><TD>
			 <font color="0000cc"><%=Record10 ("DEScAntecedentes") %></font><BR></TD><TD>
	   		 <font color="0000cc"><%=Record10 ("DEScEstatusAntecedente") %></font> &nbsp;</TD></TR>
	
	
	<% Record10.MoveNext
  LOOP   
   Record10.Close
  Coneccion.Close %>
  
  </TABLE></div>
  <!--------------------------------------------------------==========================================-->


  
  <!--------------------------------------------------------==========================================-->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

</FORM></body></html>