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
<meta https-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgproperties="fixed" background = "Multimedia/imagenes/menus/menu_izquierdo.jpg" topmargin="0" leftmargin="0" text=FFFFFF link=FFFFFF vlink=FFFFFF alink=ffffff>	

<form action="GRECA_crea_menu_II.asp" method="post" name="greca_menu2" >
  <img src='Multimedia/imagenes/menus/circulo01.gif'><strong><font size="4">Catalogos</font></strong> 
  <p style='margin-left: -1; margin-right: -1'>

<!---
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcCatalogoCurso.asp?var_Id_gcdmenus=2155&par_Id_menupadre=Catalogo de cursos&par_Id_aplicacion=34'>Catalogo de cursos</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcRespuestasPermitidas.asp?var_Id_gcdmenus=2159&par_Id_menupadre=Catalogo de respuestas permitidas (agrupadas)&par_Id_aplicacion=34'>Catalogo de respuestas permitidas (agrupadas)</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcRespuestas.asp?var_Id_gcdmenus=2158&par_Id_menupadre=Catalogo de respuestas permitidas (detalle)&par_Id_aplicacion=34'>Catalogo de respuestas permitidas (detalle)</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcTipos_evaluacion.asp?var_Id_gcdmenus=2161&par_Id_menupadre=Tipos de evaluacion&par_Id_aplicacion=34'>Tipos de evaluacion</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcSede.asp?var_Id_gcdmenus=2160&par_Id_menupadre=Catalogo de sedes&par_Id_aplicacion=34'>Catalogo de sedes</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcInstructores.asp?var_Id_gcdmenus=2157&par_Id_menupadre=Catalogo de instructores&par_Id_aplicacion=34'>Catalogo de instructores</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadCapacitadora.asp?var_Id_gcdmenus=2170&par_Id_menupadre=Entidad Capacitadora&par_Id_aplicacion=34'>Entidad Capacitadora</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadCoordinadora.asp?var_Id_gcdmenus=2171&par_Id_menupadre=Entidad Coordinador&par_Id_aplicacion=34'>Entidad Coordinador</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadPatrocinadora.asp?var_Id_gcdmenus=2172&par_Id_menupadre=Entidad Patrocinadora&par_Id_aplicacion=34'>Entidad Patrocinadora</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPdPlantilla_preguntas_cuestionarios.asp?var_Id_gcdmenus=2166&par_Id_menupadre=Preguntas cuestionarios&par_Id_aplicacion=34'>Preguntas cuestionarios</a></td><hr></div></ul> </div><br>
--->

<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CARcCatalogoCursosPGR.asp?var_Id_gcdmenus=2155&par_Id_menupadre=Catalogo de cursos&par_Id_aplicacion=34'>Catálogo de cursos PGR</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcInstructores.asp?var_Id_gcdmenus=2157&par_Id_menupadre=Catalogo de instructores&par_Id_aplicacion=34'>Catálogo de instructores</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadCapacitadora.asp?var_Id_gcdmenus=2170&par_Id_menupadre=Entidad Capacitadora&par_Id_aplicacion=34'>Catálogo de Entidades Capacitadoras</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadCoordinadora.asp?var_Id_gcdmenus=2171&par_Id_menupadre=Entidad Coordinador&par_Id_aplicacion=34'>Catálogo de Entidades Coordinadoras</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcEntidadPatrocinadora.asp?var_Id_gcdmenus=2172&par_Id_menupadre=Entidad Patrocinadora&par_Id_aplicacion=34'>Catálogos de Entidades Patrocinadoras</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcSede.asp?var_Id_gcdmenus=2160&par_Id_menupadre=Catalogo de sedes&par_Id_aplicacion=34'>Catálogo de sedes</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>

<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcTipo_curso.asp?var_Id_gcdmenus=2172&par_Id_menupadre=Entidad Patrocinadora&par_Id_aplicacion=34'>Catálogo de tipo de cursos</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER")%>/carrerapgr/Altas_CAPcTipoDocs.asp?var_Id_gcdmenus=2160&par_Id_menupadre=Catalogo de sedes&par_Id_aplicacion=34'>Catálogo de tipo de documentos</a></td><hr></div><p style='margin-left: -1; margin-right: -1'>

   <!--<input type="submit" value="enviar">-->
 </form>   
</body>
</html>