<html><head><title>Documento sin t&iacute;tulo</title>
</head>
<body background="../softgri1.jpg">
<link href="../Estilo.css" rel="stylesheet" type="text/css">

<!------------------------------------------------------------------------------------->


<%
    Id_CARdDatosPersonales = REQUEST.QueryString("Id_CARdDatosPersonales")

    SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	SET Record_Contar = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 Coneccion.PROVIDER="sqloledb"
    Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

CadenadeConsulta = "SELECT * FROM VISTA_DATOSPERSONALES1 WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales &" AND Id_CARcTipoDomicilio = 1"						
  						 
'''response.write 	 CadenadeConsulta
'''response.end 
		  
        Record.Open CadenadeConsulta, Coneccion		
 %>

<!------------------------------------------------------------------------------------->










<BR><BR>
  <center>
  <table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>DIRECCIÓN GENERAL DEL SERVICIO DE CARRERA DE PROCURACIÓN DE </strong></em></center></td>
  </tr>
  <tr>
    <td><center><em><strong>JUSTICIA FEDERAL</strong></em></center></td>
  </tr>
  <tr>
    <td><center><em><strong>DIRECCIÓN DE CONTROL DEL REGISTRO DE PERSONAL SUSTANTIVO</strong></em></center></td>
  </tr>
</table>
  
 


 <table width="707" border="0" class="SL">
  <tr>
    <td width="707"><div align="right"><img src="../Multimedia/imagenes/<%= Record ("Foto")  %>" width="84" height="93"></div></td>
  </tr>
  
</table>
  
  
<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>DATOS PERSONALES</strong></em></center></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>NOMBRE:</strong> &nbsp;<%= Record ("ApellidoPaterno")  %>&nbsp;&nbsp; <%= Record ("ApellidoMaterno") %>&nbsp;&nbsp;<%= Record ("Nombre") %></td>
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
    <td><strong>DOMICILIO REGISTRADO: </strong>&nbsp;<strong>CALLE:</strong> <%=Record("Calle")%>&nbsp;<strong>NÚMERO:</strong><%=Record("Numero")%>&nbsp;<strong>COLONIA:</strong><%=Record("Colonia")%>&nbsp;<strong>TELEFONO:</strong><%=Record("Telefono")%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
</table>
<% Record.close%>
<BR><BR>

<%

CadenadeConsulta = "SELECT * FROM VISTA_DATOSINSTITUCIONALES1 WHERE Id_CARdDatosPersonales = " & Id_CARdDatosPersonales 						
  						 
'''response.write 	 CadenadeConsulta
'''response.end 
		  
        Record.Open CadenadeConsulta, Coneccion		


%>
<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center>
      <em><strong>DATOS INSTITUCIONALES</strong></em>
    </center></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>RAMA:</strong> &nbsp;<%= RECORD("CARcTipoNombramiento") %></td>
  </tr>
  <tr>
    <td><strong>CATEGORIA:</strong> &nbsp; <%= RECORD("CARcCategoria") %></td>
  </tr>
  <tr>
    <td><strong>STATUS:</strong> &nbsp;</td>
  </tr>
  <tr>
    <td><strong>ADSCRIPCIÓN:</strong> &nbsp; <%= RECORD("CARcAdscripciones_corta") %></td>
  </tr>
  <tr>
    <td><strong>FECHA DE INGRESO PGR: </strong>&nbsp; <%= RECORD("Fecha_IngresoPGR") %></td>
  </tr>
  <tr>
    <td><strong>FORMACIÓN INICIAL PGR: </strong>&nbsp;</td>
  </tr>
  
</table>



<BR><BR>




<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>EVALUACIONES</strong></em></center></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>CONFIANZA:</strong> &nbsp; <%= RECORD("CARcResultadoEva") %></td>
  </tr>
  <tr>
    <td><strong>DESEMPEÑO:</strong> &nbsp; <%'= RECORD("CARcTipoEvaluacion") %></td>
  </tr>
  <tr>
    <td><strong>APROBADO:</strong> &nbsp;</td>
  </tr>
  
  
</table>




<BR><BR>



<table width="707" border="1" class="SL">
  <tr>
    <td width="707"><center><em><strong>ANTECEDENTES ADMINISTRATIVOS</strong></em></center></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>ANTECEDENTES:</strong> &nbsp;<%= RECORD("CARcTipoProcedimiento") %></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>




</center></body></html>
