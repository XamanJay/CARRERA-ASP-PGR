<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Pagina nueva 1</title>
</head>
<!-- #Include File = "RelatSelect.inc" -->
<body>
<%
sPath = Request.ServerVariables("APPL_PHYSICAL_PATH")&"Seleccion"
CALL RelatSelectAccess("bd.mdb",sPath,"tSeleccion")

Set Ob_Conn = Server.CreateObject("ADODB.Connection")
DSNtest="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest=dsntest & "DBQ=" & Server.MapPath("bd.mdb")
Ob_Conn.Open DSNtest

Set Ob_RS = Server.CreateObject("ADODB.Recordset")
%>
<form method="POST" name="frm" action="seleccion.asp" webbot-action="--WEBBOT-SELF--">
  <p>
  <select size="1" name="D1" onchange="cambia(document.frm.D1,document.frm.D2,document.frm.D3,document.frm.D4,document.frm.D5)">
    <option value="0">-seleccionar-</option>
	<%Sql = "Select * from tSeleccion where idpadre is null order by Elemento"
   	  Ob_RS.Open Sql, Ob_Conn
   	  Do until Ob_RS.Eof%>
   		<option <%if nIdElemento = Ob_RS("IdElemento") then%>selected<%end if%> value="<%=Ob_RS("IdElemento")%>"><%=Ob_RS("Elemento")%></option>
   	<%Ob_RS.MoveNext
   	Loop%>
  </select></p>
  <p><select size="1" name="D2" onchange="cambia(document.frm.D2,document.frm.D3,document.frm.D4,document.frm.D5,0)">
  <option value="0">-seleccionar-</option>
  </select></p>
  <p><select size="1" name="D3" onchange="cambia(document.frm.D3,document.frm.D4,document.frm.D5,0,0)">
  <option value="0">-seleccionar-</option>
  </select></p>
  <p><select size="1" name="D4" onchange="cambia(document.frm.D4,document.frm.D5,0,0,0)">
  <option value="0">-seleccionar-</option>
  </select></p>
  <p><select size="1" name="D5">
  <option value="0">-seleccionar-</option>
  </select></p>    
  <p><input type="submit" value="Enviar" name="B1"><input type="reset" value="Restablecer" name="B2"></p>
</form>
<%
Set Ob_Conn = Nothing
Set Ob_RS = Nothing
%>
</body>

</html>