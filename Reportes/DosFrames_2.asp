<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "https://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta https-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<% 
  variable_Id_CAPdConvocatoria = Request.QueryString("Id_CAPdConvocatoria")
%>

	
<FRAMESET rows ="19%,81%" cols="*" Border=2>
  <FRAME SRC="Consultas_G_CAPdConvocatoria.asp?Id_CAPdConvocatoria=<%=variable_Id_CAPdConvocatoria%>" scrolling="yes" NAME="Superior">
  <FRAME SRC="Consultas_G_CAPdCurso_2.asp?Id_CAPdConvocatoria=<%=variable_Id_CAPdConvocatoria%>" NAME="Inferior" NORESIZE scrolling="auto">
</FRAMESET>



<noframes><body>

</body></noframes>
</html>