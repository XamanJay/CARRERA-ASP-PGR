<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdExperienciaLaboral"
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
  <FORM METHOD="post" ACTION= "Altas_CARdExperienciaLaboral.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Historia Laboral No Institucional  </FONT>
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
        if request("Id_CARcTipoEmpresa")  <> "" then  Ob_RS("Id_CARcTipoEmpresa")=ucase(request("Id_CARcTipoEmpresa")) end if
        if request("CARdExperienciaLaboral")  <> "" then  Ob_RS("CARdExperienciaLaboral")=ucase(request("CARdExperienciaLaboral")) end if
        if request("NombreEmpresa_Institucion")  <> "" then  Ob_RS("NombreEmpresa_Institucion")=ucase(request("NombreEmpresa_Institucion")) end if
        if request("Puesto")  <> "" then  Ob_RS("Puesto")=ucase(request("Puesto")) end if
		
        if request("AnioInicio")  <> "" then  Ob_RS("AnioInicio")=request("AnioInicio") end if
        if request("AnioTermino")  <> "" then  Ob_RS("AnioTermino")=request("AnioTermino") end if

        if request("MotivoSeparacion")  <> "" then  Ob_RS("MotivoSeparacion")=ucase(request("MotivoSeparacion")) end if
        if request("Logros")  <> "" then  Ob_RS("Logros")=ucase(request("Logros")) end if
        if request("Calle")  <> "" then  Ob_RS("Calle")=ucase(request("Calle")) end if
        if request("Numero")  <> "" then  Ob_RS("Numero")=ucase(request("Numero")) end if
		if request("NumeroExt")<> "" then Ob_RS("NumeroExt")=ucase(request("NumeroExt")) end if
        if request("Colonia")  <> "" then  Ob_RS("Colonia")=ucase(request("Colonia")) end if
        if request("CodigoPostal")  <> "" then  Ob_RS("CodigoPostal")=request("CodigoPostal") end if
        if request("Municipio")  <> "" then  Ob_RS("Municipio")=ucase(request("Municipio")) end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=ucase(request("Ciudad")) end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if

		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
 '       if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS("Fecha_Captura")=date()
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
         <B>Tipo Empresa/Institución </B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipoEmpresa order by id_CARcTipoEmpresa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEmpresa' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEmpresa")= CINT(Id_CARcTipoEmpresa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEmpresa")%>'> <%= Ob_RS2("CARcTipoEmpresa")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEmpresa")%>'> <%= Ob_RS2("CARcTipoEmpresa")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
     <TR>
      <TD>
        <B>Nombre de la empresa o institución</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreEmpresa_Institucion' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=NombreEmpresa_Institucion%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Cargo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Puesto' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=Puesto%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>A&ntilde;o de ingreso</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AnioInicio' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioInicio%> >
       </TD > 
     </TR>
     <TR>
      <TD>
        <B>Año de separación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AnioTermino' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioTermino%> >
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Motivo de separación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='MotivoSeparacion' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= MotivoSeparacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Logros obtenidos</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <!--INPUT TYPE='TEXT' NAME='Logros' SIZE=50 MAXLENGTH=50 VALUE=<%= Logros%>-->
       <TEXTAREA NAME='Logros' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=Logros%></TEXTAREA>
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
       <p><INPUT TYPE='TEXT' NAME='NumeroExt' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= NumeroExt%>>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='Numero' style="text-transform: uppercase" SIZE=10 MAXLENGTH=10 VALUE=<%= Numero%>>
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdExperienciaLaboral' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdExperienciaLaboral%></TEXTAREA>
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

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()" > &nbsp;&nbsp;&nbsp; 
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

  if (FormAltas.NombreEmpresa_Institucion.value  == "")
  {
       alert("EL CAMPO: Nombre de la empresa o institución, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Puesto.value  == "")
  {
       alert("EL CAMPO: Cargo, no puede estar vacio");
       return false;
  }
  
  
  








  
  
       /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_especialnumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        if(jvi_textoynumero_correcto.test(FormAltas.NombreEmpresa_Institucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la empresa o institución, verifique por favor.');
	  	 FormAltas.NombreEmpresa_Institucion.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Puesto.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Cargo, verifique por favor.');
	  	 FormAltas.Puesto.focus();
      	 return false;    
        }
		
		
		
		
		if(jvi_numero_correcto.test(FormAltas.AnioInicio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año inicio, verifique por favor.');
	  	 FormAltas.AnioInicio.focus();
      	 return false;    
        }
		      
			 if (FormAltas.AnioInicio.value != "" )
			 {
			   var anio = '<%=anio%>'
			   if (anio >= FormAltas.AnioInicio.value)
		          {
     	 			alert('El Año de inicio no puede se menor o igual a la fecha de nacimiento de la persona, verifique por favor.');
	  	 			FormAltas.AnioInicio.focus();
      	 			return false;    
        			}
		      }
		
		
		if(jvi_numero_correcto.test(FormAltas.AnioTermino.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año termino, verifique por favor.');
	  	 FormAltas.AnioTermino.focus();
      	 return false;    
        }
		
		
		     if (FormAltas.AnioTermino.value != "" )
			 {    
			  if (FormAltas.AnioInicio.value > FormAltas.AnioTermino.value)
		          {
     	 			alert('El Año de termino no puede se menor al año de inicio, verifique por favor.');
	  	 			FormAltas.AnioTermino.focus();
      	 			return false;    
        			}
			  }		
		
		if(jvi_texto_correcto.test(FormAltas.MotivoSeparacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Motivo de separación, verifique por favor.');
	  	 FormAltas.MotivoSeparacion.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Logros.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Logros obtenidos, verifique por favor.');
	  	 FormAltas.Logros.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Calle.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calle, verifique por favor.');
	  	 FormAltas.Calle.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormAltas.NumeroExt.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número ext., verifique por favor.');
	  	 FormAltas.NumeroExt.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormAltas.Numero.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Numero int., verifique por favor.');
	  	 FormAltas.Numero.focus();
      	 return false;    
        }
		
		if(jvi_especialnumero_correcto.test(FormAltas.Colonia.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Colonia, verifique por favor.');
	  	 FormAltas.Colonia.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormAltas.CodigoPostal.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Código postal, verifique por favor.');
	  	 FormAltas.CodigoPostal.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Municipio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Municipio, verifique por favor.');
	  	 FormAltas.Municipio.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto.test(FormAltas.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormAltas.Ciudad.focus();
      	 return false;    
        }
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdExperienciaLaboral.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdExperienciaLaboral.focus();
      	 return false;    
        }*/
		
		 
  
  
  
       FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

  
  
  

}
</script>