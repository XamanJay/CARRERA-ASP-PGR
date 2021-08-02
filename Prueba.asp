<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcNombramiento " 'WHERE Id_CARdIdiomas =1"+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
'CALL LLAMA()
matriz_registros = OB_rs.getrows
cant_campos = UBound(matriz_registros,1) 
cant_registros = UBound(matriz_registros,2) 

I = -1
'DO WHILE NOT OB_RS.EOF
'   I = I+1
'   REDIM DATOS(I)
'   Datos(I) = ob_RS(1)
'response.write Datos(I) 
'   OB_RS.movenext 
'LOOP
'response.write "<BR>"
'TotalReg = I
'      FOR K = 0 to 3
'	     response.write Datos(K)
'       next 
'response.end
 %>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <FORM METHOD="post" ACTION= "CARdIdiomas.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Conversacion</font>	</B>
      </TD>
      <TD>
 	    <P ALIGN='left'>
        <INPUT TYPE='TEXT' NAME='Conversacion' SIZE=4 MAXLENGTH=4  ONCHANGE="proc()" VALUE=<%= Conversacion%>> %
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Conversa</font>	</B>
      </TD>
      <TD>
 	    <P ALIGN='left'>
        <INPUT TYPE='TEXT' NAME='Conversa' SIZE=4 MAXLENGTH=4  ONCHANGE='llama()' VALUE=<%= Conversa%>> %
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Idioma/Dialecto</B>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcIdioma' SIZE=1>
	            <OPTION VALUE='0'> Seleccione registro </OPTION>
       </SELECT>
      </TD>
     </TR>
</TABLE>


  <% Ob_Rs.CLOSE %>

 
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1 onClick="CALL llama()">
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
<% ELSE %>
   <BR>
  <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% END IF %> 

  </p>

   </CENTER>
  </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->
<%
FUNCTION proc%>
 <script Language="JavaScript"> 
 alert()
 </script>
<%
end FUNCTION

%>
 <script Language="JavaScript"> 
function llama()
{
alert("<%= cant_registros%>")
document.FormEdita.Id_CARcIdioma.length=<%= cant_registros+1%>
     <%
       FOR I = 0 to cant_registros 
       %>
//	   for (i = 1; i <= 3; i++)
 //   {
//	     alert("<%= matriz_registros(1,I) %>")
//	  if (FormAltas.Id_CARcTipoEstimuloRec.value == 1 ) 
alert(document.FormEdita.Conversa.value)

         document.FormEdita.Id_CARcIdioma.options[<%=I%>].text='<%= matriz_registros(1,I) %>'
	//	 }
<% 
       next 
       %>   

return false
}
</script> 
