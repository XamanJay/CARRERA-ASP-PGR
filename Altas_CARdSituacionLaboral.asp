<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
         CARdSituacionLaboral  =request("CARdSituacionLaboral") 
         Id_CARcEstatusLaboral =request("Id_CARcEstatusLaboral") 
         Id_CARcMotivoEstatus  =request("Id_CARcMotivoEstatus") 
         Id_CARcActual         =request("Id_CARcActual") 
		 Id_CARcDesignacionEspecial=request("Id_CARcDesignacionEspecial") 
         NoOficioDocto =request("NoOficioDocto") 
         FechaoficioDocto= request("FechaoficioDocto") 
         Sesion=request("Sesion") 
         Periodo=request("Periodo") 
         Id_CARcCargoEstructura=request("Id_CARcCargoEstructura") 
         AdscripcionEstructura=request("AdscripcionEstructura") 
         Id_CARcMotivoEstatus=request("Id_CARcMotivoEstatus") 
 '        FechaBaja=request("FechaBaja") 

   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdSituacionLaboral"
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
 '  response.end
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
  <FORM METHOD="post" ACTION= "Altas_CARdSituacionLaboral.asp" NAME= "FormAltas">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de Situacion Laboral</FONT>
    </H2>
  </CENTER>

 <%
      IF request("Id_CARcEstatusLaboral") <> "" THEN
'   response.write"::::::"
 '  RESPONSE.WrITE(request("Id_CARcEstatusLaboral"))
'   RESPONSE.END
      xEstatus = CINT(request("Id_CARcEstatusLaboral"))
     Id_CARcEstatusLaboral = request("Id_CARcEstatusLaboral")
   END IF 

	xAct = 1
	xSusp = 2
	xLEsp = 3
	xBaja = 4
	xLTmp = 5
	xIrre = 6
	xLMed = 7 
	
     vAgregar = request("Agregar") 
'	 RESPONSE.WRITE("-->>>"+vAgregar)
	' RESPONSE.END
     if vAgregar = "S" then  
'	 RESPONSE.WRITE(REQUEST.FORM)
'	 RESPONSE.END
	
    	   Ob_RS.Addnew 
        if request("CARdSituacionLaboral")  <> "" then  Ob_RS("CARdSituacionLaboral")=ucase(request("CARdSituacionLaboral")) end if
        if request("Id_CARcEstatusLaboral")  <> "" then  Ob_RS("Id_CARcEstatusLaboral")=request("Id_CARcEstatusLaboral") end if
        if request("Id_CARcMotivoEstatus")  <> ""  then  Ob_RS("Id_CARcMotivoEstatus")=request("Id_CARcMotivoEstatus") end if
        if request("Id_CARcMotivoEstatus")  = "" OR request("Id_CARcMotivoEstatus") = NULL  then  Ob_RS("Id_CARcMotivoEstatus")=0 end if
        if request("Id_CARcActual")  <> ""  then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
        if request("Id_CARcActual")  = "" OR request("Id_CARcActual") = NULL then  Ob_RS("Id_CARcActual")=0 end if
        if request("Id_CARcDesignacionEspecial")  <> ""  then  Ob_RS("Id_CARcDesignacionEspecial")=request("Id_CARcDesignacionEspecial") end if
        if request("Id_CARcDesignacionEspecial") = NULL OR request("Id_CARcDesignacionEspecial")  = "" then  Ob_RS("Id_CARcDesignacionEspecial")= 0 end if
        if request("NoOficioDocto")  <> "" then  Ob_RS("NoOficioDocto")=ucase(request("NoOficioDocto")) end if
        if request("FechaoficioDocto")  <> "" then  Ob_RS("FechaoficioDocto")=request("FechaoficioDocto") end if
        if request("Sesion")  <> "" then  Ob_RS("Sesion")=ucase(request("Sesion")) end if
        if request("Periodo")  <> "" then  Ob_RS("Periodo")=request("Periodo") end if
        if request("Id_CARcCargoEstructura")  <> ""  then  Ob_RS("Id_CARcCargoEstructura")=request("Id_CARcCargoEstructura") end if
        if request("Id_CARcCargoEstructura")  = "" OR request("Id_CARcCargoEstructura") = NULL then  Ob_RS("Id_CARcCargoEstructura")= 0 end if
        if request("AdscripcionEstructura")  <> "" then  Ob_RS("AdscripcionEstructura")=ucase(request("AdscripcionEstructura")) end if
        if request("Id_CARcMotivoEstatus")  <> "" then  Ob_RS("Id_CARcMotivoEstatus")=request("Id_CARcMotivoEstatus") end if
        if request("Id_CARcMotivoEstatus")  = "" OR request("Id_CARcMotivoEstatus") = NULL then  Ob_RS("Id_CARcMotivoEstatus")= 0 end if
        if request("FechaBaja")  <> "" then  Ob_RS("FechaBaja")=request("FechaBaja") end if
        if request("NoDocumento")  <> "" then  Ob_RS("NoDocumento")=ucase(request("NoDocumento")) end if
		
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
        Ob_RS.update
        response.clear
				
	      %>
		 		<!-- #INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
