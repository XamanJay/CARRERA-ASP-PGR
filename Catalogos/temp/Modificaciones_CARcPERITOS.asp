<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcPERITOS"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcPERITOS WHERE Id_CARcPERITOS ="+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 

'========== Combos
%>

<%
'======= Inicializa variables de ambiente ===========
   CARcPERITOS= OB_RS("CARcPERITOS")
   Lote= OB_RS("Lote")
   ConocimientosP= OB_RS("ConocimientosP")
   Enviados_SC= OB_RS("Enviados_SC")
   Incorporado_SC= OB_RS("Incorporado_SC")
   Expediente= OB_RS("Expediente")
   Nombre= OB_RS("Nombre")
   RFC= OB_RS("RFC")
   Ingreso= OB_RS("Ingreso")
   AñosPGR= OB_RS("AñosPGR")
   Categoria= OB_RS("Categoria")
   Especialidad= OB_RS("Especialidad")
   Fotos= OB_RS("Fotos")
   Huellas= OB_RS("Huellas")
   CUIP= OB_RS("CUIP")
   Ubicacion= OB_RS("Ubicacion")
   Adscripcion= OB_RS("Adscripcion")
   Subsede= OB_RS("Subsede")
   Fecha_Adscripcion= OB_RS("Fecha_Adscripcion")
   Tiempo_delegacion= OB_RS("Tiempo_delegacion")
   Adscripcion_Ant= OB_RS("Adscripcion_Ant")
   Diez_anios= OB_RS("Diez_anios")
   Ultimo_Edo_Fuerza= OB_RS("Ultimo_Edo_Fuerza")
   SIED_1999= OB_RS("SIED_1999")
   SIED_2000= OB_RS("SIED_2000")
   SIED_2001= OB_RS("SIED_2001")
   Examen_Oposicion= OB_RS("Examen_Oposicion")
   Fecha_Oposicion= OB_RS("Fecha_Oposicion")
   Constancia_verifcada= OB_RS("Constancia_verifcada")
   Puntaje_Conocimientos= OB_RS("Puntaje_Conocimientos")
   Resultado_Conocimientos= OB_RS("Resultado_Conocimientos")
   CEDH1= OB_RS("CEDH1")
   Fecha_Oficio_Resulta= OB_RS("Fecha_Oficio_Resulta")
   Desempeño2004= OB_RS("Desempeño2004")
   Desempeño2005= OB_RS("Desempeño2005")
   INACIPE2005= OB_RS("INACIPE2005")
   Observaciones_Carrera= OB_RS("Observaciones_Carrera")
   Procedimiento= OB_RS("Procedimiento")
   Numero= OB_RS("Numero")
   Resolucion= OB_RS("Resolucion")
   Sancion= OB_RS("Sancion")
   Fecha= OB_RS("Fecha")
   Cargo_Estructura= OB_RS("Cargo_Estructura")
   AdscripcionA= OB_RS("AdscripcionA")
   E_FZA= OB_RS("E_FZA")
   Observacones1= OB_RS("Observacones1")
   Status= OB_RS("Status")
   Motivo_baja= OB_RS("Motivo_baja")
   FechaBaja= OB_RS("FechaBaja")
   Documento1= OB_RS("Documento1")
   B_SNSP= OB_RS("B_SNSP")
   Tipo_Licencia= OB_RS("Tipo_Licencia")
   Perido= OB_RS("Perido")
   Documento2= OB_RS("Documento2")
   NumeroLicenciaMedica= OB_RS("NumeroLicenciaMedica")
   Dias= OB_RS("Dias")
   Fecha1= OB_RS("Fecha1")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARcPERITOS.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver CARcPERITOS  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  CARcPERITOS  </FONT></h2>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
