<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->

<HTML>
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">


<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<%

  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0

  Tabla = REQUEST("tabla_original")
  IdMaestro = REQUEST("IdMaestro")
  ODBC = REQUEST("ODBC") 
  ID = REQUEST("ID") 

  IdMaestro = "Id_"+IdMaestro 
  var_pagina_regreso = "'Modificaciones_"+ TRIM(Tabla)  +".asp'"
  idPer= request(IdMaestro)

   OpcionVer = "Modificaciones_"+tabla+".asp"
   OpcionAlta = "altas_"+tabla+".asp"
   ListaDesempeno = "CT_ComprensionResponsabilidadSocial,CT_CompromisoLaboral,CT_ConsecusionResultados,CT_SatisfaccionNecesidadesClientes,CT_DemostracionExperienciaTecnica,CT_CapacidadTrabajoEquipo,CT_MenteAbiertaCambio_CapacidadAprendizaje,CT_Negociacion_ResolucionConflictos,CT_Objetividad,CT_Delegacion,CT_DireccionPersonal_GruposTrabajo,CT_FacilitacionDesarrolloDePersonal,CT_RelacionesInterpersonales,CT_HabilidadVerbal"
   
   pIDTabla2  = "Id_"+tabla
%>
<TITLE> 
 <%= "Modificacion de " + (MID((Tabla),4,LEN(TABLA))) + " Desplegado de la b�squeda"%>
</TITLE>

<%

Set Ob_Conn = Server.CreateObject("ADODB.Connection")
Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
Set Ob_RS2 = Server.CreateObject("ADODB.RecordSet")
Set Ob_RS_Id = Server.CreateObject ("ADODB.RecordSet")


Set Ob_Etiq_RS = Server.CreateObject("ADODB.RecordSet")
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

'=====
      consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND upper(name) = '" & Tabla & "'"
      Ob_RS_Id.OPEN consulta_Id, Ob_Conn
      ID = Ob_RS_Id(0)
'=====	 	      


server.scripttimeout = 200

  consulta = "SELECT * FROM " & Tabla
  Ob_RS.OPEN consulta, Ob_Conn
response.write consulta

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
'--- Construcci�n de la cadena de consulta
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
    cadena6 = MID(cadena5,1,LEN(cadena5)-1) + " Id_CARdDatosPersonales FROM " + cadena3 
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
SQL = SQL + " AND "+IdMaestro+" = "+Idper
%>


<% total_campos = Ob_RS.FIELDS.COUNT %>

<%
response.write(sql)
'response.end

Ob_RS2.Open Sql, Ob_Conn

  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" & "'" & ID & "'"
  Ob_Etiq_RS.OPEN Etiq_Nor, Ob_Conn
  total_campos_Etiq_Nor = Ob_Etiq_RS.FIELDS.COUNT


Num_Campos= Ob_RS.Fields.Count 
If Not Ob_RS2.EoF Then %>
	<center><H2>Registros de <%= (MID((Tabla),5,LEN(TABLA)))%></H2><center>

<table border = 1 >
<tr>
	<%For Campo = 0 to Num_Campos - 1%>
		   <% IF TRIM(Ob_RS2(Campo).Name) = "CVDAccion" THEN %>
              <TD bgcolor="#136F9F">
              <P ALIGN="center">            
              <B>		<font color="#FFFFFF"> 	<%= "Acci�n" %>  </font>	</B> 
			<%END IF
		NEXT%> 
	  <% DO UNTIL Ob_Etiq_RS.Eof%>  
 
   	    <%IF MID((Ob_Etiq_RS(0)),1,3) <> "Id_" AND MID((Ob_Etiq_RS(0)),1,3) <> "TI_"   THEN%>
              <TD bgcolor="#136F9F">
              <P ALIGN="center">            
              <B>		<font color="#FFFFFF"> 	<%=Ob_Etiq_RS(0) & ":" %>  </font>	</B> 
   	    <%END IF 
          IF (MID(Ob_Etiq_RS(0),1,3) = "Id_") and (Ob_Etiq_RS(0) <> "Id_Datos de la persona") THEN
      	    if Ob_Etiq_RS(0) <> IdMaestro then%>
              <TD bgcolor="#136F9F">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> <%=MID ( Ob_Etiq_RS(0),4,LEN(Ob_Etiq_RS(0)) )& ":" %>  </font>	</B> 
      	    <% END IF
      	  END IF
        Ob_Etiq_RS.MoveNext

    LOOP%>
  </TR>
<!--- ================================================================================================================ --->
     
