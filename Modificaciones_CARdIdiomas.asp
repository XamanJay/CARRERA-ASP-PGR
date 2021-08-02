<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdIdiomas"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdIdiomas WHERE Id_CARdIdiomas ="+CSTR(ParID) 
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
   CARdIdiomas= OB_RS("CARdIdiomas")
   Id_CARcIdioma= OB_RS("Id_CARcIdioma")
   Lectura= OB_RS("Lectura")
   Escritura= OB_RS("Escritura")
   Conversacion= OB_RS("Conversacion")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdIdiomas.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Idiomas  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
	

<!-- #Include File = "HISTORIAL.inc" -->




	
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Idiomas  </FONT></h2>
  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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
        consulta = "SELECT * FROM CARdIdiomas WHERE Id_CARdIdiomas ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdIdiomas")=ucase(request("CARdIdiomas")) 
        if request("Id_CARcIdioma")  <> "" then  Ob_RS("Id_CARcIdioma")=request("Id_CARcIdioma") end if
        if request("Lectura")  <> "" then  Ob_RS("Lectura")=request("Lectura") end if
        if request("Escritura")  <> "" then  Ob_RS("Escritura")=request("Escritura") end if
        if request("Conversacion")  <> "" then  Ob_RS("Conversacion")=request("Conversacion") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
          <%Sql ="SELECT * FROM CARCIDIOMA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Idioma/Dialecto</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcIdioma' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcIdioma")= CINT(Id_CARcIdioma) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
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
        <B>Lectura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Lectura' SIZE=4 MAXLENGTH=4 VALUE=<%= Lectura%>> %
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Escritura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Escritura' SIZE=4 MAXLENGTH=4 VALUE=<%= Escritura%>> %
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Conversaci&oacute;n</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Conversacion' SIZE=4 MAXLENGTH=4 VALUE=<%= Conversacion%>> %
      </TD > 
     </TR>
	  <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdIdiomas' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdIdiomas%></TEXTAREA>
  	
      </TD > </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdIdiomas >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>

 
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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

  if (FormEdita.Id_CARcIdioma.value  == "")
  {
       alert("EL CAMPO: Id_Idioma/Dialecto, no puede estar vacio");
       return false;
  }
 
  /* if (FormEdita.Lectura.value  == "" && FormEdita.Escritura.value =="" && FormEdita.Conversacion.value =="") 
  {
       alert("Debe de poner información en cualquiera de los campos de Lectura, Escritura o Conversación");
       return false;
  }*/
 if (FormEdita.Lectura.value  == "")
  {
       alert("EL CAMPO: Lectura, no puede estar vacio");
       return false;
  }
  
  
   if (FormEdita.Escritura.value  == "")
  {
       alert("EL CAMPO: Escritura, no puede estar vacio");
       return false;
  }
  
  
   if (FormEdita.Conversacion.value  == "")
  {
       alert("EL CAMPO: Conversación, no puede estar vacio");
       return false;
  }
  
  
  
  
  
  
    if (FormEdita.Lectura.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Lectura, Solo Acepta Números");
       return false;
  }
    if (FormEdita.Escritura.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Escritura, Solo Acepta Números");
       return false;
  }
  
    if (FormEdita.Conversacion.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Conversación, Solo Acepta Números");
       return false;
  }
  
  
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/


}
</script> 
