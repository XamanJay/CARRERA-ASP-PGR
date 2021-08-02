<!-- #Include File = "MD5/md5.asp" -->
<!-- #Include File = "Seguridad/ConfigSec.inc" -->
<html><head><title>Pagina nueva 1</title>
<base target="_self">
<style>
<!--
a:hover{color:blue}
a{text-decoration:none}
.look{font:bold 11.0pt Arial;}
.look2{font:bold 7pt Arial;}
.folding{cursor:hand}
a:hover{color:blue}
//-->
</style>

<script language="JavaScript">
<!--
img1=new Image()
img1.src="Imagenes/BD14982_.GIF"
img2=new Image()
img2.src="Imagenes/BD14982_.GIF"
ns6_index=0

function change(e){

if(!document.all&&!document.getElementById)
return

if (!document.all&&document.getElementById)
ns6_index=1

var source=document.getElementById&&!document.all? e.target:event.srcElement
if (source.className=="folding"){
var source2=document.getElementById&&!document.all? source.parentNode.childNodes:source.parentElement.all
if (source2[2+ns6_index].style.display=="none"){
source2[0].src="Imagenes/BD14982_.GIF"
source2[2+ns6_index].style.display=''
}
else{
source2[0].src="Imagenes/BD14982_.GIF"
source2[2+ns6_index].style.display="none"
}
}
}
document.onclick=change
//-->
</script>
<script language="JavaScript">
<!--
img1=new Image()
img1.src="Imagenes/BD14982_.GIF"
img2=new Image()
img2.src="Imagenes/BD14982_.GIF"
ns6_index=0

function change(e){

if(!document.all&&!document.getElementById)
return

if (!document.all&&document.getElementById)
ns6_index=1

var source=document.getElementById&&!document.all? e.target:event.srcElement
if (source.className=="folding"){
var source2=document.getElementById&&!document.all? source.parentNode.childNodes:source.parentElement.all
if (source2[2+ns6_index].style.display=="none"){
source2[0].src="Imagenes/BD14982_.GIF"
source2[2+ns6_index].style.display=''
}
else{
source2[0].src="Imagenes/BD14982_.GIF"
source2[2+ns6_index].style.display="none"
}
}
}
document.onclick=change
//-->
</script>
<%
Set Ob_Conn = Server.CreateObject("ADODB.Connection")
Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
'v_ODBC  = "SIIFP"
Ob_Conn.PROVIDER="sqloledb"
Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ u() +";PWD="+ p()
   IdUSR = SESSION("IdLogin")
   SQL = "Select * from CARdUsrModulo Where Id_CARcUsr="+CSTR(IdUsr)
   Ob_RS.Open Sql, Ob_Conn
   MPersonal = 1
   MCapacitacion = 2
   MPerfiles = 3
   MSelPersonal = 4
'   RESPONSE.WRITE IDUSR
'   RESPONSE.END
%>
<meta https-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgproperties="fixed" background = "Multimedia/imagenes/menus/menu_superior.jpg" topmargin="0" leftmargin="0" text=FFFFFF link=FFFFFF vlink=FFFFFF alink=ffffff>	
<form action="GRECA_crea_menu_II.asp" method="post" name="greca_menu2" >

<table border='0' bordercolor='330099' align='left' > <tr><th border='1' valign='top' align='left' width='250' heigth='300' >
<%do while not OB_RS.EOF%>
   <%IF  OB_RS("Id_CARcModulo") = MPerfiles THEN
   'IF  OB_RS("Id_CARcModulo") = MPersonal THEN%>
     <div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10' alt ="Liga al sistema de Formación Profesional"><a class='folding' target='_blank'  href='https://<%= session("IP_SERVER")%>/Formacion_Profesional'>Puestos y Perfiles</a></li></th><th border='1' valign='top' align='left' width='250' heigth='300' >
   <%END IF %>
   <%IF  OB_RS("Id_CARcModulo") = MPersonal THEN%>
     <div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10' alt ="Modulo de Personal"><a class='folding' target='leftFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/GRECA_M34_Personal_Desplegable.asp'>PERSONAL</a></li></th><th border='1' valign='top' align='left' width='250' heigth='300' >
   <%END IF %>
   <%IF  OB_RS("Id_CARcModulo") = Mcapacitacion THEN%>
     <div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10' alt ="Modulo de Capacitación"><a class='folding' target='leftFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/GRECA_crea_menu_II.asp?var_Id_gcdmenus=2178&par_Id_menupadre=Capacitación&par_Id_aplicacion=34'>Capacitación</a></li></th><th border='1' valign='top' align='left' width='250' heigth='300' >
   <%END IF %>
   <%IF  OB_RS("Id_CARcModulo") = MSelPersonal THEN%>
     <div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10' alt ="Modulo de Evaluaciones"><a class='folding' target='leftFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/GRECA_crea_menu_II.asp?var_Id_gcdmenus=2404&par_Id_menupadre=Evaluaciones&par_Id_aplicacion=34'>Selección de Personal</a></li></th></tr></table></ul> </div>
   <%END IF %>
   <%OB_RS.MOVENEXT%>
<%LOOP %>

  </form>   
</body>
</html>

