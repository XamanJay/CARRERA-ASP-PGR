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

    v_Tabla = "CARdEstimulosReconocimientos"
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

consulta = "SELECT * FROM CARcDetalle " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Detalle = OB_rs.getrows
Campos_Detalle = UBound(tbl_Detalle,1) 
regs_Detalle = UBound(tbl_Detalle,2)
OB_RS.CLOSE 

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

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
     <FONT COLOR= #3366CC>Consultas de  Estimulos y Reconocimientos   </FONT>
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
        <B>Estímulo/Reconocimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcTipoEstimuloRec" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEstimuloRec' SIZE=1 onchange='SeleMenu("C")'>
			<%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
            <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEstimuloRec")= CINT(Id_CARcTipoEstimuloRec) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= Ob_RS2("CARcTipoEstimuloRec")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= Ob_RS2("CARcTipoEstimuloRec")%>
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
        <B>Tipo Estímulo/Reconocimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcDetalle" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDetalle' SIZE=1 onchange='SeleMenu()'>
		   <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
           <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
     <TR>
      <TD>
        <B>Motivo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Motivo' SIZE=10 ROWS=5 COLS=35 style="text-transform: uppercase"><%=Motivo%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEstimulosReconocimientos' SIZE=10 ROWS=5 COLS=35 style="text-transform: uppercase"><%=CARdEstimulosReconocimientos%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Estimulos y Reconocimientos"%>
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
function SeleMenu(pas)
{
var xcont = 1 
var ycont = 0 
   
   <% FOR I = 0 to regs_Detalle %>
	    if  (document.FormConsultas.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
  document.FormConsultas.Id_CARcDetalle.length= xcont;
    <% FOR I = 0 to regs_Detalle %>
        if  (document.FormConsultas.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcDetalle.options[ycont].text='<%= tbl_Detalle(1,I) %>'
          document.FormConsultas.Id_CARcDetalle.options[ycont].value='<%= tbl_Detalle(0,I) %>'
		  }
   <%  next    %>   

}

</script> 

