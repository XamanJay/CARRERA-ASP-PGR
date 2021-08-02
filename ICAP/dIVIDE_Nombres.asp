<%
'RESPONSE.END
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
  Tabla = "RFC_PS"
  ODBC = "Orion1"
%>

<TITLE><%= "Consultas de " + request("TIT")%></TITLE>

<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")


   Ob_Conn.PROVIDER="sqloledb"
   '''Ob_Conn.OPEN= "SERVER=DESE-desar01;DATABASE=SIP_DGFP;UID=olugo;PWD=luguito"
''   response.write SESSION("V_ODBC")
''   response.end 
   Ob_Conn.OPEN="SERVER="+ SESSION("IP_SERVER") +";DATABASE="+SESSION("V_ODBC")+";UID="+ SESSION("UserID") +";PWD="+ SESSION("Password")
'   Ob_Conn.open SESSION("STR_CONEXION")

    consulta = "select * from TEMP_ICAP order by Nombre"
    Ob_RS.OPEN consulta, Ob_Conn
	Ind = 0
	TotalREg = 0 
GSql = ""	
	do until OB_RS.EOF
	   TotalREg = TotalREg +1 

'	response.write "entro"
'	response.end
 'IF LEFT(OB_RS("NombreLargo"),2) >= "TO" THEN
'	   a = instr(OB_RS("NombreLargo")," ")
       xName = OB_RS("Nombre")
'	   Pos2B=instr(xName,"  ")
      response.write OB_RS("Nombre")+">>"
'	   if Pos2b <> 0 THEN
'	       xName = LEFT(xName,Pos2B-1)+MID(xName,Pos2B+1,len(xName))
'		   response.write xName  
'       END if 
'		   response.write "<BR>" 
       SQL1 = "update " 
	   Ind = Ind +1
	   Pointer = 1 

	   IF  LEFT(xName,3) = "DE " THEN
	       Pointer = 4
	   END IF
	   IF  LEFT(xName,4) = "DEL "  THEN
	       Pointer = 5
	   END IF
	   IF  LEFT(xName,6) = "DE LA "  THEN
	       Pointer = 7 
	   END IF
       b1 = instr(Pointer,xname," ")
       b2 = instr(pointer+b1,XName," ")
	   Paterno = mid(xName,1,b1-1)

	   
	   Pointerb= b1+1 
       b1 = B1+1 
'response.write  "::"+MID(xName,b1,3)+"<BR>b1"
	   IF  MID(xName,b1,3) = "DE " THEN
	       Pointerb = Pointerb+4
	   END IF
	   IF  MID(xName,b1,4) = "DEL "  THEN
	       Pointerb = PointerB+5
	   END IF
	   IF  MID(xName,b1,6) = "DE LA "  THEN
	       Pointerb = PointerB+7 
	   END IF
       b2 = instr(Pointerb,xname," ")
	   
	   IF B2-B1 > 0 THEN 
	      Materno = mid(xName,b1,b2-B1)
		ELSE
		  Materno = "ERROR"	  
	   END IF
   
	   
	   
	  Nombre = mid(xName,b2+1,len(xname)-1)
	  xSQL = "UPDATE TEMP_ICAP SET Nombre_S = '"+LTRIM(Nombre)+"', APaterno = '"+LTRIM(Paterno)+"' ,AMaterno='"+LTRIM(Materno)+"'"
	  xSQL = xSQL+" WHERE RFC = '" +OB_RS("RFC")+"'"
	  RESPONSE.WRITE xSQL
	  response.write "<BR>"
	  GSql = GSql + xSQL
'      response.write "P-->"+ Paterno+"--M-->"+Materno+"--N-->"+NombreLargo 
	  response.write "<BR>" 
'	      RESPONSE.end
'' END IF
	   OB_RS.MOVENEXT
	   IF TotalReg = 5000 then
	      TotalReg = 0 
          Ob_RS2.OPEN GSql, Ob_Conn
	   END IF 
	loop
    Ob_RS2.OPEN GSql, Ob_Conn
		   response.write "F I N <BR>" 

%>

