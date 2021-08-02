<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdExperienciaLaboral"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdExperienciaLaboral WHERE Id_CARdExperienciaLaboral ="+CSTR(ParID) 
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

   Id_CARcTipoEmpresa= OB_RS("Id_CARcTipoEmpresa")
   CARdExperienciaLaboral= OB_RS("CARdExperienciaLaboral")
   NombreEmpresa_Institucion= OB_RS("NombreEmpresa_Institucion")
   Puesto= OB_RS("Puesto")
   AnioInicio= OB_RS("AnioInicio")
   AnioTermino= OB_RS("AnioTermino")
   Ciudad= OB_RS("Ciudad")
   
   MotivoSeparacion = Ob_RS("MotivoSeparacion")
   Logros = Ob_RS("Logros")
   Calle = Ob_RS("Calle")
   Numero = Ob_RS("Numero")
   NumeroExt = Ob_RS("NumeroExt")
   Colonia = Ob_RS("Colonia")
   CodigoPostal = Ob_RS("CodigoPostal")
   Municipio = Ob_RS("Municipio")
   
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   FechaCaptura= OB_RS("Fecha_Captura")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdExperienciaLaboral.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Historia Laboral No Institucional </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Historia Laboral No Institucional </FONT></h2>
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
        consulta = "SELECT * FROM CARdExperienciaLaboral WHERE Id_CARdExperienciaLaboral ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdExperienciaLaboral")=ucase(request("CARdExperienciaLaboral")) 
          Ob_RS("NombreEmpresa_Institucion")=ucase(request("NombreEmpresa_Institucion"))
         Ob_RS("Puesto")=ucase(request("Puesto")) 
         'Ob_RS("AnioInicio")=request("AnioInicio") 
		 
 IF request ("Id_CARcTipoEmpresa") = "" then 
    Ob_RS("Id_CARcTipoEmpresa")= NULL 
 ELSE
    Ob_RS("Id_CARcTipoEmpresa")= request("Id_CARcTipoEmpresa") 
 END IF 

 IF request ("AnioInicio") = "" then 
    Ob_RS("AnioInicio")= NULL 
 ELSE
    Ob_RS("AnioInicio")= request("AnioInicio") 
 END IF 
		 
		 
        ' Ob_RS("AnioTermino")=request("AnioTermino") 
		 
		 
		 
 IF request ("AnioTermino") = "" then 
    Ob_RS("AnioTermino")= NULL 
 ELSE
    Ob_RS("AnioTermino")= request("AnioTermino") 
 END IF 

         Ob_RS("MotivoSeparacion")=ucase(request("MotivoSeparacion")) 
         Ob_RS("Logros")=ucase(request("Logros")) 
		 Ob_RS("Calle")=ucase(request("Calle")) 
         Ob_RS("Numero")=ucase(request("Numero")) 
		 Ob_RS("NumeroExt")=ucase(request("NumeroExt")) 
         Ob_RS("Colonia")=ucase(request("Colonia")) 
         Ob_RS("CodigoPostal")=request("CodigoPostal") 
         Ob_RS("Municipio")=ucase(request("Municipio")) 
		
         Ob_RS("Ciudad")=ucase(request("Ciudad")) 
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        
	'	if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
		
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
         <B>Tipo Empresa/Institución </B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipoEmpresa order by id_CARcTipoEmpresa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEmpresa' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEmpresa")= CINT(Id_CARcTipoEmpresa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEmpresa")%>'> <%= Ob_RS2("CARcTipoEmpresa")%>  </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEmpresa")%>'> <%= Ob_RS2("CARcTipoEmpresa")%> </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Nombre de la empresa o institución<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreEmpresa_Institucion' style="text-transform: uppercase"  SIZE=10 ROWS=5 COLS=35><%=NombreEmpresa_Institucion%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Cargo<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Puesto' style="text-transform: uppercase"  SIZE=10 ROWS=5 COLS=35><%=Puesto%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Año de ingreso<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AnioInicio' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioInicio%> >
      </TD > 
     <TR>
      <TD>
        <B>Año de separación<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AnioTermino' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioTermino%> >
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Motivo de separación</font>	</B>      </TD>
      <TD>
 	    <P ALIGN='left'>
 	      <input type='TEXT' name='MotivoSeparacion' style="text-transform: uppercase"  size=50 maxlength=50 value='<%= MotivoSeparacion%>'>
       </TD > 
     </TR>
     <TR>
      <TD>
        <B>Logros obtenidos</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <!--INPUT TYPE='TEXT' NAME='Logros' SIZE=50 MAXLENGTH=50 VALUE=<%= Logros%>-->
       <TEXTAREA NAME='Logros' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=Logros%></TEXTAREA>
      </TD > 
     </TR>
      <TR>
      <TD>
        <B>Calle</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Calle%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <p><B>Número exterior </B></p>       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='NumeroExt' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= NumeroExt%>>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='Numero' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= Numero%>>
      </p></TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Colonia%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Código postal</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=5 MAXLENGTH=5 VALUE=<%= CodigoPostal%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Municipio' style="text-transform: uppercase"  SIZE=50 MAXLENGTH=50 VALUE='<%= Municipio%>'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado </B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA order by id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Ciudad%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdExperienciaLaboral' style="text-transform: uppercase"  SIZE=10 ROWS=5 COLS=35><%=CARdExperienciaLaboral%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdExperienciaLaboral >
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
fecha_nacimiento = "Select FechaNacimiento FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN fecha_nacimiento, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		FechaNacimiento = Ob_RS2("FechaNacimiento")
		anio = YEAR(FechaNacimiento)
		'RESPONSE.WRITE anio & "<--------"
        'RESPONSE.END 
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
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

  if (FormEdita.NombreEmpresa_Institucion.value  == "")
  {
       alert("EL CAMPO: Nombre de la empresa o institución, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Puesto.value  == "")
  {
       alert("EL CAMPO: Cargo, no puede estar vacio");
       return false;
  }
  


 /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        if(jvi_textoynumero_correcto.test(FormEdita.NombreEmpresa_Institucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la empresa o institución, verifique por favor.');
	  	 FormEdita.NombreEmpresa_Institucion.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Puesto.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Cargo, verifique por favor.');
	  	 FormEdita.Puesto.focus();
      	 return false;    
        }
		
		
		
		
		if(jvi_numero_correcto.test(FormEdita.AnioInicio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año inicio, verifique por favor.');
	  	 FormEdita.AnioInicio.focus();
      	 return false;    
        }
		      
			 if (FormEdita.AnioInicio.value != "" )
			 {
			   var anio = '<%=anio%>'
			   if (anio >= FormEdita.AnioInicio.value)
		          {
     	 			alert('El Año de inicio no puede se menor o igual a la fecha de nacimiento de la persona, verifique por favor.');
	  	 			FormEdita.AnioInicio.focus();
      	 			return false;    
        			}
		      }
		
		
		if(jvi_numero_correcto.test(FormEdita.AnioTermino.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año termino, verifique por favor.');
	  	 FormEdita.AnioTermino.focus();
      	 return false;    
        }
		
		
		     if (FormEdita.AnioTermino.value != "" )
			 {    
			  if (FormEdita.AnioInicio.value > FormEdita.AnioTermino.value)
		          {
     	 			alert('El Año de termino no puede se menor al año de inicio, verifique por favor.');
	  	 			FormEdita.AnioTermino.focus();
      	 			return false;    
        			}
			  }		
		
		if(jvi_texto_correcto.test(FormEdita.MotivoSeparacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Motivo de separación, verifique por favor.');
	  	 FormEdita.MotivoSeparacion.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Logros.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Logros obtenidos, verifique por favor.');
	  	 FormEdita.Logros.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormEdita.Calle.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormEdita.NumeroExt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número ext., verifique por favor.');
	  	 FormEdita.NumeroExt.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormEdita.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Numero int., verifique por favor.');
	  	 FormEdita.Numero.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormEdita.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormEdita.Colonia.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormEdita.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Código postal, verifique por favor.');
	  	 FormEdita.CodigoPostal.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio, verifique por favor.');
	  	 FormEdita.Municipio.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormEdita.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormEdita.Ciudad.focus();
      	 return false;    
        }
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdExperienciaLaboral.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdExperienciaLaboral.focus();
      	 return false;    
        }*/
		
		 
  
  
  
       FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/













}
</script>