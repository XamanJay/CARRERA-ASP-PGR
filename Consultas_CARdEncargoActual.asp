<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEncargoActual"
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
     <FONT COLOR= #3366CC>Consultas de  EncargoActual   </FONT>
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEncargoActual' SIZE=10 ROWS=1 COLS=35><%=CARdEncargoActual%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Clave presupuestal</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ClavePresupuestal' SIZE=20 MAXLENGTH=20 VALUE=<%= ClavePresupuestal%>>
      </TD > 
     <TR>
      <TD> 
         <B>Puesto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM SFPCPUESTOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_SFPcPuestos' SIZE=1>
          <% IF Id_SFPcPuestos = "" OR Id_SFPcPuestos = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_SFPcPuestos")= CINT(Id_SFPcPuestos) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_SFPcPuestos")%>'> <%= Ob_RS2("SFPcPuestos")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_SFPcPuestos")%>'> <%= Ob_RS2("SFPcPuestos")%>
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
        <B>Fecha de ingreso a la PGR</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre :      <INPUT TYPE='TEXT' NAME='FechaIngresoPGR' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaIngresoPGR_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaIngresoPGR')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
y     <INPUT TYPE='TEXT' NAME='FechaIngresoPGR_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaIngresoPGR_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaIngresoPGR_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     <TR>
      <TD>
        <B>Unidad de adscripción</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='UnidadAdscripcion' SIZE=50 MAXLENGTH=50 VALUE=<%= UnidadAdscripcion%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de adscripción actual</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Mayor o igual a :      <INPUT TYPE='TEXT' NAME='FechaAdscripcionActual' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcionActual_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdscripcionActual')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
<table><tr><td>Menor o igual a :       <INPUT TYPE='TEXT' NAME='FechaAdscripcionActual_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcionActual_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdscripcionActual_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> </tr></table>
      </TD > 
     <TR>
      <TD>
        <B>Domicilio de oficina (calle y número)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle_y_numero' SIZE=50 MAXLENGTH=50 VALUE=<%= Calle_y_numero%>>
      </TD > 
     <TR>
      <TD>
        <B>Colonia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' SIZE=30 MAXLENGTH=30 VALUE=<%= Colonia%>>
      </TD > 
     <TR>
      <TD>
        <B>Delegación o municipio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Delegacion_municipio' SIZE=30 MAXLENGTH=30 VALUE=<%= Delegacion_municipio%>>
      </TD > 
     <TR>
      <TD>
        <B>Ciudad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=30 MAXLENGTH=30 VALUE=<%= Ciudad%>>
      </TD > 
     <TR>
      <TD>
        <B>Estado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estado' SIZE=30 MAXLENGTH=30 VALUE=<%= Estado%>>
      </TD > 
     <TR>
      <TD>
        <B>Teléfono oficina</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=30 MAXLENGTH=30 VALUE=<%= Telefono%>>
      </TD > 
     <TR>
      <TD>
        <B>Micro</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Micro' SIZE=15 MAXLENGTH=15 VALUE=<%= Micro%>>
      </TD > 
     <TR>
      <TD>
        <B>Fax oficina</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fax' SIZE=30 MAXLENGTH=30 VALUE=<%= Fax%>>
      </TD > 
     <TR>
      <TD>
        <B>Correo Electrónico</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='EMail' SIZE=25 MAXLENGTH=25 VALUE=<%= EMail%>>
      </TD > 
     <TR>
      <TD>
        <B>Situación laboral</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_SituacionLaboral"))%>
	     <SELECT NAME='CT_SituacionLaboral' SIZE=1>
          <% IF CT_SituacionLaboral = "" OR CT_SituacionLaboral = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_SituacionLaboral") (w)= CINT(CT_SituacionLaboral) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_SituacionLaboral") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_SituacionLaboral") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Última evaluación CeDH</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Mayor o igual a :      <INPUT TYPE='TEXT' NAME='UltimaEvaluacionCeDH' SIZE=10  MAXLENGTH=16  VALUE=<%= UltimaEvaluacionCeDH_N%> >
       <IMG ONCLICK="window_open('FormConsultas','UltimaEvaluacionCeDH')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
<table><tr><td>Menor o igual a :       <INPUT TYPE='TEXT' NAME='UltimaEvaluacionCeDH_N' SIZE=10  MAXLENGTH=16  VALUE=<%= UltimaEvaluacionCeDH_N%> >
       <IMG ONCLICK="window_open('FormConsultas','UltimaEvaluacionCeDH_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> </tr></table>
      </TD > 
     <TR>
      <TD>
        <B>Portación de arma?</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_PortacionArma"))%>
	     <SELECT NAME='CT_PortacionArma' SIZE=1>
          <% IF CT_PortacionArma = "" OR CT_PortacionArma = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_PortacionArma") (w)= CINT(CT_PortacionArma) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_PortacionArma") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_PortacionArma") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CUIP' SIZE=15 MAXLENGTH=15 VALUE=<%= CUIP%>>
      </TD > 
     <TR>
      <TD>
        <B>Tipo de nombramiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoNombramiento' SIZE=20 MAXLENGTH=20 VALUE=<%= TipoNombramiento%>>
      </TD > 
     <TR>
      <TD>
        <B>Designación especial (No. Oficio)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficio' SIZE=30 MAXLENGTH=30 VALUE=<%= NoOficio%>>
      </TD > 
     <TR>
      <TD>
        <B>Curso (Generación)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=8 MAXLENGTH=8 VALUE=<%= Generacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Concurso (Fecha de examen)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Mayor o igual a :      <INPUT TYPE='TEXT' NAME='FechaExamen' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaExamen_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaExamen')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
<table><tr><td>Menor o igual a :       <INPUT TYPE='TEXT' NAME='FechaExamen_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaExamen_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaExamen_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> </tr></table>
      </TD > 
     <TR>
      <TD>
        <B>Foto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Foto' SIZE=10 ROWS=1 COLS=35><%=Foto%></TEXTAREA>
      </TD > 
     <TR>
      <TD> 
         <B>Área</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPCAREAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPcAreas' SIZE=1>
          <% IF Id_CAPcAreas = "" OR Id_CAPcAreas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CAPcAreas")= CINT(Id_CAPcAreas) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPcAreas")%>'> <%= Ob_RS2("CAPcAreas")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPcAreas")%>'> <%= Ob_RS2("CAPcAreas")%>
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
         <B>Datos de la persona</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARDDATOSPERSONALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARdDatosPersonales' SIZE=1>
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
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
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

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

