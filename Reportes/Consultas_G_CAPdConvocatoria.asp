<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "../Seguridad/Perfil.inc" -->
<HTML>
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">

<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0
	
  Tabla = "CAPdConvocatoria"
  ODBC = "SIIFP"
  v_Id_CAPdConvocatoria = request.querystring("Id_CAPdConvocatoria")
    
  var_pagina_regreso = "'Consultas_CAPdConvocatoria.asp'"  
%>
<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS_Id = Server.CREATEOBJECT("ADODB.RECORDSET")

  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    Ob_Conn.PROVIDER="sqloledb"
   IP_Servidor = session("IP_Servidor")
   Ob_Conn.OPEN="SERVER="&IP_Servidor&";DATABASE="+ ODBC +";UID=cursos;PWD=cursos"

  consulta = "SELECT * FROM " & Tabla
  Ob_RS.OPEN consulta, Ob_Conn
    consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & Tabla & "'"
    Ob_RS_Id.OPEN consulta_Id, Ob_Conn
    ID = Ob_RS_Id(0) 
%>
<div align="center">
  <%
'--- Vaciado a una matriz local de los valores especificados en la forma anterior

total_campos = Ob_RS.FIELDS.COUNT

FOR x = 0 TO total_campos-1
  
	REDIM PRESERVE Matriz (x)

        IF (mid(Ob_RS(X).NAME,1,3) <> "Id_") AND (mid(Ob_RS(X).NAME,1,3) <> "CT_") THEN
		Matriz(x) = REQUEST.FORM(Ob_RS(x).NAME)
	ELSE
		IF UCASE(RTRIM(LTRIM(Ob_RS(X).NAME)))<>"ID_"+LTRIM(RTRIM(UCASE(Tabla))) THEN
			VAR_TMP_APD=1
		END IF
		
		var_combo = "cbx"+TRIM(MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) )
		Matriz(x) = REQUEST.FORM(var_combo)
	END IF

NEXT
%>
  <%
'--- Construcción de la cadena de consulta
cadena1 =  "SELECT " + Tabla + "." + "Id_" + Tabla + " AS CVDAccion, "
FOR x = 0 TO total_campos-1

 	IF (MID(Ob_RS(x).NAME,1,3) <> "Id_") THEN
	        cadena1 = cadena1 + Tabla + "." + Ob_RS(x).NAME + ","
	END IF
	
	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN
	       	cadena3 = cadena3 + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
	END IF
	
	IF (MID(Ob_RS(x).NAME,1,3) = "Id_") AND (ucase(MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).Name))) <> ucase(trim(Tabla)) ) THEN
		cadena2 = cadena2 + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + ","
		cadena4 = cadena4 + Tabla + "." + Ob_RS(x).NAME + " = " + MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) + "." + Ob_RS(x).NAME + " AND "
		cadena2_1 = Tabla&"."&Ob_RS(x).NAME&","
	END IF

NEXT
%>
  <%

      IF cadena4 = "" THEN
		 cadena4 = "      "
	  END IF
	  
   cadena3 = MID(cadena3,1,LEN(cadena3)-1)
   cadena4 = MID(cadena4,1,LEN(cadena4)-5)
   cadena5 = cadena1+cadena2+cadena2_1

IF rtrim(ltrim(cadena4)) = "" THEN
    cadena6 = MID(cadena5,1,LEN(cadena5)-1) + " FROM " + cadena3 
ELSE
	cadena6 = MID(cadena5,1,LEN(cadena5)-1) + " FROM " + cadena3 + " WHERE "
	VAR_WHERE = 1
END IF


   sql = Cadena6 + cadena4
   
   
FOR x = 0 TO total_campos-1

	IF MID(Ob_RS(x).NAME,1,3) <> "Id_" AND Ob_RS(x).TYPE <> 135 AND TRIM(Matriz(x)) <> "" THEN
	  IF VAR_WHERE = 1 THEN
		  sql = sql
	  ELSE
		  sql = sql + " WHERE "
	  END IF 
	  
          IF  RIGHT(RTRIM(sql),5) = "WHERE" THEN
			  sql = sql + Tabla + "." + Ob_RS(x).NAME + " LIKE " + "'%" + Matriz(x) + "%'" 
	      ELSE   
			  sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " LIKE " + "'%" + Matriz(x) + "%'" 
          END IF
          
          IF ((RIGHT(RTRIM(sql),5) = "WHERE") AND (TRIM(Matriz(x)) = "")) THEN
			sql = MID(sql,len(sql)-5,len(sql))
          END IF
	END IF

	IF MID(Ob_RS(x).NAME,1,3) = "Id_" AND TRIM(Matriz(x)) <> "" THEN
	  IF VAR_WHERE = 1 THEN
		  sql = sql
	  ELSE
		  sql = sql + " WHERE "
	  END IF 
	  	
          IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " = " + Matriz(x) 
          ELSE
			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " = " + Matriz(x) 
          END IF
	END IF

	IF Ob_RS(x).TYPE = 135 AND TRIM(Matriz(x)) <> "" THEN
	  IF VAR_WHERE = 1 THEN
		  sql = sql
	  ELSE
		  sql = sql + " WHERE "
	  END IF 
	  	
          IF RIGHT(RTRIM(sql),5) = "WHERE" THEN
	  		 sql = sql + Tabla + "." + Ob_RS(x).NAME + " = " + "'" + Matriz(x) + "'"
          ELSE
			 sql = sql + " AND " + Tabla + "." + Ob_RS(x).NAME + " = " + "'" + Matriz(x) + "'"
          END IF
	END IF		
