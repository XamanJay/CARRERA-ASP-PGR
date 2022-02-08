
<html>

<BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

<!-- #INCLUDE File="ADOVBS.inc" -->

<%
lnkIdCarros= Request.QueryString("lnkIdCarros")
Tabla = Request.QueryString("parametroTabla")
ODBC = Request.QueryString("parametroODBC")
ID = Request.QueryString("parametroID")
Cadena = Request.QueryString("parametroCadena")
v_Where = Request.QueryString("parametroWhere")

Cadena = REPLACE(Cadena, "''", "'")
Cadena = REPLACE(Cadena, "~", "%")
%>

<TITLE> 
 <%= "Bajas de " + (MID((Tabla),4,LEN(TABLA))) %>
</TITLE>


<%

Set Ob_Conn		= Server.CreateObject ("ADODB.Connection")
Set Ob_RS		= Server.CreateObject ("ADODB.RecordSet")

Set Ob_Etiq_RS	= Server.CreateObject ("ADODB.RecordSet")

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")


IF v_Where = 1 THEN
Sql = Cadena + " AND " + " Id_" + Tabla + " = " + lnkIdCarros
ELSE
   Sql = Cadena + " WHERE " + " Id_" + Tabla + " = " + lnkIdCarros 
END IF

'response.write (sql)
'response.end

Ob_RS.Open Sql, Ob_Conn 

%>

<hr width=40%>
<h2 align="center" dir="rtl">Eliminar registro</h2>
<hr width=40%>
<!--  <form method="POST" action="BajasOpr.asp">-->
  

<center>
<fieldset style="padding: 2; width:352; height:232">
<legend><b><h3>¿Desea eliminar el registro?</h3></b></legend>

<%
  total_campos = Ob_RS.FIELDS.COUNT

IF NOT Ob_RS.EOF THEN %>
 	
<!--- Consulta para sacar la descripción de los campos---------------------------------------------------------------- --->
<%
  Num_Campos= Ob_RS.Fields.Count 
  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" & "'" & ID & "'"
  Ob_Etiq_RS.OPEN Etiq_Nor, Ob_Conn
  total_campos_Etiq_Nor = Ob_Etiq_RS.FIELDS.COUNT
%>

<!--- ---------------------------------------------------------------------------------------------------------------- --->

<BR><BR><BR>
  
  <TABLE border=1>
  <TR>
	  <%Ob_Etiq_RS.MoveFirst
	    DO UNTIL Ob_Etiq_RS.Eof%>    	    
   	    <%IF MID((Ob_Etiq_RS(0)),1,3) <> "Id_" AND MID((Ob_Etiq_RS(0)),1,3) <> "TI_" THEN%>
              <TD BGCOLOR = "#00003C">
              <P ALIGN="center">            
              <B>		<font color="#FFFFFF"> 	<%=Ob_Etiq_RS(0) & ":" %>  </font>	</B> 
   	    <%END IF  
        Ob_Etiq_RS.MoveNext
    LOOP%>
 

 	  <%  Ob_Etiq_RS.MoveFirst
 		  DO UNTIL Ob_Etiq_RS.Eof%>    	    
      	  <%IF (MID(Ob_Etiq_RS(0),1,3) = "Id_") AND (MID(Ob_Etiq_RS(0),1,3) <> "TI_")THEN%>
              <TD BGCOLOR = "#00003C">
              <P ALIGN="center">
              <B>		<font color="#FFFFFF"> 	<%=MID ( Ob_Etiq_RS(0),4,LEN(Ob_Etiq_RS(0)) )& ":" %>  </font>	</B> 
      	  <%END IF 
        Ob_Etiq_RS.MoveNext
    LOOP%>   
    
  </TR>
<!--- ================================================================================================================ --->

    
<!--- ================================================================================================================ --->

	<%  Ob_RS.MoveFirst
	    DO UNTIL Ob_RS.EOF %>
	    <TR>
		<%FOR Campo = 0 TO Num_Campos - 1%>
		
		<%IF UCASE(Ob_RS(Campo).Name) <> UCASE("CVDAccion") AND (MID(Ob_RS(Campo).Name,1,3) <> "Id_") AND (MID(Ob_RS(Campo).Name,1,3) <> "LK_") AND (MID(Ob_RS(Campo).Name,1,3)  <> "ML_") THEN%>
					<TD> <%= Ob_RS(Campo)%> &nbsp;</TD>
		<%END IF%>

		<%IF (MID(Ob_RS(Campo).Name,1,3) = "LK_") THEN %>
		<TD> <A HREF="<%= Ob_RS(Campo) %>"><%= Ob_RS(Campo) %></A> &nbsp; </TD>
		<%
		END IF
		%>  

		<%IF (MID(Ob_RS(Campo).Name,1,3) = "ML_") THEN %>		
		<TD> <p align="center" style="margin-top: 0; margin-bottom: 0"> <%= Ob_RS(Campo)%> <IMG border="0" src="MailTo.jpg" onClick="parent.location='mailto:<%= Ob_RS(Campo)%>'"> </TD>
		<%																					
		END IF
		%>  
		
		<%  NEXT
		
		Ob_RS.MOVENEXT%>

	<% LOOP%>

	<%Ob_RS.MoveFirst
	  DO UNTIL Ob_RS.EOF %>

		<%FOR Campo = 0 TO Num_Campos - 1%>

			<%IF UCASE(Ob_RS(Campo).Name) <> UCASE("Id_"&Tabla) AND (MID(Ob_RS(Campo).Name,1,3) = "Id_") THEN%>
					<TD> <%= Ob_RS(Campo)%> &nbsp;</TD>
			<%END IF%>
		
		<%  NEXT
		Ob_RS.MOVENEXT%>
	</TR>	
	<% LOOP%>

<%
END IF
%>

</TABLE>



<BR>
<CENTER>

<Input Type="button" Value="Eliminar" OnClick="location.href='BajasOpr.asp?lnkIdCarros=<%= lnkIdCarros%>&parametroTabla=<%= Tabla%>&parametroODBC=<%= ODBC%>'">&nbsp;&nbsp; 
<INPUT TYPE="button" VALUE="Cancelar" OnClick="location.href='Bajas_<%= Tabla%>.ASP'">
<!--</form>-->
</body>

</html>