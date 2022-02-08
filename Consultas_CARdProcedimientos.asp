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

    v_Tabla = "CARdProcedimientos"
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
     <FONT COLOR= #3366CC>Consultas de  Procedimientos   </FONT>
    </H2>
  </CENTER>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">

  </p>
 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
    <%	

     PERFIL = TRIM(SESSION("PERFIL"))
   IF  PERFIL =  "PERFIL 4" THEN       %> 
     
     <TR>
      <TD>
        <B>Tipo de procedimiento</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcTipoProcedimiento WHERE Id_CARcTipoProcedimiento in (0,3,4,5,6)" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoProcedimiento' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
        <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
	 
	 
	 <% ELSE %>
	 
	 <TR>
      <TD>
        <B>Tipo de procedimiento</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcTipoProcedimiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoProcedimiento' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
        <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
     
	 
	 <% END IF%>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
     <TR>
      <TD>
        <B>Imputación</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Imputacion' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Imputacion%>>
      </TD > 
     <TR>
      <TD>
        <B>No. de procedimiento</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumeroProcedimiento' SIZE=30 MAXLENGTH=30 style="text-transform: uppercase" VALUE=<%= NumeroProcedimiento%>>
      </TD > 
     <TR>
      <TD>
        <B>Autoridad que instruye</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='AutoridadInstuctora' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=AutoridadInstuctora%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de inicio</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre   
  <INPUT TYPE='TEXT' NAME='FechaProcedimiento' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaProcedimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaProcedimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y     <INPUT TYPE='TEXT' NAME='FechaProcedimiento_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaProcedimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaProcedimiento_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > 
     <TR>
      <TD> 
         <B>Estatus</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCESTATUSPROCEDIMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusProcedimiento' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcEstatusProcedimiento")= CINT(Id_CARcEstatusProcedimiento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= Ob_RS2("CARcEstatusProcedimiento")%>                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= Ob_RS2("CARcEstatusProcedimiento")%>                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Resolución</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Resolucion' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Resolucion%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de resolución</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaResolucion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaResolucion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaResolucion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      <INPUT TYPE='TEXT' NAME='FechaResolucion_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaResolucion_N%> >
      <IMG ONCLICK="window_open('FormConsultas','FechaResolucion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > </TR>
      <TR>
      <TD>
        <B>Registro validado</font>	</B>      </TD>
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
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
   </TR>

	  <TR>
      <TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	    <P ALIGN='left'>
 	      <textarea name='CARdProcedimientos' size=10 rows=1 cols=35 style="text-transform: uppercase"><%=CARdProcedimientos%></textarea>
 	    </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Procedimientos"%>
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

