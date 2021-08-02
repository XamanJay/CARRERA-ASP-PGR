<!-- #Include File = "../Session/ActiveSession.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
v_Tabla = "CARcCatalogoCursosPGR"
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
     <FONT COLOR= #3366CC>Consultas de  CatalogoCursosPGR   </FONT>
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
        <B>Comentario</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARcCatalogoCursosPGR' SIZE=10 ROWS=1 COLS=35><%=CARcCatalogoCursosPGR%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Denominaci�n</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Denominacion' SIZE=10 ROWS=1 COLS=35><%=Denominacion%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>�rea o instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Area_Instituto' SIZE=50 MAXLENGTH=50 VALUE=<%= Area_Instituto%>>
      </TD > 
     <TR>
      <TD> 
         <B>Curso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPDCURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPdCurso' SIZE=1>
          <% IF Id_CAPdCurso = "" OR Id_CAPdCurso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CAPdCurso")= CINT(Id_CAPdCurso) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
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
        <B>Generaci�n</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=10 MAXLENGTH=10 VALUE=<%= Generacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Folio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Folio' SIZE=5 MAXLENGTH=5 VALUE=<%= Folio%>>
      </TD > 
     <TR>
      <TD>
        <B>�rea de especializaci�n</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AreaEspecializacion' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaEspecializacion%>>
      </TD > 
     <TR>
      <TD> 
         <B>Tipo de curso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPCTIPO_CURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPcTipo_curso' SIZE=1>
          <% IF Id_CAPcTipo_curso = "" OR Id_CAPcTipo_curso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CAPcTipo_curso")= CINT(Id_CAPcTipo_curso) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
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
<!--- Paso de par�metros (Tabla y ODBC seleccionados) --->

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

