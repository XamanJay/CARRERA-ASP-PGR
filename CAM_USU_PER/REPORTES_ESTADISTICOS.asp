<% 

EXCEL = REQUEST.FORM("exxxcel")

IF EXCEL = 100 THEN
 Response.ContentType = "application/vnd.ms-excel" 
ELSE
 EXCEL = 0
END IF

  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdNombramientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")

	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   xtipoReporte = request("TipoReporte")
'   RESPONSE.WRITE xTipoReporte
'   RESPONSE.WRITE "<>"
'   RESPONSE.WRITE request("TRep")
''xTrep =  request("TRep")
sRecarga =  request("ICarga")
%>
<HTML>
<!--<link href="Estilo.css" rel="stylesheet" type="text/css">
-->
 <HEAD>
  <TITLE>
   Pantalla REPORTES
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
<!-- <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0" bgcolor="">
--><body background="../softgri1.jpg" bgproperties="fixed" link="#FFFFFF" alink="#FFFFFF" vlink="#FFFFFF" >
<link href="../Estilo.css" rel="stylesheet" type="text/css">

  <CENTER>
 
   <FORM METHOD="post" ACTION= "REPORTES_ESTADISTICOS.asp" NAME= "FormRE">
<!--      <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
-->
      <!--INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg"-->


 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
 
 <% CALL STipoReporte(xtipoReporte) %>
 <%'IF sRecarga ="S" AND xtipoReporte = "VST_RE_ADSCRIPCION_RAMA_CATEGORIA" THEN  %>
      <% 'CALL SADSCRIPCION() %>
  <%'END IF%>
 <%'IF sRecarga ="S" AND xtipoReporte =  "VST_RE_URESPONSABLE_RAMA_CATEGORIA" THEN  %>
      <%' CALL sUR() %>
      <%' CALL sDel_DG() %>
  <%'END IF%>
  <%IF sRecarga ="S" AND xtipoReporte = "VST_RE_SITUACION_RAMA_CATEGORIA" THEN  %>
      <% ''CALL SSituacionActual() %>
      <% CALL sEstatus() %>
  <%END IF%>
 <%'IF sRecarga ="S" AND xtipoReporte =  "VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA" THEN  %>
      <%' CALL sNombramiento() %>
  <%'END IF%>
 <%'IF sRecarga ="S" AND xtipoReporte =  "VST_RE_GENERO_RAMA_CATEGORIA" THEN  %>
      <%' CALL sNombramiento() %>
  <%'END IF%>
 <%''IF sRecarga ="S" AND xtipoReporte =  "VST_RE_RAMA_CATEGORIA" THEN  %>
      <%' CALL sNombramiento() %>
      <%'' CALL SSituacionActual() %>
  <%''END IF%>
  <%'IF sRecarga ="S"  THEN '"CARRERA" %>
       <% 'CALL sTIPO_NOMBRAMIENTO() %>
       <% 'CALL sCATEGORIA() %>
  <%'END IF%>
</TABLE>
  <% 
'  response.end
  IF xtipoReporte <> "" AND sRecarga ="N" then 
      xxWhere = sWhere()
'response.write xxWhere
'  response.end
      CALL SFILTRO(xtipoReporte,xxWhere)%>
  <% END IF%>
<INPUT TYPE="Hidden" NAME=ICarga Value ='N'>

  <p ALIGN="center"> 
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick=""> 
  &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> 
  
  	      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="../Multimedia/imagenes/EXCEL.jpg">

  </p>
   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>


<%SUB SAdscripcion%>
     <TR>
      <TD height="26"> <B>Adscripción</B> </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY Id_CARcSubprocuradurias, CARcSubprocuradurias ASC" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='IdAdscripcion' SIZE=1 >
	         <OPTION SELECTED VALUE='0'>SELECCIONE</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<% END SUB %>

<% SUB sEstatus %>
     <TR>
      <TD> 
         <B>Estatus Laboral</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcEstatusLaboral" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>0SELECCIONAR</OPTION>
          <%ELSE%>
            <OPTION SELECTED VALUE='ACTIVO'>ACTIVO</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                   <OPTION VALUE='<%=Ob_RS2("CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%> </OPTION>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<% END SUB %>
	 
