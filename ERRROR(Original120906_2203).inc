<%If Err.Number <> 0 Then
		   response.Clear
	       Response.Write ("<br><br>")
		   Response.Write ("<FONT COLOR= #3366CC>Se ha detectado que uno de los datos no cumple con las reglas de validación, le agradeceremos verifique su captura. Gracias.</FONT><br><br><br>")
		   Response.Write (Err.Description& "<br>")
	       response.end 
	     End If %>