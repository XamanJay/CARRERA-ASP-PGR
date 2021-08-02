<html>

<head>

<meta https-equiv="Content-Language" content="es">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta https-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Pagina nueva 1</title>
<base target="_blank">
</head>
<body background="FONDO.gif">
<form>

<% varbuscar= Request.Querystring("lnkInd")%>
<%

Set OB_conn = Server.CreateObject("ADODB.Connection")
Set OB_rs = Server.CreateObject("ADODB.Recordset")
Set OB_rscount = Server.CreateObject("ADODB.Recordset")


Ob_Conn.Provider="sqloledb"
Ob_Conn.Open="SERVER="+ session("IP_DATOS") +";Database=SIIFP;UID=carrera;PWD=carre"


SQL = "Select *  FROM CARdHistoriaLaboralPGR  WHERE (Id_CARdDatosPersonales = '"&varbuscar&"') ORDER BY FechaAdscripcionActual"
OB_RS.Open Sql, OB_Conn


%>
       <%Num_Campos = OB_rs.Fields.Count %>

		<%IF NOT OB_Rs.EOF THEN %>

&nbsp;</p>
<b>
<div align="left">
<TABLE BORDER=2 width="477" style="position: absolute; top = 150; left= 12; border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0" height="39">
	<% FOR Campo=0 TO Num_Campos - 1%>
		
			
				<%IF Campo=2 THEN%>
					<TH width="74" background=>
					<font color="#336699" face="Arial" size="2">Unidad de Adscripción</font></TH>
				<%ELSE%>
					<%IF Campo=3 THEN%>		
						<TH width="101" background=>
                        <font face="Arial" size="2" color="#336699">Tipo de Movimiento</font></TH>
					<%ELSE%>
						<%IF CAMPO=4 THEN%>	
							<TH width="207">
                        	<font color="#336699" face="Arial" size="2">Fecha de Registro</font></TH>
	        	        <%ELSE%>
							    <%IF Campo=5 THEN%>		
								     <TH width="67">
    	                	         <font color="#336699" face="Arial" size="2">Nombramiento</font></TH>          	               			 
			    		                  
        		              <%END IF%>
                	     <%END IF%>                                                
                   <%END IF%>                     
                <%END IF%>
                             
		
 
	   <%NEXT
	    
	    DO UNTIL Ob_RS.Eof %>

<tr>
<% FOR Campo=0 TO Num_Campos -1 %>
		
		 

			<%IF Campo=4 THEN%> 
			<td  width="74"><CENTER><font face="Arial" size="2"><%= Ob_RS(Campo)%>&nbsp;</font></CENTER></td>
			<%ELSE%>
				<%IF Campo=6 THEN%>		
					<td   width="101"><CENTER><font face="Arial" size="2"><%= Ob_RS(Campo)%>&nbsp;</font></CENTER></td>
				<%ELSE%>	
					<%IF CAMPO=7 THEN%>
						<td   width="207"><CENTER><font face="Arial" size="2"><%= Ob_RS(Campo)%>&nbsp;</font></CENTER></td>
					<%ELSE%>
						<%IF Campo=8 THEN%>		
							<td   width="67"><CENTER><font face="Arial" size="2"><%= Ob_RS(campo)%>&nbsp;</font></CENTER></td>
												          						  
							
						<%END IF%>
					<%END IF%>
				<%END IF%>                                                
			<%END IF%>                     
			
                               						  					
   <% NEXT 
		Ob_RS.MoveNext	
	Loop
	 ELSE
		RESPONSE.WRITE "<CENTER><H3>NO EXISTEN REFERENCIAS</H3></CENTER>"
	END IF 

	Ob_Rs.Close
	Ob_Conn.Close
	%>
					  					


	</Table>
</div>
<%Set rs = Nothing
Set conn = Nothing
%>


<p style="margin-top: 0; margin-bottom: 0">&nbsp;
</p>

<p style="margin-top: 0; margin-bottom: 0">&nbsp;
</p>

<p style="margin-top: 0; margin-bottom: 0">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<body topmargin="10" leftmargin="10">

</form>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>

</body>

</html>