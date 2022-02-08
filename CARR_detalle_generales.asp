<%'On Error Resume Next

'*** Fin de sesión ***
If Session("FlagConn") = "" or isNull(Session("FlagConn")) or Cint(Session("FlagConn") = 0) Then
	response.write "Finalizó la Sesión"
End If
'*** Fin de Sesión ***

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
'RESPONSE.WRITE (SQL)
'response.write "<br>"

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
SQL_Nom =  SQL_Nom +  " order BY CARdNombramientos.Id_CARcSINO"
''response.write SQL_Nom
'response.write "<br>"

'SQL_Ads =  " SELECT   CARdDatosPersonales.Id_CARdDatosPersonales, CARdAdscripciones.FechaAdscripcion, CARcAdscripciones.CARcAdscripciones_corta"
'SQL_Ads = SQL_Ads + " FROM     CARdDatosPersonales left JOIN"
'SQL_Ads = SQL_Ads + "   CARdAdscripciones ON CARdDatosPersonales.Id_CARdDatosPersonales = CARdAdscripciones.Id_CARdDatosPersonales LEFT JOIN"
'SQL_Ads = SQL_Ads + "  CARcAdscripciones ON CARdAdscripciones.Id_CARcAdscripciones = CARcAdscripciones.Id_CARcAdscripciones "
'SQL_Ads = SQL_ADs + "   WHERE CARdDatosPersonales.Id_CARdDatosPersonales="+CSTR(MPer)
'SQL_Ads = SQL_Ads + " order by FechaAdscripcion DESC"


SQL_Ads = "SELECT CARcSubprocuradurias, CARcDG_o_Delegaciones,CARcDelDescripcion FROM VISTA_ADSCRIPCIONES_P_DETALLE " & _
                        " WHERE Id_CARdDatosPersonales = " & CSTR(MPer)
						
SQL_SegADS="SELECT * FROM VISTA_ADSCRIPCIONES " & _
                        " WHERE Id_CARdDatosPersonales = "& CSTR(MPer)

'jviresponse.write						SQL_Ads
'jviresponse.end 
'response.write SQL_Ads
'response.write "<br>"

  
SAL_STUATUSSS = "SELECT * FROM VISTA_SITUACIONLABORAL_ACTUAL WHERE Id_CARdDatosPersonales =  " & CSTR(MPer) & _
                " AND Id_CARcActual = 1"

'response.write SAL_STUATUSSS
'response.write "<br>"
'response.end



	

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
	 SET Ob_STATUS = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 SET BITACORA = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	 SET Ob_SegADS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
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
		  Ob_SegADS.Open SQL_SegADS, ob_conn  
		  Ob_STATUS.Open SAL_STUATUSSS, ob_conn	   

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
   

  <table border="01" cellspacing="1" width="100%" id="AutoNumber1"  class="SL">
    <tr>
      <td width="12%"  rowspan="4"  valign="top" align="center"><input border="2" src='https://<%= session("IP_SERVER")%>/FotosCarrera/Imagenes/<%= ob_RS("foto") %>' name="I1" width="90" height="95" type="image"></td>
      <td width="16%"  align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">NOMBRE:</font></div></td>
      <td width="49%"  align="left"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= TRIM(Ob_RS ("ApellidoPaterno"))+" "+TRIM(Ob_RS("ApellidoMaterno"))+" "+TRIM(Ob_RS("Nombre"))  %></strong></font></td>
      <td width="6%"  align="left" background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">RFC:</font></div></td>
      <td width="17%"  align="left"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= TRIM(Ob_RS("RFC"))  %></strong></font></td>
    </tr>
    <tr>
      <td background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">NOMBRAMIENTO:</font></div></td>
      <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b>
	  <% 
	  CARcCategoria_1 = TRIM(Ob_NOM ("CARcCategoria"))
	  
	  CARcNivel_1  = TRIM(Ob_NOM ("CARcNivel")) 
	 ' RESPONSE.WRITE CARcNivel_1
