<%'On Error Resume Next
'response.write "1"
    v_ODBC  = SESSION("ODBC")
    IdUSR = SESSION("IdLogin")
    mper = request.QueryString("Id_CARdDatosPersonales")

SQL =       " SELECT CARdDatosPersonales.ApellidoPaterno, CARdDatosPersonales.RFC, "
SQL = SQL + "        CARdDatosPersonales.ApellidoMaterno, CARdDatosPersonales.Nombre, CARdDatosPersonales.Id_CARcEntidadFederativa, "
SQL = SQL + "        CARdDatosPersonales.Foto, CARcEstatusLaboral.CARcEstatusLaboral, CARdSituacionLaboral.FechaoficioDocto,CARdDatosPersonales.Id_CARdDatosPersonales"
SQL = SQL + " FROM   CARdDatosPersonales LEFT JOIN"
SQL = SQL + "        CARdSituacionLaboral ON CARdDatosPersonales.Id_CARdDatosPersonales = CARdSituacionLaboral.Id_CARdDatosPersonales left JOIN"
SQL = SQL + "        CARcEstatusLaboral ON CARdSituacionLaboral.Id_CARcEstatusLaboral = CARcEstatusLaboral.Id_CARcEstatusLaboral"
SQL = SQL + " WHERE CARdDatosPersonales.Id_CARdDatosPersonales="+CSTR(MPer)
SQL = SQL + " order by RFC, FechaoficioDocto DESC"

SQL_Nom =  "  SELECT     CARdDatosPersonales.Id_CARdDatosPersonales, CARcTipoNombramiento.CARcTipoNombramiento," 
SQL_Nom =  SQL_Nom +  "  CARdNombramientos.Fecha_nombramiento, CARcCategoria.CARcCategoria, CARcEspecialidad.CARcEspecialidad, CARcNivel.CARcNivel"
SQL_Nom =  SQL_Nom +  "  FROM         CARcNivel RIGHT OUTER JOIN"
SQL_Nom =  SQL_Nom +  "  CARdNombramientos ON CARcNivel.Id_CARcNivel = CARdNombramientos.Id_CARcNivel LEFT OUTER JOIN"
SQL_Nom =  SQL_Nom +  "  CARcEspecialidad ON CARdNombramientos.Id_CARcEspecialidad = CARcEspecialidad.Id_CARcEspecialidad LEFT OUTER JOIN"
SQL_Nom =  SQL_Nom +  "  CARcCategoria ON CARdNombramientos.Id_CARcCategoria = CARcCategoria.Id_CARcCategoria RIGHT OUTER JOIN"
SQL_Nom =  SQL_Nom +  "  CARdDatosPersonales ON "
SQL_Nom =  SQL_Nom +  "  CARdNombramientos.Id_CARdDatosPersonales = CARdDatosPersonales.Id_CARdDatosPersonales LEFT OUTER JOIN"
SQL_Nom =  SQL_Nom +  "  CARcTipoNombramiento ON "
SQL_Nom =  SQL_Nom +  "  CARdNombramientos.Id_CARcTipoNombramiento = CARcTipoNombramiento.Id_CARcTipoNombramiento"
SQL_NOM =  SQL_NOM +  "   WHERE CARdDatosPersonales.Id_CARdDatosPersonales="+CSTR(MPer)
SQL_Nom =  SQL_Nom +  " order BY Fecha_nombramiento DESC"


SQL_Ads =  " SELECT   CARdDatosPersonales.Id_CARdDatosPersonales, CARdAdscripciones.FechaAdscripcion, CARcAdscripciones.CARcAdscripciones_corta"
SQL_Ads = SQL_Ads + " FROM     CARdDatosPersonales left JOIN"
SQL_Ads = SQL_Ads + "   CARdAdscripciones ON CARdDatosPersonales.Id_CARdDatosPersonales = CARdAdscripciones.Id_CARdDatosPersonales LEFT JOIN"
SQL_Ads = SQL_Ads + "  CARcAdscripciones ON CARdAdscripciones.Id_CARcAdscripciones = CARcAdscripciones.Id_CARcAdscripciones "
SQL_Ads = SQL_ADs + "   WHERE CARdDatosPersonales.Id_CARdDatosPersonales="+CSTR(MPer)
SQL_Ads = SQL_Ads + " order by FechaAdscripcion DESC"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->

<script language="javascript">
function detalle( url ) {
  web = url
  alto = 450
  ancho = 500
  izq = 20
  arr = 15
  Win = window.open(web, "mainFrame4", "scrollbars=no, width=" + ancho + ",height=" + alto + ", top=" + arr + ",left=" + izq)

}</script>

  <% 'Con esto recupero solo el Id_PSGdMovimientos
  
     Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
     SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     SET Ob_ADS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     SET Ob_NOM  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
     SET Ob_VAL  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
'     Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")
      Ob_Conn.Provider="sqloledb"
     IP_Servidor = session("IP_Servidor")
