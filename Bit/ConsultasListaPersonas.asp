<HTML><HEAD><TITLE>LISTADO</TITLE>
<style type="text/css">
<!--
.Estilo1 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</HEAD>
 <link  rel="stylesheet" type="text/css" href="../Estilo.css">
<BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
<%
  DIM Tabla
  DIM ODBC
	
	
  Tabla = REQUEST("tabla_original")
  ODBC = SESSION("ODBC")
  ID = REQUEST.FORM("ID") 
  ParamID =  request("ParamID")
  
 FechaEvaAct = TRIM(REQUEST("FechaEvaAct"))
 '''' Response.write(FechaEvaAct&"<---FECHA ACTUAL----")
  
  FechaEvaluacion    = TRIM (REQUEST.FORM("FechaEvaluacion"))
  NoRegistro_FOLIO   = TRIM (REQUEST.FORM("NoRegistro_FOLIO"))
  GrupoEspecial      = TRIM (REQUEST.FORM("GrupoEspecial"))
  Nombre             = TRIM (REQUEST.FORM("Nombre"))
  Paterno            = TRIM (REQUEST.FORM("Paterno"))
  Materno            = TRIM (REQUEST.FORM("Materno"))
  
  '''Response.write(GrupoEspecial)
 ''' response.end 
  
  FECHA = NOW
  DIA = TRIM(DAY(FECHA))
  MES = TRIM(MONTH(FECHA))
  ANIO = TRIM(YEAR(FECHA))
  FECHA_BIEN = TRIM(DIA&"/"&MES&"/"&ANIO)
  
  '''Response.Write(FECHA&"-------    "&FECHA_BIEN&"---")
 TipoExamen = TRIM(REQUEST("TipoExamen"))
 ''''Response.write(TipoExamen&"<---Tipo de Examen----")
 
 

   
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Record_Main_andColor = Server.CREATEOBJECT("ADODB.RECORDSET")
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
IF  FechaEvaAct <> "" THEN     '''Este query se ejecuta para que se muestren los resultados al momento de dar clic desde en una de las opciones del menu
	                        '''Y tomo la fecha del dia actual. Y no tomo en cuenta el grupo especial
   consulta = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
             " AND FechaProg = '"&FechaEvaAct&"'" & _
			 " AND Id_PLAcTipoEvaluacion = "&TipoExamen
	OpcionDesdemenu = 1 
			''' response.write(consulta)
			'''response.End
   FechaEvaluacion = TRIM(FechaEvaAct) ''Aqui si llega el valor
   '''response.write(FechaEvaluacion)
  ''' response.end 
			 
ELSEIF FechaEvaluacion = "" THEN '''si la fecha viene vacia(es decir si no seleccionaron fecha) entonces no tomo en cuenta el campo de fecha como condición pero si tomo en cuenta el campo de grupo especial
     FECHA_BIEN = " (Sin fecha)"
	 
	  consulta = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
             " AND Id_PLAcGrupoEspecial = "&GrupoEspecial& " AND Id_PLAcTipoEvaluacion = "& TipoExamen
			OpcionDesdemenu = 2
	'''RESPONSE.Write(CONSULTA)
   ELSE                         ''''''''''''''''Si seleccione una fecha, si tomo en cuenta el campo fecha como condición y tambien el campo de grupo especial
   
      FechaEvaluacion  = FechaEvaluacion  
	  FECHA_BIEN = FechaEvaluacion
	  
	   consulta = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
              " AND Id_PLAcGrupoEspecial = "&GrupoEspecial& " AND FechaProg = '"&FechaEvaluacion&"'" & _
			 " AND Id_PLAcTipoEvaluacion = "&TipoExamen
			 OpcionDesdemenu = 3
	''' RESPONSE.Write(CONSULTA)
   END IF
   
   '''-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=JVI
   
   OpcionDesdemenu_1 = TRIM(OpcionDesdemenu)
   
  FechaEvaluacion_1    = TRIM(FechaEvaluacion)
  NoRegistro_FOLIO_1   = TRIM(NoRegistro_FOLIO)
  GrupoEspecial_1      = TRIM(GrupoEspecial) 
  Nombre_1             = TRIM(Nombre)
  Paterno_1            = TRIM(Paterno)
  Materno_1            = TRIM(Materno)
  TipoExamen_1         = TRIM(TipoExamen)
  
  
	 '''-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=JVI
	Record_Main_andColor.Open consulta, Ob_Conn
		Num_Campos= Record_Main_andColor.FIELDS.COUNT 
		IF NOT Record_Main_andColor.EOF THEN %>
 <CENTER>
 <font color="#000000" size="+1"> Reporte de Avance </font>
 </CENTER><BR>

<%x = -1 %>
<FORM action="PA_Grabacionde_OBSERVACIONES_LISTAS.asp" name="22" method="post">
 
  
  
<CENTER>
  <TABLE class="SL" border="1">
   <TR>
   <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">       Usuario		 	</TD>
     <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">      		 	Direcci&oacute;n IP</TD>
     <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">       Fecha		 	</TD>
   	 <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">      		 	Tipo de Operaci&oacute;n</TD>
	 <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">      		 	Tabla modificada  	 
     </TD>
   	 
	 <TD class="Encabezados_AzulFuerte">
              <P ALIGN="center" class="Estilo1">      		 	Dato modificado
     </TD>
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
		         <%=Record_Main_andColor("NO_Registro") %>
		 </TD>
         <TD> 	  
         		 <%=Record_Main_andColor("Paterno") %>
         </TD>
         <TD> 
				<%=Record_Main_andColor("Materno") %>
         </TD>
	     <TD>
				 <%=Record_Main_andColor("Nombre") %>
	    </TD>
		  <TD>
				 <%=Record_Main_andColor("PLAcGrupoEspecial") %>
		  </TD>
		  
		    <TD>
				 <%=Record_Main_andColor("PLAcGrupoEspecial") %>
		  </TD>
		  



                                                                                                                                             																								
		
				  
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