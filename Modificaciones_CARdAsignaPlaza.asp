<% On Error Resume Next %>
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdAsignaPlaza"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdAsignaPlaza WHERE Id_CARdAsignaPlaza ="+CSTR(ParID) 
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
   CARdAsignaPlaza= OB_RS("CARdAsignaPlaza")
   FechaAsignacion= OB_RS("FechaAsignacion")
   Id_CARcPlaza= OB_RS("Id_CARcPlaza")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   Id_CARcTIPOASIGNACION= OB_RS("Id_CARcTIPOASIGNACION")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
<link href="Estilo1.css" rel="stylesheet" type="text/css">
<% ELSE %>
<link href="Estilo.css" rel="stylesheet" type"text/css">
<%END IF %> 

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARdAsignaPlaza.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver CARdAsignaPlaza  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  CARdAsignaPlaza  </FONT></h2>
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
        consulta = "SELECT * FROM CARdAsignaPlaza WHERE Id_CARdAsignaPlaza ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARdAsignaPlaza")  <> "" then  Ob_RS("CARdAsignaPlaza")=request("CARdAsignaPlaza") end if
        if request("FechaAsignacion")  <> "" then  Ob_RS("FechaAsignacion")=request("FechaAsignacion") end if
        if request("Id_CARcPlaza")  <> "" then  Ob_RS("Id_CARcPlaza")=request("Id_CARcPlaza") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Id_CARcTIPOASIGNACION")  <> "" then  Ob_RS("Id_CARcTIPOASIGNACION")=request("Id_CARcTIPOASIGNACION") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		
        Ob_RS.update
        response.clear
		
	       %>
		 		<!-- #INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Fecha de Asignacion:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAsignacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAsignacion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaAsignacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
  	<BR><BR> 
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcPlaza" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Numero de Plaza</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcPlaza' SIZE=1 >
          <% IF Id_CARcPlaza = "" OR Id_CARcPlaza = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPlaza")= CINT(Id_CARcPlaza) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPlaza")%>'> <%= Ob_RS2("CARcPlaza")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPlaza")%>'> <%= Ob_RS2("CARcPlaza")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcTIPOASIGNACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de Asignación</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTIPOASIGNACION' SIZE=1 >
          <% IF Id_CARcTIPOASIGNACION = "" OR Id_CARcTIPOASIGNACION = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTIPOASIGNACION")= CINT(Id_CARcTIPOASIGNACION) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTIPOASIGNACION")%>'> <%= Ob_RS2("CARcTIPOASIGNACION")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTIPOASIGNACION")%>'> <%= Ob_RS2("CARcTIPOASIGNACION")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Observaciones:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARdAsignaPlaza' SIZE=50 MAXLENGTH=50 VALUE=<%= CARdAsignaPlaza%>>
		 <BR> <BR>
      </TD > 
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdAsignaPlaza >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >


<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>


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
<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormEdita.FechaAsignacion.value  == "")
  {
       alert("EL CAMPO: Fecha de Asignacion, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcPlaza.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Numero de Plaza.");
       return false;
  }
  
  
  if (FormEdita.Id_CARcTIPOASIGNACION.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Asignación.");
       return false;
  }
  


}
</script> 
