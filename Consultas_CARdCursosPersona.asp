<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>
<!-- #Include File = "Seguridad/Perfil.inc" -->



<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdCursosPersona"
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
     <FONT COLOR= #3366CC>Consultas de Profesionalización  </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">

  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     
     
     <TR>
      <TD> 
         <B>Tipo de capacitación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOCAPACITACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoCapacitacion' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipoCapacitacion")= CINT(Id_CARcTipoCapacitacion) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Nombre del curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreCurso' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=NombreCurso%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre       
  <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicio_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y        <INPUT TYPE='TEXT' NAME='FechaInicio_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicio_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaInicio_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD>
        <B>Fecha de término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre       
  <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaTermino_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y         
 <INPUT TYPE='TEXT' NAME='FechaTermino_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaTermino_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaTermino_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD> 
         <B>Tipo  de institución</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOINSTITUCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoInstitucion' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipoInstitucion")= CINT(Id_CARcTipoInstitucion) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>	 
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Nombre de la institución</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AreaInstituto' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= AreaInstituto%>>
      </TD > 
     <TR>
      <TD> 
         <B>Documento obtenido</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPODOCUMENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoDocumento' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipoDocumento")= CINT(Id_CARcTipoDocumento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
         <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Calificación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Calificacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Créditos</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Creditos' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Creditos%>>
      </TD > 
     <TR>
      <TD>
        <B>Horas cursadas</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='HorasCursadas' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= HorasCursadas%>>
      </TD > 
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE="TEXT" NAME='CARdCursosPersona'  SIZE=30 style="text-transform: uppercase" VALUE=<%=CARdCursosPersona%>>
      </TD ></TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Profesionalización"%>
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

