<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdDomicilios"
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
  <FORM METHOD="post" ACTION= "Altas_CARdDomicilios.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Domicilios</FONT>
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
        if request("CARdDomicilios")  <> "" then  Ob_RS("CARdDomicilios")=UCASE(request("CARdDomicilios")) end if
        if request("Id_CARcTipoDomicilio")  <> "" then  Ob_RS("Id_CARcTipoDomicilio")=request("Id_CARcTipoDomicilio") end if
        if request("Calle")  <> "" then  Ob_RS("Calle")=UCASE(request("Calle")) end if
        if request("Numero")  <> "" then  Ob_RS("Numero")=request("Numero") end if
        if request("NumeroInt")  <> "" then  Ob_RS("NumeroInt")=request("NumeroInt") end if
        if request("Colonia")  <> "" then  Ob_RS("Colonia")=UCASE(request("Colonia")) end if
        if request("CodigoPostal")  <> "" then  Ob_RS("CodigoPostal")=request("CodigoPostal") end if
        if request("Municipio")  <> "" then  Ob_RS("Municipio")=UCASE(request("Municipio")) end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=UCASE(request("Ciudad")) end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("Telefono")  <> "" then  Ob_RS("Telefono")=request("Telefono") end if
        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		Ob_RS("IdLogin") = session("IdLogin")
				if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if

		
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
      <TD width="20%"> 
         <B>El domicilio es</B>      </TD>
      <TD width="80%">
          <%Sql ="SELECT * FROM CARcTipoDomicilio" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoDomicilio' SIZE=1 >          
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoDomicilio")= CINT(Id_CARcTipoDomicilio) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDomicilio")%>'> <%= Ob_RS2("CARcTipoDomicilio")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDomicilio")%>'> <%= Ob_RS2("CARcTipoDomicilio")%>
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
        <B>Calle</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Calle' SIZE=50 MAXLENGTH=50 VALUE=<%= Calle%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <p><B>Número exterior </B></p>
       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='Numero' SIZE=20 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Numero%>>
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='NumeroInt' SIZE=20 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= NumeroInt%>>
      </p></TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Colonia' SIZE=50 MAXLENGTH=50 VALUE=<%= Colonia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Código postal</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=5 MAXLENGTH=5 VALUE=<%= CodigoPostal%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT'  style="text-transform: uppercase" NAME='Municipio' SIZE=50 MAXLENGTH=50 VALUE=<%= Municipio%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado </B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA order by id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
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
       <INPUT TYPE='TEXT'  style="text-transform: uppercase" NAME='Ciudad' SIZE=50 MAXLENGTH=50 VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Teléfono</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=50 MAXLENGTH=200 style="text-transform: uppercase" VALUE=<%= Telefono%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>&iquest;Domicilio actual?</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
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
       <TEXTAREA NAME='CARdDomicilios' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdDomicilios%></TEXTAREA>
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
  
  if (FormAltas.Id_CARcTipoDomicilio.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: el Domicilio es");
       return false;
  }


  if (FormAltas.Calle.value  == "")
  {
       alert("EL CAMPO: Calle, no puede estar vacio");
       return false;
  }
  
/*  if (FormAltas.Numero.value  == "")
  {
       alert("EL CAMPO: Numero, no puede estar vacio");
       return false;
  }
 */ 
  if (FormAltas.Colonia.value  == "")
  {
       alert("EL CAMPO: Colonia, no puede estar vacio");
       return false;
  }
  
     
  if (FormAltas.Id_CARcEntidadFederativa.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Estado .");
       return false;
  }
  
  if (FormAltas.Ciudad.value  == "")
  {
       alert("EL CAMPO: Ciudad, no puede estar vacio");
       return false;
  }
  
 /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        /*if(jvi_textoynumero_correcto.test(FormAltas.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormAltas.Calle.focus();
      	 return false;    
        } */   
		
		
		


/*if(jvi_especialnumero_correcto.test(FormAltas.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número, verifique por favor.');
	  	 FormAltas.Numero.focus();
      	 return false;    
        } 
	    
		 if(jvi_especialnumero_correcto.test(FormAltas.NumeroInt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Int., verifique por favor.');
	  	 FormAltas.NumeroInt.focus();
      	 return false;    
        } 
		
          if(jvi_especialnumero_correcto.test(FormAltas.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormAltas.Colonia.focus();
      	 return false;    
        } */
		
		 if(jvi_numero_correcto.test(FormAltas.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Código postal, verifique por favor.');
	  	 FormAltas.CodigoPostal.focus();
      	 return false;    
        } 
        
		 /*if(jvi_textoynumero_correcto.test(FormAltas.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio o Delegación, verifique por favor.');
	  	 FormAltas.Municipio.focus();
      	 return false;    
        } */
		
		 /*if(jvi_textoynumero_correcto.test(FormAltas.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormAltas.Ciudad.focus();
      	 return false;    
        }*/ 
		
		 /*if(jvi_numero_correcto.test(FormAltas.Telefono.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Teléfono, verifique por favor.');
	  	 FormAltas.Telefono.focus();
      	 return false;    
        } */

         /*if(jvi_textoynumero_correcto.test(FormAltas.CARdDomicilios.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdDomicilios.focus();
      	 return false;    
        } */


		
		




     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

}
</script>
