<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM DESdDatosDesignacion" 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 
'========== Combos
%>

<%'========= No tiene combos========= %>


<% '========== Inicia HTML %>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.Estilo1 {color: #FFFFFF}
-->
</style>
<HEAD>
  <TITLE>
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_PLAdAntecedentes.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Designaciones</FONT>
</H2>
  </CENTER>

<%'----Como voy'
 Id_CARdDatosPersonales = request.QueryString("Id_CARdDatosPersonales") 
'Response.write(Id_PLAcPersonasDGRH)
Nombre = request.QueryString("Nombre")
'Response.write(Nombre)
Paterno = request.QueryString("Paterno")
'Response.write(Paterno)
%>
  <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

  <CENTER> <table width="569" border="0"  >
  <tr>
    <td width="77" valign="top"><strong>NOMBRE: </strong></td>
    <td width="175" valign="top"><font color="#3366CC"><strong><%response.write( request("Nombre"))%>&nbsp;<%response.write( request("Paterno"))%></strong></font></td>
   <td width="55" valign="top"><strong>RFC:</strong></td>
    <td width="97" valign="top"><font color="#3366CC"><strong><% response.write(request("RFC"))%></strong></font></td>
   <td width="48" valign="top"></td>
    <td width="91" valign="top"><font color="#3366CC"><strong><% response.write(request("FOLIO"))%></strong></font></td>
 </tr>
</table>
<BR>
</CENTER>

  <FORM name="ARMA" action="123.asp" method="post" >

<%
    v_Tabla = "PLAdPersonas"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))

 %>

  
<%SET Coneccion = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")


	 Coneccion.PROVIDER="sqloledb"
   Coneccion.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
	 
	                                   
	  CadenadeConsulta = "SELECT * FROM VISTA_DatosPersonales_DatosDesignacion WHERE Id_CARdDatosPersonales = " + Id_CARdDatosPersonales
	   '''  Response.write(CadenadeConsulta)
		''' response.end 
        Record.Open CadenadeConsulta, Coneccion, 3, 1
		
		TotdeRegistros = Record.RECORDCOUNT
		
		IF TotdeRegistros = 0 THEN
			Response.Write("No existen registros")
			Response.write("<BR>")
		ELSE
			Response.Write("Numero de Antecedentes : ")
			Response.write(TotdeRegistros)
			Response.write("<BR>")
		END IF
		

 %>
 <BR>
  <center>
  <table class="SL" border="1"  >
  <tr >
  <td bgcolor="000066" ><span class="Estilo1">Acción</span></td>
  <td bgcolor="000066"><span class="Estilo1">No. de Acuerdo</span></td>
  <td bgcolor="000066"><span class="Estilo1">No. de Expediente</span></td>
  <td bgcolor="000066"><span class="Estilo1">No. de Oficio de licencia</span></td>
   <td bgcolor="000066"><span class="Estilo1">Observaciones</span></td>
  
  
 
  

  <% do until Record.Eof %>
  <tr>
  <td class="Datos">
  <% '''ANTE = Record ("AntecedentesDGRH")
       '''Response.write(ANTE) 
	'''   IF ISNULL(ANTE) THEN %>
<A target="mainFrame" HREF="TT_Reporte -Tarjeta de Hechos-.asp?Id_DESdDatosDesignacion=<%= Record ("Id_DESdDatosDesignacion")%>">Tarjeta de Hechos</A>
<%
    '''   ELSE
	   '''  Response.write("----")
	'''   END IF
%>


  </td>
  <td class="Datos"><%= Record ("NumAcuerdo") %></td>
  <td class="Datos"><%= Record ("NumExpediente") %></td>
  <td class="Datos"><%= Record ("NumOficioLicencia") %></td>
  <td class="Datos"><%= Record ("DESdDatosDesignacion") %></td>
  
   
  <% Record.MoveNext
  LOOP
  Record.Close
  Coneccion.Close %>
  </table>
</center>


  </FORM>

 </BODY>
</HTML>
