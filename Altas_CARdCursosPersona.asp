<% On Error Resume Next %>
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdCursosPersona"
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
<link href="Estilo.css" rel="stylesheet" type="text/css"><HEAD>
  <TITLE>
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_CARdCursosPersona.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Profesionalizaci&oacute;n   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <%'--- insertar resultado de  LOOP -----------------------------------------------------------------------------%>

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdCursosPersona")  <> "" then  Ob_RS("CARdCursosPersona")=ucase(request("CARdCursosPersona")) end if
        if request("Id_CARcTipoCapacitacion")  <> "" then  Ob_RS("Id_CARcTipoCapacitacion")=request("Id_CARcTipoCapacitacion") end if
        if request("NombreCurso")  <> "" then  Ob_RS("NombreCurso")=ucase(request("NombreCurso")) end if
        if request("FechaInicio")  <> "" then  Ob_RS("FechaInicio")=request("FechaInicio") end if
        if request("FechaTermino")  <> "" then  Ob_RS("FechaTermino")=request("FechaTermino") end if
        if request("Id_CARcTipoInstitucion")  <> "" then  Ob_RS("Id_CARcTipoInstitucion")=request("Id_CARcTipoInstitucion") end if
        if request("AreaInstituto")  <> "" then  Ob_RS("AreaInstituto")=ucase(request("AreaInstituto")) end if
        if request("Id_CARcTipoDocumento")  <> "" then  Ob_RS("Id_CARcTipoDocumento")=request("Id_CARcTipoDocumento") end if
        if request("Calificacion")  <> "" then  Ob_RS("Calificacion")=request("Calificacion") end if
        if request("Creditos")  <> "" then  Ob_RS("Creditos")=request("Creditos") end if
        if request("HorasCursadas")  <> "" then  Ob_RS("HorasCursadas")=request("HorasCursadas") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
'        Ob_RS("FechaCaptura")= date()
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
         <B>Tipo de capacitación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOCAPACITACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoCapacitacion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoCapacitacion")= CINT(Id_CARcTipoCapacitacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
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
        <B>Nombre del curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreCurso' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=NombreCurso%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormAltas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormAltas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Tipo de institución</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOINSTITUCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoInstitucion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoInstitucion")= CINT(Id_CARcTipoInstitucion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
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
        <B>Nombre de la institución</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AreaInstituto' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE=<%= AreaInstituto%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Documento obtenido</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPODOCUMENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoDocumento' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoDocumento")= CINT(Id_CARcTipoDocumento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
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
        <B>Calificación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Calificacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Cr&eacute;ditos</font>	</B> </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Creditos' SIZE=4 MAXLENGTH=4 style="text-transform: uppercase" VALUE=<%= Creditos%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Horas cursadas</font>	</B>
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
      </TD ></TR>
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
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
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

  if (FormAltas.Id_CARcTipoCapacitacion.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Capacitación.");
       return false;
  }
  
  if (FormAltas.Id_CARcTipoInstitucion.value  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Institución.");
       return false;
  }
  
  if (FormAltas.Id_CARcTipoDocumento.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Documento obtenido.");
       return false;
  }
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormAltas.NombreCurso.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre del curso, verifique por favor.');
	  	 FormAltas.NombreCurso.focus();
      	 return false;    
        }*/
		
		
	

	
		
		
		if (FormAltas.FechaInicio.value != "")
	  {
		  if (!esFecha(FormAltas.FechaInicio.value,'E'))
		  {
			alert("El campo - Fecha de Inicio de curso- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaInicio.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaInicio = FormAltas.FechaInicio.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaInicio = Date.parse(FechaInicio)
		
			if (FechaInicio < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha de Inicio de curso no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaInicio.focus();
			return false;
		  }
		
		
		
		if (FormAltas.FechaTermino.value != "")
	  {
		  if (!esFecha(FormAltas.FechaTermino.value,'E'))
		  {
			alert("El campo - Fecha de Término de curso- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaTermino.focus();
			return false;
		  }	
	  }
		
		var FechaTermino = FormAltas.FechaTermino.value
		FechaTermino = Date.parse(FechaTermino)
		if (FechaTermino < FechaInicio)
		 {
			alert("La Fecha de Término de curso no puede ser menor a la Fecha del inicio del curso.");
			FormAltas.FechaTermino.focus();
			return false;
		  }
		
		
		
		
			
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.AreaInstituto.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la institución, verifique por favor.');
	  	 FormAltas.AreaInstituto.focus();
      	 return false;    
        }*/
  
  if(jvi_numero_correcto.test(FormAltas.Calificacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Calificación, verifique por favor.');
	  	 FormAltas.Calificacion.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormAltas.Creditos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Creditos, verifique por favor.');
	  	 FormAltas.Creditos.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormAltas.HorasCursadas.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Horas cursadas, verifique por favor.');
	  	 FormAltas.Creditos.focus();
      	 return false;    
        }
        
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdCursosPersona.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdCursosPersona.focus();
      	 return false;    
        }*/






 FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	
}
</script> 

