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
 <img src='Multimedia/imagenes/menus/circulo01.gif' alt = "Modulo de Evaluaciones"><strong><font size = "4" >Evaluaciones</font></strong>
<p style='margin-left: -1; margin-right: -1'>
<div class='look'><img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='https://<%= session("IP_SERVER") %>/carrerapgr/evaluaciones/ListaPuestos.asp?var_Id_gcdmenus=2405&par_Id_menupadre=Evaluar Puesto&par_Id_aplicacion=34'>Evaluar Puesto</a></td><hr></div></ul> </div><br>
   <!--<input type="submit" value="enviar">-->
 </form>   
</body>
</html>

