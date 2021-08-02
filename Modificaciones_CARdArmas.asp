<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.vbs" -->
<!-- #INCLUDE File="Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CardArmas"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CardArmas WHERE Id_CardArmas ="+CSTR(ParID) 
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
    CardArmas =  Ob_RS("CardArmas")
'	ArmaFuego  = Ob_RS("ArmaFuego")
    Id_CARcArmaFuego = Ob_RS("Id_CARcArmaFuego")
    NoOficio =  Ob_RS("NoOficio")
    FechaOficio = Ob_RS("FechaOficio")
	
    NoLista =  Ob_RS("NoLista")
    NoOficioRecHum =  Ob_RS("NoOficioRecHum")
    FechaOficioRH =  Ob_RS("FechaOficioRH")
    FechaAsignacion =   Ob_RS("FechaAsignacion")
    CUIP =   Ob_RS("CUIP")
    Id_CARcAutorizacion =   Ob_RS("Id_CARcAutorizacion")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CardArmas.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Armas </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Armas </FONT></h2>
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
        consulta = "SELECT * FROM CardArmas WHERE Id_CardArmas ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CardArmas")=ucase(request("CardArmas")) 
        if request("Id_CARcArmaFuego")  <> "" then  Ob_RS("Id_CARcArmaFuego")=request("Id_CARcArmaFuego") end if
       ' Ob_RS("ArmaFuego")=ucase(request("ArmaFuego")) 
        Ob_RS("NoOficio")=ucase(request("NoOficio")) 
       ' Ob_RS("FechaOficio")= request("FechaOficio") 
		
 IF request ("FechaOficio") = "" then 
    Ob_RS("FechaOficio")= NULL 
 ELSE
    Ob_RS("FechaOficio")= request("FechaOficio") 
 END IF 
		
        Ob_RS("NoLista")=ucase(request("NoLista")) 
        Ob_RS("NoOficioRecHum")=ucase(request("NoOficioRecHum")) 
       ' Ob_RS("FechaOficioRH")=request("FechaOficioRH")
 IF request ("FechaOficioRH") = "" then 
    Ob_RS("FechaOficioRH")= NULL 
 ELSE
    Ob_RS("FechaOficioRH")= request("FechaOficioRH") 
 END IF 
		 
       ' if request("FechaAsignacion")  <> "" then  Ob_RS("FechaAsignacion")=request("FechaAsignacion") end if
		
		
 IF request ("FechaAsignacion") = "" then 
    Ob_RS("FechaAsignacion")= NULL 
 ELSE
    Ob_RS("FechaAsignacion")= request("FechaAsignacion") 
 END IF 
		
		
        Ob_RS("CUIP")=ucase(request("CUIP")) 
        if request("Id_CARcAutorizacion")  <> "" then  Ob_RS("Id_CARcAutorizacion")=request("Id_CARcAutorizacion") end if

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
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
         <B>Arma de fuego</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCARMAFUEGO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcArmaFuego' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcArmaFuego")= CINT(Id_CARcArmaFuego) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcArmaFuego")%>'> <%=UCASE(Ob_RS2("CARcArmaFuego"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcArmaFuego")%>'> <%=UCASE(Ob_RS2("CARcArmaFuego"))%>
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
        <B>No. de oficio (Rec. Mat.)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoOficio' SIZE=50 MAXLENGTH=50 VALUE='<%= NoOficio%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha del oficio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	      
       <INPUT TYPE='TEXT' NAME='FechaOficio' SIZE=10 MAXLENGTH=16  VALUE=<%= FechaOficio%> >
       <IMG ONCLICK="window_open('FormEdita','FechaOficio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>No. de lista (DGSC)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoLista' SIZE=30 MAXLENGTH=30 VALUE='<%= NoLista%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>No. oficio (Rec. Humanos)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoOficioRecHum' SIZE=50 MAXLENGTH=50 VALUE='<%= NoOficioRecHum%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha oficio (Rec. Humanos)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaOficioRH' SIZE=16 MAXLENGTH=16  VALUE=<%= FechaOficioRH%> >
       <IMG ONCLICK="window_open('FormEdita','FechaOficioRH')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de asignación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAsignacion' SIZE=16 MAXLENGTH=16  VALUE=<%= FechaAsignacion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaAsignacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='CUIP' SIZE=30 MAXLENGTH=30 VALUE='<%= CUIP%>'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>&iquest;Autorización?</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcAutorizacion" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAutorizacion' SIZE=1 >
         
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcAutorizacion")= CINT(Id_CARcAutorizacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAutorizacion")%>'> <%=UCASE(Ob_RS2("CARcAutorizacion"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAutorizacion")%>'> <%=UCASE(Ob_RS2("CARcAutorizacion"))%>
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
        <B>Observación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CardArmas' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CardArmas%></TEXTAREA>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CardArmas >
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

    
  if (FormEdita.Id_CARcArmaFuego.value  == 0)
  {
       alert("EL CAMPO: Arma de Fuego, no puede estar vacio");
       return false;
  }
  
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  
  if (FormEdita.FechaOficio.value != "")
	  {
		  if (!esFecha(FormEdita.FechaOficio.value,'E'))
		  {
			alert("El campo - Fecha del oficio- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaOficio.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaOficio = FormEdita.FechaOficio.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaOficio = Date.parse(FechaOficio)
		
			if (FechaOficio < Fecha_Ingreso_PGR)
		 {
			alert("La fecha del Oficio no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaOficio.focus();
			return false;
		  }
		
  
  
  
  
  
  
  
  
  
  
          if (FormEdita.FechaOficioRH.value != "")
	  {
		  if (!esFecha(FormEdita.FechaOficioRH.value,'E'))
		  {
			alert("El campo - Fecha oficio (Rec. Humanos)- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaOficioRH.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaOficioRH = FormEdita.FechaOficioRH.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaOficioRH = Date.parse(FechaOficioRH)
		
			if (FechaOficioRH < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha oficio (Rec. Humanos) no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaOficioRH.focus();
			return false;
		  }
		
  
  
  
  
     if (FormEdita.FechaAsignacion.value != "")
	  {
		  if (!esFecha(FormEdita.FechaAsignacion.value,'E'))
		  {
			alert("El campo - Fecha de asignación- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaAsignacion.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaAsignacion = FormEdita.FechaAsignacion.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaAsignacion = Date.parse(FechaAsignacion)
		
			if (FechaAsignacion < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha de asignación no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaAsignacion.focus();
			return false;
		  }
		
  
  
  
  
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto_oficios = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/

        /*if(jvi_textoynumero_correcto_oficios.test(FormEdita.NoOficio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de oficio, verifique por favor.');
	  	 FormEdita.NoOficio.focus();
      	 return false;    
        }	

         if(jvi_textoynumero_correcto_oficios.test(FormEdita.NoLista.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de lista, verifique por favor.');
	  	 FormEdita.NoLista.focus();
      	 return false;    
        }
		
		 if(jvi_textoynumero_correcto_oficios.test(FormEdita.NoOficioRecHum.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de oficio de RH, verifique por favor.');
	  	 FormEdita.NoOficioRecHum.focus();
      	 return false;    
        }
         
		  if(jvi_textoynumero_correcto_oficios.test(FormEdita.CUIP.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo CUIP, verifique por favor.');
	  	 FormEdita.CUIP.focus();
      	 return false;    
        }
		
		if(jvi_textoynumero_correcto_oficios.test(FormEdita.CardArmas.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CardArmas.focus();
      	 return false;    
        }*/
		
		
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	

}
</script> 
