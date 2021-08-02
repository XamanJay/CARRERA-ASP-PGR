<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdDomicilios"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdDomicilios WHERE Id_CARdDomicilios ="+CSTR(ParID) 
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
   CARdDomicilios= OB_RS("CARdDomicilios")
   Id_CARcTipoDomicilio= OB_RS("Id_CARcTipoDomicilio")
   Calle= OB_RS("Calle")
   Numero= OB_RS("Numero")
   NumeroInt= OB_RS("NumeroInt")
   Colonia= OB_RS("Colonia")
   Municipio= OB_RS("Municipio")
   CodigoPostal= OB_RS("CodigoPostal")
   Ciudad= OB_RS("Ciudad")
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   Telefono= OB_RS("Telefono")
   Id_CARcActual= OB_RS("Id_CARcActual")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdDomicilios.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Domicilios  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar Domicilios  </FONT></h2>
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
        consulta = "SELECT * FROM CARdDomicilios WHERE Id_CARdDomicilios ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdDomicilios")=UCASE(request("CARdDomicilios")) 
        if request("Id_CARcTipoDomicilio")  <> "" then  Ob_RS("Id_CARcTipoDomicilio")=request("Id_CARcTipoDomicilio") 
          Ob_RS("Calle")=UCASE(request("Calle"))
          Ob_RS("Numero")=request("Numero") 
		  Ob_RS("NumeroInt")=request("NumeroInt") 
          Ob_RS("Colonia")=UCASE(request("Colonia")) 
          Ob_RS("CodigoPostal")=request("CodigoPostal") 
          Ob_RS("Municipio")=UCASE(request("Municipio")) 
          Ob_RS("Ciudad")=UCASE(request("Ciudad")) 
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
          Ob_RS("Telefono")=request("Telefono") 
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
          <%Sql ="SELECT * FROM CARCTIPODOMICILIO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>El domicilio es</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoDomicilio' SIZE=1 >
          <% IF Id_CARcTipoDomicilio = "" OR Id_CARcTipoDomicilio = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoDomicilio")= CINT(Id_CARcTipoDomicilio) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDomicilio")%>'> <%= Ob_RS2("CARcTipoDomicilio")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDomicilio")%>'> <%= Ob_RS2("CARcTipoDomicilio")%>
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
        <B>Calle<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Calle' SIZE=50 MAXLENGTH=50 VALUE='<%= Calle%>'>
      </TD > 
     <TR>
      <TD>
        <p><B>Número exterior </B></p>
       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='Numero' SIZE=20 MAXLENGTH=50 style="text-transform: uppercase" VALUE="<%= Numero%>">
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='NumeroInt' SIZE=20 MAXLENGTH=50 style="text-transform: uppercase" VALUE="<%= NumeroInt%>">
      </p></TD > 
     <TR>
      <TD>
        <B>Colonia<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Colonia' SIZE=50 MAXLENGTH=50 VALUE='<%= Colonia%>'>
      </TD > 
     <TR>
      <TD>
        <B>Código postal<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=5 MAXLENGTH=5 VALUE=<%= CodigoPostal%>>
      </TD > 
     <TR>
      <TD>
        <B>Municipio o Delegación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Municipio' SIZE=50 MAXLENGTH=50 VALUE='<%= Municipio%>'>
      </TD > 
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY ID_CARCENTIDADFEDERATIVA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Estado</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
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
        <B>Ciudad<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Ciudad' SIZE=50 MAXLENGTH=50 VALUE='<%= OB_RS("Ciudad")%>'>
      </TD > 
     <TR>
      <TD>
        <B>Tel&eacute;fono<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=50 MAXLENGTH=200 style="text-transform: uppercase" VALUE='<%= Telefono%>'>
      </TD > 
<TR>
      <TD> 
         <B>&iquest;Domicilio actual?</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1  <% IF Id_CARcActual = 1 THEN RESPONSE.WRITE "DISABLED"%>>
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
    <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdDomicilios' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdDomicilios%></TEXTAREA>
      </TD > 
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdDomicilios >
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

  if (FormEdita.Id_CARcTipoDomicilio.value  == "")
  {
       alert("EL CAMPO: El Domicilio es ?, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Calle.value  == "")
  {
       alert("EL CAMPO: Calle, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Numero.value  == "")
  {
       alert("EL CAMPO: Numero, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Colonia.value  == "")
  {
       alert("EL CAMPO: Colonia, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcEntidadFederativa.value  == "")
  {
       alert("EL CAMPO: Id_Estado , no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Ciudad.value  == "")
  {
       alert("EL CAMPO: Ciudad, no puede estar vacio");
       return false;
  }
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        /*if(jvi_textoynumero_correcto.test(FormEdita.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormEdita.Calle.focus();
      	 return false;    
        }*/    
		
		
		


/*if(jvi_especialnumero_correcto.test(FormEdita.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número, verifique por favor.');
	  	 FormEdita.Numero.focus();
      	 return false;    
        } 
	    
		 if(jvi_especialnumero_correcto.test(FormEdita.NumeroInt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Int., verifique por favor.');
	  	 FormEdita.NumeroInt.focus();
      	 return false;    
        } 
		
          if(jvi_especialnumero_correcto.test(FormEdita.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormEdita.Colonia.focus();
      	 return false;    
        } 
		*/
		 if(jvi_numero_correcto.test(FormEdita.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Código postal, verifique por favor.');
	  	 FormEdita.CodigoPostal.focus();
      	 return false;    
        } 
        
		 /*if(jvi_textoynumero_correcto.test(FormEdita.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio o Delegación, verifique por favor.');
	  	 FormEdita.Municipio.focus();
      	 return false;    
        }*/ 
		
		 /*if(jvi_textoynumero_correcto.test(FormEdita.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormEdita.Ciudad.focus();
      	 return false;    
        }*/ 
		
		 /*if(jvi_numero_correcto.test(FormEdita.Telefono.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Teléfono, verifique por favor.');
	  	 FormEdita.Telefono.focus();
      	 return false;    
        } */

         /*if(jvi_textoynumero_correcto.test(FormEdita.CARdDomicilios.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdDomicilios.focus();
      	 return false;    
        } */


		
		




     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

  

}
</script>