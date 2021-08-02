<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcDatosPersonales"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcDatosPersonales WHERE Id_CARcDatosPersonales ="+CSTR(ParID) 
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
   CARcDatosPersonales= OB_RS("CARcDatosPersonales")
   RFC= OB_RS("RFC")
   ApellidoPaterno= OB_RS("ApellidoPaterno")
   ApellidoMaterno= OB_RS("ApellidoMaterno")
   Nombre= OB_RS("Nombre")
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   FechaNacimiento= OB_RS("FechaNacimiento")
   Id_CarcEdoCivil= OB_RS("Id_CarcEdoCivil")
   Id_CARcGenero= OB_RS("Id_CARcGenero")
   CURP= OB_RS("CURP")
   CartillaSMN= OB_RS("CartillaSMN")
   ClaveElector= OB_RS("ClaveElector")
   Foto= OB_RS("Foto")
   NoFiliacion= OB_RS("NoFiliacion")
   FechaFiliacion= OB_RS("FechaFiliacion")
   DependenciaFiliacion= OB_RS("DependenciaFiliacion")
   Autorizador= OB_RS("Autorizador")
   Fecha_Captura= OB_RS("Fecha_Captura")
   IdLogin= OB_RS("IdLogin")
   IP_user= OB_RS("IP_user")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARcDatosPersonales.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver CARcDatosPersonales  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  CARcDatosPersonales  </FONT></h2>
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
        consulta = "SELECT * FROM CARcDatosPersonales WHERE Id_CARcDatosPersonales ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcDatosPersonales")  <> "" then  Ob_RS("CARcDatosPersonales")=request("CARcDatosPersonales") end if
        if request("RFC")  <> "" then  Ob_RS("RFC")=request("RFC") end if
        if request("ApellidoPaterno")  <> "" then  Ob_RS("ApellidoPaterno")=request("ApellidoPaterno") end if
        if request("ApellidoMaterno")  <> "" then  Ob_RS("ApellidoMaterno")=request("ApellidoMaterno") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=request("Nombre") end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("FechaNacimiento")  <> "" then  Ob_RS("FechaNacimiento")=request("FechaNacimiento") end if
        if request("Id_CarcEdoCivil")  <> "" then  Ob_RS("Id_CarcEdoCivil")=request("Id_CarcEdoCivil") end if
        if request("Id_CARcGenero")  <> "" then  Ob_RS("Id_CARcGenero")=request("Id_CARcGenero") end if
        if request("CURP")  <> "" then  Ob_RS("CURP")=request("CURP") end if
        if request("CartillaSMN")  <> "" then  Ob_RS("CartillaSMN")=request("CartillaSMN") end if
        if request("ClaveElector")  <> "" then  Ob_RS("ClaveElector")=request("ClaveElector") end if
        if request("Foto")  <> "" then  Ob_RS("Foto")=request("Foto") end if
        if request("NoFiliacion")  <> "" then  Ob_RS("NoFiliacion")=request("NoFiliacion") end if
        if request("FechaFiliacion")  <> "" then  Ob_RS("FechaFiliacion")=request("FechaFiliacion") end if
        if request("DependenciaFiliacion")  <> "" then  Ob_RS("DependenciaFiliacion")=request("DependenciaFiliacion") end if
        if request("Autorizador")  <> "" then  Ob_RS("Autorizador")=request("Autorizador") end if
        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
        if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
        if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcDatosPersonales >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >

  <INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
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
