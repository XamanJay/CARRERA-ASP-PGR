<%  EXCEL = REQUEST.FORM("exxxcel")
'IF EXCEL = 100 THEN
' Response.ContentType = "application/vnd.ms-excel" 
'ELSE
'  EXCEL = 0
'END IF
%>
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO
IF EXCEL = 100 THEN
  '''NumPerPage = 500 Si  EXCEL es igual a 100 lo envío a excel
   Response.ContentType = "application/vnd.ms-excel" 


ELSE
EXCEL = 0%>
<!-- #INCLUDE File="INCLUDE/Paginas.inc"-->

<%NumPerPage = 20
END IF%>
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
  FechaEvaluacion2 = TRIM (REQUEST.FORM("FechaEvaluacion2"))
  'TipodeOrdenamiento = TRIM(REQUEST.FORM("TipodeOrdenamiento"))
  
  
  FECHA = NOW
  DIA = TRIM(DAY(FECHA))
  MES = TRIM(MONTH(FECHA))
  ANIO = TRIM(YEAR(FECHA))
  FECHA_BIEN = TRIM(DIA&"/"&MES&"/"&ANIO)
  
 
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_R3 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET OB_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET DatosPersonales  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+SESSION("V_ODBC")+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
    
IF FechaEvaluacion <> "" THEN 
   DIA1 = TRIM(DAY(FechaEvaluacion))
   MES1 = TRIM(MONTH(FechaEvaluacion))
   ANIO1 = TRIM(YEAR(FechaEvaluacion))
   FechaEvaluacion1 = TRIM(DIA1&"/"&MES1&"/"&ANIO1)
  
   DIA2 = TRIM(DAY(FechaEvaluacion2))
   MES2 = TRIM(MONTH(FechaEvaluacion2))
   ANIO2 = TRIM(YEAR(FechaEvaluacion2))
   FechaEvaluacion22 = TRIM(DIA2&"/"&MES2&"/"&ANIO2)
   
 	IF Operacion   = "Todas" AND CARcUSR <> 10000 THEN ' Es correcto
			SQL = "SELECT * FROM VISTA_AVANCE_1 WHERE Fecha BETWEEN '"& FechaEvaluacion1 &"' AND '"& FechaEvaluacion22 & _
					   "' AND  IdLogin  = " & CARcUSR & "  AND  CARcUSR <> 'NULL'  ORDER BY fecha  DESC" 
'					   "' AND  IdLogin  = " & CARcUSR & "  ORDER BY Id_CARdRastreo_bit  DESC" 
					   
	ELSEIF  Operacion <> "Todas" AND CARcUSR <> 10000 THEN 'Es correcto
			SQL = "SELECT * FROM VISTA_AVANCE_1 WHERE Fecha BETWEEN '"& FechaEvaluacion1 &"' AND '"& FechaEvaluacion22 & _
					   "' AND  IdLogin  = " & CARcUSR & "  AND   Operacion = '"  & Operacion & "' AND  CARcUSR <> 'NULL'  ORDER BY Fecha  DESC" 
'					   "' AND  IdLogin  = " & CARcUSR & "  AND   Operacion = '"  & Operacion & "'  ORDER BY Id_CARdRastreo_bit  DESC" 
					   
	ELSEIF  Operacion = "Todas" AND CARcUSR = 10000 THEN ' Es correcto
			SQL = "SELECT * FROM VISTA_AVANCE_1 WHERE Fecha BETWEEN '"& FechaEvaluacion1 &"' AND '"& FechaEvaluacion22 & _
					   "'  AND  CARcUSR <> 'NULL'  ORDER BY Fecha  DESC " 
'					   "' ORDER BY Id_CARdRastreo_bit  DESC " 
					   
   ELSEIF  Operacion <> "Todas" AND CARcUSR = 10000 THEN ' Es correcto
			SQL = "SELECT * FROM VISTA_AVANCE_1 WHERE Fecha BETWEEN '"& FechaEvaluacion1 &"' AND '"& FechaEvaluacion22 & _
					   "' AND  Operacion = '"  & Operacion & "' AND  CARcUSR <> 'NULL'   ORDER BY Fecha  DESC" 
'					   "' AND  Operacion = '"  & Operacion & "'  ORDER BY Id_CARdRastreo_bit  DESC" 
	END IF	
	
END IF 
xRFC = request("xRFC")	
IF xRFC <> "" THEN
  SQL = replace(SQL,"WHERE ","WHERE RFC LIKE '%" + xRFC + "%' AND ")
END IF 
'response.Write SQL
' response.end 
		
if  request("gFiltro") = "SI" THEN
    Sql = session("xQuery")
END IF 
  
    
  ''''JAISSIEL  RESPONSE.WRITE SQL
	'RESPONSE.END 

	OB_RS2.Open SQL, Ob_Conn ,1,1
