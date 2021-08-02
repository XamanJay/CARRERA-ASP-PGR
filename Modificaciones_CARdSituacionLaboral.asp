<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdSituacionLaboral"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdSituacionLaboral WHERE Id_CARdSituacionLaboral ="+CSTR(ParID) 
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
   CARdSituacionLaboral= OB_RS("CARdSituacionLaboral")
   Id_CARcEstatusLaboral= OB_RS("Id_CARcEstatusLaboral")
   Id_CARcMotivoEstatus= OB_RS("Id_CARcMotivoEstatus")
   Id_CARcActual   = Ob_RS("Id_CARcActual")
   Id_CARcDesignacionEspecial =   Ob_RS("Id_CARcDesignacionEspecial")
   NoOficioDocto    = Ob_RS("NoOficioDocto")
   FechaoficioDocto =  Ob_RS("FechaoficioDocto")
   Sesion = Ob_RS("Sesion")
   Periodo = Ob_RS("Periodo")
   Id_CARcCargoEstructura = Ob_RS("Id_CARcCargoEstructura")
   AdscripcionEstructura = Ob_RS("AdscripcionEstructura")
   Id_CARcMotivoEstatus = Ob_RS("Id_CARcMotivoEstatus")
   FechaBajaa =  Ob_RS("FechaBaja")
   Id_CARcActual= OB_RS("Id_CARcActual")
   NoDocumento = OB_RS("NoDocumento")
   
   xEstatus = CINT(Id_CARcEstatusLaboral)
   
	xAct = 1
    xSusp = 2
	xLEsp = 3
	xBaja = 4
	xLTmp = 5
	xIrre = 6
	xLMed = 7 
    
	
	
	
	'xEstatus = TRIM(CINT(xEstatus))
