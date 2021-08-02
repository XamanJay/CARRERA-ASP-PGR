<!-- Include File = "Seguridad/Perfil.inc" -->




<HTML>
<link href="../Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Consultas  </TITLE> </HEAD>

 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "PERFIL_Muestra_Perfiles.asp?OP=INF" NAME= "FormConsultas" target="Informacion">
        <input type="hidden" name="Agregar" value="S">

<p align="Center"> <font  size="3" face="Arial Narrow" color="#0000CC"><b><STRONG><FONT size="4">       </FONT></STRONG></FONT></p>
<p align="Center"><font  size="3" face="Arial Narrow" color="#0000CC"><STRONG><FONT size="4"> </FONT></STRONG> </FONT>
    </font></p>
<fieldset style="width: 810; height: 25; padding: 2"> <legend>Busqueda de Perfiles </legend>
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
       <B>Nombre de Perfil:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <INPUT TYPE='TEXT' NAME='nombre_perfil' SIZE=30 MAXLENGTH=50 >
  </P>
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Descripción del perfil</font>:  &nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' NAME='descrip_perfil' SIZE=30 MAXLENGTH=50 >
  </P>
  <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
        
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


