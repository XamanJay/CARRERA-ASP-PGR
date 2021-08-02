<html><head><title>En esta pagina solo voy a ejecutar el store procedure de PA_OBSERVACIONES_LISTAS para grabar un solo dato</title>
</head><body bgproperties="fixed" background = "../Multimedia/imagenes/softgri1.jpg">
<link  rel="stylesheet" type="text/css" href="../Estilo.css" >
<%    Set Ob_Conn_po = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_po = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_RS_sp = Server.CreateObject("ADODB.RecordSet")
	    Ob_Conn_po.PROVIDER="sqloledb"
        Ob_Conn_po.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE=EVALUA;UID=" + Session("UserID") + ";PWD=" + Session("Password")
		
	Id_PLAdPersonas = TRIM(REQUEST.QUERYSTRING("Id_PLAdPersonas"))
	Id_PLAdListas = TRIM(REQUEST.QUERYSTRING("Id_PLAdListas"))
	Observa = TRIM(REQUEST.QUERYSTRING("Observa"))
	Asistio = TRIM(REQUEST.QUERYSTRING("Asistio"))
	'Response.write(Observa)
	'Response.write(Asistio)
	'Response.end 
	
	IF request.form(Asistio) = "1" THEN
		    Asistio = "1"
			
		 ELSE 
		    Asistio = "NULL"
		 END IF 
	
		 ''' Ob_RS_po.Open var_query, ob_conn_po %>
	<%  var_sp = "exec PA_OBSERVACIONES_LISTAS " & Id_PLAdPersonas &", " & Id_PLAdListas & _
	         ", '" & request.form(Observa) & "', " & request.form(Asistio)
			 
			response.Write(var_sp)  
			response.end
  '''  Ob_RS_sp.Open var_sp, ob_conn_po 
	

 
  '''Ob_RS_po.Close
  Ob_Conn_po.Close %>
  
  <br><br><br><br>
         <hr>	  
<center>
  <p class="Estilo1">
    <label><font size="4">Registro(s) Grabado(s) Correctamente</font> 
    </label>
  </p>
</center>
      <hr>
	  <br>
	  <br><br> 
</body></html>


