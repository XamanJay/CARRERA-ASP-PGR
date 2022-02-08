

<!-- #include file="uploadfile.asp" -->



<%
' Create the FileUploader
	Dim Uploader, File, ThisFile, nombrearch, path, var
'path = server.mappath("images") 
path = "D:\AppsDesa\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\"
Set Uploader = New FileUploader

' This starts the upload process
Uploader.Upload()
'-=-=-=-=-=-=-=-=-=-=-=-=-CONEXXXION=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


   
 Id_CARcBoca = Uploader.Form ("Id_CARcBoca")
 Id_CARcCara = Uploader.Form ("Id_CARcCara")
 Id_CARcCejas = Uploader.Form ("Id_CARcCejas")
 Id_CARcFrente = Uploader.Form ("Id_CARcFrente")
 Id_CARcComplexion = Uploader.Form ("Id_CARcComplexion")
 Id_CARcColorCabello = Uploader.Form ("Id_CARcColorCabello")
 Id_CARcFormaCabello = Uploader.Form ("Id_CARcFormaCabello")
 Id_CARcMenton = Uploader.Form ("Id_CARcMenton")
 Id_CARcNariz = Uploader.Form ("Id_CARcNariz")
 Id_CARcFormaOjos = Uploader.Form ("Id_CARcFormaOjos")
 Id_CARcOjos = Uploader.Form ("Id_CARcOjos")
 Id_CARcOrejas = Uploader.Form ("Id_CARcOrejas")
 Id_CARcColorTez = Uploader.Form ("Id_CARcColorTez")
 Id_CARcLabios = Uploader.Form ("Id_CARcLabios")
 Estatura = Uploader.Form ("Estatura")
 SeniasParticulares = Uploader.Form ("SeniasParticulares")
 IdLogin = Uploader.Form ("IdLogin")
 IP_user = Uploader.Form ("IP_user")
 Peso = Uploader.Form ("Peso")
 TipoSangre = Uploader.Form ("TipoSangre")
 CARdFicha = Uploader.Form ("CARdFicha")
 Id_CARdDatosPersonales =  Uploader.Form ("Id_CARdDatosPersonales")  
 


 
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_I = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
   
    
' Ob_Conn.PROVIDER="sqloledb"
 '  Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE=SIIFP;UID="+ Session("UserID") +";PWD="+ Session("Password")
 
 ' v_ODBC  = SESSION("ODBC")
 'Ob_Conn.Open v_ODBC,Session("UserID"),Session("Password")
 
    DSN  = SESSION("DSN")	
 '	Ob_Conn.Open "DSN"
 
  Ob_Conn.Open DSN,Session("UserID"),Session("Password") 
 

   
   
   Pro_Almacenado = " Exec PA_DatosFicha " & Id_CARcBoca &", "& Id_CARcCara &", "&Id_CARcCejas &", "&Id_CARcFrente &", "&Id_CARcComplexion & _ 
                   ", " & Id_CARcColorCabello &", "& Id_CARcFormaCabello &", "&Id_CARcMenton &", "&Id_CARcNariz &", "&Id_CARcFormaOjos &", "&Id_CARcOjos & _ 
					", " & Id_CARcOrejas&", "& Id_CARcColorTez&", "& Id_CARcLabios&", '"& Estatura &"',  '"&SeniasParticulares&"', "& IdLogin &", '"&IP_user&"',  '"& Peso&"',  '"& TipoSangre &"',  '"&CARdFicha & "', " & Id_CARdDatosPersonales 
					
					'response.write(Pro_Almacenado)
					'response.end 
		Ob_RS.Open Pro_Almacenado, Ob_Conn
		'***
	    Id_ = Ob_RS("Id_")
		
			 			 
	'Ob_RS.CLOSE
	'Set Ob_RS_PA1 = Nothing
 '-=-=-=-=-=-=-=-=-=-=FIN-=-=-CONEXXXION=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
If Uploader.Files.Count = 0 Then

	Else
	
	For Each File In Uploader.Files.Items
	
	                     nom_arch = file.filename 
	                     Proc_Almac_Img = "Exec PA_Act_Imagen " & Id_ & ", '" & nom_arch & "'"
						 Ob_RS_I.Open Proc_Almac_Img, Ob_Conn
	 
	 
		File.SaveToDisk path
	Next
End If

 
%>












<style type="text/css">
<!--
.Estilo1 {
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
<body background="softgri1.jpg">
 <table width="72%" align="center">
   <tr> 
    <td ><div align="center" class="Estilo1"> 
        La firma autografa digitalizada y la huella dactilar digitalizada han sido guardadas correctamente</div></td>
  </tr>
</table>
</body>
