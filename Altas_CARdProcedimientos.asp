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

    v_Tabla = "CARdProcedimientos"
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
  <FORM METHOD="post" ACTION= "Altas_CARdProcedimientos.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Procedimientos </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
 <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;  
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->
 
 <% 
	 vAgregar = request("Agregar") 
  if vAgregar = "S" then     'Codigo Original%>  

    
	 
    	  <% Ob_RS.Addnew 
        if request("CARdProcedimientos")  <> "" then  Ob_RS("CARdProcedimientos")=UCASE(request("CARdProcedimientos")) end if
        if request("Id_CARcTipoProcedimiento")  <> "" then  Ob_RS("Id_CARcTipoProcedimiento")=request("Id_CARcTipoProcedimiento") end if
        if request("Imputacion")  <> "" then  Ob_RS("Imputacion")=UCASE(request("Imputacion")) end if
        if request("NumeroProcedimiento")  <> "" then  Ob_RS("NumeroProcedimiento")=UCASE(request("NumeroProcedimiento")) end if
        if request("AutoridadInstuctora")  <> "" then  Ob_RS("AutoridadInstuctora")=UCASE(request("AutoridadInstuctora")) end if
        if request("FechaProcedimiento")  <> "" then  Ob_RS("FechaProcedimiento")=request("FechaProcedimiento") end if
        if request("Id_CARcEstatusProcedimiento")  <> "" then  Ob_RS("Id_CARcEstatusProcedimiento")=request("Id_CARcEstatusProcedimiento") end if
        if request("Resolucion")  <> "" then  Ob_RS("Resolucion")=UCASE(request("Resolucion")) end if
        if request("FechaResolucion")  <> "" then  Ob_RS("FechaResolucion")=request("FechaResolucion") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
         Ob_RS("FechaCaptura")=DATE()
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
 
 <%	

     PERFIL = TRIM(SESSION("PERFIL"))
   IF  PERFIL =  "PERFIL 4" THEN       %>
     
     <TR>
      <TD>
        <B>Tipo de procedimiento</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	   
            <%Sql ="SELECT * FROM CARcTipoProcedimiento WHERE Id_CARcTipoProcedimiento in (0,3,4,5,6)" %>
			
			
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoProcedimiento' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
	 
	 
	 
	  <% ELSE%>
	 
	 <TR>
      <TD>
        <B>Tipo de procedimiento</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	   
            <%Sql ="SELECT * FROM CARcTipoProcedimiento" %>
			
			
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoProcedimiento' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
     
	 <% END IF%>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
     <TR>
      <TD>
        <B>Imputación	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
<!--       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Imputacion' SIZE=50 MAXLENGTH=50 VALUE=<%'= Imputacion%>>
-->      <TEXTAREA style="text-transform: uppercase" NAME='Imputacion' SIZE=10 ROWS=5 COLS=35><%=Imputacion%></TEXTAREA>

      </TD > 
     </TR>
     <TR>
      <TD>
        <B>No. de procedimiento</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NumeroProcedimiento' SIZE=30 MAXLENGTH=30 VALUE=<%= NumeroProcedimiento%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Autoridad que instruye	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='AutoridadInstuctora' SIZE=10 ROWS=5 COLS=35><%=AutoridadInstuctora%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de inicio	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaProcedimiento' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaProcedimiento%> >
       <IMG ONCLICK="window_open('FormAltas','FechaProcedimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
       <B>Estatus</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCESTATUSPROCEDIMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusProcedimiento' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusProcedimiento")= CINT(Id_CARcEstatusProcedimiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= Ob_RS2("CARcEstatusProcedimiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= Ob_RS2("CARcEstatusProcedimiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Resolución	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Resolucion' SIZE=50 MAXLENGTH=50 VALUE=<%= Resolucion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de resolución</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaResolucion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaResolucion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaResolucion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
	 <TR>
      <TD>
        <B>Observaciones</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdProcedimientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdProcedimientos%></TEXTAREA>
      </TD > </TR>
