<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdFamilia"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

'===== Llena un arreglo con los datos del Catalogo que sirve para llenar el Combo Tipo Parentezco
consulta = "SELECT * FROM CARcParentesco " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Paren = OB_rs.getrows
Campos_Paren = UBound(tbl_Paren,1) 
regs_Paren = UBound(tbl_Paren,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

   consulta = "SELECT * FROM CARdFamilia WHERE Id_CARdFamilia ="+CSTR(ParID) 
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
   CARdFamilia= OB_RS("CARdFamilia")
   Id_CARcParentesco= OB_RS("Id_CARcParentesco")
   Nombre= OB_RS("Nombre")
   Id_CARcGenero= OB_RS("Id_CARcGenero")
   Ocupacion= OB_RS("Ocupacion")
   Telefono= OB_RS("Telefono")
   Ciudad= OB_RS("Ciudad")

   Calle =  Ob_RS("Calle")
   Numero = Ob_RS("Numero")
   NumeroInt = Ob_RS("NumeroInt")
   Colonia = Ob_RS("Colonia")
   CodigoPostal = Ob_RS("CodigoPostal")
   Municipio = Ob_RS("Municipio")

   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   Id_CARcReferencia= OB_RS("Id_CARcReferencia")
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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdFamilia.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Referencias Personales</FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Referencias </FONT></h2>
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
        consulta = "SELECT * FROM CARdFamilia WHERE Id_CARdFamilia ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdFamilia")=ucase(request("CARdFamilia")) 
        if request("Id_CARcParentesco")  <> "" then  Ob_RS("Id_CARcParentesco")=request("Id_CARcParentesco") end if
        Ob_RS("Nombre")=ucase(request("Nombre")) 
        if request("Id_CARcGenero")  <> "" then  Ob_RS("Id_CARcGenero")=request("Id_CARcGenero") end if
        Ob_RS("Ocupacion")=ucase(request("Ocupacion")) 
        Ob_RS("Telefono")=request("Telefono") 

        Ob_RS("Calle")=ucase(request("Calle")) 
        Ob_RS("Numero")=ucase(request("Numero")) 
        Ob_RS("NumeroInt")=ucase(request("NumeroInt")) 
        Ob_RS("Colonia")=ucase(request("Colonia")) 
        Ob_RS("CodigoPostal")=request("CodigoPostal") 
        Ob_RS("Municipio")=ucase(request("Municipio")) 

        Ob_RS("Ciudad")=ucase(request("Ciudad")) 
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("Id_CARcReferencia")  <> "" then  Ob_RS("Id_CARcReferencia")=request("Id_CARcReferencia") end if
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
          <%Sql ="SELECT * FROM CARCREFERENCIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Referencia</B><BR>      </TD>
      <TD><select name='Id_CARcReferencia' size=1 onChange='SeleMenu()'>
        <% IF Ob_RS2.EOF THEN %>
        <option value='0'>SIN INFORMACIÓN</option>
        <% END IF  %>
        <%DO UNTIL Ob_RS2.Eof%>
        <%IF Ob_RS2("Id_CARcReferencia")= CINT(Id_CARcReferencia) THEN %>
        <option selected value='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= UCASE(Ob_RS2("CARcReferencia"))%> </option>
        <% ELSE  %>
        <option value='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= UCASE(Ob_RS2("CARcReferencia"))%> </option>
        <%END IF  %>
        <%Ob_RS2.MOVENEXT %>
        <%LOOP%>
      </select></TD>
    <% Ob_RS2.CLOSE%>
     </TR>
    <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCPARENTESCO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Parentesco</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcParentesco' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcParentesco")= CINT(Id_CARcParentesco) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= Ob_RS2("CARcParentesco")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= UCASE(Ob_RS2("CARcParentesco"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
       <%If CINT(Id_CARcReferencia) <> 1 Then%>
       <script>
       	document.FormEdita.Id_CARcParentesco.disabled =true
       </script>
       <%End If%>     
     <TR>
      <TD>
        <B>Nombre<BR>  
       </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Nombre%>'>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCGENERO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Género</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcGenero' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcGenero")= CINT(Id_CARcGenero) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= UCASE(Ob_RS2("CARcGenero"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= UCASE(Ob_RS2("CARcGenero"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Ocupación<BR>  
       </font>	</B>      </TD>
      <TD>
 	    <P ALIGN='left'>
 	      <input type='TEXT' name='Ocupacion' style="text-transform: uppercase" size=50 maxlength=50 value='<%= Ocupacion%>'>
       </TD > 
     <TR>
      <TD>
        <B>Calle</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Calle%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <p><B>Número exterior</B></p>       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='Numero' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE="<%= Numero%>">
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='NumeroInt' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE="<%= NumeroInt%>">
      </p></TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Colonia%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Código postal</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=5 MAXLENGTH=5 VALUE=<%= CodigoPostal%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Municipio' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Municipio%>'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado </B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA order by ID_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <% IF Id_CARcEntidadFederativa = "" OR Id_CARcEntidadFederativa = "0" THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= UCASE(Ob_RS2("CARcEntidadFederativa"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= UCASE(Ob_RS2("CARcEntidadFederativa"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Ciudad%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Tel&eacute;fono<BR>  
       </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=50 MAXLENGTH=100 VALUE="<%= Telefono%>">
      </TD > 
	 <TR>
      <TD>
        <B>Observaciones<BR>  
       </font>	</B>      </TD>
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdFamilia >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>


 <%
     idPersona = REQUEST.QUERYSTRING("Id_Persona")
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

  if (FormEdita.Id_CARcReferencia.value  == 0)
  {
       alert("EL CAMPO: Referencia , no puede estar vacio");
       return false;
  }
  if (FormEdita.Id_CARcReferencia.value  == 1 && FormEdita.Id_CARcParentesco.value  == 0)
  {
       alert("EL CAMPO: Parentesco, no puede estar vacio");
       return false;
  }
  
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	  var  totderegistros_m = '<%= totderegistros_m %>'
	  var  totderegistros_p = '<%= totderegistros_p %>'


  /*if (FormEdita.Id_CARcParentesco.value  == 3)
  {	  
	 if (totderegistros_m >= 1)
	  {
	  alert ("Para esta persona ya existe un tipo de parentesco Madre, verifique por favor.");
	  return false;
	  }
  }  */
	 
	  
   /*if (FormEdita.Id_CARcParentesco.value  == 4)
   {	  
	  if (totderegistros_p >= 1)
	  {
	  alert ("Para esta persona ya existe un tipo de parentesco Padre, verifique por favor.");
	  return false;
	  }
	}*/
	
 /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
 
  
  if (FormEdita.Nombre.value  == "")
  {
       alert("EL CAMPO: Nombre, no puede estar vacio");
       return false;
  }
    
 
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        if(jvi_texto_correcto.test(FormEdita.Nombre.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre, verifique por favor.');
	  	 FormEdita.Nombre.focus();
      	 return false;    
        }
		
		if(jvi_texto_correcto.test(FormEdita.Ocupacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ocupacion, verifique por favor.');
	  	 FormEdita.Ocupacion.focus();
      	 return false;    
        }
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormEdita.Calle.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormEdita.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Ext., verifique por favor.');
	  	 FormEdita.Numero.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormEdita.NumeroInt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número Int., verifique por favor.');
	  	 FormEdita.NumeroInt.focus();
      	 return false;    
        }*/
		
		/*if(jvi_especialnumero_correcto.test(FormEdita.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormEdita.Colonia.focus();
      	 return false;    
        }*/
		
		if(jvi_numero_correcto.test(FormEdita.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo CódigoPostal, verifique por favor.');
	  	 FormEdita.CodigoPostal.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio, verifique por favor.');
	  	 FormEdita.Municipio.focus();
      	 return false;    
        }
		
		if(jvi_texto_correcto.test(FormEdita.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormEdita.Ciudad.focus();
      	 return false;    
        }
		
		/*if(jvi_numero_correcto.test(FormEdita.Telefono.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Teléfono, verifique por favor.');
	  	 FormEdita.Telefono.focus();
      	 return false;    
        }*/
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdFamilia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones paterno, verifique por favor.');
	  	 FormEdita.CARdFamilia.focus();
      	 return false;    
        }*/
 











 
     FormEdita.B1.disabled = true;  
     document.FormEdita.Id_CARcParentesco.disabled =false
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

    
}


function SeleMenu()
{
//var xcont = <%= regs_Paren%> 
		if  (document.FormEdita.Id_CARcReferencia.value == 1 )
		 {
           document.FormEdita.Id_CARcParentesco.disabled =false
		  }
		  else
		  {		  
	        document.FormEdita.Id_CARcParentesco.options[0].selected =true
			document.FormEdita.Id_CARcParentesco.disabled =true
		  }
}



</script>