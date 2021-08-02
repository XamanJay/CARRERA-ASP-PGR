<%
EXCEL = REQUEST.FORM("exxxcel")

IF EXCEL = 100 THEN
 Response.ContentType = "application/vnd.ms-excel" 
ELSE
 EXCEL = 0
END IF%>

<html><head><title>Armazón de Resultados</title>
<style type="text/css">
<!--
.Estilo5 {color: #000000; font-weight: bold; }
.Estilo6 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<body background="softgri1.jpg" bgproperties="fixed" link="#FFFFFF" alink="#FFFFFF" vlink="#FFFFFF">
<FORM name="ARMA" action="123.asp" metdod="post" >
<% 
   Id_CARcSubprocuradurias  = Request.FORM("Id_CARcSubprocuradurias")
   Id_CARcDG_o_Delegaciones = Request.FORM("Id_CARcDG_o_Delegaciones")
   Id_CARcEstatusLaboral    = Request.FORM("Id_CARcEstatusLaboral")
   Id_CARcNombramiento      = Request.FORM("Id_CARcNombramiento")
   
   
   
   SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET RS_Insert = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Record    = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Record1    = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
   Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+SESSION("V_ODBC")+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   
   
   '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  
  Adscripcion = " SELECT * FROM  VISTA_SUBPROCURADURIA_DELEGACION WHERE  Id_CARcSubprocuradurias = " & Id_CARcSubprocuradurias 
	IF Id_CARcDG_o_Delegaciones <> 0 THEN 
	   Adscripcion = Adscripcion + " AND Id_CARcDG_o_Delegaciones = " & Id_CARcDG_o_Delegaciones 
	END IF
    Record1.Open Adscripcion, Coneccion
	
	  
CadenadeConsulta =  " SELECT    dbo.CARdDatosPersonales.Id_CARdDatosPersonales, dbo.CARdDatosPersonales.RFC, dbo.CARdDatosPersonales.ApellidoPaterno, " & _
                     " dbo.CARdDatosPersonales.ApellidoMaterno, dbo.CARdDatosPersonales.Nombre, dbo.CARdDatosPersonales.Fecha_IngresoPGR,  " & _
					 " dbo.CARdDatosPersonales.Ciudad,   " & _
					 " dbo.CARdDatosPersonales.MunicipiooDel,  " & _
					 " dbo.CARdDatosPersonales.Nacionalidad,  " & _
					 " dbo.CARdDatosPersonales.CURP,  " & _
					 " dbo.CARdDatosPersonales.ClaveElector,  " & _
					 " dbo.CARdDatosPersonales.Licencia,  " & _
					 " dbo.CARdDatosPersonales.DependenciaFiliacion,  " & _
					 " dbo.CARdNombramientos.Id_CARdNombramientos, dbo.CARdNombramientos.Id_CARcSINO, dbo.CARdSituacionLaboral.Id_CARdSituacionLaboral,  " & _
                     " dbo.CARdSituacionLaboral.Id_CARcActual, dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias, dbo.CARcSubprocuradurias.CARcSubprocuradurias,  " & _
                     " dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones, dbo.CARcDG_o_Delegaciones.CARcDG_o_Delegaciones, " & _
                     " dbo.CARcDir_o_subsede.Id_CARcDir_o_subsede, dbo.CARcDir_o_subsede.CARcDir_o_subsede, dbo.CARcNombramiento.Id_CARcNombramiento, " & _
                     " dbo.CARcNombramiento.CARcNombramiento, dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento, " & _
                     " dbo.CARcTipoNombramiento.CARcTipoNombramiento, dbo.CARcCategoria.Id_CARcCategoria, dbo.CARcCategoria.CARcCategoria, " & _
                     " dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral, dbo.CARcEstatusLaboral.CARcEstatusLaboral , " & _
					 " dbo.CARdSituacionLaboral.CARdSituacionLaboral " & _
                 " FROM         dbo.CARdDatosPersonales INNER JOIN " & _
                    "  dbo.CARdNombramientos ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdNombramientos.Id_CARdDatosPersonales INNER JOIN " & _
                    "  dbo.CARdSituacionLaboral ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdSituacionLaboral.Id_CARdDatosPersonales INNER JOIN " & _
                    "  dbo.CARcSubprocuradurias ON  " & _
                    "  dbo.CARdDatosPersonales.Id_CARcSubprocuradurias = dbo.CARcSubprocuradurias.Id_CARcSubprocuradurias INNER JOIN  " & _
                    "  dbo.CARcDir_o_subsede ON dbo.CARdDatosPersonales.Id_CARcDir_o_subsede = dbo.CARcDir_o_subsede.Id_CARcDir_o_subsede INNER JOIN  " & _
                    "  dbo.CARcDG_o_Delegaciones ON   " & _
                     " dbo.CARdDatosPersonales.Id_CARcDG_o_Delegaciones = dbo.CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones INNER JOIN  " & _
                    "  dbo.CARcNombramiento ON dbo.CARdNombramientos.Id_CARcNombramiento = dbo.CARcNombramiento.Id_CARcNombramiento INNER JOIN  " & _
                    "  dbo.CARcTipoNombramiento ON   " & _
                    "  dbo.CARdNombramientos.Id_CARcTipoNombramiento = dbo.CARcTipoNombramiento.Id_CARcTipoNombramiento INNER JOIN  " & _
                    "  dbo.CARcCategoria ON dbo.CARdNombramientos.Id_CARcCategoria = dbo.CARcCategoria.Id_CARcCategoria INNER JOIN  " & _
                     " dbo.CARcEstatusLaboral ON dbo.CARdSituacionLaboral.Id_CARcEstatusLaboral = dbo.CARcEstatusLaboral.Id_CARcEstatusLaboral " & _
					" WHERE CARcSubprocuradurias.Id_CARcSubprocuradurias = "& Id_CARcSubprocuradurias  
					IF Id_CARcDG_o_Delegaciones <> 0 THEN 
					   CadenadeConsulta = CadenadeConsulta + " AND CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones = " & Id_CARcDG_o_Delegaciones 
					END IF
					 CadenadeConsulta = CadenadeConsulta + " AND CARdNombramientos.Id_CARcSINO = 1 " & _
                    " AND CARdSituacionLaboral.Id_CARcEstatusLaboral = " &Id_CARcEstatusLaboral & _
					" AND CARdSituacionLaboral.Id_CARcActual = 1 "&_
					" ORDER BY CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones, CARdDatosPersonales.ApellidoPaterno "
					
                ''AND CARdSituacionLaboral.Id_CARcEstatusLaboral = 1 /*ACTIVO     */
				''AND CARdSituacionLaboral.Id_CARcActual = 1 /*Es actual o no  */
				''AND CARdNombramientos.Id_CARcSINO = 1 /*Nombramiento Actual*/  



						
    
'=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
'response.write CadenadeConsulta
'response.end   					  
   Record.Open CadenadeConsulta, Coneccion
   %>
   <center>    
   
  
   <div align="left">
     <table width="860" border="0">
       <tr>
         
		 
<td width="118">
<!--<a href="javascript:imprimir()"> <img src="Multimedia/imagenes/LOGO_2007 PGR (170x120).png" width="111" height="63"></a>
-->
		 
		 
		 </td>
<% ' response.write TIME
'response.end   %>					  
         <td width="732"><p><strong>ADSCRIPCIÓN :</strong><%= Record1("CARcSubprocuradurias") %>
           </p>
		   <%IF CINT(Id_CARcDG_o_Delegaciones) <> O THEN %>
           <p>    <strong>DELEG. O DIR. GRAL:</strong> <%= Record1("CARcDG_o_Delegaciones")%>
            </p></td>
		   <%END IF %>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <!--td><input type="Button"   value="ESTADOS DE FUERZA" name="3" onClick=" location.href='DesplegarReportedeEstadosdeFuerza.asp?Id_CARcSubprocuradurias=<%'= Id_CARcSubprocuradurias%>&Id_CARcDG_o_Delegaciones=<%'= Id_CARcDG_o_Delegaciones%>'"></td-->
       </tr>
     </table>
     
   </div>
	 <BR>
   <table width="1381" border="1" class="SL">
   <%
   xDG = ""
    do until Record.Eof
	IF xDG <> Record("Id_CARcDG_o_Delegaciones") THEN
	   xDG = Record("Id_CARcDG_o_Delegaciones") %>
      <tr>
	 <td colspan="9"><p align="left"><font face="Arial, Helvetica, sans-serif" size="2"><b><%=Record("CARcDG_o_Delegaciones")%></b></font></p></td>
      </tr>
      <tr>
  <td class="Encabezados" width="223"><div align="center"><span class="Estilo5">NOMBRE</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">RFC</span></div></td>
  <td class="Encabezados" width="169"><div align="center"><span class="Estilo5">SITUACI&Oacute;N LABORAL </span></div></td>
  <td class="Encabezados" width="129"><div align="center"><span class="Estilo5">OBSERVACIONES DE SU SITUACIÓN LABORAL ACTUAL</span></div></td>

  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Ciudad</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Municipio/Delegación</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Nacionalidad</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">CURP</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Clave de elector</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Licencia</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">Dependencia de filiación</span></div></td>


  <td class="Encabezados" width="131"><div align="center"><span class="Estilo5">FECHA DE INGRESO </span></div></td>
  </tr>
<% 	END IF 	 %>
  <tr class="DATOS">
  <td> <div align="left"> <%= Record("ApellidoPaterno")%>&nbsp;<%= Record("ApellidoMaterno")%>&nbsp;<%= Record("Nombre")%>  </div></td>
  <td> <div align="left"> <%= Record("RFC") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcEstatusLaboral") %>  </div></td>
  <td> <div align="center"> <%= Record("CARdSituacionLaboral") %>  </div></td>

  <td> <div align="left"> <%= Record("Ciudad") %>  </div></td>
  <td> <div align="left"> <%= Record("MunicipiooDel") %>  </div></td>
  <td> <div align="left"> <%= Record("Nacionalidad") %>  </div></td>
  <td> <div align="left"> <%= Record("CURP") %>  </div></td>
  <td> <div align="left"> <%= Record("ClaveElector") %>  </div></td>
  <td> <div align="left"> <%= Record("Licencia") %>  </div></td>
  <td> <div align="left"> <%= Record("DependenciaFiliacion") %>  </div></td>


  <td> <div align="center"> <%= Record("Fecha_IngresoPGR") %>  </div></td>

  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table></center></FORM></body></html>
