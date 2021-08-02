
<TITLE><%= "Consultas de " + request("TIT")%></TITLE>

<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")

    v_ODBC  = SESSION("ODBC")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
'   RESPONSE.WRITE "SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password") 
    consulta = "select apellidoPaterno,apellidoMaterno,nombre,rfc,id_CARdDatosPersonales from CARdDatosPersonales order by apellidoPaterno,apellidoMaterno"
    Ob_RS.OPEN consulta, Ob_Conn
	
            xName = OB_RS("Nombre")
	        xPaterno = OB_RS("apellidoPaterno")
	        xMaterno = OB_RS("apellidoMaterno")
	        xRFC = OB_RS("rfc")
	        xId= OB_RS("id_CARdDatosPersonales")
	response.write "<Table borde=1>"
	do until OB_RS.EOF
	   IF  OB_RS("apellidoPaterno") = xPaterno AND  xMaterno = OB_RS("apellidoMaterno") THEN
        	response.write "<TR>"
	       RESPONSE.WRITE "<TD>"+xPaterno+"</TD><TD> "+xMaterno+"</TD><TD> "+ xName+"</TD><TD> "+xRFC+"</TD><TD> "+cstr(xId)+"</TD><TD>"
	       response.write "</TR>"
	      ' RESPONSE.WRITE OB_RS("apellidoPaterno")+" "+OB_RS("apellidoMaterno")+" "+ OB_RS("nombre")+" "+ OB_RS("rfc") 
		    debeUno = true
	    '   response.write "<BR>"
	    else   
		   if debeUno then
            	response.write "<TR>"
    	       RESPONSE.WRITE "<TD>"+xPaterno+"</TD><TD>"+xMaterno+" </TD><TD>"+ xName+" </TD><TD> "+xRFC+" </TD><TD>"+cstr(xId)+"</TD>"
            	response.write "</TR>"
		   end if 
		    debeUno = false
	   END IF 
            xName = OB_RS("Nombre")
	        xPaterno = OB_RS("apellidoPaterno")
	        xMaterno = OB_RS("apellidoMaterno")
	        xRFC = OB_RS("rfc")
	        xId= OB_RS("id_CARdDatosPersonales")
	   OB_RS.MOVENEXT
	loop
   response.write "</Table>"
		   response.write "F I N <BR>" 

%>

