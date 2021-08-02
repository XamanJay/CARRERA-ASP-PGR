<!--#INCLUDE FILE="ADOVBS.INC"-->
<!--#include file="DSUpload.inc"-->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    V_ODBC  = SESSION("ODBC")
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
	
	
	QRY = " Insert Into CARdDatosPersonales ( " 
	qry = QRY + REQUEST("campos") + " )"
	qry = QRY + " Values ("+ REQUEST("valores")+ " )"
	'RESPONSE.WRITE QRY
'	RESPONSE.END
	Ob_Rs.Open QRY, Ob_Conn
	Set Ob_Rs= Nothing
	Set Ob_Conn= Nothing%>
	
<CENTER><H2>El Registro de los Datos se ha Realizado de Manera Correcta
<br><br>
<A HREF="FondoAuxiliar.asp">Finalizar</A></H2>
</CENTER>

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