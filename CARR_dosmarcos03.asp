<html><head><title>DosMarcosJVI</title></head>
<%
 
mper = request("Id_CardDatosPersonales")
MTabla = request("tabla")
'RESPONSE.WRITE(MTABLA)
%>
<FRAMESET rows ="22%,4%,4%, 71%" cols="*" Border=1>
    <FRAME SRC="CARR_detalle_generales.asp?Id_CARdDatosPersonales=<% = mper %>" scrolling="no" name="topFrame3" target="_self">
    <FRAME SRC="CARR_MENU1.asp?Id_CARdDatosPersonales=<% = mper %>"  scrolling="no" name="topFrame1" target="_self">
    <FRAME SRC="CARR_MENU2.asp?Id_CARdDatosPersonales=<% = mper %>"  scrolling="no" name="topFrame2" target="_self">
<%    IF MTABLA = "CARDNOMBRAMIENTOS"  THEN %>
    <FRAME SRC="Mfiltro.asp?tabla_original=<%=MTabla%>&ODBC=SIIFP&Id_CARdDatosPersonales=<% = mper %>&IdMaestro=CARdDatosPersonales&TIT=<%= REQUEST("TITU")%>" NAME="mainFrame4" NORESIZE scrolling="auto">
<%    ELSE %>
    <FRAME SRC="Mfiltro.asp?tabla_original=<%=MTabla%>&ODBC=SIIFP&Id_CARdDatosPersonales=<% = mper %>&IdMaestro=CARdDatosPersonales&TIT=<%= REQUEST("TITU")%>" NAME="mainFrame4" NORESIZE scrolling="auto">
<% END IF %>
</FRAMESET>
<noframes><body>
</body></noframes></html>