<%SUB SUR%>
	  <TR>
     <TD colspan="2">
      <FONT class="SL"><b>UNIDAD ADMINISTRATIVA RESPONSABLE </b></FONT>
      </TD>
     </TR>
     <TR>
     <TD>
	 <p align="right">
        <B><font size="-2"> Subprocuraduria</font> </B> </p>
      </TD>
     <TD>
        <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY CARcSubprocuradurias ASC" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")'>
          <OPTION SELECTED VALUE='0'>SELECCIONE</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%> </OPTION>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT>
        <% Ob_RS2.CLOSE%>
       </TD>
      </TR>
<% END SUB %>	 
<%SUB sDEL_DG%>
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
<% END SUB %>	 
<%SUB SSituacionActual%>
     <TR>
      <TD>
        <B>¿Actual?</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	      <SELECT NAME='Actual' SIZE=1 >
          <OPTION VALUE='0SELECCIONE'>SELECCIONE</OPTION>
          <OPTION VALUE='SI'> SI</OPTION>
          <OPTION VALUE='NO'> NO</OPTION>
        </SELECT> 
      </TD > </TR>
<% END SUB %>	 
<% SUB sNombramiento %>
      <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNombramiento' SIZE=1 <%=xNom_Disabled%> onchange='pRecarga()'  <% IF xNom_Disabled ="disabled" THEN RESPONSE.WRITE "class='styletest'"  %>>
          <%IF Ob_RS2.EOF  THEN %>
	            <OPTION VALUE='0'>SELECCIONE</OPTION>
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
<% SUB sTIPO_NOMBRAMIENTO %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Rama</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 onchange='SeleCombo2("C")'>
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SELECCIONE</OPTION>
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
          <OPTION VALUE='0'>SELECCIONE</OPTION>
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
<%SUB STipoReporte(pRep)%>
     <TR>
      <TD>
        <B>Tipo de Reporte:</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	      <SELECT NAME='TipoReporte' SIZE=1 onChange="pRecarga()">
          <OPTION VALUE=''> Seleccionar</OPTION>
		  <%IF pRep <> "" then%>
            <OPTION SELECTED VALUE='<%=pRep%>'><%=mid(pREp,8,len(pRep)-1)%></OPTION>
		  <%END IF%>
          <OPTION VALUE='VST_RE_RAMA_CATEGORIA'>RAMA_CATEGORIA</OPTION>
          <OPTION VALUE='VST_RE_ADSCRIPCION_RAMA_CATEGORIA'>ADSCRIPCION_RAMA_CATEGORIA</OPTION>
          <OPTION VALUE='VST_RE_URESPONSABLE_RAMA_CATEGORIA'>URESPONSABLE_RAMA_CATEGORIA</OPTION>
          <OPTION VALUE='VST_RE_SITUACION_RAMA_CATEGORIA'>SITUACION_RAMA_CATEGORIA</OPTION>
          <OPTION VALUE='VST_RE_NOMBRAMIENTO_RAMA_CATEGORIA'>NOMBRAMIENTO_RAMA_CATEGORIA</OPTION>
          <OPTION VALUE='VST_RE_GENERO_RAMA_CATEGORIA'>GENERO_RAMA_CATEGORIA</OPTION>
        </SELECT> 
      </TD > </TR>
<% END SUB %>	 


<%SUB  SFILTRO(pVista,pWhere)
xQry = "select * from " +pVista +pWhere
''response.write xQry
Ob_RS2.open xQry , Ob_Conn 
Num_Campos= Ob_RS2.FIELDS.COUNT 
N = 0
%>
<!--H4><%=mid(pVista,8,len(pVista)-1)%></H4-->
 <BR>
  <TABLE class="SL" border="1">
       
 <TR>
    <SCRIPT LANGUAGE="JavaScript">
<!--

function imprimir() {
  if (window.print)
    window.print()
  else
    alert("Disculpe, su navegador no soporta esta opción.");
}

// -->
</SCRIPT>

 
 <td  colspan="<%=Num_Campos%>"> </TD>
 <tr> 
 	<td><p align="center">
		 <a href="javascript:imprimir()"><img src="../Multimedia/imagenes/LOGO_2007 PGR (170x120).png" width="111" height="63"> </a>
		 </p>
	</td>  
	
	<td colspan="5"><p align="center">
		 <h4><center>PROCURADURÍA GENERAL DE LA REPÚBLICA </center></h4>
		  <h5><center><%=mid(pVista,8,len(pVista)-1)%></center></h5>
		  </p>
	</td>
	
 </tr>

      <TR> 
	  
