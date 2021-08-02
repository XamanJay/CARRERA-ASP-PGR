<%
If  Session("FlagConn") = 0 Then
	'*** Directorio Virtual ***
	sVirtualDirectory = Request.ServerVariables("PATH_INFO")
	sVirtualDirectory = Mid(sVirtualDirectory,2,len(sVirtualDirectory))
	sVirtualDirectory = Mid(sVirtualDirectory,1,inStr(sVirtualDirectory,"/")-1)
        '***
	'*** Servidor ***
	sIPServer =  request.ServerVariables("https_HOST")
	'***
	url = "https://"& sIPServer &"/"& sVirtualDirectory &"/Error/ErrorAcceso.asp"
	response.redirect url
End if
'Dim dsn 			'*** DSN de la Base de Datos
'dsn = "SIIFP"

'Dim sScriptPage		'*** Pagina del Script (asp)
sScriptPage = Request.ServerVariables("PATH_INFO")
sScriptFile = Request.ServerVariables("PATH_TRANSLATED")

'*** Localizamos Página ***
'Dim nDiagonal		'*** Nombre de la página que estan accesando
nDiagonal = inStrRev(sScriptPage,"/")

'Dim sPage		'*** Página accesada
sPage = Mid(sScriptPage,nDiagonal + 1,len(sScriptPage))
'response.write sPage

'***

'*** Localizamos Carpeta ***
'Dim nDiagonal2		'*** Nombre de la carpeta donde se encuentra la página
nDiagonal2 = inStrRev(sScriptFile,"\")
sScriptFile = Mid(sScriptFile,1,nDiagonal2-1)
nDiagonal2 = inStrRev(sScriptFile,"\")

'Dim sFile		'*** Carpeta accesada
sFile = Mid(sScriptFile,nDiagonal2 + 1,len(sScriptFile))
'response.write ">>>>>>"+ sFile

'***

Set Ob_Conn = Server.CreateObject("ADODB.Connection")
Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
'Ob_Conn.Open dsn

Ob_Conn.PROVIDER="sqloledb"
Ob_Conn.OPEN="Server="+  session("IP_DATOS") +";DATABASE="+SESSION("ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

sSql = "select "
sSql = sSql & "usr.Id_CARcUSR, "
sSql = sSql & "usr.CARcUSR, "
sSql = sSql & "p.CARcPaginas, "
'*** Código agregado para sacar la clave del Perfil del Grupo ***
sSql = sSql & "upg.id_CARcPerfilGrupo "
'***
sSql = sSql & "from CARcUSR usr "
sSql = sSql & "inner join CARdUsrPerfilGrupo upg on usr.Id_CARcUSR = upg.Id_CARcUSR "
sSql = sSql & "inner join CARdPerfilGrpPantallas pgp on upg.Id_CARcPerfilGrupo = pgp.Id_CARcPerfilGrupo "
sSql = sSql & "inner join CARdPantallasPaginas pp on pgp.Id_CARCPantallas = pp.Id_CARCPantallas "
sSql = sSql & "inner join CARcPaginas p on pp.Id_CARcPaginas = p.Id_CARcPaginas "
sSql = sSql & "where usr.CARcUSR ='"& Session("UserLogin") &"' and p.CARcPaginas =  '"& sPage &"' and p.Carpeta = '"& sFile &"' "

'RESPONSE.WRITE "TOPER>>>"+REQUEST("TOPER")
'RESPONSE.END

Ob_RS.Open sSql, Ob_Conn

If Ob_RS.Eof AND REQUEST("TOPER") <> "VER" Then
	'response.write "no tienes permisos sobre esta página"

	'*** Directorio Virtual ***
	sVirtualDirectory = Request.ServerVariables("PATH_INFO")
	sVirtualDirectory = Mid(sVirtualDirectory,2,len(sVirtualDirectory))
	sVirtualDirectory = Mid(sVirtualDirectory,1,inStr(sVirtualDirectory,"/")-1)
	'***
	
	'*** Servidor ***
	sIPServer =  request.ServerVariables("https_HOST")
	'***
	'jvi   url = "https://"& sIPServer &"/"& sVirtualDirectory &"/Error/ErrorPermisos.asp"
	'''jvi   response.redirect url
	response.clear
	response.write "<BR><BR><BR><HR>"

	response.write "<CENTER>    <H2>     <FONT COLOR= #3366CC>Acceso no autorizado</FONT></H2></CENTER><HR>"
	response.end
else
	'response.write "felicidades tienes permisos sobre esta página"
	sCvePerfilGrupo = Ob_RS("Id_CARcPerfilGrupo")
end if

Ob_RS.Close
Set Ob_Conn = Nothing
Set Ob_RS = Nothing
%>








<Script language=JavaScript>
function right(e) {
if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)){
alert("Acceso Denegado");
return false;
}
else if (navigator.appName == 'Microsoft Internet Explorer' &&
(event.button == 2 || event.button == 3)) {
alert("Acceso Denegado");
return false;
}
return true;
}
document.onmousedown=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=right;
  </script>