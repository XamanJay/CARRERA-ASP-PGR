<%
If Err.Number <> 0 Then
        %>
		
	<BODY BGCOLOR="C0C0C0">
	<%  response.clear %>
	<B>ALERTA</B><BR><BR>
			
	<%
		response.write "Error Número"
		response.write Err.Number
		If Err.Number = -2147217900 Then 		
		%>	<BR><BR>
			<FONT FACE="ARIAL"">Se ha detectado que uno de los datos no cumple con las reglas de validación, le agradeceremos verifique su captura. Gracias.<P> 
			<B>Datos inconsistentes</B><BR><BR>
			<B>Descripción del Error: </B><%=Err.Description%><BR>
		</FONT>
	<%else   
		Set Ob_ConnErr = Server.CreateObject ("ADODB.Connection")
		Set Ob_RS_Err = Server.CreateObject ("ADODB.RecordSet")
		v_ODBC  = "ErrorPGR" 
		Ob_ConnErr.Open v_ODBC,"apalacios","123"
		Descrip=replace(Err.Description,"'","""")
		NumErr=Err.Number
		LinErr=Error.Line
		ArchErr=Err.Source
		Dest=replace(Request.ServerVariables("URL"),"'","""")
		Ref=replace(Request.ServerVariables("APPL_PHYSICAL_PATH"),"'","""")
		Sql = "Insert Into PGRError (PGRError,NumeroError,FuenteError,IP_GeneraError,IP_ServidorError,MacAddress,destino,referencia)"
		Sql = Sql + " values ('"+Descrip+"','"+CSTR(Err.Number)+"','"+Err.Source+"','"+Request.ServerVariables("REMOTE_ADDR")+"','"+Request.ServerVariables("LOCAL_ADDR")+"','10-25-98-63-58-85','"+Dest+"','"+Ref+"')"
		'response.write Sql
		Ob_RS_Err.Open Sql, ob_connErr  
					
		ob_connErr.Close	
		Set Ob_RS_Err = Nothing
		
		'response.clear
		%>
		<FONT FACE="ARIAL"">Se ha presentado un error en el procesamiento de la informacion de está página,  Por favor contacte al administrador del sistema. Gracias.<P> 
			<B>Page Error Object</B><BR>
			Número de Error: <%=NumErr%><BR>
			Descripción del Error: <%=Descrip%><BR>
			Arcrhivo con error:  <%=ArchErr%><BR>
			Número de Línea:    <%=LinErr%><BR>			
			<%err.close%>
		</FONT>
	<%End If%>
<%End If%>
