<html><head><title>Armazón de Resultados</title>
<style type="text/css">
<!--
.Estilo5 {color: #FFFFFF; font-weight: bold; }
.Estilo6 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<body background="softgri1.jpg">
<FORM name="ARMA" action="123.asp" metdod="post" >
<% 
   Id_CARcSubprocuradurias  = Request.FORM("Id_CARcSubprocuradurias")
   Id_CARcDG_o_Delegaciones = Request.FORM("Id_CARcDG_o_Delegaciones")
   
   
   
   SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET RS_Insert = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Record    = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Record1    = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
   Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="&Session("IP_SERVER")&";DATABASE="+ SESSION("V_ODBC") +";UID="+ SESSION("UserID") +";PWD="+ SESSION("Password")
   
   '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  
  Adscripcion = " SELECT * FROM  VISTA_SUBPROCURADURIA_DELEGACION WHERE  Id_CARcSubprocuradurias = " & Id_CARcSubprocuradurias & _ 
                "AND  Id_CARcDG_o_Delegaciones = "& Id_CARcDG_o_Delegaciones 
    Record1.Open Adscripcion, Coneccion
	
	  
CadenadeConsulta =  " SELECT     dbo.CARdDatosPersonales.Id_CARdDatosPersonales, dbo.CARdDatosPersonales.RFC, dbo.CARdDatosPersonales.ApellidoPaterno, " & _
                     " dbo.CARdDatosPersonales.ApellidoMaterno, dbo.CARdDatosPersonales.Nombre, dbo.CARdDatosPersonales.Fecha_IngresoPGR,  " & _
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
					" WHERE CARcSubprocuradurias.Id_CARcSubprocuradurias = "& Id_CARcSubprocuradurias & _
					" AND CARcDG_o_Delegaciones.Id_CARcDG_o_Delegaciones = " & Id_CARcDG_o_Delegaciones & _
					" AND CARdNombramientos.Id_CARcSINO = 1 " & _
                    " AND CARdSituacionLaboral.Id_CARcEstatusLaboral = 1 " & _
					" AND CARdSituacionLaboral.Id_CARcActual = 1 "
					
             ''      AND CARdSituacionLaboral.Id_CARcEstatusLaboral = 1 /*ACTIVO     */
				''AND CARdSituacionLaboral.Id_CARcActual = 1 /*Es actual o no  */
				''AND CARdNombramientos.Id_CARcSINO = 1 /*Nombramiento Actual*/  



						
    
   '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
'response.write CadenadeConsulta
'response.end   					  
   Record.Open CadenadeConsulta, Coneccion
    %>
   <center>    
   <p><BR>
       <span class="Estilo6">PROCURADURÍA GENERAL DE LA REPÚBLICA <br>
       </span>   </p>
   
  
   
	 <BR>
   <table width="1381" border="1" class="SL">
  <tr>
  <td class="Encabezados" width="223"><div align="center"><span class="Estilo5">NOMBRE</span></div></td>
  <td class="Encabezados" width="55"><div align="center"><span class="Estilo5">RFC</span></div></td>
  <td class="Encabezados" width="168"><div align="center"><span class="Estilo5">TIPO DE NOMBRAMIENTO</span></div></td>
  <td class="Encabezados" width="174"><div align="center"><span class="Estilo5">RAMA</span></div></td>
  <td class="Encabezados" width="121"><div align="center"><span class="Estilo5">CATEGOR&Iacute;A</span></div></td>
  <td class="Encabezados" width="153"><div align="center"><span class="Estilo5">SUBSEDEO DIRECCI&Oacute;N </span></div></td>
  <td class="Encabezados" width="131"><div align="center"><span class="Estilo5">FECHA DE INGRESO </span></div></td>
  <td class="Encabezados" width="169"><div align="center"><span class="Estilo5">SITUACI&Oacute;N LABORAL </span></div></td>
  <td class="Encabezados" width="129"><div align="center"><span class="Estilo5">OBSERVACIONES</span></div></td>
    <% do until Record.Eof
	
	

	
	
	
	 %>
  <tr class="DATOS">
  <td> <div align="center"> <%= Record("ApellidoPaterno")%>&nbsp;<%= Record("ApellidoMaterno")%>&nbsp;<%= Record("Nombre")%>  </div></td>
  <td> <div align="center"> <%= Record("RFC") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcNombramiento") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcTipoNombramiento") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcCategoria") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcDir_o_subsede") %>  </div></td>
  <td> <div align="center"> <%= Record("Fecha_IngresoPGR") %>  </div></td>
  <td> <div align="center"> <%= Record("CARcEstatusLaboral") %>  </div></td>
  <td> <div align="center"> <%= Record("CARdSituacionLaboral") %>  </div></td>

  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table></center></FORM></body></html>
