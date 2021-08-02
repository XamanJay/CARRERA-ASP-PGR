<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS3 = Server.CREATEOBJECT("ADODB.RECORDSET")

  Ob_Conn.PROVIDER="sqloledb"
  Ob_Conn.OPEN= "SERVER=10.3.194.244;DATABASE=ATREE;UID=utree;PWD=utree" 

  consulta = "truncate table arbol"
  Ob_RS.OPEN consulta, Ob_Conn

%>
<HTML>

<link href="Estilo.css" rel="stylesheet" type="text/css">

 <BODY  BACKGROUND="softgri1.jpg" ><CENTER>
 

<BR><BR>
<CENTER>
    <H2> 
     <font size="4" color="#000080"><span style="font-weight: 400">Carga de</span></font><span style="font-weight: 400"><FONT COLOR= #000080 size="4"> 
     Archivo de <%=Titulo%></FONT><font color="#000080"> </font>
     </span>
    </H2>

<BR><BR><BR>

<FORM METHOD="post" ACTION="<%=Pagina%>" NAME= "FormAltas">

<Table width="100%">


<%
dim fs,fo,x
set fs=Server.CreateObject("Scripting.FileSystemObject")
'set fo=fs.GetFolder("c:\Datos")
'response.write chr(34)+SERVER.MAPPATH("Lista_Archivos.asp")+chr(34)
response.write chr(34)+SERVER.MAPPATH(".")+chr(34)

'response.end 
'set fo=fs.GetFolder(chr(34)+SERVER.MAPPATH("Lista_Archivos.asp")+chr(34))

set fo=fs.GetFolder(SERVER.MAPPATH("."))
redim AFiles(1,1)
'call Buscar("GRECA_M34_Personal_Desplegable.asp",1,0)
call Buscar("GRECAlOGINAplicaciones.asp",1,0)
for X = 1 to 20
   MQry = "Select * from Arbol Where Nivel = " +cstr(x)
   Ob_RS3.OPEN MQry, Ob_Conn
   do while not Ob_RS3.EOF
      call Buscar(Ob_RS3("Programa"),X+1,Ob_RS3("Id_ARbol"))
      Ob_RS3.MoveNext
   loop
   Ob_RS3.CLOSE
  
next   
%>

	<Tr>
		<Td>
			<font size="2"><b><font color="#006699">Archivo:&nbsp;</font></b>&nbsp;&nbsp; </font>
		</Td>

		<Td width="444%">
	      <SELECT NAME='ARCHIVOS' SIZE=1>
	     	<OPTION VALUE='0'>
                   Seleccione registro
            </OPTION>
	       	<% Y = 1
             for each x in fo.files
                 Response.write(x.Name & "aa<br />")
			           IF UCASE(RIGHT(x.Name,4)) = ".ASP" THEN 
	       	         'redim Preserve AFILES(Y,1)
                   'AFILES(Y,0) = x.Name + "algo" 
                  '' Y = y + 1 %>
            		 <OPTION VALUE='<%= x.Name%>'> <%= x.Name%>
	            	</OPTION>
    	          <%END IF 
      			 next%>
       	</SELECT>
       	</Td>
    </Tr>  
    
<%
'response.write Y
for Z = 0 to Y-2
response.write "B>" 
response.write  Afiles(Z,0)
'response.write  Afiles(Z,1)
next
set fo=nothing
set fs=nothing
%>
 	



</Table>

<BR><BR>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
 
</FORM>
  
</CENTER>

</BODY>
</HTML>
<%
SUB Buscar(BFile,PNivel,POrden)
'response.write Server.MapPath(BFile)
   Dim fso , MyFile
   Set fso = server.CreateObject("Scripting.FileSystemObject")
   sFileName = "MapaEjecucion.RTF"