'	  RESPONSE.END 
	  
	    IF CARcCategoria_1 = "SELECIONAR" OR CARcCategoria_1 = "SELECCIONAR"  THEN 
         CARcCategoria_1 = ""
		ELSE 
		 CARcCategoria_1 = " : "+Ob_NOM ("CARcCategoria")
		END IF 
		
		
		IF CARcNivel_1 = "SELECCIONAR" OR CARcNivel_1 = "SELECIONAR"  THEN 
         CARcNivel_1 = ""
		ELSE 
		 CARcNivel_1  = " : "+Ob_NOM ("CARcNivel")
		END IF 
	  
	  %>
	  <%= Ob_NOM ("CARcTipoNombramiento") +CARcCategoria_1 +CARcNivel_1%>
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  </b></font></td>
    </tr>
	    <tr>
      <td  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">ADSCRIPCIÓN ACTUAL:</font></div></td>
       <% if RTRIM(Ob_Ads("CARcDelDescripcion"))="1" then %>
	      <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%= "Formación Inicial" %><BR><%=Ob_Ads("CARcDG_o_Delegaciones")%></b></td>
 
 	 <% else  %>
       <!--td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%'= Ob_Ads("Adscripcion") ><BR><%= Ob_Ads("CARcDG_o_Delegaciones") %></b></font></td-->
	      <% if Ob_SegAds.eof then %>
    	      <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%= "No se ha capturado la adscripción para esta persona" %><BR><%=Ob_Ads("CARcDG_o_Delegaciones")%></b></td>
			<%else%>
		  	  <td  align="left" colspan="3"><font color="#48ADBF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b><%= Ob_SegAds("Adscripcion") %><BR><%= Ob_Ads("CARcDG_o_Delegaciones") %></b></font></td>
		   <% end if%>
	 <% end if%>

    </tr>
    <tr>
      <td height="21"  background="Multimedia/imagenes/menus/menu_izquierdo.jpg"><div align="LEFT" class="Estilo3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">ESTATUS:</font></div></td>
      <td align="left" colspan="3"><font size="1" color="#48ADBF" face="Verdana, Arial, Helvetica, sans-serif"><b><%If Ob_STATUS.Eof Then response.write "Sin datos" Else response.write Ob_STATUS ("CARcEstatusLaboral") End If%></b></font></td>
    </tr>
    <!--<tr>
      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
      <td  align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;???</b></font></td>
    </tr>
    <tr>-->
	<!-- <tr>
    <td  ></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
    </tr>
	 <tr>
    <td></td>
      <td></td>
  </tr>-->
  </table>
<INPUT TYPE="Hidden" id=IDPER NAME='idPersona' Value = <%request("Id_CARdDatosPersonales")%> >
</form>
</body>
 </html>
 <!-- #INCLUDE File="errores.inc" -->
 <%
   RRFFCC = TRIM(Ob_RS("RFC"))
 	 OB_RS.CLOSE
	 OB_NOM.CLOSE
	 OB_ADS.CLOSE
	 OB_SegADS.CLOSE





    Id_Login    		= Session("IdLogin") 
	IP          		= request.servervariables("remote_addr")
	FECHA       		= NOW
    DIA         		= TRIM(DAY(FECHA))
    MES         		= TRIM(MONTH(FECHA))
    ANIO        		= TRIM(YEAR(FECHA))
    FECHA_BIEN  		= TRIM(DIA&"/"&MES&"/"&ANIO)
    OPERACION   		= "CONSULTA"
    TABLA_CONSULTADA    = "CARdDatosPersonales"
    Id_Utilizado        = CSTR(MPer)
    RFC                 = RRFFCC
  
  

  SQUELE_BITACORA = "INSERT CARdRastreo_bit ( IdLogin,      IP_user, Fecha,          Operacion,    TablaUtilizada,        IdUtilizado,      RFC ) " & _
                    "VALUES                 ("&Id_Login &", '"&IP&"', '"&FECHA_BIEN&"', '"&OPERACION&"', '"&TABLA_CONSULTADA&"', "&Id_Utilizado&", '"&RFC&"')"      

   BITACORA.OPEN SQUELE_BITACORA, Ob_Conn,2, 3, 1
   'BITACORA.CLOSE
   'RESPONSE.WRITE SQUELE_BITACORA


















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