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

    v_Tabla = "CARdNombramientos"
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

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Tipo Nombramiento y Categoria
consulta = "SELECT * FROM CARcCategoria " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = OB_rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Categoria y Nivel
consulta = "SELECT * FROM CARcNivel" 
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
   XTipoNom= REQUEST("Id_CARcNombramiento_P")
  Id_CARcNombramiento= REQUEST("Id_CARcNombramiento_P")
  Id_CARcNombramiento_P= REQUEST("Id_CARcNombramiento_P")
'========== Combos
%>

<%'=======No tiene combos===========%>


<% '========== Inicia HTML %>
<style type="text/css" id="oStyle">
.styletest {
     background-color: white;
     color: blue;
	 disabled:disabled;
}
</style>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0" bgcolor="">

  <CENTER>
<% IF XTipoNom = "" THEN %>  
   <% xNom_Disabled = "enabled" %>  
  <FORM METHOD="post" ACTION= "Consultas_CARdNombramientos.asp" NAME= "FormConsultas">
        <input type="hidden" name="Agregar" value="S">
<% ELSE %>  
   <% xNom_Disabled = "disabled" %>  
   <FORM METHOD="post" ACTION= "ConsultasFiltro.asp" NAME= "FormConsultas">
      <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">
<% END IF %>  

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Consultas de  Nombramientos</FONT>
    </H2>
  </CENTER>
<p ALIGN="center">&nbsp; 

  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
 
  <%IF XTipoNom = "" or XTipoNom = "0" THEN ' "EN BLANCO" %>
      <BR><BR>
       <% CALL sNombramiento %>
      <BR><BR>
  <%END IF%>
  <%IF XTipoNom = 1 THEN ' "ASPIRANTE" %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES%>
  <%END IF%>
  <%IF XTipoNom = 2  THEN '"CARRERA" %>
      <% CALL sNombramiento %>
      <% CALL sFECHA_NOMBRAMIENTO %>
      <% CALL sTIPO_INGRESO %>
      <% CALL sFECHA_INGRESO %>
      <% CALL SADSCRIPCION %>
      <% CALL sNO_GAFETE %>
      <% CALL sCLAVE_PAGO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
      <% CALL sCATEGORIA %>
      <% CALL sESPECIALIDAD %>
      <% CALL sNIVEL %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
      <% CALL sOBSERVACIONES %>
  <%END IF%>
  <%IF XTipoNom = 3 THEN ' "D ESPECIAL" %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
       <% CALL sCATEGORIA %>
       <% CALL sOficioPeticion %>
       <% CALL sFechaOfPeticion %>
       <% CALL sAreaSolicitante %>
       <% CALL sNombreSolicitante %>
       <% CALL sNoAcuerdo %>
       <% CALL sFechaAcuerdo %>
       <% CALL sFechaInicio %>
       <% CALL sFechaTermino %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES%>
  <%END IF%>
  <%IF XTipoNom = 4 OR  XTipoNom =5 THEN '"DELEGADO"  O SUBDELEGADO %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
       <% CALL sNumeroSesion %>
       <% CALL sFechaSesion %>
       <% CALL sOficioPeticion %>
       <% CALL sFechaOfPeticion %>
       <% CALL sAreaSolicitante %>
       <% CALL sNombreSolicitante %>
       <% CALL sNoAcuerdo %>
       <% CALL sFechaAcuerdo %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES %>
  <%END IF%>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Nombramientos"%>
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARcNombramiento Value = <%= Id_CARcNombramiento%> >

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> 
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> 
  </p>
   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!-- #INCLUDE File="errores.inc" -->


