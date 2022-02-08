<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="Utilerias.vbs" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")
'response.write(idPersona)
    v_Tabla = "CardArmas"
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
  <FORM METHOD="post" ACTION= "Altas_CardArmas.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Armas   </FONT>
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
        if request("CardArmas")  <> "" then  Ob_RS("CardArmas")=ucase(request("CardArmas")) end if
        if request("Id_CARcArmaFuego")  <> "" then  Ob_RS("Id_CARcArmaFuego")=request("Id_CARcArmaFuego") end if
'        if request("ArmaFuego")  <> "" then  Ob_RS("ArmaFuego")=request("ArmaFuego") end if
        if request("NoOficio")  <> "" then  Ob_RS("NoOficio")=ucase(request("NoOficio")) end if
        if request("FechaOficio")  <> "" then  Ob_RS("FechaOficio")=CDATEFORMAT(request("FechaOficio"),2) end if
        if request("NoLista")  <> "" then  Ob_RS("NoLista")=ucase(request("NoLista")) end if
        if request("NoOficioRecHum")  <> "" then  Ob_RS("NoOficioRecHum")=ucase(request("NoOficioRecHum")) end if
        if request("FechaOficioRH")  <> "" then  Ob_RS("FechaOficioRH")=CDATEFORMAT(request("FechaOficioRH"),2) end if
        if request("FechaAsignacion")  <> "" then  Ob_RS("FechaAsignacion")=CDATEFORMAT(request("FechaAsignacion"),2) end if
        if request("CUIP")  <> "" then  Ob_RS("CUIP")=ucase(request("CUIP")) end if
        if request("Id_CARcAutorizacion")  <> "" then  Ob_RS("Id_CARcAutorizacion")=request("Id_CARcAutorizacion") end if

		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
         Ob_RS("FechaCaptura")= date()
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
         <B>Arma de fuego</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCARMAFUEGO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcArmaFuego' SIZE=1 >
            <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>	
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
		 <% END IF  %>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>No. de oficio (Rec. Mat.)</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoOficio' SIZE=50 MAXLENGTH=50 VALUE=<%= NoOficio%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha del oficio</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaOficio' SIZE=16 MAXLENGTH=16  VALUE=<%= FechaOficio%> >
       <IMG ONCLICK="window_open('FormAltas','FechaOficio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>No. de lista (DGSC)</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoLista' SIZE=30 MAXLENGTH=30 VALUE=<%= NoLista%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>No. oficio (Rec. Humanos)</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NoOficioRecHum' SIZE=50 MAXLENGTH=50 VALUE=<%= NoOficioRecHum%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha oficio (Rec. Humanos)</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaOficioRH' SIZE=16 MAXLENGTH=16  VALUE=<%= FechaOficioRH%> >
       <IMG ONCLICK="window_open('FormAltas','FechaOficioRH')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de asignación</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAsignacion' SIZE=16 MAXLENGTH=16  VALUE=<%= FechaAsignacion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAsignacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='CUIP' SIZE=30 MAXLENGTH=30 VALUE=<%= CUIP%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>¿Autorización?</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARcAutorizacion" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAutorizacion' SIZE=1 >
            <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>	
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
		  <%END IF %>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
      <TD>
       <B>Observación</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CardArmas' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CardArmas%></TEXTAREA>
      </TD > </TR>
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

  
  if (FormAltas.Id_CARcArmaFuego.value  == 0)
  {
       alert("EL CAMPO: Arma de Fuego, no puede estar vacio");
       return false;
  }
  
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  
  if (FormAltas.FechaOficio.value != "")
	  {
		  if (!esFecha(FormAltas.FechaOficio.value,'E'))
		  {
			alert("El campo - Fecha del oficio- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaOficio.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaOficio = FormAltas.FechaOficio.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaOficio = Date.parse(FechaOficio)
		
			if (FechaOficio < Fecha_Ingreso_PGR)
		 {
			alert("La fecha del Oficio no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaOficio.focus();
			return false;
		  }
		
  
  
  
  
  
  
  
  
  
  
          if (FormAltas.FechaOficioRH.value != "")
	  {
		  if (!esFecha(FormAltas.FechaOficioRH.value,'E'))
		  {
			alert("El campo - Fecha oficio (Rec. Humanos)- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaOficioRH.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaOficioRH = FormAltas.FechaOficioRH.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaOficioRH = Date.parse(FechaOficioRH)
		
			if (FechaOficioRH < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha oficio (Rec. Humanos) no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaOficioRH.focus();
			return false;
		  }
		
  
  
  
  
     if (FormAltas.FechaAsignacion.value != "")
	  {
		  if (!esFecha(FormAltas.FechaAsignacion.value,'E'))
		  {
			alert("El campo - Fecha de asignación- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaAsignacion.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaAsignacion = FormAltas.FechaAsignacion.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaAsignacion = Date.parse(FechaAsignacion)
		
			if (FechaAsignacion < Fecha_Ingreso_PGR)
		 {
			alert("La Fecha de asignación no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaAsignacion.focus();
			return false;
		  }
		
  
  
  
  
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto_oficios = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/

        /*if(jvi_textoynumero_correcto_oficios.test(FormAltas.NoOficio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de oficio, verifique por favor.');
	  	 FormAltas.NoOficio.focus();
      	 return false;    
        }*/	

         /*if(jvi_textoynumero_correcto_oficios.test(FormAltas.NoLista.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de lista, verifique por favor.');
	  	 FormAltas.NoLista.focus();
      	 return false;    
        }*/
		
		 /*if(jvi_textoynumero_correcto_oficios.test(FormAltas.NoOficioRecHum.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de oficio de RH, verifique por favor.');
	  	 FormAltas.NoOficioRecHum.focus();
      	 return false;    
        }*/
         
		  /*if(jvi_textoynumero_correcto_oficios.test(FormAltas.CUIP.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo CUIP, verifique por favor.');
	  	 FormAltas.CUIP.focus();
      	 return false;    
        }*/
		
		/*if(jvi_textoynumero_correcto_oficios.test(FormAltas.CardArmas.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CardArmas.focus();
      	 return false;    
        }*/
		
		
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	

}
</script> 

