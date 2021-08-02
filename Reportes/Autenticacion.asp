<html><head><title>Usuario y contraseña</title></head>

<form action="Verifica.asp" method="post" name="Autenticacion">  

<body background = "softgri1.jpg"><center>

<% 											      
  vl_id_curso_seleccionado = REQUEST.QUERYSTRING("vp_id_curso_seleccionado")
  vl_curso_seleccionado = REQUEST.QUERYSTRING("vp_curso_seleccionado")
  vl_curso_fecha_inicio = REQUEST.QUERYSTRING("vp_curso_fecha_inicio")
  vl_curso_fecha_fin = REQUEST.QUERYSTRING("vp_curso_fecha_fin")
  vl_curso_sede = REQUEST.QUERYSTRING("vp_curso_sede")
  vl_curso_horario = REQUEST.QUERYSTRING("vp_curso_horario")    
%>

<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<br><br><br>
<table border="1" >
<tr >
 <td><Center><strong><font color="#3CA0BD" size="3">Digite usuario, contraseña y la opci&oacute;n deseada</font></strong>
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
<td><center><input type="text" name="txtUsuario" maxlength="30" size="30"></center> </td>
<td><center><input type="password" name="txtContrasena" maxlength="30" size="30"></center> </td>
</table>

<br><br>
</center>

<center>
  <table width="75%" border="1">
    <tr>
      <td width="20%" bgcolor="#3CA0BD"><input type=radio name=radiobutton value="radiobutton1" checked=checked> Registrar solicitud </td>
      <td width="80%"> <strong>Registrar su solicitud</strong> 
        al curso de <strong> <font color="#0033CC"> <%= vl_curso_seleccionado%> </font> </strong> que se impartira del <strong> <font color="#0033CC"> <%= vl_curso_fecha_inicio%> </font> </strong> al <strong> <font color="#0033CC"> <%= vl_curso_fecha_fin%> </font> </strong> en la sede <strong> <font color="#0033CC"> <%= vl_curso_sede%> </font> </strong> con un horario 
        de<strong> <font color="#0033CC"> <%= vl_curso_horario%> </font> </strong></td>
    </tr>

<!---    <tr>
      <td bgcolor="#3CA0BD"><input type=radio name=radiobutton value="radiobutton2"> Consultar </td>
      <td>Seleccione esta opci&oacute;n si lo que desea es <strong>consultar</strong> 
        los cursos que ha solicitado inscripcion y el estatus de los mismos</td>
    </tr>
--->
    
  </table>
</center>
<br><br>
<center>
<table border="1">

<INPUT TYPE="Hidden" NAME=hdnId_curso_seleccionado Value = <%= vl_id_curso_seleccionado%> >
<INPUT TYPE="Hidden" NAME=hdnCurso_seleccionado Value = <%= vl_curso_seleccionado%> >

<tr>
<td><center><input type="reset" name="btnlimpiar" value="L i m p i a r"></center></td>
<td><center><input type="submit" name="btnEnviar" value="E n v i a r"></center></td>
</tr>
</table>
</center>
</body>
</form> 

</html>