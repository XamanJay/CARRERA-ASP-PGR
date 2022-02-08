<html><head>
<title>MenúEvaluación</title>
<base target="_self">
<style>
<!--
a{text-decoration:none}
.look{font: 10.0pt Arial narrow;}
.look2{font: 10.0pt Arial narrow;}
.folding{cursor:hand}
a:hover{color:blue}
a:activevv {color: white}
a:activevv {background-color:blue}
//.Estilo1 {font-size: x-small}
.Estilo3 {font-size: x-small}
-->
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
     Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
     SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     Ob_Conn.Provider="sqloledb"
     'RESPONSE.WRITE SESSION("IP_DATOS")
     'RESPONSE.WRITE SESSION("ODBC")
     'RESPONSE.END
''     Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
     Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
Generales = 0 
Trayectoria = 0 
Capacitacion = 0 
%>
</head>

<script language="JavaScript">
<!--
function Ventana(URL,Nombre,Flags) { 
  window.showModelessDialog(URL,Nombre,Flags);
}
//-->
</script>


<body bgproperties="fixed" background = "Multimedia/imagenes/menus/menu_izquierdo.jpg" topmargin="0" leftmargin="0" text=ffffff link=ffffff vlink=ffffff alink=000000>	
<!--body bgproperties="fixed"   bgcolor="#469FB3" topmargin="0" leftmargin="0" text=#ffffff link=#ffffff vlink=#ffffff alink=#000000-->	
<BR>
<!---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===-->
<!---===---===---===---===---===---===---===---INICIO UNO===---===---===---===---===---===---===---===---===---===---===---===-->

<!--1010101010101010101010101010101010101 INICIO DE SUBMENU DATOS GENERALES -->
<!--<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> 
  <a class="folding">PERSONAL</a> 
  <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">-->
    
	<img src='Multimedia/imagenes/menus/circulo01.gif'><strong><font size="4">PERSONAL <BR> &nbsp&nbsp&nbsp SUSTANTIVO</font></strong> 
  <p style='margin-left: -1; margin-right: -1'>
	
	<!------------inicio bloke submenu------------------------>
