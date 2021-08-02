<HTML>

<link href="Estilo.css" rel="stylesheet" type="text/css">

 <BODY  BACKGROUND="softgri1.jpg" ><CENTER>

  <%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

  
'   Ob_Conn.PROVIDER="sqloledb"

   ODBC = SESSION("ODBC")
'   v_ODBC  = SESSION("ODBC")
  
   Archivo=Request.Form("ARCHIVOS")
   Adscrip=Request.Form("Adscrip")
   Ruta="c:\DatosPersonas\"&Archivo
   Folio = REQUEST("Id_GESdGestion")  
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Ruta, 1)
   Set f1=fs.OpenTextFile(Ruta, 1)
   
   IF CINT(Folio) = 0 THEN
      GrupoEspecial= REQUEST("Id_PLAcGrupoEspecial")  
   END IF
   
'   Ob_Conn.OPEN= "SERVER="+ Session("IP_DATOS")+";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
Ob_Conn.Open ODBC,Session("UserID"),Session("Password")

     Ini=0
     ValArea=0
     Do while f1.AtEndOfStream = false
     
        Ini=Ini + 1

		cadena= f1.ReadLine
		
       	Longcadena= Len(Cadena)
       	
	    ComaAPP =  InStr(Cadena,",")
		ComaAPM =  InStr( MID(cadena,ComaAPP+1,LEN(Cadena)-1),",")
		ComaNOM =  InStr(MID(cadena,ComaAPM+ComaAPP+1,LEN(Cadena)-1),",")
'			ComaRFC =  InStr(MID(cadena,ComaAPM+ComaAPP+ComaNOM+1,LEN(Cadena)-1),",")
        vPaterno =  TRIM(Mid(Cadena, 1, ComaAPP-1))
        vMaterno = TRIM(Mid(Cadena, ComaAPP+1,ComaAPM-1))
        vNombre  =TRIM(Mid(Cadena, ComaAPM+ComaAPP+1, ComaNOM-1))
        vRFC     =TRIM(Mid(Cadena, ComaAPM+ComaAPP+ComaNOM+1, LEN(Cadena)-1))
		CadFalta = ""
		IF vMaterno = "" THEN 
		   FaltaDato = true
		   CadFalta = CadFalta+" Apellido Materno,"
		END IF 
		IF vNombre = "" THEN 
		   CadFalta = CadFalta+" Nombre,"
		   FaltaDato = true
		END IF 
		IF vRFC = "" or LEN(vRFC)< 10 THEN 
		   CadFalta = CadFalta+" RFC,"
		   FaltaDato = true
		END IF 
		IF FaltaDato THEN 
		   Response.Write("A -->"+vPaterno+" "+vMaterno+" "+vNombre+" "+vRFC+ " le hacen FALTA Los DATOS :")
		   Response.Write(CadFalta+"<BR>")
		ELSE
           SQL = "Select * from PLAcPersonasDGRH WHERE RFC ='"+vRFC+"'"
           Ob_RS.OPEN Sql, Ob_Conn
           IF OB_RS.EOF THEN
              Response.write ("No existe Registro de:"+vRFC+"<BR>")
	          Campos = "'"+UCASE(vPaterno)+"','"+UCASE(vMaterno)+"','"+UCASE(vNombre)+"','"+UCASE(vRFC)+"','"+UCASE(CURP)+"'"
              Sql = "EXEC sp_RecuperaIdPersona " +Campos
'	          response.write SQL
              Ob_RS2.Open Sql, Ob_Conn
	          IdPersona = Ob_RS2("IdPersona")
	   
           ELSE
              Response.write ("YA EXISTE Registro de:"+vRFC+"<BR>")
              IdPersona = OB_RS("Id_PLAcPersonasDGRH")
              vRFC     =TRIM(Mid(Cadena, ComaAPM+ComaAPP+ComaNOM+1, LEN(Cadena)-1))
           END IF
           Ob_RS.Close
    	
           SQLInsertB = "INSERT into PLAdPersonas(RFC,Id_PLAcPersonasDGRH,Id_GESdGestion,Id_PLAcGrupoEspecial) Values ('"+vRFC+"','"+CSTR(IDPersona)+"','"+Folio+"','"+GrupoEspecial+"')"
           Ob_RS.Open SQLInsertB, Ob_Conn
		END IF 
    Loop
    
response.WRITE("<H2>CONCLUYO EL PROCESO DE CARGA</H2>")   
%>
</BODY>
</HTML>