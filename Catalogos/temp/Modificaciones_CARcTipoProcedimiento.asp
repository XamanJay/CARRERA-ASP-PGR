<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcTipoProcedimiento"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcTipoProcedimiento WHERE Id_CARcTipoProcedimiento ="+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 

'========== Combos
%>

<%
'======= Inicializa variables de ambiente ===========
   CARcTipoProcedimiento= OB_RS("CARcTipoProcedimiento")
   Fecha_Captura= OB_RS("Fecha_Captura")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARcTipoProcedimiento.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver CARcTipoProcedimiento  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  CARcTipoProcedimiento  </FONT></h2>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
<%END IF %> 
   </H2>

  </CENTER>

 <!--- insertar resulstado de  LOOP ----------------------------------------------------------------------------------------------- --->

    <% 
     vModi = request("Modi") 
     if vModi = "S" then  
        Ob_RS.Close 
        consulta = "SELECT * FROM CARcTipoProcedimiento WHERE Id_CARcTipoProcedimiento ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcTipoProcedimiento")  <> "" then  Ob_RS("CARcTipoProcedimiento")=request("CARcTipoProcedimiento") end if
        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Tipo de Procedimiento:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARcTipoProcedimiento' SIZE=50 MAXLENGTH=50 VALUE=<%= CARcTipoProcedimiento%>>
		 <BR> <BR>
      </TD > 
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcTipoProcedimiento >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >

  <% Ob_Rs.CLOSE %>

 
<% IF TOper = "MOD" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
<% ELSE %>
   <BR>
  <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% END IF %> 

  </p>

   </CENTER>
  </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormEdita.CARcTipoProcedimiento.value  == "")
  {
       alert("EL CAMPO: Tipo de Procedimiento, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcTipoProcedimiento.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Catálogo Tipo Procedimiento.");
       return false;
  }
  


}
</script> 