'''response.Write xEstatus & "<---"


'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" THEN%>
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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdSituacionLaboral.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
'response.write ">>>>"+REQUEST("TOper")
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Situacion Laboral  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar Situacion Laboral  </FONT></h2>
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
        consulta = "SELECT * FROM CARdSituacionLaboral WHERE Id_CARdSituacionLaboral ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
		
		Ob_RS("CARdSituacionLaboral")=ucase(request("CARdSituacionLaboral")) 
        if request("Id_CARcEstatusLaboral")  <> "" then  Ob_RS("Id_CARcEstatusLaboral")=request("Id_CARcEstatusLaboral") end if
        if request("Id_CARcMotivoEstatus")  <> "" then  Ob_RS("Id_CARcMotivoEstatus")=request("Id_CARcMotivoEstatus") end if
        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
        if request("Id_CARcDesignacionEspecial")  <> "" then  Ob_RS("Id_CARcDesignacionEspecial")=request("Id_CARcDesignacionEspecial") end if
        Ob_RS("NoOficioDocto")=ucase(request("NoOficioDocto")) 
		
        'if request("FechaoficioDocto")  <> "" then  Ob_RS("FechaoficioDocto")=request("FechaoficioDocto") end if
		
 IF request ("FechaoficioDocto") = "" then 
    Ob_RS("FechaoficioDocto")= NULL 
 ELSE
    Ob_RS("FechaoficioDocto")= request("FechaoficioDocto") 
 END IF 
		
		
          Ob_RS("Sesion")=ucase(request("Sesion")) 
          Ob_RS("Periodo")=request("Periodo") 
        if request("Id_CARcCargoEstructura")  <> "" then  Ob_RS("Id_CARcCargoEstructura")=request("Id_CARcCargoEstructura") end if
          Ob_RS("AdscripcionEstructura")=ucase(request("AdscripcionEstructura")) 
        if request("Id_CARcMotivoEstatus")  <> "" then  Ob_RS("Id_CARcMotivoEstatus")=request("Id_CARcMotivoEstatus") end if
       
'	    if request("FechaBaja")  <> "" then  Ob_RS("FechaBaja")=request("FechaBaja") end if

IF request ("FechaBaja") = "" then 
    Ob_RS("FechaBaja")= NULL 
 ELSE
    Ob_RS("FechaBaja")= request("FechaBaja") 
 END IF
         Ob_RS("NoDocumento")=request("NoDocumento") 
        
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

<%
IF Id_CARcEstatusLaboral <> "" THEN
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


IF xEstatus = 4 THEN
'   CALL Estatus()
   CALL MotivoBaja()
   CALL FechaBaja()
   CALL Actual()
   CALL Observaciones()
END IF

%>
	  </TABLE>
	  </fieldset>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->


<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdSituacionLaboral >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>
<%
idPersona = REQUEST.QUERYSTRING("Id_Persona")
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		
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

 /* if (FormEdita.Id_CARcEstatusLaboral.value  == 0)
  {
       alert("EL CAMPO: Estatus, no puede estar vacio");
       return false;
  }*/
  
  if (FormEdita.Id_CARcActual.value  == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }
    
	
 
		
		
			
	
 
 
		
		
 var xEstatus = '<%= xEstatus%>'

//alert(xEstatus)

 if (xEstatus == 4)
 {	
	if (FormEdita.FechaBaja.value != "")
  {
	  if (!esFecha(FormEdita.FechaBaja.value,'E'))
	  {
		alert("El campo - Fecha de baja- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaBaja.focus();
		return false;
	  }	
  }
  
  
             var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaBaja = FormEdita.FechaBaja.value
			
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaBaja = Date.parse(FechaBaja)
		
			if (FechaBaja < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de baja no puede ser menor a la fecha del ingreso a la PGR de la persona.");
			FormEdita.FechaBaja.focus();
			return false;
		  }	
  
  
  
  
 }

		
		

if (xEstatus == 2 || xEstatus == 3 || xEstatus == 5 || xEstatus == 6)	
  {
		 if (FormEdita.FechaoficioDocto.value != "")
	  {
		  if (!esFecha(FormEdita.FechaoficioDocto.value,'E'))
		  {
			alert("El campo - Fecha de oficio documento- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaoficioDocto.focus();
			return false;
		  }	
	  }
 }



 if (xEstatus == 7)	
  {
		 if (FormEdita.FechaoficioDocto.value != "")
	  {
		  if (!esFecha(FormEdita.FechaoficioDocto.value,'E'))
		  {
			alert("El campo - Fecha de oficio documento- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaoficioDocto.focus();
			return false;
		  }	
	  }
  
  
  
			var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaoficioDocto = FormEdita.FechaoficioDocto.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaoficioDocto = Date.parse(FechaoficioDocto)
		
			if (FechaoficioDocto < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de oficio de documento no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaoficioDocto.focus();
			return false;
		  }	
 }		   
		   
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

      /*  if(jvi_textoynumero_correcto.test(FormEdita.Periodo.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Periodo, verifique por favor.');
	  	 FormEdita.Periodo.focus();
      	 return false;    
        }	
		
		if(jvi_textoynumero_correcto.test(FormEdita.Sesion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Sesión, verifique por favor.');
	  	 FormEdita.Sesion.focus();
      	 return false;    
        }		   
          
		 if(jvi_textoynumero_correcto.test(FormEdita.AdscripcionEstructura.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Adscripción Estructura, verifique por favor.');
	  	 FormEdita.Sesion.focus();
      	 return false;    
        }	

         if(jvi_textoynumero_correcto.test(FormEdita.NoDocumento.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo NoDocumento, verifique por favor.');
	  	 FormEdita.NoDocumento.focus();
      	 return false;    
        }
		*/
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdSituacionLaboral.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdSituacionLaboral.focus();
      	 return false;    
        }*/

		
		
		
		
		
		
		   
		 
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  
		   

/*
if (!comparaFechas(FormEdita.FechaAcuerdo.value,'menor_igual',FormEdita.FechaInicio.value,0))
		{
		alert("La Fecha de Acuerdo no puede ser menor a la Fecha de Inicio: ")
		return false;
		}

  if (FormEdita.Id_CARcTipoAcuerdo.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO:  acuerdo.");
       return false;
  }
  
 if ((FormEdita.Id_CARcEstatusLaboral.value  != 0 ) && (FormEdita.Id_CARcEstatusLaboral.value  != 1 ) && (FormEdita.Id_CARcMotivoEstatus.value  == 0 ) )
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Motivo.");
       return false;
  }
*/
 //  document.FormEdita.Agregar.value = "S"

}













/*

function CambiaVal()
{

       alert();
     document.FormEdita.Agregar.value = "N"
}
*/
</script> 
<%
SUB Estatus %>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcEstatusLaboral" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1 <% IF xESTATUS <> 0 Then response.write("DISABLED") END IF %>>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusLaboral")= CINT(Id_CARcEstatusLaboral) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%=UCASE(Ob_RS2("CARcEstatusLaboral"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%=UCASE(Ob_RS2("CARcEstatusLaboral"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
         <B>Designación Especial</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESIGNACIONESPECIAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesignacionEspecial' SIZE=1 >
   	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDesignacionEspecial")= CINT(Id_CARcDesignacionEspecial) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%=UCASE(Ob_RS2("CARcDesignacionEspecial"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%=UCASE(Ob_RS2("CARcDesignacionEspecial"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='NoOficioDocto' SIZE=50 MAXLENGTH=50 VALUE='<%= NoOficioDocto%>'>
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
       <IMG ONCLICK="window_open('FormEdita','FechaoficioDocto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
       <INPUT TYPE='TEXT' NAME='Periodo' SIZE=30 MAXLENGTH=40 style="text-transform: uppercase" VALUE='<%= Periodo%>'>
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
       <INPUT TYPE='TEXT' style="text-transform: uppercase"   NAME='Sesion' SIZE=15 MAXLENGTH=15  VALUE='<%= Sesion%>'>
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
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCargoEstructura")= CINT(Id_CARcCargoEstructura) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%=UCASE(Ob_RS2("CARcCargoEstructura"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%=UCASE(Ob_RS2("CARcCargoEstructura"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='AdscripcionEstructura' SIZE=60 MAXLENGTH=80 VALUE='<%= AdscripcionEstructura%>'>
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
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoEstatus")= CINT(Id_CARcMotivoEstatus) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%=UCASE(Ob_RS2("CARcMotivoEstatus"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%=UCASE(Ob_RS2("CARcMotivoEstatus"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
 	   <!--<P ALIGN='left'>-->
       <INPUT TYPE='TEXT' NAME='FechaBaja' SIZE=10 MAXLENGTH=12 Value='<%=FechaBajaa%>'>
       <IMG ONCLICK="window_open('FormEdita','FechaBaja')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de Documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase"  NAME='NoDocumento' SIZE=40  MAXLENGTH=50  VALUE='<%= NoDocumento%>'>
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
	     <SELECT NAME='Id_CARcActual' SIZE=1 <% IF Id_CARcActual = 1 THEN RESPONSE.WRITE "DISABLED"%>>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcActual")= CINT(Id_CARcActual) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%=UCASE(Ob_RS2("CARcActual"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%=UCASE(Ob_RS2("CARcActual"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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