<%
    v_ODBC  = SESSION("ODBC")
'	response.write v_ODBC
'	response.end
    IdUSR = SESSION("IdLogin")
    mper = request.QueryString("Id_CARdDatosPersonales")
     Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
     SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     Ob_Conn.PROVIDER="sqloledb"
     Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
	 SQL = "SELECT  dbo.CARdDatosPersonales.Id_CARdDatosPersonales, dbo.CARdDatosPersonales.Foto, dbo.CARdFicha.Firma, dbo.CARdFicha.Huellas, dbo.CARdFicha.VOZ "
     SQL = SQL + " FROM  dbo.CARdDatosPersonales left JOIN dbo.CARdFicha ON dbo.CARdDatosPersonales.Id_CARdDatosPersonales = dbo.CARdFicha.Id_CARdDatosPersonales "
	 SQL = SQL + " WHERE CARdDatosPersonales.Id_CARdDatosPersonales = "+request("Id_Persona")
'	 RESPONSE.WRITE SQL
'	 RESPONSE.END
	 Ob_RS.Open SQL, ob_conn  	   
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<TABLE width="858">
<TR>
    <TD width="78">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
	<% IF ob_RS("foto") <>  "" THEN %>
      <input border="2" src='https://<%= session("IP_SERVER")%>/FotosCarrera/Imagenes/<%= ob_RS("foto") %>' name="I1"  type="image" width="200" height="220"> 
	<% else %>
      <input border="2" src='http://<%= session("IP_SERVER")%>/FotosCarrera/Imagenes/NOFOTO.GIF' name="I1"  type="image" width="110" height="110"> 
	<% END IF %>
    </TD>
<TD width="57">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<% IF ob_RS("FIRMA") <>  "" THEN %>
      <input border="2" src='https://<%= session("IP_SERVER")%>/FotosCarrera/Firmas/<%= ob_RS("FIRMA") %>' name="I1"  type="image" width="200" height="220"> 
	<% else %>
      <input border="2" src='http://<%= session("IP_SERVER")%>/FotosCarrera/Firmas/NOFIRMA.GIF' name="I1"  type="image" width="110" height="110"> 
	<% END IF %>
</TD>
<TD width="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<% IF ob_RS("huellas") <>  "" THEN %>
      <input border="2" src='https://<%= session("IP_SERVER")%>/FotosCarrera/Huellas/<%= ob_RS("HUELLAS") %>' name="I1"  type="image" width="200" height="220"> 
	<% else %>
      <input border="2" src='http://<%= session("IP_SERVER")%>/FotosCarrera/Huellas/NOHUELLA.GIF' name="I1"  type="image" width="110" height="110"> 
	<% END IF %>
</TD>
<TD width="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <DIV align="left">
        <% IF ob_RS("VOZ") <>  "" THEN %>
        <a href="     https://<%= session("IP_SERVER")%>/FotosCarrera/VOZ/<%= ob_RS("VOZ") %>" ><STRONG> Registro de Voz</STRONG></a>
        <% else %>
        <input border="2" src='http://<%= session("IP_SERVER")%>/FotosCarrera/VOZ/SINVOZ.GIF' name="I1"  type="text" width="110" height="110"> 
        <% END IF %>
        </DIV></TD>


</TR>
</TABLE>
<P><center>
  <INPUT TYPE="button" VALUE="Regresar" ONCLICK="location.href='javascript:window.history.back()'   " >
</center></P>
</body>
</html>
