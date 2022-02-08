<HTML>

<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<%
  DIM Tabla
  DIM ODBC
	VAR_TMP_APD=0
	VAR_WHERE=0

  vl_RegistroSeleccionado = REQUEST.QUERYSTRING("RegistroSeleccionado")
 	
  Tabla = "CAPdCursosPerfil"
  ODBC = "SIIFP" 
  var_pagina_regreso = "'Consultas_"+ TRIM(Tabla)  +".asp'"
%>

<TITLE> 
 <%= "Consultas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>

<%
  SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
  SET Ob_RS = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS2 = Server.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")
  SET Ob_Etiq_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER=10.1.207.37;DATABASE="+ ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

  consulta = "SELECT * FROM " & Tabla
  Ob_RS.OPEN consulta, Ob_Conn
  
  consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & Tabla & "'"  
  Ob_RS_Id.OPEN consulta_Id, Ob_Conn  
  ID = Ob_RS_Id(0)  
%>

<BR><BR><BR>

<%
'Sql = "SELECT * FROM CAPdCursosPerfil WHERE (Id_CARcCatalogoCursosPGR = 11)"
Sql = "SELECT dbo.CAPdCursosPerfil.Id_CAPdCursosPerfil, dbo.CAPdCursosPerfil.CAPdCursosPerfil, dbo.CAPdCursosPerfil.Id_CARcCatalogoCursosPGR,  dbo.CAPdCursosPerfil.Id_SFPcPuestos, dbo.CARcCatalogoCursosPGR.CARcCatalogoCursosPGR, dbo.SFPcPuestos.Denominacion FROM dbo.CAPdCursosPerfil INNER JOIN dbo.CARcCatalogoCursosPGR ON dbo.CAPdCursosPerfil.Id_CARcCatalogoCursosPGR = dbo.CARcCatalogoCursosPGR.Id_CARcCatalogoCursosPGR INNER JOIN dbo.SFPcPuestos ON dbo.CAPdCursosPerfil.Id_SFPcPuestos = dbo.SFPcPuestos.Id_SFPcPuestos WHERE (dbo.CAPdCursosPerfil.Id_CARcCatalogoCursosPGR = 11)"
Ob_RS2.Open Sql, Ob_Conn
Num_Campos= Ob_RS2.FIELDS.COUNT 

IF NOT Ob_RS2.EOF THEN %>
 	
<CENTER><H2> <FONT COLOR=#"FF0000"> <%= vl_RegistroSeleccionado%> </FONT> Dirigido a:</H2><CENTER>

<!--- Consulta para sacar la descripción de los campos---------------------------------------------------------------- --->
<%
  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" & "'" & ID & "'"
  Ob_Etiq_RS.OPEN Etiq_Nor, Ob_Conn
  total_campos_Etiq_Nor = Ob_Etiq_RS.FIELDS.COUNT
%>

<!--- ---------------------------------------------------------------------------------------------------------------- --->

<BR><BR><BR>
  
<%x = -1 %>

  <TABLE border=1>
  <TR>
  
  <%DO UNTIL Ob_Etiq_RS.Eof%>

   	    <%IF MID((Ob_Etiq_RS(0)),1,3) <> "Id_" AND MID((Ob_Etiq_RS(0)),1,3) <> "TI_" THEN%>
              <TD BGCOLOR = "#00003C">
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
              <TD BGCOLOR = "#00003C">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=MID ( Ob_Etiq_RS(0),4,LEN(Ob_Etiq_RS(0)) )& ":" %>  </font>	</B> 
      	  <%END IF
          
          Ob_Etiq_RS.MoveNext

    LOOP%>
  </TR>
    
<!--- ================================================================================================================ --->

	<%DO UNTIL Ob_RS2.EOF %>
	<TR>
		<%FOR Campo = 0 TO Num_Campos - 1	
		    IF (Ob_RS2(Campo).Name <> "Id_CAPdCursosPerfil") AND (Ob_RS2(Campo).Name <> "Id_CARcCatalogoCursosPGR") AND (Ob_RS2(Campo).Name <> "Id_SFPcPuestos") AND (MID(Ob_RS2(Campo).Name,1,3) <> "CT_") AND (MID(Ob_RS2(Campo).Name,1,3) <> "LK_") AND (MID(Ob_RS2(Campo).Name,1,3) <> "ML_") THEN %>
			<TD> <%= Ob_RS2(Campo) %> &nbsp;</TD>
		  <%END IF

		IF (MID(Ob_RS2(Campo).Name,1,3) = "CT_") THEN %>
		<% valor = (Ob_RS2(Campo)) 
	    nombre = Ob_RS2(Campo).NAME %>
		<TD> <%= Session(nombre) (valor)%> &nbsp;</TD>
		<%
		END IF
		%>  
		  
		<%IF (MID(Ob_RS2(Campo).Name,1,3) = "LK_") THEN %>
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
'	RESPONSE.WRITE "<CENTER> <H3> No existe ningún registro que cumpla con los parámetros de búsqueda </H3> </CENTER>"
%>
<CENTER><H3><FONT COLOR=#"FF0000"> <%= vl_RegistroSeleccionado%> </FONT> no tiene ninguna relación</h3>
  <H3></CENTER>
<%
END IF
%>

</TABLE>

<CENTER>
<H3>
<BR>

<INPUT TYPE="button" VALUE="Buscar otro registro" ONCLICK="self.parent.location.href='Consultas_CARCCATALOGOCURSOSPGR.ASP'">

<%

  SET Ob_RS = NOTHING
  SET Ob_RS2 = NOTHING
  SET Ob_Etiq_RS = NOTHING
  SET Ob_Conn = NOTHING
  
%>

 </BODY>
</HTML>