<% SUB sNombramiento %>
      <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNombramiento_P' SIZE=1 <%=xNom_Disabled%> onchange='pRecarga()'  <% IF xNom_Disabled ="disabled" THEN RESPONSE.WRITE "class='styletest'"  %>>
          <%IF Ob_RS2.EOF  THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcNombramiento")= CINT(Id_CARcNombramiento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNombramiento")%>'> <%= Ob_RS2("CARcNombramiento")%>
                </OPTION>
             <%ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNombramiento")%>'> <%= Ob_RS2("CARcNombramiento")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
         <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <%If CINT(Id_CARcTipoNombramiento) = 1 or CINT(Id_CARcTipoNombramiento) = 2 Then%>
     	<script>
     		document.FormConsultas.Id_CARcEspecialidad.disabled =true
     	</script>
     <%End If%>
<%END SUB%>

<% SUB sFECHA_NOMBRAMIENTO %>

     <TR> 
      <TD> <B>Fecha de nombramiento<BR></font>
        </B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Fecha_nombramiento' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento%> >
          <IMG ONCLICK="window_open('FormConsultas','Fecha_nombramiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
          <BR>
          <BR>
      </TD >
    </TR>
<%END SUB %>
<% SUB sTIPO_INGRESO %>

    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCTIPO_INGRESO" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Tipo de ingreso</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcTipo_ingreso' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcTipo_ingreso")= CINT(Id_CARcTipo_ingreso) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= UCASE(Ob_RS2("CARcTipo_ingreso"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= UCASE(Ob_RS2("CARcTipo_ingreso"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sFECHA_INGRESO %>
    <TR> 
      <TD> <B>Fecha de ingreso al servicio de carrera</B></TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Fecha_ingreso' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso%> >
          <IMG ONCLICK="window_open('FormConsultas','Fecha_ingreso')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
          <BR>
          <BR>
      </TD >
    </TR>
<%END SUB %>

<% SUB SADSCRIPCION %>
    <TR> 
      <TD> <B>Adscripción</font></B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Adscripcion' style="text-transform: uppercase"  SIZE=80 MAXLENGTH=120 VALUE='<%= Adscripcion%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sNO_GAFETE %>
    <TR> 
      <TD> <B>Número de gafete</B></TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='NumeroGafete' style="text-transform: uppercase"  SIZE=20 MAXLENGTH=20 VALUE='<%= Trim(NumeroGafete)%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sCLAVE_PAGO %>
    <TR> 
      <TD> <B>Clave de pago</font> </B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Clavepago' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Trim(Clavepago)%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sTIPO_NOMBRAMIENTO %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Rama</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 onchange='SeleCombo2("C")'>
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= UCASE(Ob_RS2("CARcTipoNombramiento"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= UCASE(Ob_RS2("CARcTipoNombramiento"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sCATEGORIA %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCCATEGORIA"%>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Categor&iacute;a</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcCategoria' SIZE=1 onchange='SeleCombo3("C")'>
          <OPTION VALUE='0'>SELECCIONAR</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcCategoria")= CINT(Id_CARcCategoria) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= UCASE(Ob_RS2("CARcCategoria"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sESPECIALIDAD %>
    <TR> 
      <TD> <B>Especialidad</B></TD>
      <TD> 
        <%Sql ="SELECT * FROM CARcEspecialidad" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <SELECT NAME='Id_CARcEspecialidad' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <% IF Ob_RS2("Id_CARcEspecialidad")= CINT(Id_CARcEspecialidad) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEspecialidad")%>'> <%= UCASE(Ob_RS2("CARcEspecialidad"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> 
        <% Ob_RS2.CLOSE%>
      </TD>
    </TR>
<%END SUB %>
<% SUB sNIVEL %>
   <%If CINT(Id_CARcTipoNombramiento) = 1 or CINT(Id_CARcTipoNombramiento) = 2 Then%>
    <script>
     		document.FormConsultas.Id_CARcEspecialidad.disabled =true
     	</script>
    <%End If%>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCNIVEL " %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Nivel</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcNivel' SIZE=1 >
          <%IF Ob_RS2.Eof THEN %>
          <OPTION VALUE='0'>SELECCIONAR</OPTION>
          <%ELSE%>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcNivel")= CINT(Id_CARcNivel) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= UCASE(Ob_RS2("CARcNivel"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
          <%END IF%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>

<% SUB sNOMBRAMIENTO_ACTUAL %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCSINO "%>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>&iquest;Nombramiento actual?</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcSINO' SIZE=1 >
          <%IF Ob_RS2.Eof THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcSINO")= CINT(Id_CARcSINO) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSINO")%>'> <%=UCASE(Ob_RS2("CARcSINO"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
          <%END IF%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>

 <% SUB sOBSERVACIONES %>
   <TR> 
      <TD> <B>Observaciones<BR></font>
        </B> </TD>
      <TD> <P ALIGN='left'> 
          <TEXTAREA NAME='CARdNombramientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdNombramientos%></TEXTAREA>
      </TD >
    </TR>
<%END SUB %>


 <% SUB sOficioPeticion %>
<TR>
      <TD>
        <B>Oficio de Petición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Oficio_Peticion' SIZE=50 MAXLENGTH=50 VALUE=<%= Oficio_Peticion%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaOfPeticion %>
     <TR>
      <TD>
        <B>Fecha Oficio Petición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_OF_Peticion' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= Fecha_OF_Peticion%> >
       <IMG ONCLICK="window_open('FormConsultas','Fecha_OF_Peticion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sAreaSolicitante %>
     <TR>
      <TD>
        <B>Area Solicitante</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='AreaSolicitante' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaSolicitante%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNombreSolicitante %>
     <TR>
      <TD>
        <B>Nombre del Solicitante</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='NombreSolicitante' SIZE=50 MAXLENGTH=50 VALUE=<%= NombreSolicitante%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNoAcuerdo %>
     <TR>
      <TD>
        <B>Número de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Noacuerdo' SIZE=30 MAXLENGTH=30 VALUE=<%= Noacuerdo%>>
      </TD > 
     </TR>
<%END SUB %>

 <% SUB sFechaAcuerdo %>
     <TR>
      <TD>
        <B>Fecha de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAcuerdo' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaAcuerdo%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAcuerdo')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaInicio %>
     <TR>
      <TD>
        <B>Fecha de Inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaTermino %>
     <TR>
      <TD>
        <B>Fecha de Término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNumeroSesion %>
     <TR>
      <TD>
        <B>Número de Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='NoSesion' SIZE=30 MAXLENGTH=30 VALUE=<%= NoSesion%>>
      </TD > 
     </TR>
<%END SUB %>
<% SUB sFechaSesion %>
     <TR>
      <TD>
        <B>Fecha de Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaSesion' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaSesion%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaSesion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>


<!--- ================================================================================================================ --->


<script Language="JavaScript"> 
<!--
function pRecarga(pas)
{
   FormConsultas.B1.disabled = true;  
   document.FormConsultas.submit();	  
}

function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    document.FormConsultas.Id_CARcNivel.length= 1; // resetea automaticamente el Tercer Combo 
	// El siguiente Desabilita el campo Especialidad cuando es Agente del MP o AFI
    if  (FormConsultas.Id_CARcTipoNombramiento.value == 1 || FormConsultas.Id_CARcTipoNombramiento.value == 2)
	{ 
	   document.FormConsultas.Id_CARcEspecialidad.disabled =true;
	   }
	else
	{
	   document.FormConsultas.Id_CARcEspecialidad.disabled =false;
	}

   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormConsultas.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormConsultas.Id_CARcCategoria.length= xcont;
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormConsultas.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcCategoria.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormConsultas.Id_CARcCategoria.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  document.FormConsultas.Id_CARcCategoria.options[0].selected=true // Esta linea se agrega solo en Modificaciones



}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormConsultas.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormConsultas.Id_CARcNivel.length= xcont;
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormConsultas.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormConsultas.Id_CARcNivel.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormConsultas.Id_CARcNivel.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormConsultas.Id_CARcNivel.options[0].selected=true 

}
-->
</script>
