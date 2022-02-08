<HTML>

<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0" vlink="#FFFFFF" alink="#FFFFFF" link="#FFFFFF">
<%

EXCEL = REQUEST.FORM("exxxcel")
'response.write EXCEL
'response.end 

IF EXCEL = 100 THEN
 Response.ContentType = "application/vnd.ms-excel" 
ELSE
 EXCEL = 0 %>
 <link href="Estilo.css" rel="stylesheet" type="text/css">
 <!-- #INCLUDE File="Paginas.inc"-->
<%
NumPerPage = 15
 END IF
%>




<!-- #INCLUDE File="Utilerias.vbs" -->
<!-- #INCLUDE File="Utilerias.js" -->
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO


'RESPONSE.WRITE	Session("UserLogin") 
'RESPONSE.WRITE	Session("IdLogin")

%>


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
  SET Ob_RS4 = SERVER.CREATEOBJECT("ADODB.RECORDSET")

  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

    consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & Tabla & "'"
    Ob_RS_Id.OPEN consulta_Id, Ob_Conn
    ID = Ob_RS_Id("Id")

  consulta = "SELECT * FROM " & Tabla 
  Ob_RS.OPEN consulta, Ob_Conn

total_campos = Ob_RS.FIELDS.COUNT
Num_Campos = total_campos
'========================== Construcción de la cadena de consulta
cActual= ""   ' Sirve para agregar el filtro que lea solo el ultimo registro de las tablas que tienen el campo Actual
cadena1 =  "SELECT " + Tabla + "." + "Id_" + Tabla + " AS CVDAccion, "
IF UCASE(TABLA) <> "CARDDATOSPERSONALES" THEN
   cadena1 =  Cadena1+"CardDatosPersonales.RFC,"
END IF
FOR x = 0 TO total_campos-1
 	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	 	IF ucase(Ob_RS(x).NAME) <> ucase("Id_"+Tabla) THEN 
	        cadena1 = cadena1 +MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
		END IF 	
	ELSE
	    cadena1 = cadena1 + Tabla + "." + Ob_RS(x).NAME + ","
	    IF cActual = "" AND SESSION("PERFIL")= "PERFIL 4" THEN
	       IF UCASE(Ob_RS(x).NAME) = "ID_CARCACTUAL" THEN
	          cActual = " AND ID_CARCACTUAL = 1 " ' que solo sea el registro actual el que muestre
	       END IF 
	    END IF 
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
    cadena6 = MID(cadena1,1,LEN(cadena1)-1) + ","+ tabla+".Id_CARdDatospersonales  FROM " + cadena3 
ELSE
	cadena6 = MID(cadena1,1,LEN(cadena1)-1) +","+ tabla+".Id_CARdDatospersonales  FROM " + cadena3 + " WHERE "
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
	  	
	     Fech = cDateFormat(request(Ob_RS(x).NAME),9)
		 FTemp = CSTR(Fech)
		 MDAFecha = mid(FTemp,4,2)+"/"+mid(FTemp,1,2)+"/"+mid(FTemp,7,4)
		 Fech = MDAFecha
		  
          IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
'	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + request(Ob_RS(x).NAME)+ "'"
	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + Fech + "'"
          ELSE
'			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + request(Ob_RS(x).NAME) + "'"
			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " >= " + "'" + Fech + "'"
          END IF 
	END IF '	IF Ob_RS(x).TYPE = 135 

