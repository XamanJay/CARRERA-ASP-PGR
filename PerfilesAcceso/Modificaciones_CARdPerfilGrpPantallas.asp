<!-- INCLUDE File="Verifica.inc" -->
<!-- #INCLUDE File="MenuDinamico/menu.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdPerfilGrpPantallas"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = "SIIFP"
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM CARdPerfilGrpPantallas WHERE Id_CARdPerfilGrpPantallas ="+CSTR(ParID) 
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
   Id_CARcPerfilGrupo= OB_RS("Id_CARcPerfilGrupo")
   Id_CARcPantallas= OB_RS("Id_CARcPantallas")
   Fecha= OB_RS("Fecha")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdPerfilGrpPantallas.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Consulta CARdPerfilGrpPantallas  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSeIF TOper = "MOD" then %>
     <FONT COLOR= #990000>Modificaciones de CARdPerfilGrpPantallas  </FONT>
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
        consulta = "SELECT * FROM CARdPerfilGrpPantallas WHERE Id_CARdPerfilGrpPantallas ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("Id_CARcPerfilGrupo")  <> "" then  Ob_RS("Id_CARcPerfilGrupo")=request("Id_CARcPerfilGrupo") end if
        if request("Id_CARcPantallas")  <> "" then  Ob_RS("Id_CARcPantallas")=request("Id_CARcPantallas") end if
        if request("Fecha")  <> "" then  Ob_RS("Fecha")=request("Fecha") end if
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
          <%Sql ="SELECT * FROM CARCPERFILGRUPO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Perfil de Grupo</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE=1 >
          <% IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
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
          <%Sql ="SELECT * FROM CARCPANTALLAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Pantalla</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcPantallas' SIZE=1 >
          <% IF Id_CARcPantallas = "" OR Id_CARcPantallas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPantallas")= CINT(Id_CARcPantallas) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPantallas")%>'> <%= Ob_RS2("CARcPantallas")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPantallas")%>'> <%= Ob_RS2("CARcPantallas")%>
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdPerfilGrpPantallas >
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
  if (FormEdita.Id_CARdPerfilGrpPantallas.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: GRUPOS Y PANTALLAS.");
       return false;
  }
  
  if (FormEdita.Id_CARcPerfilGrupo.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Perfil de Grupo.");
       return false;
  }
  
  if (FormEdita.Id_CARcPantallas.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Pantalla.");
       return false;
  }
  


}
</script> 