''   Set MyFile = fso.createTextFile(Server.MapPath(".") & "\" & sFileName, True)
'olv'   Set MyFile = fso.createTextFile("D:\APPSDESA\COPLADII\DF\"+ sFileName, True)

' ===== texto extra
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
'response.write fs.FileExists(Server.MapPath(BFile))
'response.end
IF fs.FileExists(Server.MapPath(BFile)) THEN 
   Set f=fs.OpenTextFile(Server.MapPath(BFile), 1)
    

' ==== Lee el archivo de texto y reemplaza los datos de la base de datos
''    VTexto = f.Readall
''    response.write VTexto
  do while f.AtEndOfStream = false
 ''    Response.Write(f.ReadLine)
  ''   Response.Write("<br>")
    VarTexto = ucase(f.ReadLine)
 ''      MyFile.WriteLine("{"& varTexto &"}")
     if instr(varTexto,"<!--") = 0 and left(ltrim(varTexto),1) <> "'" THEN 
     Inicio = instr(varTexto,".ASP")
     if Inicio <> 0  THEN
     IF MID(VarTexto,Inicio-1,1)<> chr(34) AND MID(VarTexto,Inicio-1,1)<> ">" AND MID(VarTexto,Inicio-1,1)<> "'" THEN
        VTexto2= mid(VarTexto,1,Inicio+3)
 ''       vTExto2 = Reversa(VTexto2)
'        Inicio = instr(varTexto,chr(34))
        Inicio = instr(vTExto2,"HREF=")
        If Inicio <> 0 THEN
           VTexto2 = mid(VTexto2,Inicio+6,LEN(VTexto2))
        ELSE
           vTExto2 = Reversa(VTexto2)
           IniComillas = instr(vTexto2,chr(34))
           IniDiagonal = instr(vTExto2,"/")         
           IniApostrofe= instr(vTExto2,"'") 
           Inicio = 200        
           If IniComillas <> 0 THEN
              Inicio = IniComillas         
           END IF 
           If IniDiagonal <> 0  and IniDiagonal < Inicio THEN
              Inicio = IniDiagonal         
           END IF 
           If IniApostrofe <> 0  and IniApostrofe < Inicio THEN
              Inicio = IniApostrofe         
           END IF 
           
           If Inicio <> 0 THEN
              VTexto2 = mid(VTexto2,1,Inicio-1)
           end if 
           vTExto2 = Reversa(VTexto2)
       
       END IF
        Inicio = instr(vTExto2,"CARRERAPGR/")
        If Inicio <> 0 THEN
           VTexto2 = mid(VTexto2,Inicio+11,LEN(VTexto2))
        END if
'olv'           MyFile.WriteLine( vTexto2 ) 
           MCons = "Select * from Arbol Where Programa = '" +VTexto2 + "'"
''           if instr(Mcons,"PRINCIPAL") = FALSE then
           Ob_RS.OPEN MCons, Ob_Conn
           IF Ob_RS.EOF  THEN       
              MInsert = "insert into Arbol (Programa,Nivel,Orden) values ('"
              MInsert = MInsert + vTexto2+"',"+cstr(PNivel)+","+cstr(pOrden)+")"
 'response.write Minsert
 'response.write "<BR>"          
           Ob_RS2.OPEN MInsert, Ob_Conn 
           END IF 
           Ob_RS.CLOSE
''           end if        
       END IF 
     END IF 
     END if ' instr(varTexto,"<!--") = FALSE 
  loop

END IF 'fs.FileExists(Server.MapPath(BFile)     
END SUB   

FUNCTION Reversa(Cadena)
FOR I = 1 to len(Cadena)
    xVAr = xVAr + mid(cadena,len(Cadena)-I+1,1)
next
Reversa = xVar
END FUNCTION

SUB Barrer
END SUB

%>

<%
'dim fs,fo,x
'set fs=Server.CreateObject("Scripting.FileSystemObject")
'set fo=fs.GetFolder("c:\test\")for each x in fo.SubFolders
  'Print the name of all subfolders in the test folder
''  Response.write(x.Name & "<br />")
'nextset fo=nothing
'set fs=nothing
%>
