<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdPerfilGrpPantallas"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
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

'========== Combos
%>

<%'=======No tiene combos===========%>


<% '========== Inicia HTML %>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "ConsultasFiltro.asp" NAME= "FormConsultas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Consultas de  PerfilGrpPantallas   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD> 
         <B>Perfil de Grupo</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPERFILGRUPO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE=1>
          <% IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Pantalla</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPANTALLAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPantallas' SIZE=1>
          <% IF Id_CARcPantallas = "" OR Id_CARcPantallas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcPantallas")= CINT(Id_CARcPantallas) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPantallas")%>'> <%= Ob_RS2("CARcPantallas")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPantallas")%>'> <%= Ob_RS2("CARcPantallas")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
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

VAR_JS

}
</script> 

