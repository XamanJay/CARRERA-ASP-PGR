<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #INCLUDE File="Paginas.inc"-->
<!-- #INCLUDE File="Utilerias.vbs" -->
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO
NumPerPage = 5
%>
<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
'  Tabla = REQUEST("tabla_original")
  Tabla = "CARDNOMBRAMIENTOS"
  ODBC = SESSION("ODBC")
  ID = REQUEST.FORM("ID") 
'  IdMaestro = REQUEST("IdMaestro")
  var_pagina_regreso = "'Consultas_"+ TRIM(Tabla)  +".asp'"
  IdMaestro = "Id_CARdDatosPersonales" 
'  var_pagina_regreso = "'Modificaciones_"+ TRIM(Tabla)  +".asp'"
  idPer= request(IdMaestro)
'response.write(">>IDPER>>:"+idPer)
'response.write(">>IDMAESTRO>>:"+iDmaestro)
'  response.write Tabla
   OpcionVer = "Modificaciones_"+tabla+".asp"
   OpcionAlta = "altas_"+tabla+".asp"
'  response.write Tabla
%>

<TITLE><%= "Consultas de " + request("TIT")%></TITLE>

<%
'response.write(request.form)
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS3 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")

  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

    consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & Tabla & "'"
    Ob_RS_Id.OPEN consulta_Id, Ob_Conn
    ID = Ob_RS_Id("Id")

  consulta = "SELECT * FROM " & Tabla +" ORDER BY Fecha_nombramiento desc"
  Ob_RS.OPEN consulta, Ob_Conn

total_campos = Ob_RS.FIELDS.COUNT

'========================== Construcción de la cadena de consulta
cActual= ""   ' Sirve para agregar el filtro que lea solo el ultimo registro de las tablas que tienen el campo Actual
cOrder = ""  ' Esta variable sirve para agregar un orden cuando la tabla tiene un campo tipo Fecha , toma el primer campo

cadena1 =  "SELECT " + Tabla + "." + "Id_" + Tabla + " AS CVDAccion, "
FOR x = 0 TO total_campos-1
 	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	 	IF ucase(Ob_RS(x).NAME) <> ucase("Id_"+Tabla) THEN 
	        cadena1 = cadena1 +MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
		END IF 	
	ELSE
	    cadena1 = cadena1 + Tabla + "." + Ob_RS(x).NAME + ","
	    IF cActual = "" AND SESSION("PERFIL")= "PERFIL 4" THEN
	       IF UCASE(Ob_RS(x).NAME) = "ID_CARCSINO" THEN
	          cActual = " AND Id_CARcSINO = 1 " ' que solo sea el registro actual el que muestre
	       END IF 
	    END IF 
	    If cOrder = "" THEN
	       IF (UCASE(MID(Ob_RS(x).NAME,1,5)) = "FECHA" AND MID(Ob_RS(x).NAME,6,1) <> "_" )OR UCASE(MID(Ob_RS(x).NAME,1,4)) = "ANIO" THEN
	          cOrder = " Order by " + Ob_RS(x).NAME + " DESC"
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
    cadena6 = MID(cadena1,1,LEN(cadena1)-1) +","+ tabla+".Id_CARdDatospersonales FROM " + cadena3 
ELSE
	cadena6 = MID(cadena1,1,LEN(cadena1)-1) +","+ tabla+".Id_CARdDatospersonales FROM " + cadena3 + " WHERE "
	VAR_WHERE = 1
END IF


   sql = Cadena6 + cadena4
   
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
SQL = SQL + " AND "+Tabla+"."+IdMaestro+" = "+Idper
'response.write SQL
'response.end



