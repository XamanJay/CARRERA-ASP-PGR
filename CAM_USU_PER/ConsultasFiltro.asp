<!-- #INCLUDE File="Paginas.inc"-->
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO
NumPerPage = 5
%>
<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
  Tabla = REQUEST("tabla_original")
  ODBC = SESSION("ODBC")
  ID = REQUEST.FORM("ID") 
  var_pagina_regreso = "'Consultas_"+ TRIM(Tabla)  +".asp'"
'  response.write Tabla
%>

<TITLE><%= "Consultas de " + (MID((Tabla),4,LEN(TABLA))) %></TITLE>

<%
'response.write(request.form)
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")

  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS")+";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

    consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & Tabla & "'"
    Ob_RS_Id.OPEN consulta_Id, Ob_Conn
    ID = Ob_RS_Id("Id")

  consulta = "SELECT * FROM " & Tabla 
  Ob_RS.OPEN consulta, Ob_Conn

total_campos = Ob_RS.FIELDS.COUNT

'========================== Construcci�n de la cadena de consulta

cadena1 =  "SELECT " + Tabla + "." + "Id_" + TABLA + " AS CVDAccion, "
FOR x = 1 TO total_campos-1
 	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	 	IF ucase(Ob_RS(x).NAME) <> ucase("Id_"+Tabla) THEN 
	        cadena1 = cadena1 +MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
		END IF 	
	ELSE
	        cadena1 = cadena1 + Tabla + "." + Ob_RS(x).NAME + ","
	END IF
	
	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	       	cadena3 = cadena3 + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
	END IF
	
	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") AND (ucase(MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).Name))) <> ucase(trim(Tabla)) ) THEN
		cadena4 = cadena4 + Tabla + "." + Ob_RS(x).NAME + " = " + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + Ob_RS(x).NAME + " AND "
	END IF

NEXT

IF cadena4 = "" THEN
   cadena4 = "      "
 END IF
	  
   cadena3 = MID(cadena3,1,LEN(cadena3)-1)
   cadena4 = MID(cadena4,1,LEN(cadena4)-5)

IF rtrim(ltrim(cadena4)) = "" THEN
    cadena6 = MID(cadena1,1,LEN(cadena1)-1) + " FROM " + cadena3 
ELSE
	cadena6 = MID(cadena1,1,LEN(cadena1)-1) + " FROM " + cadena3 + " WHERE "
	VAR_WHERE = 1
END IF


   sql = Cadena6 + cadena4
   
FOR x = 0 TO total_campos-1
'response.write("<BR>campo ->"+Ob_RS(x).NAME)
'response.write(Matriz(x))
'response.write("<<<<<<")
next
FOR x = 0 TO total_campos-1
IF request(Ob_RS(x).NAME) <> "" AND request(Ob_RS(x).NAME) <> "0" THEN
	IF MID(Ob_RS(x).NAME,1,3) <> "Id_" AND Ob_RS(x).TYPE <> 135 THEN
	  IF VAR_WHERE = 1 THEN
		  sql = sql
	  ELSE
		  sql = sql + " WHERE "
	  END IF 
	  
          IF  RIGHT(RTRIM(sql),5) = "WHERE" THEN
			  sql = sql + Tabla + "." + Ob_RS(x).NAME + " LIKE " + "'%" + request(Ob_RS(x).NAME) + "%'" 
	      ELSE   
			  sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " LIKE " + "'%" + request(Ob_RS(x).NAME) + "%'" 
          END IF
          
          IF (RIGHT(RTRIM(sql),5) = "WHERE") THEN 
''		  AND request(Ob_RS(x).NAME) = "" THEN
			sql = MID(sql,len(sql)-5,len(sql))
          END IF
	END IF

	IF MID(Ob_RS(x).NAME,1,3) = "Id_" THEN 
''	AND request(Ob_RS(x).NAME) <> "" THEN
	  IF VAR_WHERE = 1 THEN
		  sql = sql
	  ELSE
		  sql = sql + " WHERE "
	  END IF 
	  	
          IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " = " + request(Ob_RS(x).NAME) 
          ELSE
			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " = " + request(Ob_RS(x).NAME) 
          END IF
	END IF
	IF Ob_RS(x).TYPE = 135 THEN 

	     IF VAR_WHERE = 1 THEN
	    	 sql = sql
	     ELSE
		     sql = sql + " WHERE "
	     END IF 
	  	
		  
          IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + request(Ob_RS(x).NAME)+ "'"
          ELSE
			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + request(Ob_RS(x).NAME) + "'"
          END IF 
	END IF '	IF Ob_RS(x).TYPE = 135 

