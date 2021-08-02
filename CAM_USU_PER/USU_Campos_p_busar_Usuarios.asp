<!-- Include File = "Seguridad/Perfil.inc" -->




<HTML>
<link href="../Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Consultas  </TITLE> </HEAD>

 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "USU_Muestra_Usuarios_y_Perfiles.asp?OP=INF" NAME= "FormConsultas" target="Informacion">
        <input type="hidden" name="Agregar" value="S">

<p align="Center"> <font  size="3" face="Arial Narrow" color="#0000CC"><b><STRONG><FONT size="4">       </FONT></STRONG></FONT></p>
<p align="Center"><font  size="3" face="Arial Narrow" color="#0000CC"><STRONG><FONT size="4"> </FONT></STRONG> </FONT>
    </font></p>
<fieldset style="width: 810; height: 25; padding: 2"> <legend>Busqueda de Usuarios </legend>
        <!--<P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
       <B>Usuario:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <INPUT TYPE='TEXT' NAME='usuario' SIZE=30 MAXLENGTH=50 >
  </P>-->
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Nombre del Responsable</font>:  &nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' NAME='responsable' SIZE=30 MAXLENGTH=50 >
  </P>
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
		<B>PerfilResponsable:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%' DES_ESP  = 1 quiere decir que solo se mostraran los registros de Personal Sustantivo
	    ' Activos = 1 Son los perfiles que se van a mostrar 
    v_ODBC  = SESSION("ODBC")
	SET INSTANCIA_CONEXXXION      = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET INSTANCIA_RECORD_1        = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    INSTANCIA_CONEXXXION.PROVIDER = "sqloledb"
    INSTANCIA_CONEXXXION.OPEN     = "SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
	  Sql ="SELECT * FROM CARcPerfilGrupo WHERE DES_ESP = 1 AND Activo = 1" %>
          
          <% INSTANCIA_RECORD_1.OPEN Sql, INSTANCIA_CONEXXXION %>
	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE= 1 >
          <% IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL INSTANCIA_RECORD_1.Eof%>
                <%IF INSTANCIA_RECORD_1("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>
                   <OPTION SELECTED VALUE='<%=INSTANCIA_RECORD_1("Id_CARcPerfilGrupo")%>'> <%= INSTANCIA_RECORD_1("CARcPerfilGrupo")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=INSTANCIA_RECORD_1("Id_CARcPerfilGrupo")%>'> <%= INSTANCIA_RECORD_1("CARcPerfilGrupo")%>
                </OPTION>
             <%END IF  %>
	         <%INSTANCIA_RECORD_1.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% INSTANCIA_RECORD_1.CLOSE%>
	   </P>
        
  </fieldset>
<%
%>


  <p ALIGN="center"> &nbsp;
  
  <INPUT TYPE="submit"  VALUE="Enviar" NAME="B1" onClick="" style="position: absolute; left: 553px; top: 47px; font-family: Tahoma; font-size: 8pt; width: 113px;" > 
  &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2" style="position: absolute; left: 669px; top: 47px; font-family: Tahoma; font-size: 8pt; width: 116px;"> 
  &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>
  </FORM> </BODY></HTML>


