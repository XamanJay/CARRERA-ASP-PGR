<%
If Request("TOper") = "VER" Then
%>
<script>
	for (i=0;i<document.FormEdita.elements.length;i++)
		{
		if (document.FormEdita.elements[i].type == 'select-one' || document.FormEdita.elements[i].type == 'text' || document.FormEdita.elements[i].type == 'textarea')
			{
			document.FormEdita.elements[i].disabled = true
			//alert(document.FormEdita.elements[i].name)
			//i = documentFormEdita.elements.length		//***Rompe el Ciclo For***
			}		
		}
</script>
<%
End If
%>