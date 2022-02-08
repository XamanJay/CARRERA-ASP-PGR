<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEvaluaArmaFuego"
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

'response.write "hola"
'response.end
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
     <FONT COLOR= #3366CC>Consultas de  Portación de Arma de Fuego   </FONT>
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
         <B>Desempeño</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESEMPENO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesempeno' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcDesempeno")= CINT(Id_CARcDesempeno) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>
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
        <B>Cartilla</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Cartilla' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Cartilla%>>
      </TD > 
     <TR>
      <TD> 
         <B>Médico</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMEDICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMedico' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcMedico")= CINT(Id_CARcMedico) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>
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
         <B>Toxicológico</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTOXICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcToxicologico' SIZE=1>
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcToxicologico")= CINT(Id_CARcToxicologico) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>
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
         <B>Datos registrales</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDATOSREGISTRALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDatosregistrales' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcDatosregistrales")= CINT(Id_CARcDatosregistrales) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>
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
         <B>Psicológico</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPSICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPsicologico' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcPsicologico")= CINT(Id_CARcPsicologico) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEvaluaArmaFuego' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CARdEvaluaArmaFuego%></TEXTAREA>
      </TD > 
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<%TITU = "Portación de Arma de Fuego"%>
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
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

VAR_JS

}
</script> 

