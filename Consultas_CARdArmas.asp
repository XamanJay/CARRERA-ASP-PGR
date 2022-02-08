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

    v_Tabla = "CardArmas"
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
     <FONT COLOR= #3366CC>Consultas de  Armas  de Fuego  </FONT>
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
         <B>Arma de fuego</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCARMAFUEGO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcArmaFuego' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcArmaFuego")= CINT(Id_CARcArmaFuego) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcArmaFuego")%>'> <%=UCASE(Ob_RS2("CARcArmaFuego"))%>                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcArmaFuego")%>'> <%=UCASE(Ob_RS2("CARcArmaFuego"))%>                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		   <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>No. de oficio (Rec.Mat.)</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficio' SIZE=50 MAXLENGTH=50  style="text-transform: uppercase" VALUE=<%= NoOficio%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha del oficio</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaOficio' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaOficio_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaOficio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
y       <INPUT TYPE='TEXT' NAME='FechaOficio_N' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaOficio_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaOficio_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > 
     <TR>
      <TD>
        <B>No. de lista (DGSC)</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoLista' SIZE=30 MAXLENGTH=30 style="text-transform: uppercase" VALUE=<%= NoLista%>>
      </TD > 
     <TR>
      <TD>
        <B>No. oficio (Rec. Humanos)</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficioRecHum' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= NoOficioRecHum%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha oficio (Rec. Humanos)</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaOficioRH' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaOficioRH_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaOficioRH')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
y     <INPUT TYPE='TEXT' NAME='FechaOficioRH_N' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaOficioRH_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaOficioRH_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > 
     <TR>
      <TD>
        <B>Fecha de asignación</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaAsignacion' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaAsignacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAsignacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
y        <INPUT TYPE='TEXT' NAME='FechaAsignacion_N' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaAsignacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAsignacion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > 
     <TR>
      <TD>
        <B>CUIP</font>	</B>      </TD>
      <TD>
 	    <P ALIGN='left'>
 	      <input type='TEXT' name='CUIP' size=30 maxlength=30 style="text-transform: uppercase" value=<%= CUIP%>>
       </TD > 
     <TR>
      <TD> 
         <B>&iquest;Autorización?</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcAutorizacion" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAutorizacion' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
               <%IF Ob_RS2("Id_CARcAutorizacion")= CINT(Id_CARcAutorizacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAutorizacion")%>'> <%=UCASE(Ob_RS2("CARcAutorizacion"))%>                   </OPTION>
               <%ELSE%>
                	<OPTION VALUE='<%=Ob_RS2("Id_CARcAutorizacion")%>'> <%=UCASE(Ob_RS2("CARcAutorizacion"))%>                	</OPTION>
               <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
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
                <%ELSE%>
                	<OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>                    </OPTION>
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
        <B>Observación</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CardArmas' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CardArmas%></TEXTAREA>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Armas de Fuego"%>
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

