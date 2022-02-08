<%
'response.write "no mammmmmmeeeeeeeeessss:"
IDPer= request("Id_CARdDatosPersonales")
'response.write IDPer

%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgproperties="fixed" bgcolor="#E5E5E5" topmargin="0" leftmargin="0" text="FFFFFF" link="FFFFFF" vlink=FFFFFF alink=ffffff>

<form action="" method="post" >
<table border='0' bordercolor='330099' align='left' > 
<tr>
<th border='1' valign='top' align='left' width='208' heigth='300' >
      <a target="topFrame2" id='PER'  onClick="SeleMenu('PER')" href="CARR_MENU2.asp?OP=PER&IDPer=<%= IDPer%>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#003399">DATOS GENERALES</font></a>
</Th>
<th border='1' valign='top' align='left' width='192' heigth='300' >
      <a target="topFrame2" id='TRA' onClick="SeleMenu('TRA')" href="CARR_MENU2.asp?OP=TRA&IDPer=<%= IDPer%>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#003399">TRAYECTORIA PGR</font></a>
</Th>
<th border='1' valign='top' align='left' width='350' heigth='300' >
      <a target="topFrame2" id='CAP' onClick="SeleMenu('CAP')" href="CARR_MENU2.asp?OP=CAP&IDPer=<%= IDPer%>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#003399">CAPACITACIÓN</font></a>
</Th>
</TR>	  
<!--INPUT TYPE="button" NAME='Forma2' Value = 'frame2'-->
</table>
 <!--ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
     <li> <a  target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdDatosPersonales.asp?var_Id_gcdmenus=2097">Datos Personales</a></li>
     <li>    <a target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdFicha.asp">Media Filiación</a></li>	
     <li>    <a target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdEscolaridad.asp">Historial Academico</a></li>	
    <li>     <a  target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdFamilia.asp">Referencias</a></li>	
	<li>     <a  target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdExperienciaLaboral.asp">Historial Laboral</a></li>	
     <li>    <a  target="mainFrame" href="https://<%= session("IP_SERVER")%>/carrerapgr/Consultas_CARdIdiomas.asp">Idiomas</a></li>	

 </ul> 
</div-->

<INPUT TYPE="Hidden" id=IDPER NAME='idPersona' Value = <%request("Id_CARdDatosPersonales")%> >
<INPUT TYPE="Hidden" id=IDOP NAME='idOPCION' Value ='INI' >
</form>
</body>
 </html>
 <script LANGUAGE="JavaScript">
	function SeleMenu(pas)
	{
	 parent.mainFrame4.location.href="FondoAuxiliar.asp"
	var IDMenu = document.getElementById("IDOP").value;
	 document.getElementById(pas).style.backgroundColor="#00CCCC";	
	if (IDMenu != 'INI')
     { document.getElementById(IDMenu).style.backgroundColor="#E5E5E5" }
	 document.getElementById("IDOP").value=pas;	
	}
	
</script>
