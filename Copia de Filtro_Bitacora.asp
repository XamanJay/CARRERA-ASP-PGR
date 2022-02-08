<!-- #Include File = "Seguridad/Perfil.inc" -->
 <html><head><title>Filtrar las listas</title>
</head>
 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <link  rel="stylesheet" type="text/css" href="../Estilo.css" >
 <%
   SET Conex = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET DatosPersonales  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET TablaAvance  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   
    Conex.PROVIDER="sqloledb"
   Conex.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE=SIIFP;UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
 TipoExamen = TRIM(REQUEST("TipoExamen"))
 TIT        = TRIM(REQUEST("TIT"))
 
 
  %>
  <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
  
  <FORM  METHOD="post" ACTION= "Listado_Bit.asp" NAME= "FormAltas" > 
  
  <INPUT TYPE="hidden" NAME="TipoExamen" VALUE="<%=TipoExamen%>">
  <INPUT TYPE="hidden" NAME="TIT" VALUE="<%=TIT%>">
  <!--<INPUT TYPE="hidden" NAME="FechaEvaAct" VALUE="<%'=FechaEvaAct%>">-->
  <BR>  <BR>  <BR>  <BR>
<FIELDSET style="width: 200; height: 70; padding: 1" title="Filtros" > <legend >Campos para buscar en la bitacora de avance</legend>
<TABLE width="870">
      <TR > 
      <TD width="186" valign="top"> <B>Usuarioo: <BR>
      </B> 
	  <%Sql ="SELECT Id_CARcUSR, CARcUSR FROM VISTA_FILTRO_BIT_1 ORDER BY CARcUSR ASC" 
	   
           DatosPersonales.OPEN Sql, Conex %>
		  
          <!-- <INPUT TYPE='TEXT' NAME='GrupoEspecial' SIZE=10  MAXLENGTH=16>-->
		   <SELECT NAME='CARcUSR1' SIZE=10 >
          <% IF Id_CARcUSR = "" OR Id_CARcUSR = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL DatosPersonales.Eof%>
                <%IF DatosPersonales("Id_CARcUSR")= CINT(Id_CARcUSR) THEN %> 
				<OPTION SELECTED VALUE='<%=DatosPersonales("Id_CARcUSR")%>'> <%= DatosPersonales("CARcUSR")%> 
             </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=DatosPersonales("Id_CARcUSR")%>'> <%= DatosPersonales("CARcUSR")%> 
                </OPTION>
             <%END IF  %>
	         <%DatosPersonales.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
     </TD >
	  <% DatosPersonales.CLOSE%>
	 
   
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
      <TD width="172" valign="top"> <B>Tipo de Operación: <BR></B> 
	  <%'Sql ="SELECT  DISTINCT Operacion FROM CARdRastreo_bit" 
	   
          ' TablaAvance.OPEN Sql, Conex %>
		  
		   <SELECT NAME='Operacion' SIZE=3 >
          
	         <%'DO UNTIL TablaAvance.Eof%>
              
				<OPTION selected value="Alta">Alta</OPTION>
				<OPTION value="Cambio">Cambio</OPTION>
                <OPTION VALUE='<%'=TablaAvance("Operacion")%>'> <%'= TablaAvance("Operacion")%> 
                </OPTION>
        
	         <%'TablaAvance.MOVENEXT %>
	         <%'LOOP%>
       </SELECT>
     </TD >
	  <% 'TablaAvance.CLOSE%>
	 
   
	
	
      <TD width="181"  align="left" valign="top"> <B>Fecha de Captura:<BR></B> 
          <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16 >
          <IMG ONCLICK="window_open('FormAltas','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='48' HEIGHT='18'> 
      </TD >
	  <TD width="291" valign="top"> <strong>Ordenamiento: </strong>	    <INPUT TYPE="radio" name="TipodeOrdenamiento" checked value="1" > 
	    <strong>Por Fecha</strong>	<BR> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <INPUT TYPE="radio" name="TipodeOrdenamiento" value="0" > <strong>Por Tabla</strong> </TD >
		
		
	  </TR>
	
  </TABLE>
	
	<TABLE>
	
	
  
	
</table>
	</FIELDSET>
	  <BR>  <BR>  <BR>
	<center><input type="submit" value="Enviar" name="B1" onClick="return ValidaCampos()" >	   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="reset" value="Restablecer" name="B2"> </center>
	   
	   
	   
	   
</FORM></body></html>


<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormAltas.CARcUSR1.value  == "")
  {
       alert("Debe seleccionar un elemento de la lista de Usuarios:  ");
       return false;
  }
  
  if (FormAltas.FechaEvaluacion.value  == "")
  {
       alert("EL CAMPO: Fecha de Captura, no puede estar vacio");
       return false;
  }
  
  
  
  }
</script> 

