<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdNombramientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
		
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

 
   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

%>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Altas  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
 
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">

<BR><BR>  
  <CENTER>    <H2>      <FONT COLOR= #3366CC>Cambios realizados correctamente</FONT>    </H2>  </CENTER>

<%
SUBPROCURA = REQUEST.FORM("Id_CARcSubprocuradurias")
DELEGA     = REQUEST.FORM("Id_CARcDG_o_Delegaciones") 
SUBSEDE    = REQUEST.FORM("Id_CARcDir_o_subsede")  
USUARIO    = REQUEST.FORM("Id_CARcUSR")


'RESPONSE.WRITE(REQUEST.FORM("Id_CARcSubprocuradurias")&"__")
'RESPONSE.WRITE(REQUEST.FORM("Id_CARcDG_o_Delegaciones")&"__" )
'RESPONSE.WRITE(REQUEST.FORM("Id_CARcDir_o_subsede")&"__"  )
'RESPONSE.WRITE(REQUEST.FORM("Id_CARcUSR")&"__")

	
	Session("Subprocuraduria") = REQUEST.FORM("Id_CARcSubprocuradurias")
	Session("Delegacion") = REQUEST.FORM("Id_CARcDG_o_Delegaciones") 
	Session("Subsede") = REQUEST.FORM("Id_CARcDir_o_subsede")  
	Session("IdLogin") = REQUEST.FORM("Id_CARcUSR")
	
	Session("TipoUSR") = 8
	
	
	
''' Response.Redirect("https://"+ session("IP_SERVER") +"/CarreraPGR/CARR_index.asp")

  %>
 






 

 </FORM>


  <%SET Ob_RS = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

