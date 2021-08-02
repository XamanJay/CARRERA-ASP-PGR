<%
If Request("TOper") = "VER" Then
%>
<script>
	for (i=0;i<document.FormAltas.elements.length;i++)
		{
		if (document.FormAltas.elements[i].type == 'select-one' || document.FormAltas.elements[i].type == 'text' || document.FormAltas.elements[i].type == 'textarea' || document.FormEdita.elements[i].type == 'file')
			{
			document.FormAltas.elements[i].disabled = true
			//alert(document.FormAltas.elements[i].name)
			//i = document.FormAltas.elements.length		//***Rompe el Ciclo For***
			}		
		}
</script>
<%
End If
%>