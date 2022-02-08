<!-- #Include File = "../Seguridad/Perfil.inc" -->




<HTML>
<link href="../Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Consultas  </TITLE> </HEAD>

 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "REP1_Muestra_Usuarios_y_Perfiles.asp?OP=INF" NAME= "FormConsultas" target="Informacion">
        <input type="hidden" name="Agregar" value="S">

<p align="Center"> <font  size="3" face="Arial Narrow" color="#0000CC"><b><STRONG><FONT size="4">       </FONT></STRONG></FONT></p>
<p align="Center"><font  size="3" face="Arial Narrow" color="#0000CC"><STRONG><FONT size="4"> </FONT></STRONG> </FONT>
    </font></p>
<fieldset style="width: 810; height: 25; padding: 2"> <legend>Busqueda de Personas </legend>
        <!--<P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
       <B>Usuario:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <INPUT TYPE='TEXT' NAME='usuario' SIZE=30 MAXLENGTH=50 >
  </P>-->
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Apellido paterno</font>:  &nbsp;&nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='ap' SIZE=30 MAXLENGTH=50 >
  </P>
        
		<P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Apellido materno</font>:  &nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='am' SIZE=30 MAXLENGTH=50 >
  </P>
  <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Nombre (s)</font>:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='nombre' SIZE=30 MAXLENGTH=50 >
  </P>
  <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B> R F C</font>: 
	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   &nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='rfc' SIZE=30 MAXLENGTH=50 >
  </P>
        
  </fieldset>
<%
%>


  <p ALIGN="center"> &nbsp;
  
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()" style="position: absolute; left: 553px; top: 47px; font-family: Tahoma; font-size: 8pt; width: 113px;" > 
  &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2" style="position: absolute; left: 669px; top: 47px; font-family: Tahoma; font-size: 8pt; width: 116px;"> 
  &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>
  </FORM> </BODY></HTML>
  
  
  
  <script Language="JavaScript"> 
function ValidaCampos()
{
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		
        if(jvi_texto_correcto.test(FormConsultas.ap.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Apellido paterno, verifique por favor.');
	  	 FormConsultas.ap.focus();
      	 return false;    
        }	
		
		
		if(jvi_texto_correcto.test(FormConsultas.am.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Apellido materno, verifique por favor.');
	  	 FormConsultas.am.focus();
      	 return false;    
        }	
		
		
		
		if(jvi_texto_correcto.test(FormConsultas.nombre.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre, verifique por favor.');
	  	 FormConsultas.nombre.focus();
      	 return false;    
        }	
		
		
		
		if(jvi_textoynumero_correcto.test(FormConsultas.rfc.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo RFC, verifique por favor.');
	  	 FormConsultas.rfc.focus();
      	 return false;    
        }	
         
		
		    
     document.FormConsultas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}
</script>


