<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdCursosPersona"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdCursosPersona WHERE Id_CARdCursosPersona ="+CSTR(ParID) 
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
   CARdCursosPersona= OB_RS("CARdCursosPersona")
   Id_CARcTipoCapacitacion= OB_RS("Id_CARcTipoCapacitacion")
   NombreCurso= OB_RS("NombreCurso")
   FechaInicio= OB_RS("FechaInicio")
   FechaTermino= OB_RS("FechaTermino")
   Id_CARcTipoInstitucion= OB_RS("Id_CARcTipoInstitucion")
   AreaInstituto= OB_RS("AreaInstituto")
   Id_CARcTipoDocumento= OB_RS("Id_CARcTipoDocumento")
   Calificacion= OB_RS("Calificacion")
   Creditos= OB_RS("Creditos")
   HorasCursadas= OB_RS("HorasCursadas")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
 '  FechaCaptura= OB_RS("Fecha_Captura")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdCursosPersona.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Profesionalización </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar Profesionalización </FONT></h2>
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
        consulta = "SELECT * FROM CARdCursosPersona WHERE Id_CARdCursosPersona ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdCursosPersona")=ucase(request("CARdCursosPersona")) 
        if request("Id_CARcTipoCapacitacion")  <> "" then  Ob_RS("Id_CARcTipoCapacitacion")=request("Id_CARcTipoCapacitacion") end if
        Ob_RS("NombreCurso")=ucase(request("NombreCurso")) 
'        if request("FechaInicio")  <> "" then  Ob_RS("FechaInicio")=request("FechaInicio") end if
		
 IF request ("FechaInicio") = "" then 
    Ob_RS("FechaInicio")= NULL 
 ELSE
    Ob_RS("FechaInicio")= request("FechaInicio") 
 END IF 
		
      '  if request("FechaTermino")  <> "" then  Ob_RS("FechaTermino")=request("FechaTermino") end if
		
IF request ("FechaTermino") = "" then 
    Ob_RS("FechaTermino")= NULL 
 ELSE
    Ob_RS("FechaTermino")= request("FechaTermino") 
 END IF 
		
        if request("Id_CARcTipoInstitucion")  <> "" then  Ob_RS("Id_CARcTipoInstitucion")=request("Id_CARcTipoInstitucion") end if
        Ob_RS("AreaInstituto")=ucase(request("AreaInstituto"))
        if request("Id_CARcTipoDocumento")  <> "" then  Ob_RS("Id_CARcTipoDocumento")=request("Id_CARcTipoDocumento") end if
        Ob_RS("Calificacion")=request("Calificacion") 
        'Ob_RS("Creditos")=request("Creditos") 
		
IF request ("Creditos") = "" then 
    Ob_RS("Creditos")= NULL 
 ELSE
    Ob_RS("Creditos")= request("Creditos") 
 END IF 
		
        'Ob_RS("HorasCursadas")=request("HorasCursadas") 
		
 IF request ("HorasCursadas") = "" then 
    Ob_RS("HorasCursadas")= NULL 
 ELSE
    Ob_RS("HorasCursadas")= request("HorasCursadas") 
 END IF 
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
'        if request("FechaCaptura")  <> "" then  Ob_RS("FechaCaptura")=request("FechaCaptura") end if

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
          <%Sql ="SELECT * FROM CARCTIPOCAPACITACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de capacitación</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoCapacitacion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoCapacitacion")= CINT(Id_CARcTipoCapacitacion) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
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
        <B>Nombre del curso<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreCurso' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=NombreCurso%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de inicio<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormEdita','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de término<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormEdita','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTIPOINSTITUCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de institución</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoInstitucion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoInstitucion")= CINT(Id_CARcTipoInstitucion) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
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
        <B>Nombre de la institución<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='AreaInstituto' SIZE=50 MAXLENGTH=50 VALUE='<%= AreaInstituto%>'>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTIPODOCUMENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Documento obtenido</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoDocumento' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoDocumento")= CINT(Id_CARcTipoDocumento) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
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
        <B>Calificación<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Calificacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Cr&eacute;ditos<BR>  
        </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Creditos' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Creditos%>>
      </TD > 
     <TR>
      <TD>
        <B>Horas cursadas<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='HorasCursadas' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= HorasCursadas%>>
      </TD > 
	  </TR>
	  
	  <TR>
	  <TD>
        <B>Observaciones</font>	</B>
      </TD>
	  <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdCursosPersona' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdCursosPersona%></TEXTAREA>
      </TD >
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdCursosPersona >
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
if (FormEdita.Id_CARcTipoCapacitacion.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Capacitación.");
       return false;
  }
  
  if (FormEdita.Id_CARcTipoInstitucion.value  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Institución.");
       return false;
  }
  
  if (FormEdita.Id_CARcTipoDocumento.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Documento obtenido.");
       return false;
  }
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormEdita.NombreCurso.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre del curso, verifique por favor.');
	  	 FormEdita.NombreCurso.focus();
      	 return false;    
        }*/
		
		
	

	
		
		
		if (FormEdita.FechaInicio.value != "")
	  {
		  if (!esFecha(FormEdita.FechaInicio.value,'E'))
		  {
			alert("El campo - Fecha de Inicio - debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaInicio.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaInicio = FormEdita.FechaInicio.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaInicio = Date.parse(FechaInicio)
		
			if (FechaInicio < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha de Inicio no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaInicio.focus();
			return false;
		  }
		
		
		
		if (FormEdita.FechaTermino.value != "")
	  {
		  if (!esFecha(FormEdita.FechaTermino.value,'E'))
		  {
			alert("El campo - Fecha de Término - debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaTermino.focus();
			return false;
		  }	
	  }
		
		var FechaTermino = FormEdita.FechaTermino.value
		FechaTermino = Date.parse(FechaTermino)
		if (FechaTermino < FechaInicio)
		 {
			alert("La Fecha de Término no puede ser menor a la Fecha del inicio del curso.");
			FormEdita.FechaTermino.focus();
			return false;
		  }
		
		
		
		
			
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.AreaInstituto.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la institución, verifique por favor.');
	  	 FormEdita.AreaInstituto.focus();
      	 return false;    
        }*/
  
  if(jvi_numero_correcto.test(FormEdita.Calificacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calificación, verifique por favor.');
	  	 FormEdita.Calificacion.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormEdita.Creditos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Creditos, verifique por favor.');
	  	 FormEdita.Creditos.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormEdita.HorasCursadas.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Horas cursadas, verifique por favor.');
	  	 FormEdita.Creditos.focus();
      	 return false;    
        }
        
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdCursosPersona.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdCursosPersona.focus();
      	 return false;    
        }*/






 FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	

}
</script> 
