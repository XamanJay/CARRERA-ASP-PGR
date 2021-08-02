<% On Error Resume Next %>
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdAdscripciones"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdAdscripciones WHERE Id_CARdAdscripciones ="+CSTR(ParID) 
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
   CARdAdscripciones= OB_RS("CARdAdscripciones")
   FechaAdscripcion= OB_RS("FechaAdscripcion")
   Id_CARcAdscripciones= OB_RS("Id_CARcAdscripciones")
   Id_CARcTipoNombramiento= OB_RS("Id_CARcTipoNombramiento")
   Area= OB_RS("Area")
   SubArea= OB_RS("SubArea")
   Ciudad= OB_RS("Ciudad")
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   Id_CARcMotivoAdscripcion= OB_RS("Id_CARcMotivoAdscripcion")
   Id_CARcActual= OB_RS("Id_CARcActual")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdAdscripciones.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Adscripciones  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Adscripciones </FONT></h2>
     <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1 onClick="return ValidaCampos()">
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
        consulta = "SELECT * FROM CARdAdscripciones WHERE Id_CARdAdscripciones ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARdAdscripciones")  <> "" then  Ob_RS("CARdAdscripciones")=UCASE(request("CARdAdscripciones")) end if
        if request("FechaAdscripcion")  <> "" then  Ob_RS("FechaAdscripcion")=request("FechaAdscripcion") end if
        if request("Id_CARcAdscripciones")  <> "" then  Ob_RS("Id_CARcAdscripciones")=request("Id_CARcAdscripciones") end if
        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
        if request("Area")  <> "" then  Ob_RS("Area")=UCASE(request("Area")) end if
        if request("SubArea")  <> "" then  Ob_RS("SubArea")=UCASE(request("SubArea")) end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=UCASE(request("Ciudad")) end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("Id_CARcMotivoAdscripcion")  <> "" then  Ob_RS("Id_CARcMotivoAdscripcion")=request("Id_CARcMotivoAdscripcion") end if
        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
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
        <B>Fecha de Adscripción:<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAdscripcion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaAdscripcion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      
    <%
    RESPONSE.WRITE("     Tiempo :")
     RESPONSE.WRITE(DATEDIFF("YYYY",DATE,FechaAdscripcion)*(-1))
    RESPONSE.WRITE(" Años, ")
     RESPONSE.WRITE(DATEDIFF("M",DATE,FechaAdscripcion)*(-1)) mod 12 
    RESPONSE.WRITE(" Meses ")
     %>
   </TD > 
         <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCADSCRIPCIONES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Unidad Central / Delegación Estatal</B>:<BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcAdscripciones' SIZE=1 >
          <% IF Id_CARcAdscripciones = "" OR Id_CARcAdscripciones = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcAdscripciones")= CINT(Id_CARcAdscripciones) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAdscripciones")%>'> <%= Ob_RS2("CARcAdscripciones_Corta")%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAdscripciones")%>'> <%= Ob_RS2("CARcAdscripciones_Corta")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcTipoNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Nombramiento</B>:<BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 >
          <% IF Id_CARcTipoNombramiento = "" OR Id_CARcTipoNombramiento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Area / Subsede:<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='Area' SIZE=10 ROWS=5 COLS=35><%=Area%></TEXTAREA>
  	<BR><BR>
      </TD > 
     <TR>
      <TD>
        <B>SubArea:<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='SubArea' SIZE=10 ROWS=5 COLS=35><%=SubArea%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Ciudad:<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT style="text-transform: uppercase" TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 VALUE='<%= Ciudad%>'>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Estado</B>:<BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <% IF Id_CARcEntidadFederativa = "" OR Id_CARcEntidadFederativa = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCMOTIVOADSCRIPCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Motivo de Adscripción</B>:<BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcMotivoAdscripcion' SIZE=1 >
          <% IF Id_CARcMotivoAdscripcion = "" OR Id_CARcMotivoAdscripcion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoAdscripcion")= CINT(Id_CARcMotivoAdscripcion) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
        <B>Actual ?</font>	</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcActual' size=1  <% IF Id_CARcActual = 1 THEN RESPONSE.WRITE "DISABLED"%>>
            <% IF Id_CARcActual = "" OR Id_CARcActual = "0" THEN %>
            <option value='0'> Seleccione registro </option>
            <% END IF  %>
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcActual")= CINT(Id_CARcActual) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>
          <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 <tr>
         <TD>
        <B>Observaciones</font>	</B>
      </TD>
   <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='CARdAdscripciones' SIZE=10 ROWS=5 COLS=35><%=CARdAdscripciones%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdAdscripciones >
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
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1 onClick="return ValidaCampos()">
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

  if (FormEdita.Id_CARcAdscripciones.value  == "")
  {
       alert("EL CAMPO: Id_Area Adscripción, no puede estar vacio");
       return false;
  }
  
  
  if (FormEdita.FechaAdscripcion.value != "" && !esFecha(FormEdita.FechaAdscripcion.value,'E'))
		{alert("El formato del campo -Fecha de Adscripción- debe ser de tipo: DD/MM/AAAA");
		return false;}
  
 /* if (FormEdita.FechaAdscripcion.value  == "")
  {
       alert("EL CAMPO: Fecha de Adscripción, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Area.value  == "")
  {
       alert("EL CAMPO: Area, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Ciudad.value  == "")
  {
       alert("EL CAMPO: Ciudad, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcEntidadFederativa.value  == "")
  {
       alert("EL CAMPO: Id_Estado, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARdAdscripciones.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tabla Adscripciones.");
       return false;
  }
  
  if (FormEdita.Id_CARcAdscripciones.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Area Adscripción.");
       return false;
  }
  
  if (FormEdita.Id_CARcTipoNombramiento.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Nombramiento.");
       return false;
  }
  
  if (FormEdita.Id_CARcEntidadFederativa.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Estado.");
       return false;
  }
  
  if (FormEdita.Id_CARcMotivoAdscripcion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Motivo de Adscripción.");
       return false;
  }
  
  if (FormEdita.Id_CARdDatosPersonales.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Datos Persona.");
       return false;
  }
*/  


}
</script> 
