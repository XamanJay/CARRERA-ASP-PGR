<%
  Dim sRTF, sFileName, sConn, varTexto
   Response.Buffer = True
' crea el archivo de salida RTF
   Dim fso, MyFile
   Set fso = server.CreateObject("Scripting.FileSystemObject")
   sFileName = "SalidaRTF.rtf"
   Set MyFile = fso.createTextFile(Server.MapPath(".") & "\" & sFileName, True)
'  texto extra
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Server.MapPath("Reporte.txt"), 1)
'  Inicializa el archivo de salida a RTF
   MyFile.WriteLine("{\rtf1")
'  Encabezado y pie de página
   MyFile.WriteLine("{\header\pard\qc{\fs50 " & _
                    " PGR   COPLADII   DGFP\par}{\fs18\chdate\par}\par\par}")
      MyFile.WriteLine("{\footer\pard\qc\brdrt\brdrs\brdrw10\brsp100" & _
                    "\fs18 Page " & _
                    "{\field{\*\fldinst PAGE}{\fldrslt 1}} of " & _
                    "{\field{\*\fldinst NUMPAGES}{\fldrslt 1}} \par}")
				%>
 <%
 
 
	  		  
 '''''''''''''''''''
	  Set rs = Server.CreateObject ("ADODB.RecordSet")
	     Ob_Conn_cap.Provider="sqloledb"
	  		  IP_Servidor = session("IP_Servidor")
		  Ob_Conn_cap.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")		  
	 var_query1 = "select * from vst_Listado_inscritos " & _
	           "where Id_CAPdCurso = "& ver_Id_curso_seleccionado
	rs.Open var_query1, Ob_conn_cap
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   varTexto = f.ReadAll
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		rs.movefirst
		cad_sustitucion=""
			do until rs.Eof
				cad_sustitucion=cad_sustitucion+rs("ApellidoPaterno").value+" "+rs("ApellidoMaterno").value+" "+rs("Nombre").value
				rs.MoveNext                                                                                  
			loop
		cad_sustitucion1=cad_sustitucion
		varTexto = replace(varTexto,"<opcion>",cad_sustitucion1)
    MyFile.WriteLine("{"& varTexto &"}") 
' Cierra el archivo de machote
    f.Close
    Set f=Nothing
   rs.Close
   Set rs = Nothing
   '  Cierra el archivo de salida Formato RTF 
   MyFile.WriteLine("}")
   MyFile.Close
   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName & """>"
 %>
  