<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #INCLUDE File="Paginas.inc"-->
<!-- #INCLUDE File="Utilerias.vbs" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<% '========= numero de registros que muestra en el grid Resultado de la consulta CONSULTASFILTRO
NumPerPage = 5
%>
<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0" vlink="#FFFFFF" alink="#FFFFFF" link="#FFFFFF">

<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
  Tabla = REQUEST("tabla_original")
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

  consulta = "SELECT * FROM " & Tabla 
  Ob_RS.OPEN consulta, Ob_Conn

total_campos = Ob_RS.FIELDS.COUNT

'========================== Construcción de la cadena de consulta
cActual= ""   ' Sirve para agregar el filtro que lea solo el ultimo registro de las tablas que tienen el campo Actual
cOrder = ""  ' Esta variable sirve para agregar un orden cuando la tabla tiene un campo tipo Fecha , toma el primer campo
cadena1 =  "SELECT " + Tabla + "." + "Id_" + Tabla + " AS CVDAccion, "
'response.write SESSION("PERFIL") + "<br>"
FOR x = 0 TO total_campos-1
'response.write SESSION("PERFIL") + "<br>"
 	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	 	IF ucase(Ob_RS(x).NAME) <> ucase("Id_"+Tabla) THEN 
	        cadena1 = cadena1 +MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
		END IF 	
	    IF cActual = "" AND SESSION("PERFIL")= "PERFIL 4" THEN
		
		  
		
	       IF UCASE(Ob_RS(x).NAME) = "ID_CARCACTUAL" AND Tabla <> "CARdSituacionLaboral"  THEN
	          cActual = " AND CARCACTUAL LIKE '%SI%' " ' que solo sea el registro actual el que muestre
			  
	       END IF 
	       IF UCASE(Ob_RS(x).NAME) = "ID_CARCSINO" THEN
	          cActual = " AND CARcSINO LIKE '%SI%' "   ' que solo sea el registro actual el que muestre
	       END IF 
	    END IF 
	ELSE
	    cadena1 = cadena1 + Tabla + "." + Ob_RS(x).NAME + ","
	    If cOrder = "" THEN
'	    response.write("<BR>"+Ob_RS(x).NAME)
	       IF (UCASE(MID(Ob_RS(x).NAME,1,5)) = "FECHA" AND ucase(right(Ob_RS(x).NAME,7)) <> "CAPTURA" )OR UCASE(MID(Ob_RS(x).NAME,1,4)) = "ANIO" THEN
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
'reSponse.write Cadena1
IF cadena4 = "" THEN
   cadena4 = "      "
 END IF
	  
   cadena3 = MID(cadena3,1,LEN(cadena3)-1)
   cadena4 = MID(cadena4,1,LEN(cadena4)-5)

IF rtrim(ltrim(cadena4)) = "" THEN
''    cadena6 = MID(cadena1,1,LEN(cadena1)-1) +","+ tabla+".Id_CARdDatospersonales FROM " + cadena3 
    cadena6 = MID(cadena1,1,LEN(cadena1)-1) +" FROM " + cadena3 
ELSE
	cadena6 = MID(cadena1,1,LEN(cadena1)-1) +" FROM " + cadena3 + " WHERE "
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