'     Ob_Conn.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")
    Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

	  
	 	  Ob_RS.Open SQL, ob_conn  	   
'		  RESPONSE.WRITE SQL
'		  RESPONSE.END	   
	 	  Ob_NOM.Open SQL_NOM, ob_conn  
'		  RESPONSE.WRITE SQL_NOM
'		  RESPONSE.END	   
	 	  Ob_ADS.Open SQL_ADS, ob_conn  	   

%>
<html><head>
<style type="text/css">
<!--
.Estilo1 {
	color: #FFFFFF;
	font-weight: bold;
}
.Estilo3 {color: #FFFFFF}
-->
</style>
<body background="softgri1.jpg" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<link href="Estilo.css" rel="stylesheet" type="text/css">

<form action="" method="post" >
   

  <table border="1" cellspacing="1" width="99%" id="AutoNumber1"  class="SL">
    <tr>
      <td width="10%"  rowspan="4"  valign="top"><input border="2" src='https://<%= session("IP_SERVER")%>/FotosCarrera/Imagenes/<%= ob_RS("foto") %>' name="I1" width="90" height="100" type="image"></td>
      <td width="16%"  align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>NOMBRE:</strong></font></div></td>
      <td width="38%"  align="left"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= TRIM(Ob_RS ("ApellidoPaterno"))+" "+TRIM(Ob_RS("ApellidoMaterno"))+" "+TRIM(Ob_RS("Nombre"))  %></strong></font></td>
      <td width="9%"  align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>RFC:</strong></font></div></td>
      <td width="8%"  align="left"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= TRIM(Ob_RS("RFC"))  %></strong></font></td>
    </tr>
    <tr>
      <td background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>NOMBRAMIENTO:</strong></font></div></td>
      <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%= Ob_NOM ("CARcTipoNombramiento") +" : "+Ob_NOM ("CARcCategoria") +" : "+Ob_NOM ("CARcNivel")%></b></font></td>
    </tr>
	    <tr>
      <td  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>ADSCRIPCIÓN ACTUAL:</strong></font></div></td>
      <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%= Ob_Ads("CARcAdscripciones_corta") %></b></font></td>
    </tr>
    <tr>
      <td height="34"  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>ESTATUS:</strong></font></div></td>
      <td align="left" colspan="3"><font size="1" color="#48ADBF" face="Verdana, Arial, Helvetica, sans-serif"><b><%= Ob_RS ("CARcEstatusLaboral")  %></b></font></td>
    </tr>
    <!--<tr>
      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
      <td  align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;???</b></font></td>
    </tr>
    <tr>-->
	 <tr>
    <td  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="center"  class="Estilo3"><a target="mainFrame4" href="https://<%= session("IP_SERVER")%>/carrerapgr/Multimedia/huellas/h1.gif"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF"><!--Huellas--></font></a> </div></td>
      <td  align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;&nbsp;???</b></font></td>
    </tr>
    <tr>
      <td  align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="center"><a target="mainFrame4" href="https://<%= session("IP_SERVER")%>/carrerapgr/PRINCIPAL.ASP?lnkInd=<%=OB_RS("Id_CARdDatosPersonales")%>&lnkNACIMIENTO=<%= Ob_RS("Id_CARcEntidadFederativa")%>');"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF"><!--Ubicación Geográfica--></font></a></div></td>
      <!--td height="5" align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="left"><a target="mainFrame4" href="#" onClick="detalle('PRINCIPAL.ASP?lnkInd=<%=OB_RS("Id_CARdDatosPersonales")%>&lnkNACIMIENTO=<%= Ob_RS("Id_CARcEntidadFederativa")%>');" style="text-decoration: none" class="link1"> <img border="0"   align="left" width="16" height="12" valign="BOTTOM" style="position: absolute; top: 5; left: 2" > <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF">Ubicación Geográfica</font></a></td-->
      <td align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;???</b></font></td>
    </tr>
	 <tr>
    <td  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="center"><a target="mainFrame4" href="https://<%= session("IP_SERVER")%>/carrerapgr/Multimedia/voz/v1.wav"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF"><!--Voz--></font></a></div></td>
      <td align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;&nbsp;???</b></font></td>
  </tr>
  </table>
<INPUT TYPE="Hidden" id=IDPER NAME='idPersona' Value = <%request("Id_CARdDatosPersonales")%> >
</form>
</body>
 </html>
 <!-- #INCLUDE File="errores.inc" -->
 <%
 	 OB_RS.CLOSE
	 OB_NOM.CLOSE
	 OB_ADS.CLOSE

 FUNCTION PantallaValida(Pantalla)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(IdUSR)+ " AND CARcPaginas like '%"+Pantalla+"%'"
'   response.write SQL
'   response.end
   Ob_VAL.OPEN consulta, Ob_Conn,2, 3, 1
     IF NOT OB_VAL.EOF THEN 
        PANTALLAValida = TRUE
	 ELSE
        PANTALLAValida = FALSE
	 END IF	 
	 OB_VAL.CLOSE

 END FUNCTION
 %>