''___________________ Anexo a la cadena para filtrar por subprocuraduria , etc...   >((((()))):>

IF Session("TipoUSR") = 4 THEN
 
 Sql = Sql
 
ELSEIF Session("TipoUSR") = 5 THEN

  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") 
  
ELSEIF Session("TipoUSR") = 6 THEN
  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") 
  
ELSEIF Session("TipoUSR") = 7 THEN
  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") & _
              " AND "&Tabla&".Id_CARcDir_o_subsede = " & Session("Subsede")
ELSE

  Sql = Sql & " AND "&Tabla&".Id_CARcSubprocuradurias = " & session("Subprocuraduria") & " AND "&Tabla&".Id_CARcDG_o_Delegaciones = " & Session("Delegacion") & _
              " AND "&Tabla&".Id_CARcDir_o_subsede = " & Session("Subsede") & " AND " &Tabla&".IdLogin = " & Session("IdLogin")
END IF



' ==============  FIN DE CONSTRUCCION DE CADENA
SQL = SQL + cOrder
SQL = SQL + cActual

IF ucase(TABLA) = "CARDNOMBRAMIENTOS" THEN
SQL = SQL + " ORDER BY Fecha_Ingreso"
END IF
'response.write (sql)
'IF REQUEST("FLAG") = "1" THEN
'response.end
'END IF 

' ==============  Se agrego , 1,1 para la paginacion  u la llamada a la rutina INICIAPAG	
Ob_RS2.Open Sql, Ob_Conn, 1,1
'CALL INICIAPAGINA 

Num_Campos= Ob_RS.FIELDS.COUNT 

IF NOT Ob_RS2.EOF THEN %>
 	
<CENTER><H2>Registros encontrados en <%= request("TIT")%></H2><CENTER>
 
<%x = -1 
IF ucase(TABLA) = "CARDNOMBRAMIENTOS" THEN
   CALL PNombramiento
END IF ' ID_CARdNombramientos 
%>
  <TABLE class="SL" border="1">
  <TR>
  <Td class="Encabezados"><B><font color="#FFFFFF">Acción </font></B></Td>
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Cargo:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Categoria:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Especialidad:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Nivel:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Fecha de nombramiento:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Cargo de Estructura:  </font>	</B> 

              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Adscripción:  </font>	</B> 
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	Actual ? </font>	</B> </TD> 



  </TR>

  <%
	nRen = 0 
' ==============  Se agrego "and nRen < Ob_RS2.PageSize" PARA LA PAGINACION	
   DO WHILE NOT Ob_RS2.EOF 'and nRen < Ob_RS2.PageSize
    nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%>
  <TR class="Datos"> 
    <% else %>
  <TR  class="Encabezados" > 
    <% end if %>
		<TD class="Encabezados"> <font size="2" face="Arial, Helvetica, sans-serif"> 
			<a href="Modificaciones_<%= Tabla%>.asp?lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&ParamId=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=VER"><font size="2">Ver</font></a><br>
		    <% IF PuedeModificar(Tabla)  THEN%>
			<a href="Modificaciones_<%= Tabla%>.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=MODI"><font size="2">Modificar</font></a><br>
		    <% END IF %>
		    <% IF UCASE(SESSION("PERFIL")) = "PERFIL 1" AND uCASE(Tabla) <> "CARDDATOSPERSONALES" THEN%>
			<a href="BajasOpr.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&Paramtabla=<%=Tabla%>"><font size="2">Borrar</font></a><br>
		    <% END IF %>
		    <% IF UCASE(SESSION("PERFIL")) = "PERFIL 1" AND uCASE(Tabla)= "CARDDATOSPERSONALES" THEN%>
			<a href="ValidadoOpr.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&Paramtabla=<%=Tabla%>"><font size="2">Validado ?</font></a><br>
		    <% END IF %>
	  </TD>	
	<TD><%=OB_RS2("CARcTipoNombramiento") %>&nbsp;</TD>
	<TD><%=OB_RS2("CARcCategoria") %>&nbsp;</TD>
	<TD><%=OB_RS2("CARcEspecialidad")%> &nbsp;</TD>
	<TD><%=OB_RS2("CARcNivel")%> &nbsp;</TD>
	<TD><%=OB_RS2("Fecha_nombramiento")%> &nbsp;</TD>
	<TD><%=OB_RS2("Cargo")%> &nbsp;</TD>
	<TD><%=OB_RS2("Adscripcion") %>&nbsp;</TD>
	<TD><% =OB_RS2("CARcSINO")	%>&nbsp;</TD>
	</TR>
<%		Ob_RS2.MOVENEXT
  LOOP
	
'  CALL FINPAGINA  ' ==============  Se agrego PARA LA PAGINACION
  
ELSE
RESPONSE.WRITE "<BR>"
RESPONSE.WRITE "<CENTER><H3>No existen registros</H3></CENTER>"
END IF
%>

</TABLE>

<CENTER>
<BR>
<% IF UCASE(Tabla) <> "CARDDATOSPERSONALES" AND PuedeAgregar(Tabla) THEN %>
<!--INPUT TYPE="button" VALUE="AGREGAR UN NUEVO REGISTRO" ONCLICK="location.href=<%= "'Altas_"+Tabla+".ASP'"%>"-->
<input type="button" value="AGREGAR REGISTRO" onClick="location.href='<%= opcionAlta%>?<%= IdMaestro%>=<%= idPer %>&oper=ALTA'" >
<% END IF %>


<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>

</BODY>
</HTML>

<%
SUB PNombramiento 
   CARcTipo_ingreso= OB_RS2("CARcTipo_ingreso")
   Fecha_ingreso= OB_RS2("Fecha_ingreso")
   CARcTipoNombramiento= OB_RS2("CARcTipoNombramiento")
%>
<table>
<TR>
<TD> <B>Tipo de ingreso:</B></TD>
<TD>   <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=20 MAXLENGTH=50 VALUE=<%= CARcTipo_ingreso%>> <BR></TD>
</TR>
<TR>
<TD>    <B>Fecha de ingreso:</B></TD>
<TD>  <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=12 MAXLENGTH=50 VALUE=<%= Fecha_ingreso%>> <BR></TD>
</TR>
<TR>
<TD>   <B>Cargo:</B></TD>
<TD> <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=50 MAXLENGTH=50 VALUE=<%=  CARcTipoNombramiento%>><BR></TD>
</TR>
</table>
<%
'OB_RS2.movenext
END SUB

 FUNCTION PuedeAgregar(Pantalla)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%Altas_"+Pantalla+"%'"
'  response.write "idper:"
'  response.write idper
 '  response.end
    Ob_RS3.OPEN consulta, Ob_Conn,2, 3, 1
	PuedeAgregar = NOT(Ob_RS3.EOF)
    OB_RS3.CLOSE

 END FUNCTION

 FUNCTION PuedeModificar(Pantalla)
    Consulta = "Select * from Vista_PantallaUsuario Where Id_CARcUSR ="+CSTR(Session("IdLogin"))+ " AND CARcPaginas like '%Modificaciones_"+Pantalla+"%'"
'  response.write "idper:"
'  response.write idper
 '  response.end
    Ob_RS3.OPEN consulta, Ob_Conn,2, 3, 1
	PuedeModificar = NOT(Ob_RS3.EOF)
    OB_RS3.CLOSE
 END FUNCTION


%>