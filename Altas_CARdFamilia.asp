<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdFamilia"
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
  <FORM METHOD="post" ACTION= "Altas_CARdFamilia.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de Referencias Personales  </FONT>
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
        if request("CARdFamilia")  <> "" then  Ob_RS("CARdFamilia")=ucase(request("CARdFamilia")) end if
        if request("Id_CARcParentesco")  <> "" then  Ob_RS("Id_CARcParentesco")=request("Id_CARcParentesco") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=ucase(request("Nombre")) end if
        if request("id_CARcGenero")  <> "" then  Ob_RS("id_CARcGenero")=request("id_CARcGenero") end if
        if request("Ocupacion")  <> "" then  Ob_RS("Ocupacion")=ucase(request("Ocupacion")) end if
        if request("Telefono")  <> "" then  Ob_RS("Telefono")=request("Telefono") end if

        if request("Calle")  <> "" then  Ob_RS("Calle")=ucase(request("Calle")) end if
        if request("Numero")  <> "" then  Ob_RS("Numero")=ucase(request("Numero")) end if
        if request("NumeroInt")  <> "" then  Ob_RS("NumeroInt")=ucase(request("NumeroInt")) end if
        if request("Colonia")  <> "" then  Ob_RS("Colonia")=ucase(request("Colonia")) end if
        if request("CodigoPostal")  <> "" then  Ob_RS("CodigoPostal")=request("CodigoPostal") end if
        if request("Municipio")  <> "" then  Ob_RS("Municipio")=ucase(request("Municipio")) end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=ucase(request("Ciudad")) end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if

'        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
        if request("Id_CARcReferencia")  <> "" then  Ob_RS("Id_CARcReferencia")=request("Id_CARcReferencia") end if
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
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
         <B>Referencia</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCREFERENCIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcReferencia' SIZE=1 onchange='SeleMenu()'>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcReferencia")= CINT(Id_CARcReferencia) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= Ob_RS2("CARcReferencia")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= Ob_RS2("CARcReferencia")%>
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
         <B>Parentesco</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPARENTESCO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcParentesco' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcParentesco")= CINT(Id_CARcParentesco) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= Ob_RS2("CARcParentesco")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= Ob_RS2("CARcParentesco")%>
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
        <B>Nombre</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase"  VALUE=<%= Nombre%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Género</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcGENERO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='id_CARcGenero' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("id_CARcGenero")= CINT(id_CARcGenero) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
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
        <B>Ocupación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ocupacion' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ocupacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Calle</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= Calle%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <p><B>Número exterior </B></p>
       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='Numero' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= Numero%>>
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='NumeroInt' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= NumeroInt%>>
      </p></TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= Colonia%>>
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
       <INPUT TYPE='TEXT' NAME='Municipio' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= Municipio%>>
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
       <INPUT TYPE='TEXT' NAME='Ciudad' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Teléfono</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=50 MAXLENGTH=100 VALUE=<%= Telefono%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFamilia' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdFamilia%></TEXTAREA>
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
  
  
 <%
    evita_duplicidad_m = "Select Id_CARdFamilia FROM CARdFamilia WHERE Id_CARdDatosPersonales = "& idPersona &" AND Id_CARcParentesco = 3"
     Ob_RS2.OPEN evita_duplicidad_m, Ob_Conn, 3, 1 
		totderegistros_m = Ob_RS2.RECORDCOUNT
	'	RESPONSE.WRITE totderegistros_m & "<--------"
   'RESPONSE.END 
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   evita_duplicidad_p = "Select Id_CARdFamilia FROM CARdFamilia WHERE Id_CARdDatosPersonales = "& idPersona &" AND Id_CARcParentesco = 4"
     Ob_RS2.OPEN evita_duplicidad_p, Ob_Conn, 3, 1 
		totderegistros_p = Ob_RS2.RECORDCOUNT
	'	RESPONSE.WRITE totderegistros_p & "<--------_p"
   'RESPONSE.END 
   Ob_RS2.CLOSE		
  %>
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

  if (FormAltas.Id_CARcReferencia.value  == 0)
  {
       alert("EL CAMPO: Referencia , no puede estar vacio");
       return false;
  }

  if (FormAltas.Id_CARcReferencia.value  == 1 && FormAltas.Id_CARcParentesco.value  == 0)
  {
       alert("EL CAMPO: Parentesco, no puede estar vacio");
       return false;
  }
  
 /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	  var  totderegistros_m = '<%= totderegistros_m %>'
	  var  totderegistros_p = '<%= totderegistros_p %>'


  if (FormAltas.Id_CARcParentesco.value  == 3)
  {	  
	 if (totderegistros_m >= 1)
	  {
	  alert ("Para esta persona ya existe un tipo de parentesco Madre, verifique por favor.");
	  return false;
	  }
  }  
	 
	  
   if (FormAltas.Id_CARcParentesco.value  == 4)
   {	  
	  if (totderegistros_p >= 1)
	  {
	  alert ("Para esta persona ya existe un tipo de parentesco Padre, verifique por favor.");
	  return false;
	  }
	}
	
 /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
 
  
  
  
  if (FormAltas.Nombre.value  == "")
  {
       alert("EL CAMPO: Nombre, no puede estar vacio");
       return false;
  }

     /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        if(jvi_texto_correcto.test(FormAltas.Nombre.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre, verifique por favor.');
	  	 FormAltas.Nombre.focus();
      	 return false;    
        }
		
		if(jvi_texto_correcto.test(FormAltas.Ocupacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ocupacion, verifique por favor.');
	  	 FormAltas.Ocupacion.focus();
      	 return false;    
        }
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormAltas.Calle.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormAltas.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Ext., verifique por favor.');
	  	 FormAltas.Numero.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormAltas.NumeroInt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Int., verifique por favor.');
	  	 FormAltas.NumeroInt.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormAltas.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormAltas.Colonia.focus();
      	 return false;    
        }*/
		
		if(jvi_numero_correcto.test(FormAltas.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo CódigoPostal, verifique por favor.');
	  	 FormAltas.CodigoPostal.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio, verifique por favor.');
	  	 FormAltas.Municipio.focus();
      	 return false;    
        }
		
		if(jvi_texto_correcto.test(FormAltas.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormAltas.Ciudad.focus();
      	 return false;    
        }
		
		/*if(jvi_numero_correcto.test(FormAltas.Telefono.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Teléfono, verifique por favor.');
	  	 FormAltas.Telefono.focus();
      	 return false;    
        }*/
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdFamilia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones paterno, verifique por favor.');
	  	 FormAltas.CARdFamilia.focus();
      	 return false;    
        }*/
 











 
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/


}

function SeleMenu()
{
		if  (document.FormAltas.Id_CARcReferencia.value == 1 )
		 {
//             document.FormAltas.Id_CARcParentesco.disabled =false
		  }
		  else
		  {
             document.FormAltas.Id_CARcParentesco.length= 1;
//             document.FormAltas.Id_CARcParentesco.disabled =true
		  }
        document.FormAltas.Id_CARcParentesco.options[0].selected =true
}

</script>