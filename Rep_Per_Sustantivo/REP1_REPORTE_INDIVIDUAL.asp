<%'Response.ContentType = "application/vnd.ms-word" 
'response.AddHeader "content-disposition", "inline; filename=111.doc" %>
<!-- Include File = "../Seguridad/Perfil.inc" -->
<html><head><title>Reporte Individual de Personal Sustantivo </title>
</head>
<body background="../softgri1.jpg" bgproperties="fixed">
<link href="../Estilo.css" rel="stylesheet" type="text/css">

<!------------------------------------------------------------------------------------->


<%
V_ODBC  = SESSION("ODBC")
    Id_CARdDatosPersonales = REQUEST.QueryString("Id_CARdDatosPersonales")

    SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET RECORD_1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")

	SET RECORD_2 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET RECORD_3 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET RECORD_4 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET RECORD_5 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
    Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

CadenadeConsulta = "SELECT * FROM VISTA_DATOSPERSONALES1 WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales &" AND Id_CARcTipoDomicilio = 1"						
  						 
'response.write 	 V_ODBC
'response.end 
		  
        Record.Open CadenadeConsulta, Coneccion		
 %>

<!------------------------------------------------------------------------------------->










<BR><BR>
  <center>
  <table width="707" border="1" class="SL">
  
  <tr>
  <td>
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
  
  <a href="javascript:imprimir()"><img src="../Multimedia/imagenes/LOGO_2007 PGR (170x120).png" width="132" height="81" border="0"></a> </td>
    <td width="707"><center>
      <em><strong>PROCURADUR&Iacute;A GENERAL DE LA REP&Uacute;BLICA </strong></em>
    </center>
	
	<center>
      <em><strong>CONSEJO DE PROFESIONALIZACI&Oacute;N </strong></em>
    </center>
	</td>
  </tr>
  
  
</table>
  
 


<!-- <table width="707" border="0" class="SL">
  <tr>
    <td width="707"><div align="right"><img src="../Multimedia/imagenes/<%'= Record ("Foto")  %>" width="84" height="93"></div></td>
  </tr>
  
</table>-->
  <BR><BR>
  
<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>DATOS PERSONALES</strong></em></center></td>
  </tr>
  
  <tr>
 
  
    <td><strong>NOMBRE:</strong> &nbsp;<%= Record ("ApellidoPaterno")  %>&nbsp;&nbsp; <%= Record ("ApellidoMaterno") %>&nbsp;&nbsp;<%= Record ("Nombre") %></td>
<!--	<td colspan="5"><div align="right"><img src="../Multimedia/imagenes/<%'= Record ("Foto")  %>" width="84" height="93"></div></td>-->
		<td colspan="5">
		<%IP_SERVER = Session("IP_SERVER")%>
		<div align="right"><img src="https://<%=IP_SERVER%>\FotosCarrera\IMAGENES\<%= Record ("Foto")  %>" width="84" height="93"></div>
		</td>
  </tr>
  <tr>
    <td><strong>RFC:</strong> &nbsp;<%= Record ("RFC")  %></td>
  </tr>
  <tr>
    <td><strong>ENTIDAD DE NACIMIENTO:</strong> &nbsp; <%= Record ("CARcEntidadFederativa")  %></td>
  </tr>
  <tr>
    <td><strong>ESTADO CIVIL:</strong> &nbsp; <%= Record ("CARcEdoCivil") %></td>
  </tr>
  <tr>
    <td height="26"><p><strong>DOMICILIO REGISTRADO: </strong>&nbsp;
      <BR><strong>CALLE:</strong> <%=Record("Calle")%>&nbsp;<strong><BR>NÚMERO:</strong><%=Record("Numero")%>&nbsp;<BR><strong>COLONIA:</strong><%=Record("Colonia")%>&nbsp;<strong><BR>TELEFONO:</strong><%=Record("Telefono")%></p></td>
  </tr>
  
  
</table>
<% Record.close%>
<BR><BR>

<%

'CadenadeConsulta = "SELECT * FROM VISTA_DATOSINSTITUCIONALES1 WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales 						