<%END IF %> 
   </H2>

  </CENTER>

 <!--- insertar resulstado de  LOOP ----------------------------------------------------------------------------------------------- --->

    <% 
     vModi = request("Modi") 
     if vModi = "S" then  
        Ob_RS.Close 
        consulta = "SELECT * FROM CARcPERITOS WHERE Id_CARcPERITOS ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcPERITOS")  <> "" then  Ob_RS("CARcPERITOS")=request("CARcPERITOS") end if
        if request("Lote")  <> "" then  Ob_RS("Lote")=request("Lote") end if
        if request("ConocimientosP")  <> "" then  Ob_RS("ConocimientosP")=request("ConocimientosP") end if
        if request("Enviados_SC")  <> "" then  Ob_RS("Enviados_SC")=request("Enviados_SC") end if
        if request("Incorporado_SC")  <> "" then  Ob_RS("Incorporado_SC")=request("Incorporado_SC") end if
        if request("Expediente")  <> "" then  Ob_RS("Expediente")=request("Expediente") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=request("Nombre") end if
        if request("RFC")  <> "" then  Ob_RS("RFC")=request("RFC") end if
        if request("Ingreso")  <> "" then  Ob_RS("Ingreso")=request("Ingreso") end if
        if request("AñosPGR")  <> "" then  Ob_RS("AñosPGR")=request("AñosPGR") end if
        if request("Categoria")  <> "" then  Ob_RS("Categoria")=request("Categoria") end if
        if request("Especialidad")  <> "" then  Ob_RS("Especialidad")=request("Especialidad") end if
        if request("Fotos")  <> "" then  Ob_RS("Fotos")=request("Fotos") end if
        if request("Huellas")  <> "" then  Ob_RS("Huellas")=request("Huellas") end if
        if request("CUIP")  <> "" then  Ob_RS("CUIP")=request("CUIP") end if
        if request("Ubicacion")  <> "" then  Ob_RS("Ubicacion")=request("Ubicacion") end if
        if request("Adscripcion")  <> "" then  Ob_RS("Adscripcion")=request("Adscripcion") end if
        if request("Subsede")  <> "" then  Ob_RS("Subsede")=request("Subsede") end if
        if request("Fecha_Adscripcion")  <> "" then  Ob_RS("Fecha_Adscripcion")=request("Fecha_Adscripcion") end if
        if request("Tiempo_delegacion")  <> "" then  Ob_RS("Tiempo_delegacion")=request("Tiempo_delegacion") end if
        if request("Adscripcion_Ant")  <> "" then  Ob_RS("Adscripcion_Ant")=request("Adscripcion_Ant") end if
        if request("Diez_anios")  <> "" then  Ob_RS("Diez_anios")=request("Diez_anios") end if
        if request("Ultimo_Edo_Fuerza")  <> "" then  Ob_RS("Ultimo_Edo_Fuerza")=request("Ultimo_Edo_Fuerza") end if
        if request("SIED_1999")  <> "" then  Ob_RS("SIED_1999")=request("SIED_1999") end if
        if request("SIED_2000")  <> "" then  Ob_RS("SIED_2000")=request("SIED_2000") end if
        if request("SIED_2001")  <> "" then  Ob_RS("SIED_2001")=request("SIED_2001") end if
        if request("Examen_Oposicion")  <> "" then  Ob_RS("Examen_Oposicion")=request("Examen_Oposicion") end if
        if request("Fecha_Oposicion")  <> "" then  Ob_RS("Fecha_Oposicion")=request("Fecha_Oposicion") end if
        if request("Constancia_verifcada")  <> "" then  Ob_RS("Constancia_verifcada")=request("Constancia_verifcada") end if
        if request("Puntaje_Conocimientos")  <> "" then  Ob_RS("Puntaje_Conocimientos")=request("Puntaje_Conocimientos") end if
        if request("Resultado_Conocimientos")  <> "" then  Ob_RS("Resultado_Conocimientos")=request("Resultado_Conocimientos") end if
        if request("CEDH1")  <> "" then  Ob_RS("CEDH1")=request("CEDH1") end if
        if request("Fecha_Oficio_Resulta")  <> "" then  Ob_RS("Fecha_Oficio_Resulta")=request("Fecha_Oficio_Resulta") end if
        if request("Desempeño2004")  <> "" then  Ob_RS("Desempeño2004")=request("Desempeño2004") end if
        if request("Desempeño2005")  <> "" then  Ob_RS("Desempeño2005")=request("Desempeño2005") end if
        if request("INACIPE2005")  <> "" then  Ob_RS("INACIPE2005")=request("INACIPE2005") end if
        if request("Observaciones_Carrera")  <> "" then  Ob_RS("Observaciones_Carrera")=request("Observaciones_Carrera") end if
        if request("Procedimiento")  <> "" then  Ob_RS("Procedimiento")=request("Procedimiento") end if
        if request("Numero")  <> "" then  Ob_RS("Numero")=request("Numero") end if
        if request("Resolucion")  <> "" then  Ob_RS("Resolucion")=request("Resolucion") end if
        if request("Sancion")  <> "" then  Ob_RS("Sancion")=request("Sancion") end if
        if request("Fecha")  <> "" then  Ob_RS("Fecha")=request("Fecha") end if
        if request("Cargo_Estructura")  <> "" then  Ob_RS("Cargo_Estructura")=request("Cargo_Estructura") end if
        if request("AdscripcionA")  <> "" then  Ob_RS("AdscripcionA")=request("AdscripcionA") end if
        if request("E_FZA")  <> "" then  Ob_RS("E_FZA")=request("E_FZA") end if
        if request("Observacones1")  <> "" then  Ob_RS("Observacones1")=request("Observacones1") end if
        if request("Status")  <> "" then  Ob_RS("Status")=request("Status") end if
        if request("Motivo_baja")  <> "" then  Ob_RS("Motivo_baja")=request("Motivo_baja") end if
        if request("FechaBaja")  <> "" then  Ob_RS("FechaBaja")=request("FechaBaja") end if
        if request("Documento1")  <> "" then  Ob_RS("Documento1")=request("Documento1") end if
        if request("B_SNSP")  <> "" then  Ob_RS("B_SNSP")=request("B_SNSP") end if
        if request("Tipo_Licencia")  <> "" then  Ob_RS("Tipo_Licencia")=request("Tipo_Licencia") end if
        if request("Perido")  <> "" then  Ob_RS("Perido")=request("Perido") end if
        if request("Documento2")  <> "" then  Ob_RS("Documento2")=request("Documento2") end if
        if request("NumeroLicenciaMedica")  <> "" then  Ob_RS("NumeroLicenciaMedica")=request("NumeroLicenciaMedica") end if
        if request("Dias")  <> "" then  Ob_RS("Dias")=request("Dias") end if
        if request("Fecha1")  <> "" then  Ob_RS("Fecha1")=request("Fecha1") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcPERITOS >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >

  <% Ob_Rs.CLOSE %>

 
<% IF TOper = "MOD" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
<% ELSE %>
   <BR>
  <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% END IF %> 

  </p>

   </CENTER>
  </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

 // no Tiene Campos Obligatorios 
 // no Tiene Campos Numericos 


}
</script> 
