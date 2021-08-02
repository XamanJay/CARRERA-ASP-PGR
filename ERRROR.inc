<%If Err.Number <> 0 Then

		   
		   
		   
		   
		   
		   
		   
        Set Ob_ConnErr = Server.CreateObject ("ADODB.Connection")
		Set Ob_RS_Err = Server.CreateObject ("ADODB.RecordSet")
		'v_ODBC  = "10.3.194.244/DESE-DESAR01/ErrorPGR" 
			v_ODBC  = "ErrorPGR" 
		Ob_ConnErr.Open v_ODBC,"usrError","uerror"
		
		Descrip=replace(Err.Description,"'","""")
		NumErr=Err.Number
		LinErr=Error.Line
		ArchErr=Err.Source
		Dest=replace(Request.ServerVariables("URL"),"'","""")
		Ref=replace(Request.ServerVariables("APPL_PHYSICAL_PATH"),"'","""")
		
		Sql = "Insert Into PGRError (PGRError,NumeroError,FuenteError,IP_GeneraError,IP_ServidorError,MacAddress,destino,referencia)"
		Sql = Sql + " values ('"+Descrip+"','"+CSTR(Err.Number)+"','"+Err.Source+"','"+Request.ServerVariables("REMOTE_ADDR")+"','"+Request.ServerVariables("LOCAL_ADDR")+"','10','"+Dest+"','"+Ref+"')"
		
		response.write Sql
		Ob_RS_Err.Open Sql, ob_connErr  
					
		ob_connErr.Close	
		Set Ob_RS_Err = Nothing
		
		
		
		
		
		
		
		response.Clear
	       Response.Write ("<br><br>")
		   Response.Write ("<FONT COLOR= #3366CC>El Sistema ha detectado que uno de los datos no cumple con las reglas de validación, le agradeceremos verifique su captura. Gracias.</FONT><br><br><br>")
		   Response.Write (Err.Description& "<br>")
	       response.end 
		   
		   
 End If %>
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 