END IF ''' v_AP_FECHA   = cDateFormat(Request.form("FECHA_NVA_AP_TRI"),9)'' Fecha de AP a verificar

    IF	Ob_RS(x).TYPE = 135 AND request(Ob_RS(x).NAME+"_N") <> "" THEN
	     Fech = cDateFormat(request(Ob_RS(x).NAME+"_N"),9)
		 FTemp = CSTR(Fech)
		 MDAFecha = mid(FTemp,4,2)+"/"+mid(FTemp,1,2)+"/"+mid(FTemp,7,4)
		 Fech = MDAFecha
	    IF RIGHT(RTRIM(sql),5) = "WHERE" THEN	
		    sql = sql + Tabla + "." + Ob_RS(x).NAME + " <= " + "'" + Fech + "'"
        ELSE		
			sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " <= " + "'" + Fech + "'"
        END IF
     END IF
		
NEXT
  IF UCASE(TABLA) = "CARDDATOSPERSONALES" THEN
     CAD3 = "CARDDATOSPERSONALES.ApellidoPaterno,CARDDATOSPERSONALES.ApellidoMaterno,CARDDATOSPERSONALES.Nombre"
     cad2 = "null,null,CARdDatosPersonales.ApellidoPaterno+' '+CARdDatosPersonales.ApellidoMaterno +' '+CARdDatosPersonales.Nombre AS CARdDatosPersonales"
     Sql = REPLACE (sql, CAD3, cad2)
     'RESPONSE.END
  ELSE   
    cad1 = "CARdDatosPersonales.CARdDatosPersonales"
    cad2 = "CARdDatosPersonales.ApellidoPaterno+' '+CARdDatosPersonales.ApellidoMaterno+' '+CARdDatosPersonales.Nombre AS CARdDatosPersonales"
    Sql = REPLACE (sql, cad1, cad2)
  END IF 
' ==============  FIN DE CONSTRUCCION DE CADENA
SQL = SQL + cActual


''___________________ Anexo a la cadena  <>}}}}*>

IF Session("TipoUSR") = 4 THEN
 
 Sql = Sql & " AND CARdDatosPersonales.CARRERA = 1"
 
ELSEIF Session("TipoUSR") = 5 THEN

  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND CARRERA = 1"
  
ELSEIF Session("TipoUSR") = 6 THEN
  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") & " AND CARRERA = 1"
  
ELSEIF Session("TipoUSR") = 7 THEN
  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") & _
              " AND "&Tabla&".Id_CARcDir_o_subsede = " & Session("Subsede") & " AND CARRERA = 1"
ELSE

  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") & _
              " AND "&Tabla&".Id_CARcDir_o_subsede = " & Session("Subsede") & " AND " &Tabla&".IdLogin = " & Session("IdLogin") & " AND CARRERA = 1"
END IF

''______

' response.write (sql)
'IF INSTR(SQL, "FechaNacimiento") <> 0 THEN
  ' CadYear =  "FechaNacimiento, year(getdate()) - year(CARDDATOSPERSONALES.FechaNacimiento),"
'  REPLACE(SQL,"FechaNacimiento,",CadYear)
'END IF 
'   response.end

' ==============  Se agrego , 1,1 para la paginacion  u la llamada a la rutina INICIAPAG	
'RESPONSE.WRITE SQL
'RESPONSE.END



Ob_RS2.Open Sql, Ob_Conn, 1,1





			IF EXCEL = 100 THEN
				''Si es igual a 100 no se pagina
			ELSE
			 EXCEL = 0 
 
			CALL INICIAPAGINA

				 END IF
 

	Num_Campos= Ob_RS2.FIELDS.COUNT
'Num_Campos = Num_Campos-Campos_Per 

			IF NOT Ob_RS2.EOF THEN %>
 	
<!--<CENTER><H2>Registros encontrados en <%'= MID(Tabla,5,LEN(TABLA)-1)%></H2><CENTER>-->
<CENTER><H2>Registros encontrados en <%RESPONSE.WRITE(REQUEST.FORM("TITU"))%></H2><CENTER>
 
<%x = -1 %>

<INPUT TYPE="button" VALUE="BUSCAR UN NUEVO REGISTRO" ONCLICK="location.href=<%= var_pagina_regreso%>" >&nbsp;&nbsp;&nbsp;
<% IF Tabla = "CARDDATOSPERSONALES" THEN %>
<!--INPUT TYPE="button" VALUE="AGREGAR UN NUEVO REGISTRO" ONCLICK="location.href=<%= "'Altas_"+Tabla+".ASP'"%>"-->
<% END IF %>
  <TABLE class="SL" border="1">
  <TR>
  <Td class="Encabezados"><B><font color="#FFFFFF">Acción </font></B></Td>
  
  <% IF Tabla <> "CARDDATOSPERSONALES" THEN %>
  <Td class="Encabezados"><B><font color="#FFFFFF">RFC </font></B></Td>
  <%ELSE %>
  <Td class="Encabezados"><B><font color="#FFFFFF"> </font></B></Td>
  <!--Td class="Encabezados"><B><font color="#FFFFFF">Nombre </font></B></Td-->
<% END IF %>
 
 <%

  CamposNoEncontrados = 0
  NoMostrar = ""
  xCampos = 0
  FOR x = 2 TO Num_Campos- 9 +xCampos
     ETIQ = ""
	 Ob_RS_Id.CLOSE
  	 consulta_Eti = "SELECT VALUE,SmallID FROM sysproperties WHERE  ID =" +CSTR(ID)  +" AND SmallID=" + CSTR(X+1)

     Ob_RS_Id.OPEN consulta_Eti, Ob_Conn
    IF NOT Ob_RS_Id.EOF THEN
      IF LEFT(OB_RS2(X+1).NAME,2) <> "D_"   THEN   ' Este Campo ES de Designaciones Especiales y no se puede ver en CarreraPGR
       	IF (MID(Ob_RS_Id(0),1,3) = "Id_") THEN
	        ETIQ = MID(Ob_RS_Id(0),4,LEN(Ob_RS_Id(0))-1) 
	      ELSE
          ETIQ = Ob_RS_Id(0)
 	      END IF 
        IF RIGHT(ETIQ,1) = "_"   THEN
         ETIQ = ""
         NoMostrar = NoMostrar + OB_RS2(X).NAME
        END IF
        IF RIGHT(ETIQ,1) = "."   THEN
         ETIQ = LEFT(ETIQ,LEN(ETIQ)-1)
        END IF
      ELSE
        XCampos = XCampos -1
      END IF 'LEFT(OB_RS2(X).NAME,2) <> "D_"'
      IF ETIQ <> "" and instr(UCASE(ETIQ),"PATERNO")=0 AND  instr(UCASE(ETIQ),"MATERNO")=0 then 
         IF instr(UCASE(ETIQ),"FONO M")<>0 THEN
''            XCampos = XCampos+1
            ETIQ = "Datos de la Persona"
         END IF 
     %>
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=ETIQ& ":" %>  </font>	</B> 
<%    END IF
   else  
      CamposNoEncontrados = CamposNoEncontrados +1  
         response.write OB_RS2(X+1).NAME
        XCampos = XCampos -1
   END IF 'NOT Ob_RS_Id.EOF 	
%>
 <%NEXT %>
<% FOR Z = 0 to CamposNoEncontrados-1 %>
      <TD class="Encabezados">
          <P ALIGN="center">
      <B>		<font color="#FFFFFF"> 	<%=OB_RS2(X-Z).NAME& ":" %>  </font>	</B> 
<% NEXT %>

  <Td class="Encabezados"><B><font color="#FFFFFF">Observaciones</font></B></Td>

  </TR>

  <%
  nRen = 0
  IF EXCEL = 100 THEN
        ''Si es igual a 100 no se pagina
		'nRen = 0 
		'DO WHILE NOT Ob_RS2.EOF


    ELSE
       EXCEL = 0 
	   'nRen = 0 
	     ' DO WHILE NOT Ob_RS2.EOF and nRen < Ob_RS2.PageSize
   END IF
  
  
	'''AKI ME KEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