END IF 
    IF	Ob_RS(x).TYPE = 135 AND request(Ob_RS(x).NAME+"_N") <> "" THEN
	    IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
		    sql = sql + Tabla + "." + Ob_RS(x).NAME + " <= " + "'" + request(Ob_RS(x).NAME+"_N") + "'"
        ELSE
			sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " <= " + "'" + request(Ob_RS(x).NAME+"_N") + "'"
        END IF
     END IF
		
NEXT
' ==============  FIN DE CONSTRUCCION DE CADENA

''response.write (sql)
''response.write "<br>"

SQL = REPLACE(SQL,TABLA+".","BK_"+TABLA+".")
SQL = REPLACE(SQL,"FROM "," ,OPERACION FROM BK_"+TABLA+",")
SQL = SQL + " AND ID_"+TABLA+" = "+CSTR(REQUEST("PARAMID"))
'''response.write (sql)
''response.end

' ==============  Se agrego , 1,1 para la paginacion  u la llamada a la rutina INICIAPAG	
Ob_RS2.Open Sql, Ob_Conn, 1,1
CALL INICIAPAGINA 

Num_Campos= Ob_RS.FIELDS.COUNT 

IF NOT Ob_RS2.EOF THEN %>
 	
	<CENTER><H4>Registros  MODIFICADOS en <%= MID(Tabla,5,LEN(TABLA)-1)%></H4><CENTER>
 
<%x = -1 %>

  <TABLE class="SL" border="1">
  <TR>
 <TD class="Encabezados"> <B><font color="#FFFFFF">Operaci�n</font></B></TD>
 <%
 HIDCampos = 8 
IF Tabla = "CARDDATOSPERSONALES" THEN
  	HIDCampos = 9     
END IF
XCampos = 0
  FOR x = 1 TO total_campos- HIDCampos
	 Ob_RS_Id.CLOSE
   	 consulta_Eti = "SELECT VALUE,SmallID FROM sysproperties WHERE  ID =" +CSTR(ID)  +" AND SmallID=" + cstr(x+1)
''	 RESPONSE.WRITE(consulta_Eti)
''	 RESPONSE.END
     Ob_RS_Id.OPEN consulta_Eti, Ob_Conn
  	IF (MID(Ob_RS_Id(0),1,3) = "Id_") THEN
	   ETIQ = MID(Ob_RS_Id(0),4,LEN(Ob_RS_Id(0))-1) 
	ELSE
        IF left(Ob_RS2(X).name,2) = "D_"   THEN
        XCampos = XCampos -1
        ETIQ = ""
    	ELSE
        ETIQ = Ob_RS_Id(0)
        END IF
 	END IF
	IF ETIQ <> "" THEN 
%>
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=ETIQ& ":" %>  </font></B> 
 <%  END IF
  NEXT %>

  </TR>

  <%
	nRen = 0 
' ==============  Se agrego "and nRen < Ob_RS2.PageSize" PARA LA PAGINACION	
   DO WHILE NOT Ob_RS2.EOF and nRen < Ob_RS2.PageSize
    nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%>
  <TR class="Datos"> 
    <% else %>
  <TR  class="Encabezados" > 
    <% end if %>
   <TD> <%= Ob_RS2("OPERACION") %> &nbsp;</TD>

		<% 
		FOR Campo = 1 TO Num_Campos - HIDCampos
		    IF left(Ob_RS2(Campo).name,2) <> "D_"   THEN%>			
			   <TD> <%= Ob_RS2(Campo) %> &nbsp;</TD>
<%          END IF
		NEXT
		Ob_RS2.MOVENEXT
  LOOP
	
  CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
  
ELSE
	RESPONSE.WRITE "<BR>"
	RESPONSE.WRITE "<CENTER> <H3> No existe ning�n registro que cumpla con los par�metros de b�squeda </H3> </CENTER>"
END IF
%>

</TABLE>

<CENTER>
<BR>
<INPUT TYPE="button" VALUE="Buscar otro registro" ONCLICK="location.href=<%= var_pagina_regreso%>" >

<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>

 </BODY>
</HTML>

