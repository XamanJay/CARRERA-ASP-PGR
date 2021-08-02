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
 <%= "Modificacion de " + (MID((Tabla),4,LEN(TABLA))) + " Desplegado de la búsqueda"%>
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
 consulta = "Select * From " & Tabla
 Ob_RS.Open consulta, Ob_Conn
 
 sql = "Select Id_" & Tabla & " AS CVDAccion, * FROM " & Tabla
 
' sql = "Select * From " & Tabla

'response.write("  >>"+idPer)
 sql = sql + " where " & IdMaestro &" = "  &IdPer

' response.write ("1>" & sql & "<1")
%>

<% total_campos = Ob_RS.FIELDS.COUNT %>

<%
'response.write(sql)
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
              <B>		<font color="#FFFFFF"> 	<%= "Acción" %>  </font>	</B> 
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
  <!--- Código personalizado ------------------------------------------------------------------------------------------ --->		 
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