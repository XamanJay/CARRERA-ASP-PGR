<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdDatosPersonales"
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
    <H2> <FONT COLOR= #3366CC>Consultas de Datos Personales</FONT> </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
    <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     
     <TR>
      <TD>
        <B>RFC</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='RFC' SIZE=15 MAXLENGTH=15 style="text-transform: uppercase" VALUE=<%= RFC%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Apellido paterno	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoPaterno' SIZE=25 MAXLENGTH=25 style="text-transform: uppercase" VALUE=<%= ApellidoPaterno%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Apellido materno</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoMaterno' SIZE=25 MAXLENGTH=25 style="text-transform: uppercase"  VALUE=<%= ApellidoMaterno%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nombre(s)</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' SIZE=25 MAXLENGTH=25 style="text-transform: uppercase" VALUE=<%= Nombre%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Pa&iacute;s de nacimiento</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='PaisNacimiento' SIZE=30 MAXLENGTH=30 style="text-transform: uppercase" VALUE=<%= PaisNacimiento%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Entidad de nacimiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcEntidadFederativa ORDER BY Id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
		  <%ELSE%>
		  	 <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                   </OPTION>
             	<% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                </OPTION>
             	<%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%> 		  
           <%END IF%>
       </SELECT>
    <%Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=30 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='MunicipiooDel' SIZE=30 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= MunicipioODel%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nacionalidad</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nacionalidad' SIZE=30 MAXLENGTH=30 style="text-transform: uppercase" VALUE=<%= Nacionalidad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
       <B>Fecha de nacimiento</B></TD>
      <TD>
 	   <P ALIGN='left'>
Entre :      <INPUT TYPE='TEXT' NAME='FechaNacimiento' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaNacimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaNacimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y        <INPUT TYPE='TEXT' NAME='FechaNacimiento_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaNacimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaNacimiento_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD> 
         <B>Estado civil</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCEDOCIVIL ORDER BY Id_CARcEdoCivil" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CarcEdoCivil' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE
	          DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CarcEdoCivil")= CINT(Id_CarcEdoCivil) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CarcEdoCivil")%>'> <%= Ob_RS2("CarcEdoCivil")%>
                   </OPTION>
                <%ELSE%>
                   <OPTION VALUE='<%=Ob_RS2("Id_CarcEdoCivil")%>'> <%= Ob_RS2("CarcEdoCivil")%>
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
         <B>Género</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCGENERO ORDER BY Id_CARcGenero"%>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	      <SELECT NAME='Id_CARcGenero' SIZE=1 >
           <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcGenero")= CINT(Id_CARcGenero) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
                   </OPTION>
              <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
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
        <B>CURP</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CURP' SIZE=30 MAXLENGTH=20 style="text-transform: uppercase" VALUE=<%= CURP%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de cartilla del SMN</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CartillaSMN' SIZE=30 MAXLENGTH=30 style="text-transform: uppercase" VALUE=<%= CartillaSMN%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Clave de elector</font></B></TD>
      <TD>
 	    <P ALIGN='left'>
 	      <input type='TEXT' name='ClaveElector' size=20 maxlength=20 style="text-transform: uppercase" value=<%= ClaveElector%>>
       </TD > 
     </TR>
     <TR>
      <TD>
        <B>Licencia de conducir</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Licencia' SIZE=30 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Licencia%>>
      </TD > 
     </TR>
       <TR>
      <TD>
        <B>Fecha ingreso PGR</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_IngresoPGR' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_IngresoPGR%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_IngresoPGR')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CUIP' SIZE=40 style="text-transform: uppercase" MAXLENGTH=50 VALUE=<%= Licencia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Foto</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <!--INPUT TYPE="TEXT" NAME='Foto' SIZE=50 VALUE=<%= Foto%>-->
        <INPUT TYPE = "Hidden" Name ="FolderName" Value = "<%=Carpeta%>">
        <input NAME="File1" TYPE="file" size="20">
     </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de filiación</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoFiliacion' SIZE=20 MAXLENGTH=20 style="text-transform: uppercase" VALUE=<%= NoFiliacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de filiación</B></TD>
      <TD>
 	   <P ALIGN='left'>
Entre :      <INPUT TYPE='TEXT' NAME='FechaFiliacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFiliacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaFiliacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y :       <INPUT TYPE='TEXT' NAME='FechaFiliacion_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFiliacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaFiliacion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD>
        <B>Dependencia Federal que realiza filiación</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='DependenciaFiliacion' SIZE=10 ROWS=1 COLS=35><%=DependenciaFiliacion%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Registro validado</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
           <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcValidado' SIZE=1 >
           <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcValidado")= CINT(Id_CARcValidado) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		   <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
     <TR>
      <TD>
        <B>Observaciones</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE= TEXT NAME='CARdExperienciaLaboral' SIZE=50 style="text-transform: uppercase" ><%=CARdDatosPersonales%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Datos Personales"%>
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
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
   if (!esFecha(FormConsultas.FechaNacimiento.value,'E') && (FormConsultas.FechaNacimiento.value !='') )
  {
  	alert("El campo -Fecha Inicio de Nacimiento- debe ser de tipo: DD/MM/AAAA");
	return false;
  }	
  
  if (!esFecha(FormConsultas.FechaNacimiento_N.value,'E') && (FormConsultas.FechaNacimiento_N.value !='') )
  {
  	alert("El campo -Fecha Final de Nacimiento- debe ser de tipo: DD/MM/AAAA");
	return false;
  }	
  
  if (!esFecha(FormConsultas.Fecha_IngresoPGR.value,'E') && (FormConsultas.Fecha_IngresoPGR.value !='') )
  {
  	alert("El campo -Fecha de Ingreso- debe ser de tipo: DD/MM/AAAA");
	return false;
  }	
  
  if (!esFecha(FormConsultas.FechaFiliacion.value,'E') && (FormConsultas.FechaFiliacion.value !='') )
  {
  	alert("El campo -Fecha Inicio Filiación- debe ser de tipo: DD/MM/AAAA");
	return false;
  }	  

  if (!esFecha(FormConsultas.FechaFiliacion_N.value,'E') && (FormConsultas.FechaFiliacion_N.value !='') )
  {
  	alert("El campo -Fecha Final de Filiación- debe ser de tipo: DD/MM/AAAA");
	return false;
  }	  
  document.FormConsultas.submit();
}
</script>