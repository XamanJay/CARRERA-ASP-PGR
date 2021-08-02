<HTML>
<HEAD>
<TITLE>Session Cleanup</Title>
</HEAD>
<BODY Onload="CallClose();">
<%
'This page is used to clean up any Crystal Reports RDC Runtime objects remaining in a
'a user's session.  This page is called by a new browser window that is launched when
'a user closes a browser window containing a Crystal Reports viewer.

Function DestroyObjects(ByRef ObjectToDestroy)
  If isobject(ObjectToDestroy) then
    set ObjectToDestroy = nothing
    DestroyObjects = true
  Else
    DestroyObjects = false
  End if
End Function

'This function takes an object (by reference rather than by value) and destroys it.
'If the object was destroyed we return true otherwise we return false.

DestroyObjects session("oPageEngine")
DestroyObjects session("oRpt")
DestroyObjects session("oApp")

Response.Write("You may close this window")

%>
<SCRIPT LANGUAGE="Javascript">

function CallClose()
{
	window.close();
}
</SCRIPT>
</BODY>
</HTML>
<%
'The javascript code is used to close the newly opened browser window once the page has run
Session.Abandon
Response.End
'These last two lines terminate that user's active session and flushes html to the browser.
%>
