<%On Error Resume Next%>
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdAdscripciones"
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

 <HEAD>
  <TITLE>
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_CARdAdscripciones.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Adscripciones   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
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
		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
 '       if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS.update
        response.clear
		%>
		 
		 		<!-- #INCLUDE File="errror.inc" -->

				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 
	     %>
  
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     
     
     <TR>
      <TD>
        <B>Fecha de Adscripción</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAdscripcion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAdscripcion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Unidad Central / Delegaci&oacute;n Estatal </B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCADSCRIPCIONES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAdscripciones' SIZE=1 >
          <% IF Id_CARcAdscripciones = "" OR Id_CARcAdscripciones = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcAdscripciones")= CINT(Id_CARcAdscripciones) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAdscripciones")%>'> <%= Ob_RS2("CARcAdscripciones_CORTA")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAdscripciones")%>'> <%= Ob_RS2("CARcAdscripciones_CORTA")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipoNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 >
          <% IF Id_CARcTipoNombramiento = "" OR Id_CARcTipoNombramiento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Area</font> / Subsede	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='Area' SIZE=10 ROWS=5 COLS=35><%=Area%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>SubArea</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='SubArea' SIZE=10 ROWS=5 COLS=35><%=SubArea%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <% IF Id_CARcEntidadFederativa = "" OR Id_CARcEntidadFederativa = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Motivo de Adscripción</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOADSCRIPCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoAdscripcion' SIZE=1 >
          <% IF Id_CARcMotivoAdscripcion = "" OR Id_CARcMotivoAdscripcion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoAdscripcion")= CINT(Id_CARcMotivoAdscripcion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
        <B>Actual ?</font>	</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
          <% IF Id_CARcActual = "" OR Id_CARcActual = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcActual")= CINT(Id_CARcActual) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
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

  if (FormAltas.Id_CARcAdscripciones.value  == 0)
  {
       alert("EL CAMPO: Id_Area Adscripción, no puede estar vacio");
       return false;
  }
  
   if (FormAltas.FechaAdscripcion.value != "" && !esFecha(FormAltas.FechaAdscripcion.value,'E'))
		{alert("El formato del campo -Fecha de Adscripción- debe ser de tipo: DD/MM/AAAA");
		return false;}
 
  /*
  if (FormAltas.FechaAdscripcion.value  == "")
  {
       alert("EL CAMPO: Fecha de Adscripción, no puede estar vacio");
       return false;
  }
  
  
  if (FormAltas.Area.value  == "")
  {
       alert("EL CAMPO: Area, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Ciudad.value  == "")
  {
       alert("EL CAMPO: Ciudad, no puede estar vacio");
       return false;
  }
     
  if (FormAltas.Id_CARcTipoNombramiento.value  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Nombramiento.");
       return false;
  }
  
  if (FormAltas.Id_CARcEntidadFederativa.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Estado.");
       return false;
  }
  
  if (FormAltas.Id_CARcMotivoAdscripcion.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Motivo de Adscripción.");
       return false;
  }
 */ 
}
</script> 