<%  IF (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN %>

<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Personas</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
 
<% END IF %>


     <!--<li>    <p style="margin-left: +5; margin-right: -20"> -->
	<% CALL InicioValida("Consultas_Personas.asp", "Altas ","DP",0)%>
	<% CALL InicioValida("Consultas_CARdDatospersonales_RED.asp", "Busquedas <BR> RFC/Nombre","DP",0)%>
	<!--<a target="mainFrame" href="https://<%'= session("IP_SERVER")%>/carrerapgr/Consultas_Personas.asp?">Alta</a></li>	
 <li>    <p style="margin-left: +5; margin-right: -20"> 
<!-- <a target="mainFrame" href="https://<%'= session("IP_SERVER")%>/carrerapgr/Consultas_CARdDatospersonales_RED.asp?">Buscar</a>--></li>	


 </ul> 
</div>
	<!------------inicio bloke submenu DATOS GENERALES------------------------>
           <!--div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Datos Generaless</a>
           <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none"-->

<% 
IF (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN 
   CALL PantallaValida("Consultas_CARdDatosPersonales.asp", "Datos Personales","DP",1)
   CALL PantallaValida("Consultas_CARdFicha.asp", "Media Filiación","MF",1)
   CALL PantallaValida("Consultas_CARdEscolaridad.asp", "Historial Académico","HA",1)
   CALL PantallaValida("Consultas_CARdFamilia.asp", "Referencias","RE",1)
   CALL PantallaValida("Consultas_CARdExperienciaLaboral.asp", "Historial Laboral No Institucional","HL",1)
   CALL PantallaValida("Consultas_CARdIdiomas.asp", "Idiomas","IM",1)
   CALL PantallaValida("Consultas_CARdDomicilios.asp", "Domicilios","DO",1)
END IF    
%>
 </ul> 
</div>
<!--1010101010101010101010101010101010101 FIN DE SUBMENU DATOS GENERALES -->

	
	
	<!------------INICIO BLOQUE SUBMENU- TRAYECTORIA PGR----------------------->
	<!--div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Trayectoria PGR</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none"-->
<% 
IF  (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN 
   CALL PantallaValida("Consultas_CARdNombramientos.asp", "Nombramientos","NM",2)
   CALL PantallaValida("Consultas_CARdSituacionLaboral.asp", "Situación Laboral","SL",2)
   CALL PantallaValida("Consultas_CARdAdscripciones.asp", "Adscripciones","AD",2)
   CALL PantallaValida("Consultas_CARdProcedimientos.asp", "Procedimientos","PR",2)
   CALL PantallaValida("Consultas_CARdEvaluaciones.asp", "Evaluaciones","EV",2)
   CALL PantallaValida("Consultas_CARdArmas.asp", "Armas de fuego","AF",2)
   CALL PantallaValida("Consultas_CARdEvaluaArmaFuego.asp", "Portación Armas de fuego","PA",2)
   CALL PantallaValida("Consultas_CARdEstimulosReconocimientos.asp", "Estímulos y Reconocimientos","ER",2)
   CALL PantallaValida("Consultas_CARdFormacionInicial.asp", "Formación Inicial","FI",2)
  'CALL PantallaValida("Consultas_CARdAsignaPlaza.asp", "Plazas","LI",2)
END IF   

%>
	
 </ul> 
</div>
	<!------------FIN BLOQUE SUBMENU- TRAYECTORIA PGR-------------------------------->
	
	
	<!------------INICIO BLOQUE SUBMENU- CAPACITACIÓN----------------------->
	<!--div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Capacitación</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none"-->
<%
IF (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN 
   CALL PantallaValida("Consultas_CARdCursosPersona.asp", "Profesionalización","SG",3)
END IF    
%>
     <!--li>    <p style="margin-left: +5; margin-right: -20">    <a  target="mainFrame" href="Consultas_CARdCursosPersona.asp">Seguimiento</a></li-->
 
 </ul>   </div>
 
 
 
<%IF (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN %>
<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Catálogos</a>
  <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
  <% 
    ' CALL CatalogosValida("Consultas_CARcAdscripciones.asp","Adscripciones")	
    ' CALL CatalogosValida("Consultas_CARcAgencias.asp","Agencias")	
    ' CALL CatalogosValida("Consultas_CARcAreaConocimiento.asp","Area Conocimiento")
     CALL CatalogosValida("Consultas_CARcCargoEstructura.asp","Cargo Estructura")	
	 CALL CatalogosValida("Consultas_CARcCategoria.asp","Categorías")	
	 CALL CatalogosValida("Consultas_CARcDatosregistrales.asp","Datos Registrables")	
	 CALL CatalogosValida("Consultas_CARcDesempeno.asp","Desempeño")	
	 CALL CatalogosValida("Consultas_CARcDetalle.asp","Detalle Estímulo Reconocimiento")	
     CALL CatalogosValida("Consultas_CARcDocumentoObtenido.asp","Documento Obtenido")
     CALL CatalogosValida("Consultas_CARcEspecialidad.asp","Especialidad")
     CALL CatalogosValida("Consultas_CARcEdoCivil.asp","Estado Civil")	
     CALL CatalogosValida("Consultas_CARcEstatus.asp","Estatus Estudios")
	 CALL CatalogosValida("Consultas_CARcEstatusLaboral.asp","Estatus Laboral")	
	 CALL CatalogosValida("Consultas_CARcEstatusPlaza.asp","Estatus Plaza")	
     CALL CatalogosValida("Consultas_CARcEstatusProcedimiento.asp","Estatus Procedimiento")
    ' CALL CatalogosValida("Consultas_CARcGenero.asp","Género")	
     CALL CatalogosValida("Consultas_CARcIdioma.asp","Idiomas")	
     CALL CatalogosValida("Consultas_CARcInstituto.asp","Instituto")	
     CALL CatalogosValida("Consultas_CARcMedico.asp","Resultado Examen Médico")	
	 CALL CatalogosValida("Consultas_CARcToxicologico.asp","Resultado Examen Toxicológico")	
	 
     CALL CatalogosValida("Consultas_CARcMotivoAdscripcion.asp","Motivo Adscripción")
	 CALL CatalogosValida("Consultas_CARcMotivoEstatus.asp","Motivo Estatus")	
	' CALL CatalogosValida("Consultas_CARcNivel.asp.asp","00000000Nivel Categoriiiiiiiiiiiiiiiiia")	
     CALL CatalogosValida("Consultas_CARcNivelEstudios.asp","Nivel Estudios")
	 CALL CatalogosValida("Consultas_CARcNivel.asp","Nivel")	
     CALL CatalogosValida("Consultas_CARcParentesco.asp","Parentesco")
'     CALL CatalogosValida("Consultas_CARcPlaza.asp","Plazas")
     CALL CatalogosValida("Consultas_CARcPsicologico.asp","Resultado Psicológico")
     CALL CatalogosValida("Consultas_CARcResultado.asp","Resultado")
     CALL CatalogosValida("Consultas_CARcResultadoEva.asp","Resultado Evaluación")
     CALL CatalogosValida("Consultas_CARcReferencia.asp","Referencias")	
	 CALL CatalogosValida("Consultas_CARcTipoAcuerdo.asp","Tipo Acuerdo")	
	 CALL CatalogosValida("Consultas_CARcTipoAsignacion.asp","Tipo Asignación")	
     CALL CatalogosValida("Consultas_CARcTipoCapacitacion.asp","Tipo Capacitación")
     CALL CatalogosValida("Consultas_CARcTipoDocumento.asp","Tipo Documento Obtenido")
	 CALL CatalogosValida("Consultas_CARcTipo_Designacion.asp","Tipo Designación")	
	 CALL CatalogosValida("Consultas_CARcTipoDomicilio.asp","Tipo Domicilio")	
'     CALL CatalogosValida("Consultas_CARcNombramientoMotivo.asp","Nombramiento Motivo")
	' CALL CatalogosValida("Consultas_CARcNivel.asp","Nivel")	
     CALL CatalogosValida("Consultas_CARcTipoEvaluacion.asp","Tipo Evaluación")
	 CALL CatalogosValida("Consultas_CARcTipoEstimulo.asp","Tipo Estímulo")	
	 CALL CatalogosValida("Consultas_CARcTipoEstimuloRec.asp","Tipo Estímulo/Reconocimiento")
	 CALL CatalogosValida("Consultas_CARcTipo_ingreso.asp","Tipo Ingreso")	
     CALL CatalogosValida("Consultas_CARcTipoInstitucion.asp","Tipo Institución")	
     CALL CatalogosValida("Consultas_CARcTipoNombramiento.asp","Tipo Nombramiento")
	 CALL CatalogosValida("Consultas_CARcTipoProcedimiento.asp","Tipo Procedimiento")	
	 CALL CatalogosValida("Consultas_CARcTipoReconocimiento.asp","Tipo Reconocimiento")	
 '    CALL CatalogosValida("Consultas_CARcAnteojos.asp","Anteojos")	
     CALL CatalogosValida("Consultas_CarcBoca.asp","Boca")
     CALL CatalogosValida("Consultas_CARcCara.asp","Cara")	
     CALL CatalogosValida("Consultas_CARcCabelloCantidad.asp","Cabello Cantidad")	
	 CALL CatalogosValida("Consultas_CARcColorCabello.asp","Cabello Color")	
     CALL CatalogosValida("Consultas_CARcFormaCabello.asp","Cabello Forma")	
     CALL CatalogosValida("Consultas_CARcCejas.asp","Cejas")
     CALL CatalogosValida("Consultas_CARcColorTez.asp","Color Tez")
     CALL CatalogosValida("Consultas_CARcComplexion.asp","Complexión")	
     CALL CatalogosValida("Consultas_CARcFrente.asp","Frente")
	 CALL CatalogosValida("Consultas_CARcLabios.asp","Labios")	
     CALL CatalogosValida("Consultas_CARcMenton.asp","Mentón")
     CALL CatalogosValida("Consultas_CARcNariz.asp","Nariz")	
	 CALL CatalogosValida("Consultas_CARcNarizAncho.asp","Nariz Ancho")	
	 CALL CatalogosValida("Consultas_CARcNarizForma.asp","Nariz Forma")	
     CALL CatalogosValida("Consultas_CARcOjos.asp","Ojos")
     CALL CatalogosValida("Consultas_CARcOjosTamano.asp","Ojos Tamaño")
     CALL CatalogosValida("Consultas_CARcFormaOjos.asp","Ojos Forma")	
	 CALL CatalogosValida("Consultas_CARcOrejas.asp","Orejas")	
   %>
 </ul> 
</div>


<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Reportes</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">

<%  
    CALL Reportesss("REP1_Frames.asp", "Reporte Ind. de <BR> Personal Sustantivo1","RA",4)
	'''CALL Reportesss("REP1_Frames111.asp", "Estados de Fuerza","RA",4)
	'''JVI CALL Reportesss("REP1_Frames.asp", "Reporte Ind. de <BR> Personal Sustantivo","RA",4)
	CALL Reportesss("USU_Framess.asp", "Reporte2","RA",4) 
	%>
	 <BR><BR><a target="mainFrame"  href="MARCOS_REPORTES.asp">Estados de Fuerza</a>
	 
	 <BR><BR><a target="mainFrame"  href="KARKOSPERSONASACTIVAS.asp">Personal Activo</a>
	 
 	 <BR><BR><a target="mainFrame"  href="MARCOS_NOMBRAMIENTOS.asp">Personal Nombramientos</a>


	 
	 <BR><BR><a target="mainFrame"  href="CAM_USU_PER/REPORTES_ESTADISTICOS.asp">Estadisticos</a>

	<BR><BR><!--<img src="multimedia/imagenes/menu_docs.gif" >-->
    <!--a target="_blank"  href="https://10.3.194.244/CarreraPGR/EstadisticasCubo/estadisticadinamica2.htm">Reporte de Totales</a-->
    <a target="_blank"  href="http://10.3.194.241/deciweb/gridcarrerapgr.htm">Reporte de Totales</a>

<BR><BR><img src="ProcesaOLAP/Imagenes/cubedw.gif" width="20" height="20">
    <a target="_blank" href="ProcesaOLAP/ProcesaOLAP.asp">Procesamiento de Cálculos</a>

 

 </ul> 
</div>



	<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Administración &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdel Sistema</a>
 <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">

<%  
    CALL AdminValida("PERFIL_Frames.asp", "P e r f i l e s","RA",4)
    CALL AdminValida("USU_Frames.asp", "U s u a r i o s","RA",4) 
    CALL PantallaValida("Filtro_Bitacora.asp", "B i t á c o r a","RA",4)
 END  IF  %>
<INPUT TYPE="Hidden" id=IDOP NAME='idOPCION' Value ='INI' >
 </ul> 
</div>
	
	
<!-- _=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=   -->	
<%
   PERFIL = TRIM(SESSION("PERFIL"))	
   IF PERFIL = "PERFIL 4_1" THEN      %>

<BR>&nbsp;&nbsp;<a target="mainFrame"  href="Rep_Per_Sustantivo/REP1_Frames.asp">Reporte Ind.</a>

<% END IF  %>

<!-- _=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=   -->	

<%
   PERFIL = TRIM(SESSION("PERFIL"))	
   IF PERFIL = "PERFIL 4" THEN      %>

<BR>&nbsp;&nbsp;<a target="mainFrame"  href="MARCOS_REPORTES.asp">Estados de Fuerza</a>


<% END IF  %>

<!-- _=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=   -->	

<% 

'RESPONSE.WRITE SESSION("PERFIL")  
PERFIL = TRIM(SESSION("PERFIL"))

IF PERFIL = "PERFIL 4" THEN
MANUAL = "MANUAL_GENERAL.pdf"

ELSEIF  PERFIL = "PERFIL 1" THEN
MANUAL = "MANUAL_UA.PDF"

END IF

%>

<% IF PERFIL = "PERFIL 1" THEN%>
   <BR><BR><BR><BR><BR><BR><BR><BR>
<% ELSE %>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<% END IF %>
	  <div > <a target="mainFrame"   href="MANUALES/<%= MANUAL%>">&nbsp <span class="Estilo3">Gu&iacute;a de usuario</span></a> </div>
<!--img src="IMAGES/IMG_PDF.JPG" width="25" height="32"--> 
<!-- _=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=   -->
<br>
</body></html>





<Script language=JavaScript>
function right(e) {
if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)){
alert("Acceso Denegado");
return false;
}
else if (navigator.appName == 'Microsoft Internet Explorer' &&
(event.button == 2 || event.button == 3)) {
alert("Acceso Denegado");
return false;
}
return true;
}
document.onmousedown=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=right;
  </script>
  
   <%
 SUB PantallaValida(Pantalla, Letrero,pID,pModulo)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"
	parID =  chr(34)+pID+chr(34)
'   response.write CONSULTA
'   response.write "<BR>"
  
'   response.end
    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
'     IF NOT OB_RS.EOF AND (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2") THEN 
     IF NOT OB_RS.EOF  THEN 
        IF pModulo = 1 AND GENERALES = 0 THEN %>
           <div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Datos Generales</a>
           <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
    <%     GENERALES = 1
        END IF 
        IF pModulo = 2 AND TRAYECTORIA = 0 THEN %>
        	<div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Trayectoria PGR</a>
            <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
    <%    TRAYECTORIA = 1
        END IF 
        IF pModulo = 3 AND CAPACITACION = 0 THEN %>
           <div class="look"><img src="Multimedia/Imagenes/menus/menu_folder_closed.gif" class="folding" width="20" height="20"> <a class="folding">Capacitación</a>
           <ul class="look2" style="list-style-image:url('menu_docs.gif');display:none">
    <%   CAPACITACION = 1
	END IF 
	
	
		
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a id="+parID+"  onClick='SeleMenu("+parID+")' target='mainFrame' href='https://"+ session("IP_SERVER")+"/carrerapgr/"+Pantalla+"'>"+Letrero+"</a></li>"+CHR(13)
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
        xCAD = xCAD + "  <a  target='mainFrame' href='https://"+ session("IP_SERVER")+"/carrerapgr/Catalogos/"+Pantalla+"'>"+Letrero+"</a></li>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB
 
 SUB AdminValida(Pantalla, Letrero,pID,pModulo)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"


    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a  target='mainFrame' href='https://"+ session("IP_SERVER")+"/carrerapgr/CAM_USU_PER/"+Pantalla+"'>"+Letrero+"</a></li>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB
 
  ''''ojo   CALL Reportesss("REP1_Frames.asp", "Reporte Ind. de <BR> Personal Sustantivo","RA",4)

 
 SUB Reportesss(Pantalla, Letrero,pID,pModulo)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"


    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a  target='mainFrame' href='https://"+ session("IP_SERVER")+"/carrerapgr/Rep_Per_Sustantivo/"+Pantalla+"'>"+Letrero+"</a></li>"
	 END IF
	 RESPONSE.WRITE xCAD
	 OB_RS.CLOSE

 END SUB
 
 
 SUB InicioValida(Pantalla, Letrero,pID,pModulo)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%"+Pantalla+"%'"


    Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_RS.EOF THEN 
        xCAD = "   <li>    <p style='margin-left: +5; margin-right: -20'>" 
        xCAD = xCAD + "  <a  target='mainFrame' href='https://"+ session("IP_SERVER")+"/carrerapgr/"+Pantalla+"'>"+Letrero+"</a></li>"
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
	document.getElementById(pas).style.backgroundColor="#00CCcc";	
	document.getElementById("IDOP").value=pas;	
//	if (IDMenu != 'INI') { 
    document.getElementById(IDMenu).style.backgroundColor="" 
//	}
	}
	
    </script>
