<!-- #Include File = "Session/ActiveSession.inc" -->
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
  ' Conex.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE=SIIFP;UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
      Conex.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+SESSION("V_ODBC")+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

  %>
  <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
  
  <FORM  METHOD="post" ACTION= "Listado_Bit.asp" NAME= "FormAltas" > 
<FIELDSET style="width: 200; height: 70; padding: 1" title="Filtros" > <legend >CAMPOS PARA BUSCAR EN USUARIOS</legend>
<TABLE width="939">
      <TR > 
      <TD width="243" valign="top"> Usuarios : <BR> 
	  <%Sql ="SELECT Id_CARcUSR, CARcUSR FROM CARcUSR WHERE Carrera = 1 AND Activo = 1 ORDER BY CARcUSR ASC" 
	   
           DatosPersonales.OPEN Sql, Conex %>
	  <select selected name='CARcUSR1' size=1 >
        <option value ='10000'> TODOS </option>
        <%DO UNTIL DatosPersonales.Eof%>
        <%IF DatosPersonales("Id_CARcUSR")= CINT(Id_CARcUSR) THEN %>
        <option  value='<%=DatosPersonales("Id_CARcUSR")%>'> <%= DatosPersonales("CARcUSR")%> </option>
        <% ELSE  %>
        <option value='<%=DatosPersonales("Id_CARcUSR")%>'> <%= DatosPersonales("CARcUSR")%> </option>
        <%END IF  %>
        <%DatosPersonales.MOVENEXT %>
        <%LOOP%>
      </select></TD >
	  <% DatosPersonales.CLOSE%>
	 
   
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
      <TD width="134" valign="top"> Tipo de Operación: <BR> 
	    <SELECT NAME='Operacion' SIZE=1 >
                <OPTION selected value="Todas">Todas</OPTION>
				<OPTION value="Alta">Altas</OPTION>
				<OPTION value="Cambio">Cambios</OPTION>
				<OPTION value="BajaCambio">Bajas</OPTION>
                </OPTION>
        </SELECT>     </TD >
	  
      <TD width="546"  align="left" valign="top"> Fecha de Captura Inicio:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
		  Fecha de Captura Final: <BR>
          <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16 value='<%=date%>'>
        <IMG ONCLICK="window_open('FormAltas','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <INPUT TYPE='TEXT' NAME='FechaEvaluacion2' SIZE=10  MAXLENGTH=16 value='<%=date%>'>
          <IMG ONCLICK="window_open('FormAltas','FechaEvaluacion2')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD >
<!--	  <TD width="291" valign="top"> <strong>Ordenamiento: </strong>	    <INPUT TYPE="radio" name="TipodeOrdenamiento" checked value="1" > 
	    <strong>Por Fecha</strong>	<BR> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <INPUT TYPE="radio" name="TipodeOrdenamiento" value="0" > <strong>Por Tabla</strong> </TD >
-->		
	  </TR>
  </TABLE>
	
	<TABLE>
	
	
  
	
</table>
	</FIELDSET>
	  <BR>  <BR>  <BR>
	<center><input type="submit" value="Enviar " name="B1" onClick="return ValidaCampos()" >	   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="reset" value="Borrar datos" name="B2"> </center>
	   
	   
	   
	   
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
			   alert("EL CAMPO: Fecha de Captura de Incio, no debe de ir vacio, verifique por favor");
			   return false;
		  }
		  
		  if (FormAltas.FechaEvaluacion2.value == "") { alert("EL CAMPO: Fecha de Captura Final, no debe de ir vacio, verifique por favor");
		  return false; }
   
  }
</script> 