<%		VarTot=0
		FOR Campo = 0 TO Num_Campos - 1 %>			
		  <% IF  INSTR(Ob_RS2(Campo).NAME ,"CARc") THEN%>
			<TD class="Encabezados"><p align="center"><center><h5>  <%= mid( Ob_RS2(Campo).name,5,len(Ob_RS2(Campo).name)-1 ) %> &nbsp; </h5></center></p></TD>
		<% ELSE%>
			<TD class="Encabezados"><p align="center"><center><h5> <%= Ob_RS2(Campo).name %> &nbsp;</h5></center></p></TD>
		<% END IF %>
<%		NEXT %>
	  </p>
      </TR> 
 <%  DO WHILE NOT Ob_RS2.EOF %>
      <TR> 
		<% N = N +1%>
		<%FOR Campo = 0 TO Num_Campos - 1 %>			
		  <%' IF  INSTR(Ob_RS2(Campo) ,"SELEC") THEN%>
			<!--TD>&nbsp; </TD-->
		<% 'ELSE%>
			<TD> <%= Ob_RS2(Campo) %></TD>
		<% 'END IF %>
<%		NEXT
		VarTot=VarTot+Ob_RS2("Total")
		Ob_RS2.MOVENEXT
  LOOP %>
       <tr><td>&nbsp;</td><td>&nbsp;  </td><td><h5>Total de Personal Activo:</h5></td><td>&nbsp;</td><td>&nbsp;</td><td><h5><%=VarTot%></h5></td>
 </TABLE>

<% END SUB%>

<%FUNCTION  sWhere()
 XWhere = " WHERE Rama <> '' "
 IF CINT(REQUEST("IdAdscripcion")) <> 0 THEN 
   XWhere = XWhere+ " AND IdAdscripcion = '"+REQUEST("IdAdscripcion")+"'"
 END IF    
 IF  CINT(REQUEST("Id_CARcSubprocuradurias")) <> 0 THEN 
   XWhere = XWhere+ " AND Id_CARcSubprocuradurias = '"+REQUEST("Id_CARcSubprocuradurias")+"'"
 END IF    
 IF  CINT(REQUEST("Id_CARcDG_o_Delegaciones")) <> 0 THEN 
   XWhere = XWhere+ " AND Id_CARcDG_o_Delegaciones = '"+REQUEST("Id_CARcDG_o_Delegaciones")+"'"
 END IF    
 IF  not isnumeric(left(REQUEST("Actual"),1)) and REQUEST("Actual") <> ""  THEN 
''    IF  REQUEST("Actual") <> "SELECCIONAR" THEN 
        XWhere = XWhere+ " AND Actual = '"+REQUEST("Actual")+"'"
''    END IF    
 END IF    
 IF INSTR(REQUEST("Id_CARcEstatusLaboral"), "SELEC") = O AND REQUEST("Id_CARcEstatusLaboral") <> "" THEN 
   XWhere = XWhere+ " AND CARcEstatusLaboral =  '"+REQUEST("Id_CARcEstatusLaboral")+"'"
 END IF    
 IF  CINT(REQUEST("Id_CARcNombramiento")) <> 0 THEN 
   XWhere = XWhere+ " AND Id_CARcNombramiento = '"+REQUEST("Id_CARcNombramiento")+"'"
 END IF    
 IF  CINT(REQUEST("Id_CARcTipoNombramiento")) <> 0 THEN 
   XWhere = XWhere+ " AND Rama = '"+REQUEST("Id_CARcTipoNombramiento")+"'"
 END IF    
 IF  CINT(REQUEST("Id_CARcCategoria")) <> 0 THEN 
   XWhere = XWhere+ " AND Id_CARcCategoria = '"+REQUEST("Id_CARcCategoria")+"'"
 END IF    
 sWhere = XWhere
END function%>

<script>
function pRecarga()
{
 //  alert()	  
   FormRE.B1.disabled = true;  
   document.FormRE.ICarga.value = "S";  
   document.FormRE.submit();
}
</script>