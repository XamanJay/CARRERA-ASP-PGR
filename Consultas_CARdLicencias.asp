<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdLicencias"
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
     <FONT COLOR= #3366CC>Consultas de  Licencias   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1' CELLPADDING='5' CELLSPACING='5'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Motivo de la licencia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='MotivoLicencia' SIZE=50 MAXLENGTH=50 VALUE=<%= MotivoLicencia%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha inicial</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre :      <INPUT TYPE='TEXT' NAME='FechaInicial' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicial_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaInicial')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y       <INPUT TYPE='TEXT' NAME='FechaInicial_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicial_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaInicial_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
	   </TD > 
     <TR>
      <TD>
        <B>Fecha final</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre :    <INPUT TYPE='TEXT' NAME='FechaFinal' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFinal_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaFinal')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y   <INPUT TYPE='TEXT' NAME='FechaFinal_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFinal_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaFinal_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD>
        <B>Tiempo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Tiempo' SIZE=10 MAXLENGTH=10 VALUE=<%= Tiempo%>>
      </TD > 
      <TR>
      <TD>
        <B>Registro Validado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
           <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcValidado' SIZE=1 >
          <% IF Id_CARcValidado = "" OR Id_CARcValidado = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
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
       <TEXTAREA NAME='CARdLicencias' SIZE=10 ROWS=1 COLS=35><%=CARdLicencias%></TEXTAREA>
      </TD > 
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