<!--- ================================================================================================================ --->
	<%DO UNTIL Ob_RS2.EOF %>
	<TR bordercolor="#136F9F" bgcolor="#EFEFEF">
		<%FOR Campo = 0 TO Num_Campos -1		
	
		    IF (Ob_RS2(Campo).Name = "CVDAccion") THEN 
		    %>
		    
			<TD>
			<a href="ModificacionesEdicion.asp?lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroCadena=<%= sql%>&parametroID=<%= ID%>&Tarea=VER"><font size="2">Ver</font></a><br>
			<a href="ModificacionesEdicion.asp?Id_Persona=<%=idPer%>&lnkIdCarros=<%=Ob_RS2("CVDAccion")%>&parametroTabla=<%= Tabla%>&parametroODBC=<%=ODBC%>&parametroCadena=<%= sql%>&parametroID=<%= ID%>"><font size="2">Modificar</font></a><br>
	  </TD>	
									    
			<%Else
			
			    IF (MID(Ob_RS2(Campo).Name,1,3) <> "LK_") AND (MID(Ob_RS2(Campo).Name,1,3) <> "ML_")  AND (Ob_RS2(Campo).Name <> "Id_"+Tabla ) AND (Ob_RS2(Campo).Name <> IdMaestro ) AND (MID(Ob_RS2(Campo).Name,1,3) <> "CT_") THEN%> 
					<TD> <%= Ob_RS2(Campo)%> &nbsp;</TD>
				<%
				END IF%>
				
		  <%END IF
<!--- --------------------------------------------------------------------------------------------------------------- --->		 		 		   
			IF (MID(Ob_RS2(Campo).Name,1,3) = "CT_") THEN 
  <!--- C�digo personalizado ------------------------------------------------------------------------------------------ --->		 
	        	IF ((Ob_RS2(Campo).NAME = "CT_CapacidadIntelectual") OR (Ob_RS2(Campo).NAME = "CT_CapacidadJuicio") OR (Ob_RS2(Campo).NAME = "CT_EstabilidadEmocional") OR (Ob_RS2(Campo).NAME = "CT_ApegoNormasValores") OR (Ob_RS2(Campo).NAME = "CT_ActitudFigurasAutoridad") OR (Ob_RS2(Campo).NAME = "CT_ManejoAgresividad") OR (Ob_RS2(Campo).NAME = "CT_RelacionesInterpersonales") OR (Ob_RS2(Campo).NAME = "CT_Adaptacion") OR (Ob_RS2(Campo).NAME = "CT_ToleranciaPresion") OR (Ob_RS2(Campo).NAME = "CT_EmpujeIniciativa") OR (Ob_RS2(Campo).NAME = "CT_Creatividad") OR (Ob_RS2(Campo).NAME = "CT_DiscresionConfiabilidad") OR (Ob_RS2(Campo).NAME = "CT_ManejoInformacionConfidencial"))  THEN
		            nombre = "PerfilPsicologico" 
				ELSE
	            	IF   instr(ListaDesempeno,Ob_RS2(Campo).NAME) <> 0 THEN
		              nombre = "CompetenciasDesempenoLaboral" 
		            ELSE
<!--- --------------------------------------------------------------------------------------------------------------- --->		 		 
		             nombre = Ob_RS2(Campo).NAME 
<!--- --------------------------------------------------------------------------------------------------------------- --->		 		 		   
		            END IF
		        END IF
					  valor = (Ob_RS2(Campo)) 
'					  response.write(nombre&":"&valor)
'					  response.end%>
			  
		   <%END IF

  
		IF (MID(Ob_RS2(Campo).Name,1,3) = "LK_") THEN %>
		<TD> <A HREF="<%= Ob_RS2(Campo) %>"><%= Ob_RS2(Campo) %></A> &nbsp; </TD>
		<%
		END IF
		%>  

		<%IF (MID(Ob_RS2(Campo).Name,1,3) = "ML_") THEN %>		
		<TD> <p align="center" style="margin-top: 0; margin-bottom: 0"> <%= Ob_RS2(Campo)%> <IMG border="0" src="MailTo.jpg" onClick="parent.location='mailto:<%= Ob_RS2(Campo)%>'"> </TD>
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
RESPONSE.WRITE "<CENTER><H3>No existen registros</H3></CENTER>"
END IF %>

</Table width="20%">

<CENTER>
<BR>
<INPUT TYPE="button" VALUE="AGREGAR REGISTRO" ONCLICK="location.href='<%= opcionAlta%>?<%= IdMaestro%>=<%= idPer %>&oper=ALTA'" >
<p>&nbsp;<%
SET Ob_RS = NOTHING
SET Ob_RS2 = NOTHING
SET Ob_Conn = NOTHING
%> </p>


 </BODY>
</HTML>
 <!-- #INCLUDE File="errores.inc" -->