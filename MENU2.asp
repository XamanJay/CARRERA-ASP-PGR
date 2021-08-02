<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<FORM>
<table>
<TR>
<TH>DATOS GENERALES</TH>
</TR>
<TR>
      <TD> 
	     <select name='MENU1' size=1 onChange="SeleMenu2()">
          <option selected value='0'> DATOS GENERALES </option>
          <option value='1'> UNO </option>
          <option value='2'> DOS </option>
        </select>
		</TD>
</TR>
</table>
</FORM>
</body>
</html>
<%
function SeleMenu2()
  response.write "hola"
end function

%>

<script LANGUAGE="JavaScript">
	function SeleMenu()
	{
	alert("hola");
//		document.location="//<%= session("IP_SERVER")%>/carrerapgr/MFiltro.asp=" 
	}
	
</script>

