<!-- Include File = "../Session/ActiveSession.inc" -->
<!-- Include File = "../Seguridad/Perfil.inc" -->
<html>
 
<head><title>Definición de Perfiles</title></head>
<link href="../Estilo.css" rel="stylesheet" type="text/css">
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
 
 <BR>
 <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Asignaci&oacute;n de permisos para la <br> creaci&oacute;n de  perfiles de acceso</FONT>
    </H2>
 </CENTER><BR>
  <FORM action="Grabar_Perfiles.asp" method="post" name="perfiles">
 
 <table width="784" border="1" align="center" class="SL">
 <tr>
     <th width="209" scope="col"><div align="center" class="cmd">Nombre del Perfil : </div></th>
     <th width="168" scope="col"><Input type="text" name="NombrePerfil" ></th>
     <th width="97" scope="col"><div align="center" class="cmd">Descripci&oacute;n del Perfil : </div></th>
     <th colspan="2" scope="col"><TEXTAREA NAME='DesPerfil' SIZE=8 ROWS=5 COLS=40></TEXTAREA></th>
     
<td width="0"></th>   </tr>
   <tr>
     <th width="209" class="cmd" scope="col" align="right">PERMISOS DE: </th>
     <th width="168" class="cmd" scope="col">Consultas</th>
     <th width="97" class="cmd" scope="col">Altas</th>
     <th width="153" class="cmd" scope="col">Modificaciones</th>
     <th width="117" class="cmd" scope="col">Eliminar</th>
   </tr>
     
  <tr>
     <th scope="col"><div align="center" class="cmd">MENÚ: PERSONAS</div></th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Altas</div></th>
     <td><div align="center"></div></td>
     <td><div align="center">
       <input type="checkbox" name="986" value="986">
     </div></td>
     <td><div align="center"></div></td>
     <td class="cmd"><div align="center">
      <!-- <input type="checkbox" name="checkbox" value="checkbox" disabled>-->
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Busquedas por RFC/NOMBRE </div></th>
     <td><div align="center">
       <input type="checkbox" name="987" value="987">
     </div></td>
     <td><div align="center"></div></td>
     <td><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
   <!-- -------------------------------------------------------------------------------->
    <tr>
     <th scope="col"><div align="center" class="cmd">MENÚ: DATOS GENERALES </div></th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
     <th scope="col">&nbsp;</th>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Datos Personales </div></th>
     <td><div align="center">
       <input type="checkbox" name="544" value="544">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="817" value="817">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="834" value="834">
     </div></td>
     <td class="cmd"><div align="center">
      <!-- <input type="checkbox" name="checkbox" value="checkbox" disabled>-->
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Media Filiaci&oacute;n </div></th>
     <td><div align="center">
       <input type="checkbox" name="545" value="545">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="801" value="801">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="818" value="818">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Historial Acad&eacute;mico</div></th>
     <td><div align="center">
       <input type="checkbox" name="546" value="546">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="802" value="802">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="819" value="819">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Referencias</div></th>
     <td><div align="center">
       <input type="checkbox" name="547" value="547">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="803" value="803">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="820" value="820">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Historial Laboral No Institucional </div></th>
     <td><div align="center">
       <input type="checkbox" name="548" value="548">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="804" value="804">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="821" value="821">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Idiomas</div></th>
     <td><div align="center">
       <input type="checkbox" name="549" value="549">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="805" value="805">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="822" value="822">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Domicilios</div></th>
     <td><div align="center">
       <input type="checkbox" name="710" value="710">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="711" value="711">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="712" value="712">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
    <tr>
     <th scope="row"><div align="center" class="cmd">MENÚ: TRAYECTORIA PGR </div></th>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Nombramientos</div></th>
     <td><div align="center">
       <input type="checkbox" name="550" value="550">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="806" value="806">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="823" value="823">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Situaci&oacute;n Laboral </div></th>
     <td><div align="center">
       <input type="checkbox" name="551" value="551">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="807" value="807">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="824" value="824">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Adscripciones</div></th>
     <td><div align="center">
       <input type="checkbox" name="552" value="552">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="808" value="808">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="825" value="825">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Procedimientos</div></th>
     <td><div align="center">
       <input type="checkbox" name="553" value="553">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="809" value="809">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="826" value="826">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Evaluaciones</div></th>
     <td><div align="center">
       <input type="checkbox" name="554" value="554">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="810" value="810">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="827" value="827">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Armas de fuego</div></th>
     <td><div align="center">
       <input type="checkbox" name="555" value="555">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="811" value="811">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="828" value="828">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Portaci&oacute;n Armas de fuego </div></th>
     <td><div align="center">
       <input type="checkbox" name="798" value="798">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="799" value="799">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="780" value="780">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Est&iacute;mulos y Reconocimientos </div></th>
     <td><div align="center">
       <input type="checkbox" name="557" value="557">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="813" value="813">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="830" value="830">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Formaci&oacute;n Inicial </div></th>
     <td><div align="center">
       <input type="checkbox" name="558" value="558">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="814" value="814">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="831" value="831">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="center" class="cmd"> MENÚ: CAPACITACI&Oacute;N</div></th>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Profesionalizaci&oacute;n</div></th>
     <td><div align="center">
       <input type="checkbox" name="556" value="556">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="812" value="812">
     </div></td>
     <td><div align="center">
       <input type="checkbox" name="829" value="829">
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr class="cmd">
     <th scope="row"><div align="center" class="cmd">MENÚ: CATALOGOS</div></th>
     <td  ><div align="center"></div></td>
     <td ><div align="center"></div></td>
     <td ><div align="center"></div></td>
     <td ><div align="center"></div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">TODOS  los catalogos </div></th>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
       <input type="checkbox" name="todos" value="9999">
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
    <tr class="cmd">
     <th scope="row"><div align="center" class="cmd">MEN&Uacute;: Administración <BR> del Sistema</div></th>
     <td ><div align="center"></div></td>
     <td ><div align="center"></div></td>
     <td ><div align="center"></div></td>
     <td ><div align="center"></div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">Definición de Perfiles</div></th>
     <td class="cmd"><div align="center"></div></td>
     <td  ><div align="center">
       <input type="checkbox" name="983" value="983">
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">Altas de Cuentas de Usuario</div></th>
     <td class="cmd"><div align="center"></div></td>
     <td ><div align="center">
       <input type="checkbox" name="984" value="984">
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">Consulta de la Bitacora</div></th>
     <td><div align="center">
       <input type="checkbox" name="985" value="985">
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
 </table>
 
 <BR>
 <div align="center">   
 
 <INPUT type="reset" value="LIMPIAR OPCIONES"> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <INPUT type="submit" value="GENERAR PERFIL" Onclick ="return ValidaCampos()">
 </div>

</FORM>
 </body>
</html>

<script Language="JavaScript"> 
function ValidaCampos()
{
  
  if (perfiles.NombrePerfil.value == "" ) 
  {
       alert("El nombre del perfil no debe de ir vacio, verifique por favor.  ");
       return false;
  }
  
  }
</script> 
