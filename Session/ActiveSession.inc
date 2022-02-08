<%If Session("FlagConn") = "" or isNull(Session("FlagConn")) or Cint(Session("FlagConn") = 0) Then%>
	<script>
		//alert('<%=Session("FlagConn")%>');
		//window.showModelessDialog('Session/EndSession.asp','Ventana','dialogHeight: 934px;dialogWidth: 762px;edge: Raised; center: No; Status:No; help: No; resizable: Yes;')
		//window.open('Session/EndSession.asp','Ventana','dialogHeight: 934px;dialogWidth: 762px;edge: Raised; center: No; Status:No; help: No; resizable: Yes;')
	</script>
	<%
	url = "Session/EndSession.asp"
	response.redirect url
	response.end
End If
response.write "."%>
