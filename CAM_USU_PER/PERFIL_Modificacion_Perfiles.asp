<!-- Include File = "../Session/ActiveSession.inc" -->
<!-- Include File = "../Seguridad/Perfil.inc" -->
<html>
 
<head><title>Definición de Perfiles</title></head>
<link href="../Estilo.css" rel="stylesheet" type="text/css">
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
 
 <BR>
 <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Modificaci&oacute;n de permisos para la <br>
      creaci&oacute;n de  perfiles de acceso</FONT>
   </H2>
 </CENTER><BR>
  <FORM action="PERFIL_UPDATESdePerfiles.asp" method="post" name="perfiles">
  <!--  ============================================================================  -->                           
  
  <%' DES_ESP  = 1 quiere decir que solo se mostraran los registros de Personal Sustantivo
	    ' Activos = 1 Son los perfiles que se van a mostrar 
	Id_CARcPerfilGrupo =	REQUEST.QUERYSTRING("Id_CARcPerfilGrupo")
	
	
    
	SET INSTANCIA_CONEXXXION      = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET INSTANCIA_RECORD_1        = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    INSTANCIA_CONEXXXION.PROVIDER = "sqloledb"
    INSTANCIA_CONEXXXION.OPEN     = "SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
	  CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = " & Id_CARcPerfilGrupo
	   %>
          
          <% INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION %>
