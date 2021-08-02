<!-- Include File = "../Session/ActiveSession.inc" -->
<html><head><title>Ingrese su password</title></head>
<body bgproperties="fixed" background = "../softgri1.jpg">
<form action="Cambio_password.asp" method="post" name="in_passsw">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">


<br>
<center>
<table border="1" >
<tr >
 <td><Center>
            <strong><font color="#3CA0BD" size="4">CAMBIO 
            DE CONTRASE&Ntilde;A </font></strong> 
          </Center></td>
    </tr>
</table>
</center>

<br><center>
<table border="1" >
<tr >
 <td><Center>
            <strong><font color="#3CA0BD" size="3">Digite usuario y contraseña</font></strong> 
          </Center></td>
    </tr>
</table>
<br><br>
<table border="1">
<tr >
<th >Usuario</th>
<th>Contraseña</th>
</tr>
<tr>
<td><center><input type="text" name="txtUsuario" maxlength="10" size="30"></center> </td>
<td><center><input type="password" name="txtContrasena" maxlength="40" size="30"></center> </td>
</table><br><br></center>

<center>
<table border="1">
<tr>
<td><center><input type="reset" name="btnlimpiar" value="L i m p i a r"></center></td>
<td><center><input type="button" name="btnEnviar" value="E n v i a r" onClick="valida()"></center></td>
</tr>
</table></center>
<br>
<table>
<tr>
<td> <!--<p> 
          <marquee behavior="scroll" loop="5" dir="ltr" scrolldelay="1000" lang="ar" direction="up" width="200" >
          <strong>Para modificar su password digite: Usuario, contraseña y oprima 
          el bonton de "Enviar".</strong>&nbsp; &nbsp;&nbsp;&nbsp; Si es la primera 
          vez que ingresa y si sus datos ya fueron registrados en el sistema de 
          CarreraPGR, entonces usted ya tiene un usuario y password asignados. 
          Solo digite los primeros 10 caracteres de su Registro Federal de Causantes 
          en el campo de usuario y en el campo de contraseña y oprima el bot&oacute;n 
          de &quot;Enviar&quot;. 
          </marquee>
        </p>--></td>
<td></td>
</tr>
</table>
</form>
   <SCRIPT>
function valida()
{
 //-----------------------------------
  if (document.in_passsw.txtUsuario.value == '')
       {
	   alert ("El campo: Usuario, no puede enviarse vacio, verifique por favor")
	   return;
	   }
 //------------------------------------
 if (document.in_passsw.txtContrasena.value == '')
      {
	  alert("El campo: Contraseña, no puede enviarse vacio, verifique por favor")
	  return;
	  }
//-----------------------------------
   document.in_passsw.submit();
   }
</SCRIPT>
</body>
</html>
