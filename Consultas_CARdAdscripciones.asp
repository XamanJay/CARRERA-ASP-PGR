<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%'On Error Resume Next
'response.write "1"
%>
<!-- #Include File = "Seguridad/Perfil.inc" -->



<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdAdscripciones"
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
   
   
   ''''<>}}}}}}*>
consulta = "SELECT * FROM CARcDG_o_Delegaciones " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = OB_rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
OB_RS.CLOSE 

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Categoria y Nivel
consulta = "SELECT * FROM CARcDir_o_subsede" 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo3 = OB_rs.getrows
Campos_Combo3 = UBound(tbl_Combo3,1) 
regs_Combo3 = UBound(tbl_Combo3,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

'========== Combos
%>

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
     <FONT COLOR= #3366CC>Consultas de  Adscripciones   </FONT>
    </H2>
  </CENTER>

 <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">

  </p>
 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border=1   ID='AutoNumber1' HEIGHT='0'>
     
     
     <TR>
      <TD width="173">
        <B>Fecha de adscripción</font>	</B>
      </TD>
      <TD width="352">
 	   <P ALIGN='left'>
 Entre 
   <INPUT TYPE='TEXT' NAME='FechaAdscripcion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdscripcion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 y     <INPUT TYPE='TEXT' NAME='FechaAdscripcion_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdscripcion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
      </TD > 
     <TR>
      <TD height="26"> <B>Adscripción</B> </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY Id_CARcSubprocuradurias, CARcSubprocuradurias ASC" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='IdAdscripcion' SIZE=1>
	         <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
 	  <TR>
     <TD colspan="2">
      <FONT class="SL"><b>UNIDAD ADMINISTRATIVA RESPONSABLE </b></FONT>
      </TD>
     </TR>
     <TR>
     <TD>
	 <p align="right">
        <B><font size="-2"> Subprocuraduría</font> </B> </p>
      </TD>
     <TD>
        <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY CARcSubprocuradurias ASC" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")'>
          <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%> </OPTION>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT>
        <% Ob_RS2.CLOSE%>
       </TD>
      </TR>
 	    <TR>
       <TD>
	 <p align="right">
       <B><font size="-2"> Delegación o Dirección General</font> </B> </p>
      </TD>
        <TD>
       <select name='Id_CARcDG_o_Delegaciones' size=1  onChange='SeleCombo3("C")'>
          <option value='0'>SELECCIONE</option>
        </select>
        <BR>
       </TD>
 	     </TR>
 	     <TR>
     <TD>
	 <p align="right">
        <B><font size="-2"> Direcci&oacute;n / Subsede</font> </B> </p>
      </TD>
       <TD>
      <SELECT NAME='Id_CARcDir_o_subsede' SIZE=1 >
          <OPTION VALUE='0'>SELECCIONE</OPTION>
        </SELECT>
	   </TD> 
	   
	   </TR>
     <TR>
      <TD> 
         <B>Nombramiento</B>
      </TD>
      <TD>
          <%
		  Sql ="SELECT * FROM CARcTipoNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
         <%END IF%>			 
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <!--TR>
      <TD>
        <B>Área</font> / Subsede	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Area' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=Area%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>SubArea</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='SubArea' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=SubArea%></TEXTAREA>
      </TD--> 
     <TR>
      <TD> 
         <B>Estado</B>
      </TD>
      <TD>
          <%
		  Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY Id_CARcEntidadFederativa " %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
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
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ciudad%>>
      </TD > 
     <TR>
      <TD> 
         <B>Motivo de adscripción</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOADSCRIPCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoAdscripcion' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcMotivoAdscripcion")= CINT(Id_CARcMotivoAdscripcion) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT%>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>¿Actual?</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	      <SELECT NAME='Id_CARcActual' SIZE=1 >
          <OPTION VALUE='0'>SELECCIONE</OPTION>
          <OPTION VALUE='1'> SI</OPTION>
          <OPTION VALUE='2'> NO</OPTION>
        </SELECT> 
      </TD > </TR>
      <TR>
      <TD>
        <B>Registro validado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'> 
          <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcValidado' size=1 >
          <%IF Ob_RS2.EOF THEN %>
          <option value='0'>SIN INFORMACIÓN</option>
          <%ELSE%>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcValidado")= CINT(Id_CARcValidado) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%> 
            </option>
          <%ELSE%>
           <option value='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%> 
           </option>
           <%END IF%>
            <%Ob_RS2.MOVENEXT %>
             <%LOOP%>
            <%END IF%>
          </select>
          <% Ob_RS2.CLOSE%>
      </TD > 
   </TR>
	  <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdAdscripciones' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CARdAdscripciones%></TEXTAREA>
      </TD > </TR>
</TABLE>


  <%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Adscripciones"%>
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

function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    document.FormConsultas.Id_CARcDir_o_subsede.length= 1; // resetea automaticamente el Tercer Combo 
   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormConsultas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormConsultas.Id_CARcDG_o_Delegaciones.length= xcont;
   <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormConsultas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcDG_o_Delegaciones.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormConsultas.Id_CARcDG_o_Delegaciones.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  //document.FormConsultas.Id_CARcDG_o_Delegaciones.options[0].selected=true // Esta linea se agrega solo en Modificaciones
}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormConsultas.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormConsultas.Id_CARcDir_o_subsede.length= xcont;
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormConsultas.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcDir_o_subsede.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormConsultas.Id_CARcDir_o_subsede.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormConsultas.Id_CARcDir_o_subsede.options[0].selected=true 
}




</script> 

