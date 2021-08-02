<%
If Session("UserName") = "" Then
	Response.Redirect "../Error/ErrorSession.asp"
End If
%>