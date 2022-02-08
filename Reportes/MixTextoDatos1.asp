<%@ Language=VBScript %>
<%

   Dim sRTF, sFileName, sConn, varTexto

' ====== inicializa el Recorset y la Base de datos
Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")
Set Ob_RSInd = Server.CreateObject ("ADODB.RecordSet")
Ob_Conn.Provider="sqloledb"
Ob_Conn.Open="SERVER="+ session("IP_DATOS") +";Database=SIIFP;UID=cursos;PWD=cursos"

   Response.Buffer = True

' ==== crea el archivo de salida RTF
   Dim fso, MyFile
   Set fso = server.CreateObject("Scripting.FileSystemObject")
   sFileName = "SalidaRTF.doc"

   Set MyFile = fso.createTextFile(Server.MapPath(".") & "\" & sFileName, True)

' ===== texto extra
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Server.MapPath("denuncia.txt"), 1)

' ==== Inicializa el archivo de salida a RTF
   MyFile.WriteLine("{\rtf1")

' ==== Encabezado y pie de página
   MyFile.WriteLine("{\header\pard\qc{\fs50 " & _
                    " Programa Generado con ASP,  RTF\par}{\fs18\chdate\par}\par\par}")
   MyFile.WriteLine("{\footer\pard\qc\brdrt\brdrs\brdrw10\brsp100" & _
                    "\fs18 Page " & _
                    "{\field{\*\fldinst PAGE}{\fldrslt 1}} of " & _
                    "{\field{\*\fldinst NUMPAGES}{\fldrslt 1}} \par}")

 
' ==== Ejecucion de un query a la base DATOS
   
   Set rs = Server.CreateObject("ADODB.Recordset")
       rs.Open "SELECT * FROM DATOS", ob_conn, 3   'adOpenStatic = 3

' ==== Lee el archivo de texto y reemplaza los datos de la base de datos
    varTexto = f.ReadAll
    varTexto = replace(varTexto,"<ap>", "\b " & rs("numap").Value & " \b0")
    varTexto = replace(varTexto,"<mesa>", "\b " & rs("mesa").Value & " \b0")
    varTexto = replace(varTexto,"<mp>", "\b " & rs("agentemp").Value & " \b0")
    
    MyFile.WriteLine("{"& varTexto &"}") 

'======= Cierra el archivo de machote
    f.Close
    Set f=Nothing
    Set fs=Nothing
  
' ====== cierra el Recorset y la Base de datos
   rs.Close
   OB_conn.Close
   Set rs = Nothing
   Set Ob_conn = Nothing
   
' ====== Cierra el archivo de salida Formato RTF 

   MyFile.WriteLine("}")
   MyFile.Close

   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName & """>"
 
%>