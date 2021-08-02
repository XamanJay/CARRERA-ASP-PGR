<HTML><HEAD><TITLE>LISTADO</TITLE>
<style type="text/css">
<!--
.Estilo2 {color: #FFFFFF}
-->
</style>
</HEAD>
 <link  rel="stylesheet" type="text/css" href="Estilo.css">
<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
<%
  DIM Tabla
  DIM ODBC
	
	
  Tabla = REQUEST("tabla_original")
  ODBC = SESSION("ODBC")
  ID = REQUEST.FORM("ID") 
  
  CARcUSR    = TRIM (REQUEST.FORM("CARcUSR1"))
  Operacion =  TRIM (REQUEST.FORM("Operacion"))
  FechaEvaluacion = TRIM (REQUEST.FORM("FechaEvaluacion"))
  TipodeOrdenamiento = TRIM(REQUEST.FORM("TipodeOrdenamiento"))
  
  
  FECHA = NOW
  DIA = TRIM(DAY(FECHA))
  MES = TRIM(MONTH(FECHA))
  ANIO = TRIM(YEAR(FECHA))
  FECHA_BIEN = TRIM(DIA&"/"&MES&"/"&ANIO)
  
 
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Record_Main_andColor = Server.CREATEOBJECT("ADODB.RECORDSET")
     SET DatosPersonales  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
    
  DIA1 = TRIM(DAY(FechaEvaluacion))
  MES1 = TRIM(MONTH(FechaEvaluacion))
  ANIO1 = TRIM(YEAR(FechaEvaluacion))
  FechaEvaluacion1 = TRIM(DIA1&"/"&MES1&"/"&ANIO1)
  
  DIM Campo_Orden 
  
  IF TipodeOrdenamiento = 1 THEN 
     Campo_Orden = "TablaUtilizada ASC"
  ELSE
     Campo_Orden = "FECHA ASC"
  END IF
  
  'CARdRastreo_bit
   consulta = "SELECT * FROM VISTA_AVANCE_1 WHERE IdLogin  = " & CARcUSR & "  AND   Operacion = '"  & Operacion & _
    "' AND Fecha = '"& FechaEvaluacion1 &"'"&      " ORDER BY " & Campo_Orden
   
  ' response.Write consulta
  ' response.end 
    
	Record_Main_andColor.Open consulta, Ob_Conn
	
		Num_Campos= Record_Main_andColor.FIELDS.COUNT 
		IF NOT Record_Main_andColor.EOF THEN %>
		
		
		
 <FIELDSET style="width: 800; height: 70; padding: 1" title="Filtros" > <legend >Reporte </legend>
<TABLE>
      <TR > 
      <TD valign="bottom"> <B><BR></B> 
	  <%Sql ="SELECT CARcUSR, Nombre, ApellidoPaterno, ApellidoMaterno FROM VISTA_FILTRO_BIT_1 WHERE Id_CARcUSR = " & CARcUSR
	   
           DatosPersonales.OPEN Sql, Ob_Conn %>
		  
		  Avance del usuario:<%= DatosPersonales("CARcUSR")%>&nbsp; <BR>
		  Asignado a: <%= DatosPersonales("Nombre")%>&nbsp; <%= DatosPersonales("ApellidoPaterno")%> &nbsp;<%= DatosPersonales("ApellidoMaterno")%> <BR>
		  <% response.write "Fecha : " & FECHA_BIEN %>
		  
     </TD >
	  <% DatosPersonales.CLOSE%>
	 <TD valign="bottom"> <B>
        </B> </TD >
    </TR></TABLE>
	
	<TABLE>
	
	
  
	
</table>
	</FIELDSET>
<BR>

<%x = -1 %>
<FORM action="Listado_Bit.asp" name="22" method="post">
 
  
  
<CENTER>
  <TABLE class="SL" border="1">
   <TR>
   
     <TD width="78" class="cmd">
	 	<div align="center" class="Estilo2">Direcci&oacute;n IP de la PC del usuario </div></TD>
     <TD width="76" class="cmd">
        <div align="center" class="Estilo2">Fecha		 	</div></TD>
   	 <TD width="120" class="cmd">
	 	<div align="center" class="Estilo2">Tipo de Operaci&oacute;n</div></TD>
	 <TD width="166" class="cmd">
                 		 	<div align="center" class="Estilo2">Tabla Modificada  	 
        </div></TD>
   	 
	 <TD width="148" class="cmd">
                 		 	<div align="center" class="Estilo2">Identificador del Registro</div></TD>
	<TD width="148" class="cmd">
                 		 	<div align="center" class="Estilo2">RFC de la Persona Relacionada con la tabla</div></TD>
     </TR>
<!--- =======RENGLONES PARA LOS DATOS============================================================================ --->
   <%
	nRen = 0 
	DO UNTIL Record_Main_andColor.EOF
	nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%><TR  class="Encabezados" > 
    <% end if %>

	    
         <TD> 	  
         		 <%=Record_Main_andColor("IP_user") %>
         </TD>
         <TD> 
				<%=Record_Main_andColor("Fecha") %>
         </TD>
	     <TD>
				 <%=Record_Main_andColor("Operacion") %>
	    </TD>
		  <TD>
				 <%=Record_Main_andColor("TablaUtilizada") %>
		  </TD>
		  
		    <TD>
				 <%=Record_Main_andColor("IdUtilizado") %>
		  </TD>
		  <TD>
				 <%=Record_Main_andColor("RFC") %>
		  </TD>
		  



                   </TR>                                                                                                                          																								
		
				  
<%	Record_Main_andColor.MOVENEXT
	LOOP
ELSE
	RESPONSE.WRITE "<BR>"
	RESPONSE.WRITE "<CENTER> <H3> No existe ningún registro de examen que cumpla con los parámetros de búsqueda </H3> </CENTER>"
END IF%>

</TABLE>
</CENTER>
<BR>
<CENTER>
</FORM>
  <%
  SET Record_Main_andColor = NOTHING
   SET Ob_Conn = NOTHING
  %>
</BODY></HTML>