' ==============  Se agrego "and nRen < Ob_RS2.PageSize" PARA LA PAGINACION	
   ''' Código Original    'DO WHILE NOT Ob_RS2.EOF and nRen < Ob_RS2.PageSize
   DO WHILE NOT Ob_RS2.EOF
    nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%>
  <TR class="Datos"> 
    <% else %>
  <TR  class="Encabezados" > 
    <% end if %>

		<% 
		FOR Campo = 0 TO Num_Campos -4 
'		response.write ("<BR>:::")
'		response.write Ob_RS2(Campo).Name 
		%>			
		   <% IF (Ob_RS2(Campo).Name = "CVDAccion") THEN %>
			     <% IF Tabla = "CARDDATOSPERSONALES" THEN %>
					<TD><a href="Carr_DosMarcos03.asp?Id_CardDatosPersonales=<%=Ob_RS2("CVDAccion")%>&TITU=<%= REQUEST("TITU")%>&tabla=<%= tabla%>"><font size="2">Detalle</font></a><br>
			     <TD><%'= Ob_RS2("RFC") %> &nbsp;</TD>
			     <% ELSE %>
					<TD><a href="Carr_DosMarcos03.asp?Id_CardDatosPersonales=<%=Ob_RS2("Id_CARdDatosPersonales")%>&TITU=<%= REQUEST("TITU")%>&tabla=<%= tabla%>"><font size="2">Detalle</font></a><br>
					<TD><%= Ob_RS2("RFC")%></TD>
			     <!--TD><%'= Ob_RS2("CARdDatosPersonales") %> &nbsp;</TD-->
			     <% END IF  'Tabla = "CARDDATOSPERSONALES" %>
			<%end if %>
<%	NEXT %>
 <% IF Tabla = "CARDDATOSPERSONALES" THEN %>
		<TD> <%= Ob_RS2("RFC") %> &nbsp;</TD>
 <% END IF %>		

<%
HIDCampos = 8 
IF Tabla = "CARDDATOSPERSONALES" THEN
  	HIDCampos = 9     
END IF

		FOR Campo = 3 TO Num_Campos - HIDCampos
		
      IF INSTR(NoMostrar,OB_RS2(Campo).name)= 0 THEN
	    	 IF (INSTR( UCASE(OB_RS2(Campo).name),"FECHA" ) <> 0) AND (TABLA <> "CARDESCOLARIDAD")  THEN  %>			
  		     <TD><%= CDATEFORMAT(Ob_RS2(Campo),2) %> &nbsp;</TD >
      <% ELSE %>
	      <% if left(ob_RS2(Campo).NAME,2)<> "D_" THEN ' Este campo es de DESIGNACIONES ESPECIALES y no se puede mostrar en Carrerapgr      %>
		   	    <TD> <%= Ob_RS2(Campo) %> &nbsp;</TD>
        <% END IF %>			 
      <% END IF %>
<%     END IF
  		NEXT 

' en la siguiente linea pone el campo OBSERVACIONES  al final de la tabla%>
 <% IF Tabla = "CARDDATOSPERSONALES" THEN %>
		<TD> <%= Ob_RS2(1) %> &nbsp;</TD>
 <% ELSE%>		
		<TD> <%= Ob_RS2(2) %> &nbsp;</TD>
 <% END IF%>		
<%	Ob_RS2.MOVENEXT
  LOOP
  
	IF EXCEL = 100 THEN
        ''Si es igual a 100 no se pagina
    ELSE
       EXCEL = 0 
       CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
   END IF
   
   
   
   
  
ELSE
	RESPONSE.WRITE "<BR>"
	RESPONSE.WRITE "<CENTER> <H3> No existe ningún registro que cumpla con los parámetros de búsqueda </H3> </CENTER>"
END IF
%>

</TABLE>

<CENTER>
<BR>
<INPUT TYPE="button" VALUE="BUSCAR UN NUEVO REGISTRO" ONCLICK="location.href=<%= var_pagina_regreso%>" >&nbsp;&nbsp;&nbsp;
<% IF Tabla = "CARDDATOSPERSONALES" THEN %>
<!--INPUT TYPE="button" VALUE="AGREGAR UN NUEVO REGISTRO" ONCLICK="location.href=<%= "'Altas_"+Tabla+".ASP'"%>"-->
<% END IF %>
<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>

 </BODY>
</HTML>