</TABLE>

 <%
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		'RESPONSE.WRITE  Fecha_Ingreso_PGR
		
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>

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

  if (FormAltas.Id_CARcTipoProcedimiento.value  == 0)
  {
       alert("EL CAMPO: Tipo de procedimiento, no puede estar vacio");
       return false;
  }
  
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		
		var jvi_textoynumeronodocumento_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/

        /*if(jvi_textoynumero_correcto.test(FormAltas.Imputacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Imputación, verifique por favor.');
	  	 FormAltas.Imputacion.focus();
      	 return false;    
        }*/	
         /*if(jvi_textoynumeronodocumento_correcto.test(FormAltas.NumeroProcedimiento.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de procedimiento, verifique por favor.');
	  	 FormAltas.NumeroProcedimiento.focus();
      	 return false;    
        }*/
		 if(jvi_textoynumero_correcto.test(FormAltas.AutoridadInstuctora.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Autoridad que instruye, verifique por favor.');
	  	 FormAltas.AutoridadInstuctora.focus();
      	 return false;    
        }
		
		
		
	if (FormAltas.FechaProcedimiento.value != "")
	  {
		  if (!esFecha(FormAltas.FechaProcedimiento.value,'E'))
		  {
			alert("El campo - Fecha de Inicio de procedimiento- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaProcedimiento.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaProcedimiento = FormAltas.FechaProcedimiento.value
			 var sFec2 = Fecha_Ingreso_PGR
			 var sFec1 = FechaProcedimiento
			/*  alert(FechaProcedimiento)
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaProcedimiento = Date.parse(FechaProcedimiento)
			alert(Fecha_Ingreso_PGR)
			alert(FechaProcedimiento)
		function comparaFechas(F1,criterio,F2,msg)
comparaFechas (sFec1,’menor_igual’,sFec2,0)*/



/*                 si no es menor o igual es que es es mayor y regresa un true */
			if (!comparaFechas(Fecha_Ingreso_PGR,'menor_igual',FechaProcedimiento,0))
		 {
			alert("La fecha de ingreso a la PGR de esta persona no puede ser mayor a la fecha de inicio del procedimiento .");
			
			return false;
		  }
		/*-----------------------------------------------
		if (!comparaFechas(FormAltas.Fecha__inicio_ac.value,'menor_igual',sFechaAct,0))
		{alert("La Fecha de Inicio no puede ser mayor a la Fecha Actual");
		return false;}
		------------------------------------------------*/
		
		
		
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.Resolucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Resolución, verifique por favor.');
	  	 FormAltas.Resolucion.focus();
      	 return false;    
        }*/
		
		
		
	if (FormAltas.FechaResolucion.value != "")
	  {
		  if (!esFecha(FormAltas.FechaResolucion.value,'E'))
		  {
			alert("El campo - Fecha de resolución- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaResolucion.focus();
			return false;
		  }	
		  
		  
		  
		  
		    var FechaResolucion = FormAltas.FechaResolucion.value
			 //FechaResolucion = Date.parse(FechaResolucion)
		/*Es como si le preguntaras si es mayor*/
		 if (!comparaFechas(FechaProcedimiento,'menor_igual',FechaResolucion,0))
		 {
			alert("La fecha de resolución  de procedimiento no puede ser menor a la fecha de Inicio de procedimiento.");
			
			return false;
		  }
		  
		/* {
			alert("La fecha de resolución  de procedimiento no puede ser menor a la fecha de Inicio de procedimiento.");
			FormAltas.FechaProcedimiento.focus();
			return false;
		  }*/
		  
		  
	  }
		
		    
	/*		 var FechaResolucion = FormAltas.FechaResolucion.value
			 FechaResolucion = Date.parse(FechaResolucion)
		
			if (FechaResolucion < FechaProcedimiento)
		 {
			alert("La fecha de resolución  de procedimiento no puede ser menor a la fecha de Inicio de procedimiento.");
			FormAltas.FechaProcedimiento.focus();
			return false;
		  }
		  
		  */
		
		
		
		
		
		
		
		
		
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdProcedimientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdProcedimientos.focus();
      	 return false;    
        }*/
			




  
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}
</script>