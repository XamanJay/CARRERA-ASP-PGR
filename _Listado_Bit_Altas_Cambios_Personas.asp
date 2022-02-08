<% 
response.write ">>>>>>>>>>"+SQL
response.end
EXCEL = REQUEST.FORM("exxxcel")

IF EXCEL = 100 THEN
 Response.ContentType = "application/vnd.ms-excel" 
ELSE
 EXCEL = 0
END IF

  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdNombramientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")

	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   sRecarga =  request("ICarga")
%>
<HTML>
<!--<link href="Estilo.css" rel="stylesheet" type="text/css">
-->
 <HEAD>
  <TITLE>
   Pantalla REPORTES
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
<!-- <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0" bgcolor="">
--><body background="softgri1.jpg" bgproperties="fixed" link="#FFFFFF" alink="#FFFFFF" vlink="#FFFFFF" >
<link href="Estilo.css" rel="stylesheet" type="text/css">

  <CENTER>
 
   <FORM METHOD="post" ACTION= "Listado_Bit_Altas_Cambios_Personas.asp" NAME= "FormRE">

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
 
 <% CALL SReporteAltasCambios() 
 CALL SFILTRO()
 %>
</TABLE>
  <% 
  response.end
  IF xtipoReporte <> "" AND sRecarga ="N" then 
      xxWhere = sWhere()
'response.write xxWhere
'  response.end
      CALL SFILTRO(xtipoReporte,xxWhere)%>
  <% END IF%>
<INPUT TYPE="Hidden" NAME=ICarga Value ='N'>

  <p ALIGN="center"> 
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick=""> 
  &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> 
  
  	      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="../Multimedia/imagenes/EXCEL.jpg">

  </p>
   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>


<%SUB SReporteAltasCambios%>
		  
<% 
response.write ">>>>>>>>>>"+SQL
response.end
        Sql =" SELECT      C.CARcSubprocuradurias , D.CARcDG_o_Delegaciones, A.RFC, A.Operacion " &_
					  " FROM         dbo.CARdRastreo_bit A INNER JOIN " &_
                      " dbo.CARdDatosPersonales B ON A.RFC = B.RFC INNER JOIN " 
					 '' " and A.Fecha >='01/01/2008' and A.Fecha <= '03/09/2008' "  

         Sql2 =       " dbo.CARcSubprocuradurias C ON c.Id_CARcSubprocuradurias = B.Id_CARcSubprocuradurias INNER JOIN "&_
                      " dbo.CARcDG_o_Delegaciones D ON D.Id_CARcDG_o_Delegaciones = B.Id_CARcDG_o_Delegaciones"&_
                      " WHERE     (A.RFC IS NOT NULL) AND (A.RFC <> '') AND  A.IDLOGIN IS NOT NULL AND "
                      " ((A.Operacion = 'Alta' AND A.TablaUtilizada = 'CARdDatosPersonales') " &_
                      " OR A.Operacion = 'Cambio') " &_
                      " GROUP BY C.CARcSubprocuradurias, D.CARcDG_o_Delegaciones,A.RFC,  A.Operacion " &_
                      " order by  Operacion,CARcSubprocuradurias,CARcDG_o_Delegaciones "
					  
           Ob_RS2.OPEN Sql, Ob_Conn
					  
SQL =SQL + " A.Fecha >='"+request("FechaEvaluacion")+ "' and A.Fecha <= '" +request("FechaEvaluacion2")+"' AND " +SQL2 
%>
<% END SUB %>


<%SUB  SFILTRO()
''xQry = "select * from " +pVista +pWhere
''response.write xQry
'''Ob_RS2.open xQry , Ob_Conn 
Num_Campos= Ob_RS2.FIELDS.COUNT 
N = 0
%>
 <BR>
  <TABLE class="SL" border="1">
       
 <TR>
    <SCRIPT LANGUAGE="JavaScript">
<!--

function imprimir() {
  if (window.print)
    window.print()
  else
    alert("Disculpe, su navegador no soporta esta opción.");
}

// -->
</SCRIPT>

 
 <td  colspan="<%=Num_Campos%>"> </TD>
 <tr> 
 	<td><p align="center">
		 <a href="javascript:imprimir()"><img src="../Multimedia/imagenes/LOGO_2007 PGR (170x120).png" width="111" height="63"> </a>
		 </p>
	</td>  
	
	<td colspan="5"><p align="center">
		 <h4><center>PROCURADURÍA GENERAL DE LA REPÚBLICA </center></h4>
		  <h5><center>REPORTE PERSONAS REGISTRADAS O MODIFICADAS</center></h5>
		  </p>
	</td>
 </tr>
      <TR> 
	  
<%		VarTot=0
		FOR Campo = 0 TO Num_Campos - 1 %>			
		  <% IF  INSTR(Ob_RS2(Campo).NAME ,"CARc") THEN%>
			<TD class="Encabezados"><p align="center"><center><h5>  <%= mid( Ob_RS2(Campo).name,5,len(Ob_RS2(Campo).name)-1 ) %> &nbsp; </h5></center></p></TD>
		<% ELSE%>
			<TD class="Encabezados"><p align="center"><center><h5> <%= Ob_RS2(Campo).name %> &nbsp;</h5></center></p></TD>
		<% END IF %>
<%		NEXT %>
	  </p>
      </TR> 
 <%  DO WHILE NOT Ob_RS2.EOF %>
      <TR> 
		<% N = N +1%>
		<%FOR Campo = 0 TO Num_Campos - 1 %>			
		  <%' IF  INSTR(Ob_RS2(Campo) ,"SELEC") THEN%>
			<!--TD>&nbsp; </TD-->
		<% 'ELSE%>
			<TD> <%= Ob_RS2(Campo) %></TD>
		<% 'END IF %>
<%		NEXT
		VarTot=VarTot+Ob_RS2("Total")
		Ob_RS2.MOVENEXT
  LOOP %>
       <tr><td>&nbsp;</td><td>&nbsp;  </td><td><h5>Total de Movimientos:</h5></td><td><h5><%=VarTot%></h5></td>
 </TABLE>
<% END SUB%>


<script>
function pRecarga()
{
 //  alert()	  
   FormRE.B1.disabled = true;  
   document.FormRE.ICarga.value = "S";  
   document.FormRE.submit();
}
</script>