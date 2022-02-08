<html><head><title>Inscripción</title>

</head><body background="softgri1.jpg">

<%
	a=request.form("radiobutton")
	response.write (a)
%>
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">

<form name="form2" method="post" action="">
<label>BIENVENIDO...</label>
<HR><BR><BR>

<table border="1">
  <tr>
    <td>Nombre</td>
    <td>Apellidos</td>
    <td>RFC</td>
    <td>AREA</td>
      <td>AUTORIZA</td>
  </tr>
  <tr>
    <td><input type="text" name="textfield" size="20"></td>
    <td><input type="text" name="textfield" size="20"></td>
    <td><input type="text" name="textfield" size="20"></td>
    <td><input type="text" name="textfield" size="20"></td>
     <td> <select>
          <option selected>EDUARDO ENRIQUE GOMEZ</option>
          <option>ANTONIO PALACIOS</option>
          <option>JUAN MARTIN GONZALEZ</option>
        </select>
      </td>
  </tr>
</table>
<HR>
<table width="80%" border="1">
  <tr>
    <td>Curso</td>
    <td>Inicio</td>
    <td>Fin</td>
    <td>Instructor</td>
    <td>Sede</td>
   
  </tr>
  <tr>
    <td><input type="text" name="textfield2" size="20"></td>
    <td><input type="text" name="textfield3" size="20"></td>
    <td><input type="text" name="textfield4" size="20"></td>
    <td><input type="text" name="textfield5" size="20"></td>
    <td><input type="text" name="textfield6" size="20"></td>
   
  </tr>
</table>
<BR><BR>
<div align="center">
<table width="17%" border="1">
  <tr>
    <td width="55%"><center><input type="button" name="btnInscripcion" value="Inscribir" onclick="location.href='confirmacion_mail.asp'" ></center></td>
    <td width="45%"><center><input type="button" name="btncerrar" value ="Regresar" onclick="location.href='ConsultasFiltro_CAPdConvocatoria_2.asp'"></center></td>
  </tr>
</table></div>
 </form>
 
 
 </body>

</html>