CadenadeConsulta = "SELECT * FROM VISTA_NOMBRAMIENTOS WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & _
                   "AND Id_CARcSINO = 1"	''Si y solo si existe un nombramiento Actual.					
  						 
						 
						 
      Record.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         				 
				 CARcTipoNombramiento = "SIN INFORMACIÓN"
				 CARcCategoria = "SIN INFORMACIÓN"
				 ADSCRITO_A = "SIN INFORMACIÓN"
		 
		    
		
				 ELSE
		         
				 CARcTipoNombramiento = Record("CARcTipoNombramiento")
				 CARcCategoria = Record("CARcCategoria")
				 ADSCRITO_A = RECORD("CARcDG_o_Delegaciones")
				 
				 END IF
		  
        	


%>
<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center>
      <em><strong>DATOS INSTITUCIONALES</strong></em>
    </center></td>
  </tr>
  
  <tr>
    <td>
	
	<strong>RAMA:</strong> &nbsp;<%= CARcTipoNombramiento  %>
	
	
	
	</td>
  </tr>
  <tr>
    <td>
	
	<strong>CATEGORIA:</strong> &nbsp; <%= CARcCategoria %>
	
	</td>
  </tr>
  
  
  
   <tr>
      
          
    <td><strong>ADSCRIPCIÓN:</strong> &nbsp; <%= ADSCRITO_A %></td>
  </tr>
  <% Record.close%>
  
  
   <%
'''Busca el primer curso que tomo
CadenadeConsulta = "SELECT Id_CARdDatosPersonales, CARcEstatusLaboral, CARcActual FROM  VISTA_ESTATUS " & _
                   " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & _
                   " AND CARcActual = 'SI'" 	
			''''	   RESPONSE.WRITE (CadenadeConsulta)					
			'''''''	RESPONSE.END 
  						 
				Record_1.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record_1.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         STATUSQUO = "SIN INFORMACIÓN"
				 ELSE
		         STATUSQUO = RECORD_1("CARcEstatusLaboral")
				 
				 END IF
		%>

  <tr>
    <td><strong>STATUS:</strong> &nbsp; <%= STATUSQUO %></td>
  </tr>
  <% Record_1.close%>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  <tr>
  <%
  CadenadeConsulta_Fingreso = "SELECT * FROM VISTA_DATOSPERSONALES1 WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales &" AND Id_CARcTipoDomicilio = 1"						
  						 
       RECORD_5.Open CadenadeConsulta_Fingreso, Coneccion		%>

<%  IF ISNULL(RECORD_5("Fecha_IngresoPGR"))   THEN
       F_I = "SIN INFORMACIÓN"
	ELSE
	  F_I = RECORD_5("Fecha_IngresoPGR")
	END IF 
	%>
    <td><strong>FECHA DE INGRESO PGR: </strong>&nbsp; <%= F_I %></td>
  </tr><%RECORD_5.CLOSE %>


  <%
