<!-- #Include File = "../Session/ActiveSession.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
v_Tabla = "CARcColorTez"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcColorTez WHERE Id_CARcColorTez ="+CSTR(ParID) 
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
   CARcColorTez= OB_RS("CARcColorTez")
   Fecha_Captura= OB_RS("Fecha_Captura")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARcColorTez.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #3366CC>Ver  Color de Tez</FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #3366CC>Modificar  Color de Tez  </FONT></h2>
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
        consulta = "SELECT * FROM CARcColorTez WHERE Id_CARcColorTez ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcColorTez")  <> "" then  Ob_RS("CARcColorTez")=UCASE(request("CARcColorTez")) end if
        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
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
     <TR>
      <TD>
        <B>Color de tez        </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARcColorTez' SIZE=50 MAXLENGTH=50 VALUE=<%= CARcColorTez%>>
      </TD > 
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcColorTez >
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
<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormEdita.CARcColorTez.value  == "")
  {
       alert("EL CAMPO: CARcColorTez, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcColorTez.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: CARcColorTez.");
       return false;
  }
  


}
</script> 