<fieldset>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>

<%
IF request("Id_CARcEstatusLaboral") <> "" THEN
  CALL DispEstatus()
ELSE 
  CALL Estatus()
END IF
IF xEstatus = xAct THEN
   CALL Actual()
   CALL Observaciones()
END IF
IF xEstatus = xSusp THEN
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL Actual()
   CALL Observaciones()
END IF
IF xEstatus = xLEsp THEN
 '  CALL Estatus()
   CALL CargoEstructura()
   CALL Adscripcion()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL NumSesion()
   CALL Actual()
   CALL Observaciones()
END IF
IF xEstatus = xLTmp THEN
'   CALL Estatus()
   CALL DESIGNACIONEspecial()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL NumSesion()
   CALL Actual()
   CALL Observaciones()
END IF

IF xEstatus = xIrre THEN
'   CALL Estatus()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Actual()
   CALL Observaciones()
END IF

IF xEstatus = xLMed THEN
'   CALL Estatus()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL Actual()
   CALL Observaciones()
END IF

IF xEstatus = xBaja THEN
'   CALL Estatus()
   CALL MotivoBaja()
   CALL FechaBaja()
   CALL Actual()
   CALL Observaciones()
END IF

'   CALL Estatus()
'   CALL DESIGNACIONEspecial()
'   CALL NumOficio()
'   CALL FechaOficio()
'   CALL Periodos()
'   CALL NumSesion()
'   CALL CargoEstructura()
'   CALL Adscripcion()
'   CALL MotivoBaja()
'   CALL FechaBaja()
'   CALL Actual()
'   CALL Observaciones()
%>
	  </TABLE>
	  </fieldset>



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
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>	
  
  
  
  

  <p ALIGN="center"> &nbsp;
  
 <%  IF request("Id_CARcEstatusLaboral") = ""  THEN %>
   <INPUT TYPE="submit" VALUE="Siguiente" NAME="B1" > &nbsp;&nbsp;&nbsp; 
   <INPUT TYPE="button" VALUE="Regresar" NAME="B2" onClick="history.go(-1)"> &nbsp;&nbsp;&nbsp; 
   <%ELSE %>
   <input type="hidden" name="Agregar" value="S">
