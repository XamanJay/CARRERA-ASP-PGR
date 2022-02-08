<!-- Include File = "Seguridad/Perfil.inc" -->




<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Consultas  </TITLE> </HEAD>

 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "listado_p_seguimiento_procedimientos.asp?OP=INF" NAME= "FormConsultas" target="mainFrameProce">
        <input type="hidden" name="Agregar" value="S">

<p align="Center"> <font  size="3" face="Arial Narrow" color="#0000CC"><b><STRONG><FONT size="4">       </FONT></STRONG></FONT></p>
<p align="Center"><font  size="3" face="Arial Narrow" color="#0000CC"><STRONG><FONT size="4"> </FONT></STRONG> </FONT>
    </font></p>
<fieldset style="width: 810; height: 25; padding: 2"> <legend>Busqueda de Procedimientos</legend>
        <!--<P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
       <B>Usuario:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <INPUT TYPE='TEXT' NAME='usuario' SIZE=30 MAXLENGTH=50 >
  </P>-->
        <P ALIGN='left' style="margin-top: 0; margin-bottom: 0"><font face="TAHOMA" style="font-size: 9pt">
      <B>Número de procedimiento</font>:  &nbsp;&nbsp;&nbsp;&nbsp;
          <INPUT TYPE='TEXT' NAME='numero_procedimiento' SIZE=40 MAXLENGTH=50 >
  </P>
        
		
  
 
        
  </fieldset>
<%
%>


  <p ALIGN="center"> &nbsp;
  
  <INPUT TYPE="button"  VALUE="Buscar" NAME="B1" onClick="ValidaCampos()" style="position: absolute; left: 553px; top: 25px; font-family: Tahoma; font-size: 8pt; width: 113px;" > 
  &nbsp;&nbsp;&nbsp; 

  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2" style="position: absolute; left: 669px; top: 25px; font-family: Tahoma; font-size: 8pt; width: 116px;"> 
  &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>
  </FORM> </BODY></HTML>


<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormConsultas.numero_procedimiento.value  == "")
  {
       alert("EL CAMPO: Número de procedimiento, no puede ser vacio, verifique por favor");
       return false;
  }
  
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		
		var jvi_textoynumeronodocumento_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/

       if(jvi_textoynumeronodocumento_correcto.test(FormConsultas.numero_procedimiento.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de procedimiento, verifique por favor.');
	  	 FormConsultas.numero_procedimiento.focus();
      	 return false;    
        }
     //FormConsultas.B1.disabled = true;  
     document.FormConsultas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}
</script>