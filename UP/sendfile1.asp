<!-- #include file="uploadfile.asp" -->
<%
' Create the FileUploader
	Dim Uploader, File, ThisFile, nombrearch, path, var
path = server.mappath("images")
Set Uploader = New FileUploader

' This starts the upload process
Uploader.Upload()

'site =  Uploader.Form("radiobutton")

If Uploader.Files.Count = 0 Then

	Else
	' Loop through the uploaded files
	For Each File In Uploader.Files.Items
	
		' salvar archivo ../imagenes
		File.SaveToDisk path
	Next
End If


%>
<body>
 <table width="72%" align="center">
   <tr> 
    <td bgcolor="#FFFFFF"> 
        Los archivos estan en el servidor</td>
  </tr>
  </table>
</body>
