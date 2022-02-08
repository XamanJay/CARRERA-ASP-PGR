 <!-- #Include File = "md5.asp" -->
<html><head><title>Cambiar  password</title></head>
<body bgproperties="fixed" background = "../softgri1.jpg">
<form action="" method="post" name="in2_passsw">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
 <%     Set Ob_Conn_cap = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_cap = Server.CreateObject ("ADODB.RecordSet")
      Ob_Conn_cap.Provider="sqloledb"
	  
 Ob_Conn_cap.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
		 
		 
		 PASSWORD	= MD5(TRIM(REQUEST.FORM("txtContrasena1")))
		 Id_CARcUSR = REQUEST.FORM("Id_CARcUSR")
		' response.write  PASSWORD
'		 response.end 
		 
		  
  var_query = "Update CARcUSR set PW = '" & PASSWORD & "' where  Id_CARcUSR = '" & Id_CARcUSR & "'"
		''response.write var_query
		''response.end 
		
	  Ob_RS_cap.Open var_query, Ob_conn_cap
	 
%>

<BR><BR><BR><BR><BR>
<center>
    <label><strong><font color="#000000" size="4">El cambio de password, se realizo 
    correctamente</font></strong></label>
  </center>
</form>
<%' Ob_RS_cap.close
	' Ob_conn_cap.close %>
</body>
</html>