<input type="hidden" name="Id_CARcEstatusLaboral" value=<%=request("Id_CARcEstatusLaboral")%>>

   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
   <INPUT TYPE="button" VALUE="Regresar" NAME="B2" onClick="history.go(-1)"> &nbsp;&nbsp;&nbsp; 
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

  if (FormAltas.Id_CARcEstatusLaboral.value  == 0)
  {
       alert("EL CAMPO: Estatus, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARcActual.value  == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }
    
	
	
	
	
	
 
 var xEstatus = '<%= xEstatus%>'



 if (xEstatus == 4)
 {	
	if (FormAltas.FechaBaja.value != "")
  {
	  if (!esFecha(FormAltas.FechaBaja.value,'E'))
	  {
		alert("El campo - Fecha de baja- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaBaja.focus();
		return false;
	  }	
  }
  
  
             var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaBaja = FormAltas.FechaBaja.value
			
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaBaja = Date.parse(FechaBaja)
		
			if (FechaBaja < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de baja no puede ser menor a la fecha del ingreso a la PGR de la persona.");
			FormAltas.FechaBaja.focus();
			return false;
		  }	
  
  
  
  
 }


    /*xAct = 1
	xSusp = 2
	xLEsp = 3
	xBaja = 4
	xLTmp = 5
	xIrre = 6
	xLMed = 7 */
	
	if (xEstatus == 2 || xEstatus == 3 || xEstatus == 5 || xEstatus == 6)	
  {
		 if (FormAltas.FechaoficioDocto.value != "")
	  {
		  if (!esFecha(FormAltas.FechaoficioDocto.value,'E'))
		  {
			alert("El campo - Fecha de oficio documento- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaoficioDocto.focus();
			return false;
		  }	
	  }
 }



 if (xEstatus == 7)	
  {
		 if (FormAltas.FechaoficioDocto.value != "")
	  {
		  if (!esFecha(FormAltas.FechaoficioDocto.value,'E'))
		  {
			alert("El campo - Fecha de oficio documento- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaoficioDocto.focus();
			return false;
		  }	
	  }
  
  
  
			var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaoficioDocto = FormAltas.FechaoficioDocto.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaoficioDocto = Date.parse(FechaoficioDocto)
		
			if (FechaoficioDocto < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de oficio de documento no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaoficioDocto.focus();
			return false;
		  }	
 }		   
		   
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

      /*  if(jvi_textoynumero_correcto.test(FormAltas.Periodo.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Periodo, verifique por favor.');
	  	 FormAltas.Periodo.focus();
      	 return false;    
        }	
		
		if(jvi_textoynumero_correcto.test(FormAltas.Sesion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Sesión, verifique por favor.');
	  	 FormAltas.Sesion.focus();
      	 return false;    
        }		   
          
		 if(jvi_textoynumero_correcto.test(FormAltas.AdscripcionEstructura.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Adscripción Estructura, verifique por favor.');
	  	 FormAltas.Sesion.focus();
      	 return false;    
        }	

         if(jvi_textoynumero_correcto.test(FormAltas.NoDocumento.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo NoDocumento, verifique por favor.');
	  	 FormAltas.NoDocumento.focus();
      	 return false;    
        }
		*/
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdSituacionLaboral.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdSituacionLaboral.focus();
      	 return false;    
        }*/



		   
		   
		   
		   
		 
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  
		   
		   
		   
		   
		   
		   
		   

/*
if (!comparaFechas(FormAltas.FechaAcuerdo.value,'menor_igual',FormAltas.FechaInicio.value,0))
		{
		alert("La Fecha de Acuerdo no puede ser menor a la Fecha de Inicio: ")
		return false;
		}

  if (FormAltas.Id_CARcTipoAcuerdo.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO:  acuerdo.");
       return false;
  }
  
 if ((FormAltas.Id_CARcEstatusLaboral.value  != 0 ) && (FormAltas.Id_CARcEstatusLaboral.value  != 1 ) && (FormAltas.Id_CARcMotivoEstatus.value  == 0 ) )
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Motivo.");
       return false;
  }
*/
 //  document.FormAltas.Agregar.value = "S"

}
















function CambiaVal()
{

       alert();
     document.FormAltas.Agregar.value = "N"
}

</script> 
<%
SUB Estatus %>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD><%'response.write sCvePerfilGrupo %>
          <%Sql ="SELECT * FROM CARcEstatusLaboral" 
          If sCvePerfilGrupo = "97" Then
          	'Nota:La cve 97 corresponde al perfil denominado PERFIL_11 que se localiza en el catálogo "CARcPerfilGrupo". 
          	'     Si el número de clave del perfil cambia en la bd, es necesario actualizar esta parte dl código          	
          	Sql = Sql &" Where CARcEstatusLaboral in ('LICENCIA ESPECIAL','LICENCIA TEMPORAL')"
          End If          
          %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1 <% IF xESTATUS <> 0 Then response.write("DISABLED") END IF %>>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusLaboral")= CINT(Id_CARcEstatusLaboral) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
                   </OPTION>
                <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
                </OPTION>
                <%END IF%>
	         <%Ob_RS2.MOVENEXT%>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>

<%
END SUB 
SUB DispEstatus %>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD>
         <%
		  Sql ="SELECT * FROM CARcEstatusLaboral where Id_CARcEstatusLaboral = " + CSTR(Id_CARcEstatusLaboral) 
         Ob_RS2.OPEN Sql, Ob_Conn 
	'  RESPONSE.WRITE(Sql)
	  RESPONSE.WRITE(Ob_RS2("CARcEstatusLaboral"))
          Ob_RS2.CLOSE 
		  %>
      </TD>
     </TR>

<%
END SUB %>

<%
SUB DesignacionEspecial 
  %> 
     <TR>
      <TD> 
         <B>Designación especial</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESIGNACIONESPECIAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesignacionEspecial' SIZE=1 >
           <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDesignacionEspecial")= CINT(Id_CARcDesignacionEspecial) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%= UCASE(Ob_RS2("CARcDesignacionEspecial"))%>                   </OPTION>
               <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%= UCASE(Ob_RS2("CARcDesignacionEspecial"))%>
                </OPTION>
               <%END IF  %>		   			 
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
 <%

END SUB

SUB NUMOficio %>
     <TR>
      <TD>
        <B>No. Oficio / Documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='NoOficioDocto' SIZE=50 MAXLENGTH=50 VALUE=<%= NoOficioDocto%>>
      </TD > 
     </TR>

<%
END SUB
SUB FEchaOficio
%>
     <TR>
      <TD>
        <B>Fecha de oficio o documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaoficioDocto' SIZE=10 MAXLENGTH=12 VALUE=<%= FechaoficioDocto%> >
       <IMG ONCLICK="window_open('FormAltas','FechaoficioDocto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%	 
END SUB

SUB Periodos %> 
     <TR>
      <TD>
        <B>Periódo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Periodo' SIZE=30 MAXLENGTH=40 style="text-transform: uppercase" VALUE=<%= Periodo%>>
      </TD > 
     </TR>
<%
END SUB

SUB NumSesion %>
     <TR>
      <TD>
        <B>Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='Sesion' SIZE=15 MAXLENGTH=15 VALUE=<%= Sesion%>>
      </TD > 
     </TR>
<%
END SUB

SUB CargoEstructura %>
     <TR>
      <TD> 
         <B>Cargo de estructura</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARGOESTRUCTURA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCargoEstructura' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCargoEstructura")= CINT(Id_CARcCargoEstructura) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%= UCASE(Ob_RS2("CARcCargoEstructura"))%>
                   </OPTION>
                <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%= UCASE(Ob_RS2("CARcCargoEstructura"))%>
                </OPTION>
                <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF  %>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB Adscripcion %>
      <TR>
      <TD>
        <B>Adscripción para estructura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='AdscripcionEstructura' SIZE=60 MAXLENGTH=80 VALUE=<%= AdscripcionEstructura%>>
      </TD > 
     </TR>

<%END SUB

SUB MotivoBaja %>
    <TR>
      <TD> 
         <B>Motivo de baja</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOESTATUS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoEstatus' SIZE=1 >
		  <%IF Ob_RS2.EOF  THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoEstatus")= CINT(Id_CARcMotivoEstatus) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%= Ob_RS2("CARcMotivoEstatus")%>
                   </OPTION>
                <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%= Ob_RS2("CARcMotivoEstatus")%>
                </OPTION>
              <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB FechaBaja %>
     <TR>
      <TD>
        <B>Fecha de baja</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaBaja' SIZE=10 MAXLENGTH=10 >
       <IMG ONCLICK="window_open('FormAltas','FechaBaja')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='NoDocumento' SIZE=40  MAXLENGTH=50  >
      </TD > 
     </TR>
<%
END SUB

SUB BAJA %>


<%
END SUB

SUB Actual %>

     <TR>
      <TD>
        <B>¿Actual?</font>	</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
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
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB Observaciones %>
   <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdSituacionLaboral' style="text-transform: uppercase"  SIZE=10 ROWS=5 COLS=35><%=CARdSituacionLaboral%></TEXTAREA>
      </TD > 
	</TR>
<%
END SUB
%>