<html><head>
<title>Menú Evaluación</title>
<base target="_self">
<style>
<!--
a{text-decoration:none}
.look{font:bold 11.0pt Arial;}
.look2{font:bold 11.0pt Arial;}
.folding{cursor:hand}
a:hover{color:blue}
a:activevv {color: white}
a:activevv {background-color:blue}
//-->
</style>

<script language="JavaScript">
<!--
//--
img1=new Image()
img1.src="Multimedia/Imagenes/menus/menu_folder_closed.gif"
img2=new Image()
img2.src="Multimedia/Imagenes/menus/menu_folder_open.gif"
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
source2[0].src="Multimedia/Imagenes/menus/menu_folder_closed.gif"
source2[2+ns6_index].style.display=''
}
else{
source2[0].src="Multimedia/Imagenes/menus/menu_folder_open.gif"
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
img1.src="Multimedia/Imagenes/menus/menu_folder_closed.gif"
img2=new Image()
img2.src="Multimedia/Imagenes/menus/menu_folder_open.gif"
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
source2[0].src="Multimedia/Imagenes/menus/menu_folder_open.gif"
source2[2+ns6_index].style.display=''
parent.mainFrame.location.href="FondoAuxiliar.asp"  // limpia el fram princiapal de despliegue de datos
}
else{
source2[0].src="Multimedia/Imagenes/menus/menu_folder_closed.gif"
source2[2+ns6_index].style.display="none"
}
}
}
document.onclick=change
//-->
</script>
<%
    v_ODBC  = SESSION("ODBC")

     Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
     SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     Ob_Conn.Provider="sqloledb"
     Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

%>
</head>
<body bgproperties="fixed" background = "Multimedia/imagenes/CARR_marco_izq_nvoo.jpg" topmargin="0" leftmargin="0" text=ffffff link=ffffff vlink=ffffff alink=000000>	
<!--body bgproperties="fixed"   bgcolor="#469FB3" topmargin="0" leftmargin="0" text=#ffffff link=#ffffff vlink=#ffffff alink=#000000-->	
<BR>
    
	<img src='Multimedia/imagenes/menus/circulo01.gif'><strong><font size="4">Designaciones Especiales</font></strong> 
  <p style='margin-left: -1; margin-right: -1'>
	
	<!------------inicio bloke submenu------------------------>
	
<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Altas</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">

     <!--li>    <p style="margin-left: +5; margin-right: -20"> 
	<a target="mainFrame" href="https://<%= session("IP_SERVER")%>/D_Especiales/Consultas_Personas.asp">Personas</a></li-->	
<% CALL PantallaValida("Consultas_Personas.asp", "Personas","PE") %>


 </ul> 
</div>
	<!------------inicio bloke submenu------------------------>
	<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Datos Curriculares</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">

<% 
CALL PantallaValida("Consultas_CARdDatosPersonales.asp", "Datos Personales","DP")
CALL PantallaValida("Consultas_CARdDomicilios.asp", "Domicilios","RE")
CALL PantallaValida("Consultas_CARdExperienciaLaboral.asp", "Experiencia Profesional","EP")
CALL PantallaValida("Consultas_CARdEscolaridad.asp", "Formación <BR> Académica","FA")
CALL PantallaValida("Consultas_DESdFormacionComputacion.asp", "Formación Computación","FC")
CALL PantallaValida("Consultas_DESdIdiomaEspanol.asp", "Español","ES")
CALL PantallaValida("Consultas_CARdIdiomas.asp", "Idiomas","ID")
CALL PantallaValida("Consultas_CARdEvaluaciones.asp", "Evaluaciones","EV")
%>
 </ul> 
</div>
<!--1010101010101010101010101010101010101 FIN DE SUBMENU DATOS GENERALES -->

	
	
	<!------------INICIO BLOQUE SUBMENU- TRAYECTORIA PGR----------------------->
	<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Designación Especial</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
<% 
CALL PantallaValida("Consultas_DESdDatosDesignacion.asp", "Datos Designación","DD") 
'CALL PantallaValida("Consultas_DESdRequisitosInicio.asp", "Requisitos Inicio","NM")%>
        <!--div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> 
          <a class="folding">Antecedentes</a> 
          <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
<%
'             CALL PantallaValida("Consultas_DESdReqAntecedentes.asp", "Solicitud","AD")
'             CALL PantallaValida("Consultas_DESdSeguimientoAntecedentes.asp", "Respuesta","PR")
%>
          </ul>
        </div-->
<%		
CALL PantallaValida("Consultas_DESdEscolaridad.asp", "Evaluaciones","EV")

'CALL PantallaValida("Consultas_DESdAsignaPlaza.asp", "Plazas","LI")

%>
	
 </ul> 
</div>
	<!------------FIN BLOQUE SUBMENU- TRAYECTORIA PGR-------------------------------->
	
	
