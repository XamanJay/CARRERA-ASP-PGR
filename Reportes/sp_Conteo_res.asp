<html><head><title>pagina para ejecutar el store procedure</title>
</head>

<body background="softgri1.jpg">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">

<%    Set Ob_Conn_pre = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_uni_ad = Server.CreateObject("ADODB.RecordSet")
	  Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
      Ob_Conn_pre.Provider="sqloledb"
IP_Servidor = session("IP_Servidor")
  Ob_Conn_pre.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")%>
<%Sql=   "exec sp_Presupuesto_Comprometido " & _
 	               Request.Form("inpUniadm")& ", " & _
	                 
		'response.Write(sql)
				   
	Ob_RS.Open Sql, Ob_Conn_pre

	Response.write "<CENTER><H1>La cantidad comprometida, ha sido registrada</H1></CENTER>"

%>
<center><a href="https://<%=session("IP_Servidor")%>/presupuestos/PRESU_acceso_comprometido.asp">Liga</a></center>



</body>
</html>
