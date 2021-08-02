 <html><head><title>Filtrar las listas</title>
</head>
 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <link  rel="stylesheet" type="text/css" href="../Estilo.css" >
 <%
   SET Conex = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET DatosPersonales  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
    Conex.PROVIDER="sqloledb"
   Conex.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE=EVALUA;UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
 TipoExamen = TRIM(REQUEST("TipoExamen"))
 TIT        = TRIM(REQUEST("TIT"))
 
 
  %>
  <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
  
  <FORM  METHOD="post" ACTION= "ConsultasListaPersonas.asp" NAME= "FormAltas" target="Informacion" > 
  
  <INPUT TYPE="hidden" NAME="TipoExamen" VALUE="<%=TipoExamen%>">
  <INPUT TYPE="hidden" NAME="TIT" VALUE="<%=TIT%>">
  <!--<INPUT TYPE="hidden" NAME="FechaEvaAct" VALUE="<%'=FechaEvaAct%>">-->
  <center><TABLE width="499" height="32">
  <TR ><td><strong>Filtro </strong></td>
  </TR>
  <TR><td></td></TR>
  <TR><TD align="right">
	   <input type="submit" value="Buscar" name="B1" onClick="return ValidaCampos()">
	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Restablecer" name="B2">
	  
		  </TD>
  </TR>
  </TABLE>
  </TABLE></center>
<FIELDSET style="width: 800; height: 70; padding: 1" title="Filtros" > <legend >...</legend>
<TABLE>
      <TR > 
    <!--  <TD  align="left" valign="bottom"> <B>Fecha de Evaluación:<BR></B> 
          <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16 >
          <IMG ONCLICK="window_open('FormAltas','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='48' HEIGHT='18'> 
      </TD >
      <TD valign="bottom"> <B>Folio: <BR></B> 
           <INPUT TYPE='TEXT' NAME='NoRegistro_FOLIO' SIZE=10  MAXLENGTH=16>
     </TD >-->
      <TD valign="bottom"> <B>Usuario: <BR></B> 
	  <%Sql ="SELECT Id_CARdDatosPersonales, CARdDatosPersonales FROM CARdDatosPersonales" 
	   
           DatosPersonales.OPEN Sql, Conex %>
		  
          <!-- <INPUT TYPE='TEXT' NAME='GrupoEspecial' SIZE=10  MAXLENGTH=16>-->
		   <SELECT NAME='CARdDatosPersonales' SIZE=1 >
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL DatosPersonales.Eof%>
                <%IF DatosPersonales("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %> 
				<OPTION SELECTED VALUE='<%=DatosPersonales("Id_CARdDatosPersonales")%>'> <%= DatosPersonales("Nombre")%> <%= DatosPersonales("ApellidoPaterno")%>
             </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=DatosPersonales("Id_CARdDatosPersonales")%>'> <%= DatosPersonales("Nombre")%> <%= DatosPersonales("ApellidoPaterno")%>
                </OPTION>
             <%END IF  %>
	         <%DatosPersonales.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
     </TD >
	  <% DatosPersonales.CLOSE%>
	 <TD valign="bottom"> <B>
        </B> </TD >
    </TR></TABLE>
	</FIELDSET>
	<FIELDSET style="width: 800; height: 70; padding: 1" title="Filtros" > <legend >...</legend>
	<TABLE>
   <!-- <TR> 
      <TD> <B>Nombre:</B>
	            <INPUT TYPE='TEXT' NAME='Nombre' SIZE=20 MAXLENGTH=50 >
      </TD >
      <TD> <B>A.Paterno:</B> 
          <INPUT TYPE='TEXT' NAME='Paterno' SIZE=20 MAXLENGTH=50 >
     </TD >
      <TD> <B>A.Materno:</B> 
          <INPUT TYPE='TEXT' NAME='Materno' SIZE=20 MAXLENGTH=50 >
     </TD >
	
	 </TR>-->
	
</table>
	</FIELDSET>
</FORM></body></html>