''___________________ Anexo a la cadena para filtrar por subprocuraduria , etc...   >((((())))*>
'Esta pantalla solo mostrara los registros que cada uno de los usuarios halla grabado. Esto es para
' para que los usuarios que pueden ver todo los registros de personas, SOLO puedan ver los registros de datos
' que c/uno de los usuarios halla capturado  --Exepto para OAI49 y COPLADII36DSC--El usuario OM40DGRH tambien puede consultar
' todos los registros de adscripciones  de todas las personas
'

 USUARIO_1 = Session("UserLogin")
 
 ''RESPONSE.WRITE Tabla & "<-- TABLA"
 ''RESPONSE.WRITE USUARIO_1 & "<--USUARIO"
 
	IF Tabla = "CARDDATOSPERSONALES"   THEN

			
					Sql = Sql '& " AND CARdDatosPersonales.CARRERA = 1"
					
	ELSEIF USUARIO_1 = "COPLADII36DSC"         THEN			
	
			Sql = Sql '& " AND CARdDatosPersonales.CARRERA = 1"

    ELSEIF USUARIO_1 = "OM40DGRH"         THEN			
	
			Sql = Sql '& " AND CARdDatosPersonales.CARRERA = 1"
			
   ELSEIF USUARIO_1 = "OAI49_C"         THEN			
	
			Sql = Sql '& " AND CARdDatosPersonales.CARRERA = 1"
			
	
	ELSEIF USUARIO_1 =  "OAI49" AND Tabla <> "CARdProcedimientos"        THEN 
		
	       		Sql = Sql '& " AND CARdDatosPersonales.CARRERA = 1"
				
				
		'Solo ve los procedimientos que el usuario OAI49 dio de alta	 
	ELSEIF USUARIO_1 =  "OAI49" AND Tabla = "CARdProcedimientos"        THEN 
		
		
	    
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
					
					
					
	
			ELSE 
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

			
         END IF

     Sql = replace(sql,"CARdAdscripciones.IdAdscripcion,"," CARcSubprocuradurias1.CARcSubprocuradurias as IdAdscripcion,")
     Sql = replace(sql," FROM "," FROM  CARcSubprocuradurias CARcSubprocuradurias1,")
     Sql = replace(sql," WHERE ","  WHERE CARdAdscripciones.IdAdscripcion = CARcSubprocuradurias1.Id_CARcSubprocuradurias AND ")

' ==============  FIN DE CONSTRUCCION DE CADENA
SQL = SQL + cActual
SQL = SQL + cOrder

'IF ucase(TABLA) = "CARDNOMBRAMIENTOS" THEN
'SQL = SQL + " ORDER BY Fecha_Ingreso"
'END IF
''response.write (sql)
'IF REQUEST("FLAG") = "1" THEN
'response.end
'END IF 

'''jvi   response.write SQL
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
 
 <% 
 CamposNoEncontrados = 0
NoMostrar = ""
FOR x = 2 TO Num_campos-8 

	 Ob_RS_Id.CLOSE
   	 consulta_Eti = "SELECT VALUE,SmallID FROM sysproperties WHERE  ID =" +CSTR(ID)  +" AND SmallID=" + cstr(x+1)
     Ob_RS_Id.OPEN consulta_Eti, Ob_Conn

    IF NOT Ob_RS_Id.EOF THEN
     IF INSTR( UCASE(Ob_RS_Id(0)),"PERSONA" ) = 0  THEN
    	IF (MID(Ob_RS_Id(0),1,3) = "Id_") THEN
	       ETIQ = MID(Ob_RS_Id(0),4,LEN(Ob_RS_Id(0))-1) 
	    ELSE
         ETIQ = Ob_RS_Id(0)
 	    END IF 
      IF LEFT(OB_RS2(X).NAME,2) <> "D_"   THEN   ' Este Campo ES de Designaciones Especiales y no se puede ver en CarreraPGR
         IF RIGHT(ETIQ,1) = "_"   THEN
            ETIQ = ""
            NoMostrar = NoMostrar + OB_RS2(X).NAME
         END IF
         IF RIGHT(ETIQ,1) = "."   THEN
            ETIQ = LEFT(ETIQ,LEN(ETIQ)-1)
         END IF
         IF ETIQ <> "" THEN
     %>
              <TD class="Encabezados">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=ETIQ& " " %>  </font>	</B> 
<%       END IF 
      END IF
      END IF 
   else  
      CamposNoEncontrados = CamposNoEncontrados +1  
   END IF 	
%>

 <%  NEXT %>
<% FOR Z = 0 to CamposNoEncontrados-1%>
      <TD class="Encabezados">
          <P ALIGN="center">
      <B>		<font color="#FFFFFF"> 	<%=OB_RS2(X+Z-1).NAME& " " %>  </font>	</B> 
<% NEXT %>

  <Td class="Encabezados"><B><font color="#FFFFFF">Subprocuraduría</font></B></Td>
  <Td class="Encabezados"><B><font color="#FFFFFF">Delegación o Dir. Gral.</font></B></Td>
<!--  <Td class="Encabezados"><B><font color="#FFFFFF">Area</font></B></Td>
-->  <Td class="Encabezados"><B><font color="#FFFFFF">Observaciones</font></B></Td>

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
			<a href="Modificaciones_<%= Tabla%>.asp?Id_Persona=<%=idPer%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&ParamId=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=VER"><font size="2">Ver</font></a><br>
	<% IF uCASE(Tabla)= "CARDFICHA"  THEN%>
		
		    <% IF PuedeModificar(Tabla)  THEN%>
			<a href="Modificaciones_<%= Tabla%>.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=MODI"><font size="2">Modificar</font></a><br>
		    <% END IF %>
			
	<% ELSE %>
		
		    <% IF PuedeModificar(Tabla)  THEN%>
			<a href="Modificaciones_<%= Tabla%>.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=MODI"><font size="2">Modificar</font></a><br>
		    <% END IF %>
			
		    <% IF UCASE(SESSION("PERFIL")) = "PERFIL 1" AND uCASE(Tabla) <> "CARDDATOSPERSONALES" THEN%>
			<!--a onclick ='Confirmar(<%= IdPer%>)' href="BajasOpr.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&Paramtabla=<%=Tabla%>"><font size="2">Borrar</font></a><br-->
			<a onclick ='Confirmar(<%=Ob_RS2("CVDAccion")%>)' href="#C4">Borrar</font></a><br>
		    <% END IF %>
			
    <% END IF %>
	   
			<% IF uCASE(Tabla)= "CARDDATOSPERSONALES"  THEN%>
			<a href="CARdMuestraFotos.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroID=<%= ID%>&TOper=MODI"><font size="2">Imagenes</font></a><br>
			<% END IF %>
			
		    <% IF (UCASE(SESSION("PERFIL")) = "PERFIL 1" OR UCASE(SESSION("PERFIL")) = "PERFIL 2" OR UCASE(SESSION("PERFIL")) = "PERFIL 3") THEN 'AND uCASE(Tabla)= "CARDDATOSPERSONALES" THEN%>
			<a href="ValidadoOpr.asp?Id_Persona=<%=idPer%>&ParamId=<%=Ob_RS2("CVDAccion")%>&Paramtabla=<%=Tabla%>"><font size="2">¿Validado?</font></a><br>
		    <% END IF %>

	  </TD>	
		<% 
		FOR Campo = 2 TO Num_Campos - 8 
		IF INSTR( UCASE(OB_RS2(Campo).name),"DATOSPERSONALES" ) = 0 THEN
		 IF INSTR( UCASE(OB_RS2(Campo).name),"FECHA" ) <> 0 AND TABLA <> "CARDESCOLARIDAD" THEN  %>	
		      <% IF  ISNULL(ob_RS2(Campo)) THEN  %>
			          <TD>&nbsp;</TD>
		    	<% ELSE %>
			          <TD><%= CDATEFORMAT(Ob_RS2(Campo),2) %> </TD >
			     <%END IF 	 
			 %>
     <% ELSE %>
	     <% if left(ob_RS2(Campo).NAME,2)<> "D_" THEN ' Este campo es de DESIGNACIONES ESPECIALES y no se puede mostrar en Carrerapgr%>
			 
			 <%  if TRIM(UCASE(ob_RS2(Campo))) = "SELECCIONAR" THEN ' Este campo es de DESIGNACIONES ESPECIALES y no se puede mostrar en Carrerapgr      %>
		   	         <TD>&nbsp;</TD>
             <% ELSE %>			 
		   	         <TD><%= Ob_RS2(Campo) %> &nbsp;</TD>
             <% END IF %> 
			 
			 
         <% END IF %>			 
      <% END IF %>
      <% END IF %>
<%		NEXT
' en la siguiente linea pone el campo OBSERVACIONES  al final de la tabla%>
		<TD> <%= Ob_RS2("CARcSubprocuradurias") %> </TD>
		<TD> <%= Ob_RS2("CARcDG_o_Delegaciones") %> </TD>
		<!--<TD> <%''POR EL MOMENTO ESTO DEBE NO DEBE DE APARECER YA QUE ESTOS DATOS NO SE TIENEN
    ' if  INSTR( UCASE(OB_RS2("CARcDir_o_subsede")),"SELECCIONE" ) = 0  then
        ' RESPONSE.WRITE Ob_RS2("CARcDir_o_subsede")
    ' END IF
    %>&nbsp; 
    </TD>-->
		<TD> <%= Ob_RS2(1) %> </TD>
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
<script>
function Confirmar(ParamId)
{
	res = confirm("¿Esta seguro de eliminar los elementos seleccionados?")
	if (res)
	{
		document.location="BajasOpr.asp?ParamId="+ParamId+"&Paramtabla=<%=Tabla %>"
    //+"&Paramtabla="+<%=Tabla %>
//alert(ParamId)
    //+ParamId+"&Paramtabla="+<%=Tabla %>
	}
	else
	{
		document.location="BajasOpr.asp?"
	}	
}

</script>
<%
SUB PNombramiento 
   CARcTipo_ingreso= OB_RS2("CARcTipo_ingreso")
   Fecha_ingreso= OB_RS2("Fecha_ingreso")
   CARcTipoNombramiento= OB_RS2("CARcTipoNombramiento")
%>
<table>
<TR>
<TD> <B>Tipo de ingreso</B></TD>
<TD>   <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=20 MAXLENGTH=50 VALUE=<%= CARcTipo_ingreso%>> <BR></TD>
</TR>
<TR>
<TD>    <B>Fecha de ingreso</B></TD>
<TD>  <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=12 MAXLENGTH=50 VALUE=<%= Fecha_ingreso%>> <BR></TD>
</TR>
<TR>
<TD>   <B>Cargo</B></TD>
<TD> <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=50 MAXLENGTH=50 VALUE='<%=  CARcTipoNombramiento%>'><BR></TD>
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
