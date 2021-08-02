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

    v_Tabla = "CARdFormacionInicial"
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
     <FONT COLOR= #3366CC>Consultas de  Formacion Inicial   </FONT>
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
        <B>Curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Curso' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Curso%>>
      </TD > 
     <TR>
      <TD> 
         <B>Instituto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCINSTITUTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcInstituto' SIZE=1>
			<%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcInstituto")= CINT(Id_CARcInstituto) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= Ob_RS2("CARcInstituto")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= Ob_RS2("CARcInstituto")%>
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
        <B>Generación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=9 MAXLENGTH=9 style="text-transform: uppercase" VALUE=<%= Generacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de examen de oposición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre       
  <INPUT TYPE='TEXT' NAME='FechaExamen' SIZE=10 MAXLENGTH=16  VALUE=<%= FechaExamen_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaExamen')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
y      <INPUT TYPE='TEXT' NAME='FechaExamen_N' SIZE=10 MAXLENGTH=16  VALUE=<%= FechaExamen_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaExamen_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD> 
         <B>Resultado examen</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCRESULTADO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcResultado' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcResultado")= CINT(Id_CARcResultado) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%= Ob_RS2("CARcResultado")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%= Ob_RS2("CARcResultado")%>
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
        <B>Fecha de ingreso al instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre       
  <INPUT TYPE='TEXT' NAME='FechaIngresoInstituto' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaIngresoInstituto_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaIngresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y
 <input type='TEXT' name='FechaIngresoInstituto_N' size=10  maxlength=16  value=<%= FechaIngresoInstituto_N%> >       
 <IMG ONCLICK="window_open('FormConsultas','FechaIngresoInstituto_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de egreso del instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaEgresoInstituto' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEgresoInstituto_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaEgresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y       <INPUT TYPE='TEXT' NAME='FechaEgresoInstituto_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEgresoInstituto_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaEgresoInstituto_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     </TR>
      <TR>
      <TD>
        <B>Registro validado</font>	</B>
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
   </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARdFormacionInicial' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= CARdFormacionInicial%>>
      </TD > 
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Formación Inicial"%>
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

