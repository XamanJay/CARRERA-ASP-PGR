<!-- INCLUDE File="Verifica.inc" -->
<!-- #INCLUDE File="MenuDinamico/menu.inc" -->
<%

   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdUsrPerfilGrupo"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = "SIIFP"
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 
'========== Combos
%>

<%'========= No tiene combos========= %>


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
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="Calendario/calendario.js"></SCRIPT>
 <body BGPROPERTIES="fixed" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_CARdUsrPerfilGrupo.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">  <CENTER>
  <br>
  <br>
  <br>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  UsrPerfilGrupo   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("Id_CARcUsr")  <> "" then  Ob_RS("Id_CARcUsr")=request("Id_CARcUsr") end if
        if request("Id_CARcPerfilGrupo")  <> "" then  Ob_RS("Id_CARcPerfilGrupo")=request("Id_CARcPerfilGrupo") end if
        if request("Fecha")  <> "" then  Ob_RS("Fecha")=request("Fecha") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCUSR" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Usuario</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcUsr' SIZE=1 >
          <% IF Id_CARcUsr = "" OR Id_CARcUsr = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcUsr")= CINT(Id_CARcUsr) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcUsr")%>'> <%= Ob_RS2("CARcUsr")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcUsr")%>'> <%= Ob_RS2("CARcUsr")%>
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
          <%Sql ="SELECT * FROM CARCPERFILGRUPO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Grupo</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE=1 >
          <% IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
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
        <B>Fecha:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha')" border='0' src="Calendario/Calendario.gif" WIDTH='32' HEIGHT='34'>
  	<BR> 
      </TD > 
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de par?metros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
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
  if (FormAltas.Id_CARdUsrPerfilGrupo.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: USUARIOS Y PERFILES DE GRUPO.");
       return false;
  }
  
  if (FormAltas.Id_CARcUsr.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Usuario.");
       return false;
  }
  
  if (FormAltas.Id_CARcPerfilGrupo.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Grupo.");
       return false;
  }
  


}
</script> 