'''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	
	
IF EXCEL = 100 THEN      ''''IF         DEL       100       SE ENVIA A EXCEL      *********************
'''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	

															
									Num_Campos= OB_RS2.FIELDS.COUNT 
									IF NOT OB_RS2.EOF THEN %>
									
									
									
							 <FIELDSET style="width: 800; height: 5; padding: 1" title="Filtros" > <legend >*REGISTROS DE BITACORA </legend>
							 <TABLE>
								  <TR > 
								  <TD valign="bottom"> 
								 <!--		  OPERACIONES REALIZADAS POR : <font color="#0033FF"><%'= OB_RS2("CARcUSR")%></font> <BR>
							-->		   <%'response.write "Registros capturados el dia : " & FECHA_BIEN %>
								  
								 </TD >
									  </TR></TABLE>
								
								
								</FIELDSET>	
							
							
							<%x = -1 %>
<!--							<FORM action="Listado_Bit.asp" name="22" method="post">
-->							 
							  
							  
							<CENTER>
							  <TABLE class="SL" border="1">
							   <TR>
							   <TD width="78" class="cmd">
									<div align="center" class="Estilo2">USUARIO </div></TD>
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
														<div align="center" class="Estilo2">R.F.C. Del Registro Modificado </div></TD>
								 <TD width="148" class="cmd">
														<div align="center" class="Estilo2">Consultar el Registro actual</div></TD>
								 <TD width="148" class="cmd">
														<div align="center" class="Estilo2">Parametros en la busqueda general </div></TD>
													
								
								 </TR>
								 
								
							<!--- =======RENGLONES PARA LOS DATOS============================================================================ --->
							   <%
								'''''''''jvinRen = 0 
							''	DO UNTIL OB_RS2.EOF
							' ==============  Se agrego "and nRen < .PageSize" PARA LA PAGINACION	
							   DO WHILE NOT OB_RS2.EOF '''''''''jvi  and nRen < OB_RS2.PageSize
								
							
							'''''''''jvi	nRen = nRen + 1
								'''''''''jvi	if (nRen mod 2) = 0 then 
								%><TR> 
								<% '''''''''jviend if %>
							
									<TD> <div align="center">	  
											 <%=OB_RS2("CARcUSR") %> </div></TD>
									 <TD><div align="center"> 	  
											 <%=OB_RS2("IP_user") %> </div></TD>
									 <TD><div align="center"> 
											<%=OB_RS2("Fecha") %> </div></TD>
									 <TD><div align="center"> 
											 <%=OB_RS2("Operacion") %> </div></TD>
									  <TD><div align="center">
											 <%=OB_RS2("TablaUtilizada") %> </div></TD>
									  
									  <TD><div align="center">
									   <%=OB_RS2("RFC") %> </div>
										 &nbsp;</TD>
											 
											 
								
										 <TD>&nbsp;
										 
										 								 
										 </TD>
																
												<TD>&nbsp;			
												</TD>
												
													  
											
												
												<TD>&nbsp;
												</TD>
														
									 
										
									 
									 
									  <TD><div align="center">
											 <%=OB_RS2("CARdRastreo_bit") %> </div></TD>
							
							
							
											   </TR>                                                                                                                          																								
									
											  
							<% 
								OB_RS2.MOVENEXT
								LOOP
							 '''''''''jvi CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
							ELSE
								RESPONSE.WRITE "<BR>"
								RESPONSE.WRITE "<CENTER> <H3> No existen registros </H3> </CENTER>"
							END IF%>
							
							</TABLE>
							</CENTER>
							<BR>
							<CENTER>
							<p></p>
<!--							</FORM>
-->							  <%
							  SET OB_RS2 = NOTHING
							   SET Ob_Conn = NOTHING
							  %>
							</BODY></HTML>


<%
'''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	
ELSE			''''      DEL       100             *********************
'''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	

	
							CALL INICIAPAGINA 
								
									Num_Campos= OB_RS2.FIELDS.COUNT 
									IF NOT OB_RS2.EOF THEN %>
									
									
									
							 <FIELDSET style="width: 800; height: 5; padding: 1" title="Filtros" > <legend >-REGISTROS DE BITACORA </legend>
							 <TABLE>
								  <TR > 
								  <TD valign="bottom"> 
								 <!--		  OPERACIONES REALIZADAS POR : <font color="#0033FF"><%'= OB_RS2("CARcUSR")%></font> <BR>
							-->		   <%'response.write "Registros capturados el dia : " & FECHA_BIEN %>
								  
								 </TD >
									  </TR></TABLE>
								
								
								</FIELDSET>	
							
							
							<%x = -1 %>
							<FORM action="Listado_Bit.asp" name="22" method="post">
							 
							  
							  
							<CENTER>
							  <TABLE class="SL" border="1">
							   <TR>
							   <TD width="78" class="cmd">
									<div align="center" class="Estilo2">USUARIO </div></TD>
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
														<div align="center" class="Estilo2">R.F.C. Del Registro Modificado </div></TD>
								 <TD width="148" class="cmd">
														<div align="center" class="Estilo2">Consultar el Registro actual</div></TD>
								 <TD width="148" class="cmd">
														<div align="center" class="Estilo2">Parametros en la busqueda general </div></TD>
													
								
								 </TR>
								 
								
							<!--- =======RENGLONES PARA LOS DATOS============================================================================ --->
							   <%
								nRen = 0 
							''	DO UNTIL OB_RS2.EOF
							' ==============  Se agrego "and nRen < .PageSize" PARA LA PAGINACION	
							   DO WHILE NOT OB_RS2.EOF and nRen < OB_RS2.PageSize
								
							
								nRen = nRen + 1
									if (nRen mod 2) = 0 then 
								%><TR> 
								<% end if %>
							
									<TD> <div align="center">	  
											 <%=OB_RS2("CARcUSR") %> </div></TD>
									 <TD><div align="center"> 	  
											 <%=OB_RS2("IP_user") %> </div></TD>
									 <TD><div align="center"> 
											<%=OB_RS2("Fecha") %> </div></TD>
									 <TD><div align="center"> 
											 <%=OB_RS2("Operacion") %> </div></TD>
									  <TD><div align="center">
											 <%=OB_RS2("TablaUtilizada") %> </div></TD>
									  
									  <TD><div align="center">
									   <%=OB_RS2("RFC") %> </div>
											 <% 
											 
										'JVI	 IF NOT OB_R3.EOF THEN 
											 '   response.write(OB_R3("RFC"))
											' END IF  
											 %> &nbsp;</TD>
				 <%
                  NOMBREDELATABLA = OB_RS2("TablaUtilizada")
				  PREFIJO = UCASE(MID (NOMBREDELATABLA,1,4))
				  IF PREFIJO <> "CARC" THEN 
				  
				  %>							 
											 
								
						  <% IdUtilizado = OB_RS2("IdUtilizado")
						     IF ISNULL(IdUtilizado)  THEN     %>	
							    <TD>&nbsp;</TD>
							<%ELSE %>
									<% ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
									 TABLA   = OB_RS2("TablaUtilizada")
									 
									 IF TABLA = "DatosPersonales" THEN
										TABLA = "CARdDatosPersonales"
									 END IF 
									 
								  
											  IF TABLA <> "CARcUSR"	THEN 
												 IIdd    = CSTR(OB_RS2("IdUtilizado"))
												 SQLPer  = "SELECT Id_CARdDatosPersonales FROM "&TABLA&" WHERE Id_"&TABLA&" = "&IIdd  
												   Ob_R3.Open SQLPer, Ob_Conn, 3, 1
												   total_campos = Ob_R3.RECORDCOUNT
												   total_campos = CINT (total_campos)
												   
											  ELSE 
												   total_campos = 0 	  
											  END IF 
												   
									   
									   
									   
									   IF total_campos => 1  THEN 
										NVO_IdCARdDatosPersonales = Ob_R3("Id_CARdDatosPersonales")	
									   ELSE
										NVO_IdCARdDatosPersonales = 0
									   END IF
										  
									''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''%> 
												<%	IF total_campos => 1  THEN    %>
												
												<TD>
													<div align="center">
													<a href="Modificaciones_<%= OB_RS2("TablaUtilizada")%>.asp?Id_Persona=<%= NVO_IdCARdDatosPersonales%>&ParamId=<%=OB_RS2("IdUtilizado") %>&parametroTabla=<%= OB_RS2("TablaUtilizada")%>&parametroID=<%= ID%>&TOper=VER&HISTORIAL=1000"><font size="2">Detalle Registro</font></a>	
													<BR>
													<a href="CONJUNTO DE MARCOS (HISTORIAL).asp?Id_Persona=<%= NVO_IdCARdDatosPersonales%>&ParamId=<%=OB_RS2("IdUtilizado") %>&tabla_original=<%= OB_RS2("TablaUtilizada")%>&parametroID=<%= ID%>&TOper=VER&HISTORIAL=1000"><font size="2">Historia </font></a>	
													</div>
												</TD>
												
													  
												<%  ELSE                         %>
												
												<TD>
															<% IF TABLA = "CARcUSR"  THEN %>
															<div align="center">
															<a href="CAM_USU_PER/ConsultasFiltro.asp?Id_Persona=<%= NVO_IdCARdDatosPersonales%>&ParamId=<%=OB_RS2("IdUtilizado") %>&tabla_original=<%= OB_RS2("TablaUtilizada")%>&parametroID=<%= ID%>&TOper=VER&HISTORIAL=1000"><font size="2">Historia </font></a>	
															</div>
															<% ELSE %>
															Sin registro &nbsp;
															<% END IF %>
												</TD>
														
												<%  END IF                       %>
									 
										<%
										
										IF TABLA <> "CARcUSR"	THEN 
										OB_R3.close 
										END IF
										
										
							END IF%>
									 
			<% ELSE  ' Viene de chechar si el prefijo fue "CARC"%>
				   <TD><!--Detectecta que es un Catalogo y no pone link ***-->&nbsp;</TD>
		    <% END IF %>		
									 
									  <TD><div align="center">
											 <%=OB_RS2("CARdRastreo_bit") %> </div></TD>
							
							
							
									   </TR>                                                                                                                          																								
									
											  
							<% 
								OB_RS2.MOVENEXT
								LOOP
							  CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
							ELSE
								RESPONSE.WRITE "<BR>"
								RESPONSE.WRITE "<CENTER> <H3> No existen registros </H3> </CENTER>"
							END IF%>
							
							</TABLE>
							</CENTER>
							<BR>
							<CENTER>
							</FORM>
							  <%
							  SET OB_RS2 = NOTHING
							   SET Ob_Conn = NOTHING
							  %>
							</BODY></HTML>
							
<%'''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	
 END IF
 '''''''''''¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦	
 %>