<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Catálogos</a>
  <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
  
  

  <% 
    ' CALL CatalogosValida("Consultas_DEScAdscripciones.asp","Adscripciones")
	' CALL CatalogosValida("Consultas_DEScAntecedentes.asp","Antecedentes")	
   '  CALL CatalogosValida("Consultas_DEScArea.asp","Areas")	
     CALL CatalogosValida("Consultas_DEScCategoria.asp","Categorias")
     CALL CatalogosValida("Consultas_DEScDocumentoObtenido.asp","Documento <BR> Obtenido")	
	' CALL CatalogosValida("Consultas_DEScEntidadFederativa.asp","Entidad Federativa")	
	 'CALL CatalogosValida("Consultas_DEScEstatus.asp","Estatus")	
	' CALL CatalogosValida("Consultas_DEScEstatusAntecedente.asp","Estatus de Antededentes")	
	' CALL CatalogosValida("Consultas_DEScEstatusExpediente.asp","Estatus de Expediente")	
     CALL CatalogosValida("Consultas_DEScIdioma.asp","Idioma")
     CALL CatalogosValida("Consultas_DEScNivel.asp","Nivel")
     CALL CatalogosValida("Consultas_DEScNivelEstudios.asp","Nivel de Estudios")	
     'CALL CatalogosValida("Consultas_DEScNuevaoProrroga.asp","Nueva Prorroga")
	' CALL CatalogosValida("Consultas_DEScResultado.asp","Resultado")	
	 CALL CatalogosValida("Consultas_DEScSubArea.asp","Sub Area")	
     'CALL CatalogosValida("Consultas_DEScTipoAcuerdo.asp","Tipo de Acuerdo")
     CALL CatalogosValida("Consultas_DEScTipoNombramiento.asp","Nombramientos")	
     'CALL CatalogosValida("Consultas_DEScTipoPersonal.asp","Tipo de Personal")	
     CALL CatalogosValida("Consultas_DEScTipoPrograma.asp","Paquetes")	
     CALL CatalogosValida("Consultas_DEScTipoReq_Detalle.asp","Req. de Detalle")	
     CALL CatalogosValida("Consultas_DEScTipoRequisito.asp","Requisitos")
	     
	
   %>
 </ul> 
</div>

<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Seguimiento</a>
  <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
  
  

  <% 
     CALL PantallaValida ("Requisitos_inicio_Frm.asp","Requisitos Inicio","RI")
	 CALL PantallaValida("AA_Antecedentes_Frm.asp","Antecedentes","RA")	
	 CALL PantallaValida("TT_Antecedentes_Frm.asp","Tarjeta de Hechos","RH")	
	 CALL PantallaValida("JJ_Antecedentes_Frm.asp","Secuencia <BR> de Estados","RS")
	 CALL PantallaValida("RR_Antecedentes_Frm.asp","Recordatorios <BR> Automáticos","RR")	
	     
	
   %>
 </ul> 
</div>


 <!------------INICIO BLOQUE SUBMENU- REPORTES----------------------->
	<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Administración</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">

<li>    <p style="margin-left: +5; margin-right: -20">    <a  target="mainFrame" href="cam_usu/Definicion_Perfiles.asp">Definición de    <BR> Perfiles</a></li>
<li>    <p style="margin-left: +5; margin-right: -20">    <a  target="mainFrame" href="cam_usu/Definicion_Usuarios_Finales.asp">Alta de Usuarios </a></li>
<%CALL PantallaValida("Filtro_Bit.asp", "Reporte de Avance","RA")
 '' CALL PantallaValida("Definicion_Usuarios_Finales.asp", "Alta de Usuarios Finales","IM")

%>



<INPUT TYPE="Hidden" id=IDOP NAME='idOPCION' Value ='INI' >
 </ul> 
</div>
	<!------------FIN BLOQUE SUBMENU- REPORTES-------------------------------->
	
<br></body></html>





<Script language=JavaScript>
function right(e) {
if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)){
alert("Acceso Denegado");
return false;
}
else if (navigator.appName == 'Microsoft Internet Explorer' &&
alert("Acceso Denegado");
(event.button == 2 || event.button == 3)) {
return false;
}
return true;
}
document.onmousedown=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=right;
  </script>
  
   <%
 SUB PantallaValida(Pantalla, Letrero,pID)
'    Consulta = "Select  * from VST_Perfiles Where Id_SEGcUSR ="+CSTR(Session("IdLogin"))+ " AND SEGcPaginas like '%"+Pantalla+"%'"
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"
	parID =  chr(34)+pID+chr(34)
'	   response.write  Consulta
 '  response.write "<BR>"
  
 
'   response.end
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a id="+parID+"  onClick='SeleMenu("+parID+")' target='mainFrame' href='http://"+ session("IP_SERVER")+"/D_Especiales/"+Pantalla+"'>"+Letrero+"</a></li>"+CHR(13)
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB

  SUB CatalogosValida(Pantalla, Letrero)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"
'   response.write SQL
'   response.end
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a  target='mainFrame' href='http://"+ session("IP_SERVER")+"/D_Especiales/Catalogos/"+Pantalla+"'>"+Letrero+"</a></li>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB
 
 
 SUB AntecedentesValida(Pantalla, Letrero)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a  target='mainFrame' href='http://"+ session("IP_SERVER")+"/D_Especiales/"+Pantalla+"'>"+Letrero+"</a></li>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB

 
  SUB DesignacionesValida(Pantalla, Letrero,pID)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"
	parID =  chr(34)+pID+chr(34)
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a id="+parID+"  onClick='SeleMenu("+parID+")' target='mainFrame' href='http://"+ session("IP_SERVER")+"/D_Especiales/Designaciones_DosMarcos.asp''>"+Letrero+"jojo</a></li>"+CHR(13)
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB

 %>
  <script LANGUAGE="JavaScript">
	function SeleMenu(pas)
	{
//	alert(pas)
	var IDMenu = document.getElementById("IDOP").value;
	document.getElementById(pas).style.backgroundColor="#CFD2FF";	
	document.getElementById("IDOP").value=pas;	
//	if (IDMenu != 'INI') { 
    document.getElementById(IDMenu).style.backgroundColor="" 
//	}
	}
	
</script>