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

    v_Tabla = "CARdEvaluaciones"
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

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Tipo evaluacion y Rsultado Evaluacion
consulta = "SELECT * FROM CARcResultadoEva " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_ResultadoEva = OB_rs.getrows
Campos_ResultadoEva = UBound(tbl_ResultadoEva,1) 
regs_ResultadoEva = UBound(tbl_ResultadoEva,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

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
     <FONT COLOR= #3366CC>Consultas de  Evaluaciones</FONT>
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
         <B>Tipo de evaluación</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOEVALUACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcTipoEvaluacion' size=1 onChange='SeleMenu("C")'>
            <%IF Ob_RS2.EOF THEN %>
            <option value='0'>SIN INFORMACIÓN</option>
            <%ELSE%>
            	<%DO UNTIL Ob_RS2.Eof%>
            	<%IF Ob_RS2("Id_CARcTipoEvaluacion")= CINT(Id_CARcTipoEvaluacion) THEN %>
            		<option selected value='<%=Ob_RS2("Id_CARcTipoEvaluacion")%>'> <%= Ob_RS2("CARcTipoEvaluacion")%> </option>
            	<%ELSE%>
            		<option value='<%=Ob_RS2("Id_CARcTipoEvaluacion")%>'> <%= Ob_RS2("CARcTipoEvaluacion")%> </option>
            	<%END IF%>
            	<%Ob_RS2.MOVENEXT %>
            	<%LOOP%>
			<%END IF%>
          </select>
          <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Fecha de evaluación</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
Entre      
  <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEvaluacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y     <INPUT TYPE='TEXT' NAME='FechaEvaluacion_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEvaluacion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaEvaluacion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD > 
     <TR>
      <TD> 
         <B>Resultado evaluación</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCRESULTADOEVA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcResultadoEva' SIZE=1>
	            <OPTION VALUE='0'>SELECCIONA</OPTION>
        </SELECT>
         <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Puntaje</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' SIZE=5 MAXLENGTH=5 style="text-transform: uppercase" VALUE=<%= Calificacion%>>
      </TD > 
	  </TR>
	  <TR>
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
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
   </TR>
<TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEvaluaciones' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CARdEvaluaciones%></TEXTAREA>
      </TD > </TR>
 </TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Evaluaciones"%>
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
function SeleMenu(pas)
{
var xcont = 1 
var ycont = 0 
//alert(<%= regs_ResultadoEva %>)
// El siguiente IF es para habilitar el campo calificacion solo cuando TipoEvaluación = Conocimientos = 3
 	  if (FormConsultas.Id_CARcTipoEvaluacion.value == 3 ) 
        {
	     document.FormConsultas.Calificacion.disabled=false;	
        }
	  else
        {
	      document.FormConsultas.Calificacion.disabled=true;	
     	  document.FormConsultas.Calificacion.value=''
       }
  
   <% FOR I = 0 to regs_ResultadoEva %>
	    if  (document.FormConsultas.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormConsultas.Id_CARcResultadoEva.length= xcont;
    <% FOR I = 0 to regs_ResultadoEva %>
        if  (document.FormConsultas.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcResultadoEva.options[ycont].text='<%= tbl_ResultadoEva(1,I) %>'
          document.FormConsultas.Id_CARcResultadoEva.options[ycont].value='<%= tbl_ResultadoEva(0,I) %>'
		  }
   <%  next    %>   

}

</script> 