<% ''''   <>{{{{}}}}}}*>   response.write       CKUEL		  %>
<% Id_CARcPantallas = INSTANCIA_RECORD_1("Id_CARcPantallas")  %>
  <!--  ============================================================================  -->                           
 
 <table width="784" border="1" align="center" class="SL">
 
	 <INPUT TYPE="HIDDEN" NAME="Id_CARcPerfilGrupo" VALUE="<%= Id_CARcPerfilGrupo %>">
	 	 <INPUT TYPE="HIDDEN" NAME="Id_CARcPantallas" VALUE="<%= Id_CARcPantallas %>">
 <tr>
     <th width="187" scope="col"><div align="center" class="cmd">Nombre del Perfil : </div></th>
     <th width="168" scope="col"><Input type="text" readonly="true" name="NombrePerfil" value="<%= INSTANCIA_RECORD_1("CARcPerfilGrupo")%>"></th>
     <th width="141" scope="col"><div align="center" class="cmd">Descripci&oacute;n del Perfil : </div></th>
     <th colspan="2" scope="col"> <Input type="text" readonly="true" size="40" name="DesPerfil" value="<%= INSTANCIA_RECORD_1("CarcDescripcion")%>"></th>
 <% INSTANCIA_RECORD_1.CLOSE %>    
<td width="5"></th> 
 </tr>
   <tr>
     <th width="187" class="cmd" scope="col" align="right">PERMISOS DE: </th>
     <th width="168" class="cmd" scope="col">Consultas</th>
     <th width="141" class="cmd" scope="col">Altas</th>
     <th width="97" class="cmd" scope="col">Modificaciones</th>
     <th width="146" class="cmd" scope="col">Eliminar</th>
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
	 <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 986 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="986" checked="checked" value="986" disabled="disabled">
	   
	   <!--<Input type="text" size="3" name="986" value="<%= INSTANCIA_RECORD_1("Id_CARcPaginas")%>">-->

	   <% ELSE %>
	   <input type="checkbox" name="986" value="986" disabled="disabled">

	    <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center"></div></td>
     <td class="cmd"><div align="center">
      <!-- <input type="checkbox" name="checkbox" value="checkbox" disabled>-->
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Búsquedas por RFC/NOMBRE </div></th>
     <td><div align="center">
	<% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 987 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
	  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="987" checked="checked" value="987">
	   
	   
<!--	    <Input type="text" size="3" name="987" value="<%= INSTANCIA_RECORD_1("Id_CARcPaginas")%>">
-->	   <% ELSE %>
	    <input type="checkbox" name="987" value="987">

	   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
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
	 <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 544 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="544" checked="checked" value="544">
	     <!-- <Input type="text" size="3" name="544" value="<%= INSTANCIA_RECORD_1("Id_CARcPaginas")%>">-->
		   <% ELSE %>
		     <input type="checkbox" name="544" value="544">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 817 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="817" checked="checked" value="817">
		   <% ELSE %>
		     <input type="checkbox" name="817" value="817">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 834 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="834" checked="checked" value="834">
		   <% ELSE %>
		     <input type="checkbox" name="834" value="834">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
      <!-- <input type="checkbox" name="checkbox" value="checkbox" disabled>-->
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Media Filiaci&oacute;n </div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 545 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="545" checked="checked" value="545">
		   <% ELSE %>
		     <input type="checkbox" name="545" value="545">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 801 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="801" checked="checked" value="801">
		   <% ELSE %>
		     <input type="checkbox" name="801" value="801">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 818 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="818" checked="checked" value="818">
		   <% ELSE %>
		     <input type="checkbox" name="818" value="818">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Historial Acad&eacute;mico</div></th>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 546 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="546" checked="checked" value="546">
		   <% ELSE %>
		     <input type="checkbox" name="546" value="546">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 802 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="802" checked="checked" value="802">
		   <% ELSE %>
		     <input type="checkbox" name="802" value="802">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 819 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="819" checked="checked" value="819">
		   <% ELSE %>
		     <input type="checkbox" name="819" value="819">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Referencias</div></th>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 547 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="547" checked="checked" value="547">
		   <% ELSE %>
		     <input type="checkbox" name="547" value="547">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 803 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="803" checked="checked" value="803">
		   <% ELSE %>
		     <input type="checkbox" name="803" value="803">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 820"
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="820" checked="checked" value="820">
		   <% ELSE %>
		     <input type="checkbox" name="820" value="820">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Historial Laboral No Institucional </div></th>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 548 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="548" checked="checked" value="548">
		   <% ELSE %>
		     <input type="checkbox" name="548" value="548">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 804 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="804" checked="checked" value="804">
		   <% ELSE %>
		     <input type="checkbox" name="804" value="804">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 821 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="821" checked="checked" value="821">
		   <% ELSE %>
		     <input type="checkbox" name="821" value="821">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Idiomas</div></th>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 549 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="549" checked="checked" value="549">
		   <% ELSE %>
		     <input type="checkbox" name="549" value="549">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 805 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="805" checked="checked" value="805">
		   <% ELSE %>
		     <input type="checkbox" name="805" value="805">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 822 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="822" checked="checked" value="822">
		   <% ELSE %>
		     <input type="checkbox" name="822" value="822">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Domicilios</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 710 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="710" checked="checked" value="710">
		   <% ELSE %>
		     <input type="checkbox" name="710" value="710">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 711 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="711" checked="checked" value="711">
		   <% ELSE %>
		     <input type="checkbox" name="711" value="711">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 712 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="712" checked="checked" value="712">
		   <% ELSE %>
		     <input type="checkbox" name="712" value="712">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
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
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 550 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="550" checked="checked" value="550">
		   <% ELSE %>
		     <input type="checkbox" name="550" value="550">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 806 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="806" checked="checked" value="806">
		   <% ELSE %>
		     <input type="checkbox" name="806" value="806">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 823 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="823" checked="checked" value="823">
		   <% ELSE %>
		     <input type="checkbox" name="823" value="823">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Situaci&oacute;n Laboral </div></th>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 551 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="551" checked="checked" value="551">
		   <% ELSE %>
		     <input type="checkbox" name="551" value="551">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 807 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="807" checked="checked" value="807">
		   <% ELSE %>
		     <input type="checkbox" name="807" value="807">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 824"
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="824" checked="checked" value="824">
		   <% ELSE %>
		     <input type="checkbox" name="824" value="824">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Adscripciones</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 552 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="552" checked="checked" value="552">
		   <% ELSE %>
		     <input type="checkbox" name="552" value="552">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
    <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 808 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="808" checked="checked" value="808">
		   <% ELSE %>
		     <input type="checkbox" name="808" value="808">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 825 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="825" checked="checked" value="825">
		   <% ELSE %>
		     <input type="checkbox" name="825" value="825">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Procedimientos</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 553 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="553" checked="checked" value="553">
		   <% ELSE %>
		     <input type="checkbox" name="553" value="553">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 809 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="809" checked="checked" value="809">
		   <% ELSE %>
		     <input type="checkbox" name="809" value="809">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 826 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="826" checked="checked" value="826">
		   <% ELSE %>
		     <input type="checkbox" name="826" value="826">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Evaluaciones</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 554 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="554" checked="checked" value="554">
		   <% ELSE %>
		     <input type="checkbox" name="554" value="554">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 810 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="810" checked="checked" value="810">
		   <% ELSE %>
		     <input type="checkbox" name="810" value="810">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 827 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="827" checked="checked" value="827">
		   <% ELSE %>
		     <input type="checkbox" name="827" value="827">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Armas de fuego</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 555 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="555" checked="checked" value="555">
		   <% ELSE %>
		     <input type="checkbox" name="555" value="555">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 811 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="811" checked="checked" value="811">
		   <% ELSE %>
		     <input type="checkbox" name="811" value="811">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 828 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="828" checked="checked" value="828">
		   <% ELSE %>
		     <input type="checkbox" name="828" value="828">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Portaci&oacute;n Armas de fuego </div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 798 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="798" checked="checked" value="798">
		   <% ELSE %>
		     <input type="checkbox" name="798" value="798">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 799 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="799" checked="checked" value="799">
		   <% ELSE %>
		     <input type="checkbox" name="799" value="799">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 780 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="780" checked="checked" value="780">
		   <% ELSE %>
		     <input type="checkbox" name="780" value="780">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Est&iacute;mulos y Reconocimientos </div></th>
     <td><div align="center">
     <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 557 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="557" checked="checked" value="557">
		   <% ELSE %>
		     <input type="checkbox" name="557" value="557">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 813 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="813" checked="checked" value="813">
		   <% ELSE %>
		     <input type="checkbox" name="813" value="813">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 830 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="830" checked="checked" value="830">
		   <% ELSE %>
		     <input type="checkbox" name="830" value="830">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr>
     <th scope="row"><div align="left" class="cmd">Formaci&oacute;n Inicial </div></th>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 558 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="558" checked="checked" value="558">
		   <% ELSE %>
		     <input type="checkbox" name="558" value="558">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 814 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="814" checked="checked" value="814">
		   <% ELSE %>
		     <input type="checkbox" name="814" value="814">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 831 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="831" checked="checked" value="831">
		   <% ELSE %>
		     <input type="checkbox" name="831" value="831">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
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
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 556"
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="556" checked="checked" value="556">
		   <% ELSE %>
		     <input type="checkbox" name="556" value="556">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 812 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="812" checked="checked" value="812">
		   <% ELSE %>
		     <input type="checkbox" name="812" value="812">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td><div align="center">
      <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 829 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="829" checked="checked" value="829">
		   <% ELSE %>
		     <input type="checkbox" name="829" value="829">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <!--<tr class="cmd">
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
   </tr>-->
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
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 983 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="983" checked="checked" value="983">
		   <% ELSE %>
		     <input type="checkbox" name="983" value="983">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">Altas de Cuentas de Usuario</div></th>
     <td class="cmd"><div align="center"></div></td>
     <td ><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 984 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="984" checked="checked" value="984">
		   <% ELSE %>
		     <input type="checkbox" name="984" value="984">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
     </div></td>
     <td class="cmd"><div align="center"></div></td>
     <td class="cmd"><div align="center">
     </div></td>
   </tr>
   <tr >
     <th scope="row"><div align="left" class="cmd">Consulta de la Bit&aacute;cora</div></th>
     <td><div align="center">
       <% CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 985 "
	INSTANCIA_RECORD_1.OPEN CKUEL, INSTANCIA_CONEXXXION, 3, 1 
	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		  IF TotdeRegistros => 1 THEN %>
       <input type="checkbox" name="985" checked="checked" value="985">
		   <% ELSE %>
		     <input type="checkbox" name="985" value="985">
		   <%END IF
	   INSTANCIA_RECORD_1.CLOSE%>
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
 <INPUT type="submit" value="ACTUALIZAR PERFIL" Onclick ="return ValidaCampos()">
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
