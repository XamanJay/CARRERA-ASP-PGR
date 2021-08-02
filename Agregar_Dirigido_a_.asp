<HTML>
  <BODY>
    <%response.write ("jajaja")
       SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
       SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

       v_ODBC = "SIIFP"
       v_Tabla = "CAPdCursosPerfil"
       
   	   Ob_Conn.PROVIDER="sqloledb"
   	   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ v_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   	   
   	   Sql = "SELECT * FROM " & v_Tabla   	   
   	   Ob_RS.OPEN Sql, Ob_Conn
    %>
    
	   <SELECT>
	     <%DO UNTIL Ob_RS.Eof%>
	        <OPTION VALUE="<%=Ob_RS(0)%>">
              <%= Ob_RS(1)%>          
            </OPTION>	
	        <%Ob_RS.MOVENEXT
	     LOOP%>
	   </SELECT>
	   
  </BODY>
</HTML>