NEXT


	Sql = Sql & " WHERE CAPdConvocatoria.Id_CAPdConvocatoria = " & v_Id_CAPdConvocatoria

'response.write (Sql)
'response.end

Ob_RS2.Open Sql, Ob_Conn

Num_Campos= Ob_RS.FIELDS.COUNT 

IF NOT Ob_RS2.EOF THEN %>
  <!--- Consulta para sacar la descripción de los campos---------------------------------------------------------------- --->
  <%
  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" & "'" & ID & "'"
  Ob_Etiq_RS.OPEN Etiq_Nor, Ob_Conn
  total_campos_Etiq_Nor = Ob_Etiq_RS.FIELDS.COUNT
%>
  <!--- ---------------------------------------------------------------------------------------------------------------- --->
  <%'%>
  <%x = -1 %>

<TABLE border=1>
  <TR>

	<%For Campo = 0 to Num_Campos - 1%>
		   <% IF TRIM(Ob_RS2(Campo).Name) = "CVDAccion" AND (v_Id_CAPdConvocatoria = "") THEN %>
              <TD BGCOLOR = "#3CA0BD">
              <P ALIGN="center">            
              <B>		<font color="#00003C"> 	<%= " - " %>  </font>	</B> 
			<%END IF
		NEXT%> 

  
  <%DO UNTIL Ob_Etiq_RS.Eof%>

   	    <%IF MID((Ob_Etiq_RS(0)),1,3) <> "Id_" AND MID((Ob_Etiq_RS(0)),1,3) <> "TI_" THEN%>
              <TD BGCOLOR = "#3CA0BD">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=Ob_Etiq_RS(0) & ":" %>  </font>	</B> 
   	    <%END IF 
   
        Ob_Etiq_RS.MoveNext

    LOOP%>
  </TR>
<!--- ================================================================================================================ --->
  <%Ob_Etiq_RS.MoveFirst
    DO UNTIL Ob_Etiq_RS.Eof

      	  IF (MID(Ob_Etiq_RS(0),1,3) = "Id_") AND (MID(Ob_Etiq_RS(0),1,3) <> "TI_")THEN%>
              <TD BGCOLOR = "#3CA0BD">
              <P ALIGN="center">
              <B>		<font color="#000000"> 	<%=MID ( Ob_Etiq_RS(0),4,LEN(Ob_Etiq_RS(0)) )& ":" %>  </font>	</B> 
      	  <%END IF
          
          Ob_Etiq_RS.MoveNext

    LOOP%>
  </TR>
    
<!--- ================================================================================================================ --->

  <%
	nRen = 0 
	DO UNTIL Ob_RS2.EOF
	nRen = nRen + 1
		if (nRen mod 2) = 0 then 
	%>
  <TR > 
    <% else %>
  <TR >  
    <% end if %>
    
		<%FOR Campo = 0 TO Num_Campos - 1			
		    IF (Ob_RS2(Campo).Name = "CVDAccion") AND (v_Id_CAPdConvocatoria = "") THEN %>
					<TD><a href="Altas_CAPdSolicitud.asp?Id_CAPdCurso=<%= Ob_RS2(Campo)%>"><font size="2">Dar de alta solicitud</font></a>
			<%Else
			    IF (Ob_RS2(Campo).Name <> "CVDAccion") AND (MID(Ob_RS2(Campo).Name,1,3) <> "LK_") AND (MID(Ob_RS2(Campo).Name,1,3) <> "ML_") THEN%>
					<TD> <font color="000000"><%= Ob_RS2(Campo)%></font> &nbsp; </TD>
				<%END IF%>
		  <%END IF
		  
		IF (MID(Ob_RS2(Campo).Name,1,3) = "LK_") THEN %>
		<TD> <A HREF="<%= Ob_RS2(Campo) %>"><font color="000000"><%= Ob_RS2(Campo) %></font></A> &nbsp; </TD>
		<%
		END IF
		%>  

		<%IF (MID(Ob_RS2(Campo).Name,1,3) = "ML_") THEN %>		
		<TD> <p align="center" style="margin-top: 0; margin-bottom: 0"> <font color="000000"><%= Ob_RS2(Campo)%></font> <IMG border="0" src="MailTo.jpg" onClick="parent.location='mailto:<%= Ob_RS2(Campo)%>'"> </TD>
		<%																					
		END IF
		%>  
		
		<%  NEXT
		
		Ob_RS2.MOVENEXT
		
	LOOP%>
	</TR>

<%
ELSE
	RESPONSE.WRITE "<BR>"
	RESPONSE.WRITE "<CENTER> <H3> No existe ningún registro que cumpla con los parámetros de búsqueda </H3> </CENTER>"
END IF
%>

</TABLE>

<% If v_Id_CAPdConvocatoria = "" THEN %>

<CENTER>

<% End If %>
<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>




<%
  var_alerta = Request.QueryString ("band_Alerta")
  
  If var_alerta = 1 Then
%>

<SCRIPT LANGUAGE='JavaScript'>
{
	alert ("El curso ha sido agregado correctamente.")
}
</SCRIPT>


<%End If%>





 </BODY>

</HTML> 

<!-- #INCLUDE File="../Error/errores.inc" -->