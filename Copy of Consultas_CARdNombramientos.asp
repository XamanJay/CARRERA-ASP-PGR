<%On Error Resume Next
'response.write "1"
%>
<!-- #Include File = "Seguridad/Perfil.inc" -->



<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdNombramientos"
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
     <FONT COLOR= #3366CC>Consultas de  Nombramientos</FONT>
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
         <B>Tipo de ingreso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPO_INGRESO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipo_ingreso' SIZE=1>
          <% IF Id_CARcTipo_ingreso = "" OR Id_CARcTipo_ingreso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipo_ingreso")= CINT(Id_CARcTipo_ingreso) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>
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
        <B>Fecha de ingreso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre :     <INPUT TYPE='TEXT' NAME='Fecha_ingreso' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso_N%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_ingreso')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y     <INPUT TYPE='TEXT' NAME='Fecha_ingreso_N' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso_N%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_ingreso_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
 
     
     <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1>
          <% IF Id_CARcTipoNombramiento = "" OR Id_CARcTipoNombramiento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
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
         <B>Categoria</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCATEGORIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCategoria' SIZE=1>
          <% IF Id_CARcCategoria = "" OR Id_CARcCategoria = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcCategoria")= CINT(Id_CARcCategoria) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= Ob_RS2("CARcCategoria")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= Ob_RS2("CARcCategoria")%>
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
         <B>Nivel</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNIVEL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNivel' SIZE=1>
          <% IF Id_CARcNivel = "" OR Id_CARcNivel = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcNivel")= CINT(Id_CARcNivel) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= Ob_RS2("CARcNivel")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= Ob_RS2("CARcNivel")%>
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
         <B>Motivo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNOMBRAMIENTOMOTIVO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNombramientoMotivo' SIZE=1>
          <% IF Id_CARcNombramientoMotivo = "" OR Id_CARcNombramientoMotivo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcNombramientoMotivo")= CINT(Id_CARcNombramientoMotivo) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNombramientoMotivo")%>'> <%= Ob_RS2("CARcNombramientoMotivo")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNombramientoMotivo")%>'> <%= Ob_RS2("CARcNombramientoMotivo")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR><TR>
      <TD> 
         <B>Tipo de designaci�n</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipo_Designacion" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipo_Designacion' SIZE=1 >
          <% IF Id_CARcTipo_Designacion = "" OR Id_CARcTipo_Designacion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipo_Designacion")= CINT(Id_CARcTipo_Designacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_Designacion")%>'> <%= Ob_RS2("CARcTipo_Designacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_Designacion")%>'> <%= Ob_RS2("CARcTipo_Designacion")%>
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
        <B>Fecha de nombramiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre :      <INPUT TYPE='TEXT' NAME='Fecha_nombramiento' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_nombramiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y        <INPUT TYPE='TEXT' NAME='Fecha_nombramiento_N' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_nombramiento_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     <TR>
      <TD>
        <B>Nombramiento historico</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Nombramiento_historico' SIZE=10 ROWS=1 COLS=35><%=Nombramiento_historico%></TEXTAREA>
      </TD > 
  </TR>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=50 MAXLENGTH=50 VALUE=<%= CARdNombramientos%>>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de par�metros (Tabla y ODBC seleccionados) --->
<%TITU = "Nombramientos"%>
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
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
<!-- #INCLUDE File="errores.inc" -->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

VAR_JS

}
</script> 

