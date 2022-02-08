<% 'On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdIdiomas"
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
  <FORM METHOD="post" ACTION= "Altas_CARdIdiomas.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Idiomas   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdIdiomas")  <> "" then  Ob_RS("CARdIdiomas")=ucase(request("CARdIdiomas")) end if
        if request("Id_CARcIdioma")  <> "" then  Ob_RS("Id_CARcIdioma")=request("Id_CARcIdioma") end if
        if request("Lectura")  <> "" then  Ob_RS("Lectura")=request("Lectura") end if
        if request("Escritura")  <> "" then  Ob_RS("Escritura")=request("Escritura") end if
        if request("Conversacion")  <> "" then  Ob_RS("Conversacion")=request("Conversacion") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
         <B>Idioma/Dialecto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCIDIOMA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcIdioma' SIZE=1 >
         
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcIdioma")= CINT(Id_CARcIdioma) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcIdioma")%>'> <%= Ob_RS2("CARcIdioma")%>
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdIdiomas' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdIdiomas%></TEXTAREA>
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
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
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

  if (FormAltas.Id_CARcIdioma.value  == 0)
  {
       alert("EL CAMPO: Idioma/Dialecto, no puede estar vacio");
       return false;
  }
   
 /* if (FormAltas.Lectura.value  == "" && FormAltas.Escritura.value =="" && FormAltas.Conversacion.value =="") 
  {
       alert("Debe de poner información en cualquiera de los campos de Lectura, Escritura o Conversación");
       return false;
  }
  */
  
  
  
   if (FormAltas.Lectura.value  == "")
  {
       alert("EL CAMPO: Lectura, no puede estar vacio");
       return false;
  }
  
  
   if (FormAltas.Escritura.value  == "")
  {
       alert("EL CAMPO: Escritura, no puede estar vacio");
       return false;
  }
  
  
   if (FormAltas.Conversacion.value  == "")
  {
       alert("EL CAMPO: Conversación, no puede estar vacio");
       return false;
  }
  
    if (FormAltas.Lectura.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Lectura, Solo Acepta Números");
       return false;
  }
    if (FormAltas.Escritura.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Escritura, Solo Acepta Números");
       return false;
  }
  
    if (FormAltas.Conversacion.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Conversación, Solo Acepta Números");
       return false;
  }

    FormAltas.B1.disabled = true;  
     document.FormAltas.submit();
}
</script> 