'''Busca el primer curso que tomo
CadenadeConsulta = "SELECT MAX(Id_CARdFormacionInicial) AS ULTIMO, Generacion, CARcInstituto FROM  VISTA_FORMACION_INI " & _
                   " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & _
                   " GROUP BY Generacion, CARcInstituto, Id_CARdFormacionInicial ORDER BY Id_CARdFormacionInicial ASC" 	
				'''   RESPONSE.WRITE (CadenadeConsulta)					
				   '''RESPONSE.END 
  						 
				Record.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         FOR_INI = "SIN FORMACIÓN"
				 GEN = "---"
				ELSE
		         FOR_INI = RECORD("CARcInstituto")
				 GEN = RECORD("Generacion")
				 END IF
		%>


  
  
 
  <tr>
    <td><strong>FORMACIÓN INICIAL PGR: </strong><%= FOR_INI%>  </td>
  </tr>
    <tr>
    <td> <strong>GENERACIÓN: </strong> <%=  GEN%></td>
  </tr>

</table>
<% Record.close%>


<BR><BR>




<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>EVALUACIONES</strong></em></center></td>
  </tr>
  
   <%
'''Busca el primer curso que tomo
'CadenadeConsulta = "SELECT CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion FROM   VISTA_EVALUACIONESSS " & _
'                   " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & _
'                   " AND Id_CARcTipoEvaluacion = 1" 	
				   
				   
				   
  CadenadeConsulta = "SELECT MAX(Id_CARdEvaluaciones) AS ULTIMO, CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion FROM VISTA_EVALUACIONESSS " & _
                     " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & " AND Id_CARcTipoEvaluacion = 1 " & _
                     " GROUP BY CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion , Id_CARdEvaluaciones ORDER BY Id_CARdEvaluaciones DESC" 
                      	
					 
				  '' RESPONSE.WRITE (CadenadeConsulta)					
				'RESPONSE.END 
  						 
				Record_2.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record_2.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         CONFIANZA = "SIN INFORMACIÓN"
				 ELSE
		         CONFIANZA = RECORD_2("CARcResultadoEva")
				 
				 END IF
		%>

  
 
  <tr>
    <td><strong>CONFIANZA:</strong> &nbsp; <%= CONFIANZA %></td>
  </tr>
  <%RECORD_2.CLOSE%>

  
   <%
			   
  CadenadeConsulta = "SELECT MAX(Id_CARdEvaluaciones) AS ULTIMO, CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion FROM VISTA_EVALUACIONESSS " & _
                     " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & " AND Id_CARcTipoEvaluacion = 2 " & _
                     " GROUP BY CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion , Id_CARdEvaluaciones ORDER BY Id_CARdEvaluaciones DESC" 
                      	
					 
				 '''  RESPONSE.WRITE (CadenadeConsulta)					
				''RESPONSE.END 
  						 
				Record_3.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record_3.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         DESEMP = "SIN INFORMACIÓN"
				 ELSE
		         DESEMP = RECORD_3("CARcResultadoEva")
				 
				 END IF
		%>

  
  <tr>
    <td><strong>DESEMPEÑO:</strong> &nbsp; <%= DESEMP %></td>
  </tr>
    <%RECORD_3.CLOSE%>
	
	<%
			   
  CadenadeConsulta = "SELECT MAX(Id_CARdEvaluaciones) AS ULTIMO, CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion FROM VISTA_EVALUACIONESSS " & _
                     " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & " AND Id_CARcTipoEvaluacion = 3 " & _
                     " GROUP BY CARcResultadoEva, Id_CARdDatosPersonales, Id_CARcTipoEvaluacion , Id_CARdEvaluaciones ORDER BY Id_CARdEvaluaciones DESC" 
                      	
					 
				'''   RESPONSE.WRITE (CadenadeConsulta)					
				''RESPONSE.END 
  						 
				Record_4.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record_4.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         CONOCIMI = "SIN INFORMACIÓN"
				 ELSE
		         CONOCIMI = RECORD_4("CARcResultadoEva")
				 
				 END IF
		%>

  <tr>
    <td><strong>CONOCIMIENTOS:</strong>&nbsp; <%= CONOCIMI%> </td>
  </tr>
  <%RECORD_4.CLOSE%>
  
</table>




<BR><BR>
<%

' Muestra su ultimo Antecedente
CadenadeConsulta = "SELECT MAX(Id_CARdProcedimientos) AS ULTIMO, NumeroProcedimiento FROM VISTA_ANTECENTES_PROCEDIMIENTOS " & _
                   " WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales & _
                   " GROUP BY NumeroProcedimiento , Id_CARdProcedimientos ORDER BY Id_CARdProcedimientos DESC" 						
  						 
				Record.Open CadenadeConsulta, Coneccion, 3, 1	
				TotdeRegistros = Record.RECORDCOUNT
				
				IF TotdeRegistros = 0 THEN
		         CERO_PROCE = "SIN ANTECEDENTES"
				ELSE
		         CERO_PROCE = RECORD("NumeroProcedimiento")
				 END IF
		%>

<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>ANTECEDENTES ADMINISTRATIVOS</strong></em></center></td>
  </tr>
  
  <tr>
    <td><%= CERO_PROCE %> &nbsp;&nbsp;&nbsp; <%'= RECORD("NumeroProcedimiento") %></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<% Record.close%>



</center></body></html>
