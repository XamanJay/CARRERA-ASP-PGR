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

    v_Tabla = "CARdIdiomas"
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
     <FONT COLOR= #3366CC>Consultas de  Idiomas   </FONT>
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
         <B>Idioma/Dialecto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCIDIOMA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcIdioma' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACI�N</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcIdioma")= CINT(Id_CARcIdioma) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
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
        <B>Lectura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Lectura' SIZE=4 MAXLENGTH=4 VALUE=<%= Lectura%>> %
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Escritura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Escritura' SIZE=4 MAXLENGTH=4 VALUE=<%= Escritura%>> %
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Conversaci�n</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Conversacion' SIZE=4 MAXLENGTH=4 VALUE=<%= Conversacion%>> %
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
	            <OPTION VALUE='0'>SIN INFORMACI�N</OPTION>
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
       <TEXTAREA NAME='CARdIdiomas' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CARdIdiomas%></TEXTAREA>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de par�metros (Tabla y ODBC seleccionados) --->
<%TITU = "Idiomas"%>
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

