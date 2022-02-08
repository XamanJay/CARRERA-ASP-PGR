<!-- #Include File = "Include/InhabilitaPag.inc" -->

<!-- #include file="uploadfile.asp" -->



<%
' Create the FileUploader
	Dim Uploader, File, ThisFile, nombrearch, path, var
'path = server.mappath("images") 
path = "C:\AppsProd\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\FIRMAS"
'\\10.3.194.167\d$\AppsProd\PGR\CarreraPGR\Desarrollo\Datos\IMAGENES\FIRMAS


path_firma = "E:\AppsProd\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\FIRMAS"
path_huella = "E:\AppsProd\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\HUELLAS"
path_voz = "E:\AppsProd\COPLADII\CarreraPGR\Desarrollo\Datos\Imagenes\VOZ"



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
 
 Id_CARcCabelloCantidad = Uploader.Form ("Id_CARcCabelloCantidad")
 Id_CARcNarizAncho = Uploader.Form ("Id_CARcNarizAncho")
 Id_CARcNarizForma = Uploader.Form ("Id_CARcNarizForma")
 Id_CARcOjosTamano = Uploader.Form ("Id_CARcOjosTamano")
 Id_CARcAnteojos = Uploader.Form ("Id_CARcAnteojos")
 
 




 
 
 
 Estatura = Uploader.Form ("Estatura")
 SeniasParticulares = UCASE(Uploader.Form ("SeniasParticulares"))
 IdLogin = Uploader.Form ("IdLogin")
 IP_user = Uploader.Form ("IP_user")
 Peso = Uploader.Form ("Peso")
 Id_CARcTipoSangre = Uploader.Form ("Id_CARcTipoSangre")
 CARdFicha = UCASE(Uploader.Form ("CARdFicha"))
 Id_CARdDatosPersonales =  Uploader.Form ("Id_CARdDatosPersonales")  
 
 
  CARdFicha = REPLACE(CARdFicha,"'","''")
  SeniasParticulares = REPLACE(SeniasParticulares,"'","''")



 
 
        Id_CARcSubprocuradurias = session("Subprocuraduria") 
		Id_CARcDG_o_Delegaciones = session ("Delegacion") 
		Id_CARcDir_o_subsede = session ("Subsede") 



 
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
					", " & Id_CARcOrejas&", "& Id_CARcColorTez&", "& Id_CARcLabios&", '"& Estatura &"',  '"&SeniasParticulares&"', "& IdLogin &", '"&IP_user&"',  '"& Peso&"',  '"& Id_CARcTipoSangre &"',  '"&CARdFicha & "', " & Id_CARdDatosPersonales & _
					", " & Id_CARcSubprocuradurias &", "&Id_CARcDG_o_Delegaciones&", "&Id_CARcDir_o_subsede & _
					", " & Id_CARcCabelloCantidad & ", " & Id_CARcNarizAncho & ", " & Id_CARcNarizForma & ", " & Id_CARcOjosTamano & ", " & Id_CARcAnteojos
					
					
					




					'''response.write(Pro_Almacenado)
					'''response.end 
		Ob_RS.Open Pro_Almacenado, Ob_Conn
		'***
	    Id_ = Ob_RS("Id_")
		
			 			 
	'Ob_RS.CLOSE
	'Set Ob_RS_PA1 = Nothing
	
 '-=-=-=-=-=-=-=-=-=-=FIN-=-=-CONEXXXION=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
If Uploader.Files.Count = 0 Then

	Else
	Dim i
	i = 0
	For Each File In Uploader.Files.Items
	
	 				 If i = 0 THEN 
	                     ''firma
	                     nom_arch = file.filename 
	                     Proc_Almac_Img = "Exec PA_Act_Imagen " & Id_ & ", '" & nom_arch & "'"
						 Ob_RS_I.Open Proc_Almac_Img, Ob_Conn
						 
						 File.SaveToDisk path_firma
	                Elseif i = 1 then
	                     '''huella
						 nom_arch = file.filename 
	                     Proc_Almac_Img = "Exec PA_Act_Imagen_huella " & Id_ & ", '" & nom_arch & "'"
						 Ob_RS_I.Open Proc_Almac_Img, Ob_Conn
						 
						 File.SaveToDisk path_huella
					Else
					 '''voz
						 nom_arch = file.filename 
	                     Proc_Almac_Img = "Exec PA_Act_Voz " & Id_ & ", '" & nom_arch & "'"
						 Ob_RS_I.Open Proc_Almac_Img, Ob_Conn
						 
						 File.SaveToDisk path_voz
	                 End if  
	 
	    i = i + 1
		'''' original     File.SaveToDisk path
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
    <!--<td ><div align="center" class="Estilo1"> 
        La firma autografa digitalizada, la huella dactilar digitalizada y el registro de voz han sido guardados correctamente</div></td>
  </tr>-->
  <td ><div align="center" class="Estilo1"> 
       El registro ha sido guardado correctamente</div></td>
  </tr>
</table>
</body>