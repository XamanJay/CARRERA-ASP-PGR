<!-- INCLUDE File="Verifica.inc" -->
<!-- #INCLUDE File="MenuDinamico/menu.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcUSR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = "SIIFP"
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM CARcUSR WHERE Id_CARcUSR ="+CSTR(ParID) 
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
   CARcUSR= OB_RS("CARcUSR")
   PW= OB_RS("PW")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   Id_CARcTipoUSR= OB_RS("Id_CARcTipoUSR")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<!-- INCLUDE File="Encabezado.inc" -->

 <style type="text/css">
<!--
body {
	background-image: url(Images/softgri1.jpg);
}
-->
</style><HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="Calendario/calendario.js"></SCRIPT>
 <body BGPROPERTIES="fixed" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARcUSR.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Consulta CARcUSR  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSeIF TOper = "MOD" then %>
     <FONT COLOR= #990000>Modificaciones de CARcUSR  </FONT>
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
        consulta = "SELECT * FROM CARcUSR WHERE Id_CARcUSR ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcUSR")  <> "" then  Ob_RS("CARcUSR")=request("CARcUSR") end if
        if request("PW")  <> "" then  Ob_RS("PW")=request("PW") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Id_CARcTipoUSR")  <> "" then  Ob_RS("Id_CARcTipoUSR")=request("Id_CARcTipoUSR") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Usuario:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARcUSR' SIZE=50 MAXLENGTH=50 VALUE=<%= CARcUSR%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD>
        <B>Password:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='PW' SIZE=50 MAXLENGTH=50 VALUE=<%= PW%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARDDATOSPERSONALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Datos personales</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARdDatosPersonales' SIZE=1 >
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTIPOUSR" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de usuario</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoUSR' SIZE=1 >
          <% IF Id_CARcTipoUSR = "" OR Id_CARcTipoUSR = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoUSR")= CINT(Id_CARcTipoUSR) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoUSR")%>'> <%= Ob_RS2("CARcTipoUSR")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoUSR")%>'> <%= Ob_RS2("CARcTipoUSR")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcUSR >
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
  if (FormEdita.Id_CARcUSR.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Usuarios.");
       return false;
  }
  
  if (FormEdita.Id_CARdDatosPersonales.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Datos personales.");
       return false;
  }
  
  if (FormEdita.Id_CARcTipoUSR.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de usuario.");
       return false;
  }
  


}
</script> 
