<HTML> 
 <BODY  BGCOLOR = "#00003C"> 
  <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"> </SCRIPT> 

  <%
   v_Tabla = "CARdDatosPersonales"
   v_Tabla = UCase(TRIM(v_TABLA))
   v_ODBC = "SIIFP"
   ruta_img_calendario		= "Calendario.gif" 
  %>
<!--- ------------------------------------------------------------------------------------------------------------------ --->   
  <CENTER> 
 
  <FIELDSET STYLE="padding: 2; width:900; height:0">        
   
   <HR WIDTH=40%> 
    <FONT COLOR="#FFFFFF"> <H2> Altas de DATOS PERSONALES DEL PERSONAL DE LA PGR </H2> </FONT> 
   <HR WIDTH=40%>    
   <BR><BR><BR> 
    
   <LEGEND> 
    <B> 
     <FONT COLOR="#FFFFFF"> <H3> Captura de DATOS PERSONALES DEL PERSONAL DE LA PGR </H3> </FONT> 
    </B> 
   </LEGEND> 
<!--- ------------------------------------------------------------------------------------------------------------------ ---> 
  <FORM METHOD="post" ACTION="AltasOpr.asp" NAME= "FormVehiAltas"> 
   
 
  <% 
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION") 
   SET Ob_RS1   = SERVER.CREATEOBJECT("ADODB.RECORDSET") 
    
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID="+ Session("UserID") +";PWD="+ Session("Password")   
  %> 
 
 
<!--- --------------------------------------------------------------------------------------------------------------- ---> 
   <TABLE border="0" CELLPADDING="0" CELLSPACING="0" STYLE="border-collapse: collapse" BORDERCOLOR="#111111" ID="AutoNumber1" HEIGHT="260"> 
<!--- --------------------------------------------------------------------------------------------------------------- ---> 

<!--- Campos -------------------------------------------------------------------------------------------------------- ---> 
    
<!--- --------------------------------------------------------------------------------------------------------------- ---> 

   <INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
   <INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >

 
   </TABLE> 
  
   <P ALIGN="CENTER">  
   
   <INPUT TYPE="submit" VALUE="Enviar" NAME="B1">  
   <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2">  
 
  </FORM> 
  </FIELDSET> 
   
  </CENTER> 
   
  <%  
   SET Ob_RS1 = NOTHING 
   SET Ob_Conn = NOTHING   
  %> 
   
 </BODY> 
</HTML>