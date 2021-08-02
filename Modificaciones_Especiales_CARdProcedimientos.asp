<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdProcedimientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdProcedimientos WHERE Id_CARdProcedimientos ="+CSTR(ParID) 
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
   CARdProcedimientos= OB_RS("CARdProcedimientos")
   Id_CARcTipoProcedimiento= OB_RS("Id_CARcTipoProcedimiento")
   Imputacion= OB_RS("Imputacion")
   NumeroProcedimiento= OB_RS("NumeroProcedimiento")
   AutoridadInstuctora= OB_RS("AutoridadInstuctora")
   FechaProcedimiento= OB_RS("FechaProcedimiento")
   Id_CARcEstatusProcedimiento= OB_RS("Id_CARcEstatusProcedimiento")
   Resolucion= OB_RS("Resolucion")
   FechaResolucion= OB_RS("FechaResolucion")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   FechaCaptura= OB_RS("FechaCaptura")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdProcedimientos.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Procedimientos  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Procedimientos  </FONT></h2>
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
        consulta = "SELECT * FROM CARdProcedimientos WHERE Id_CARdProcedimientos ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARdProcedimientos")  <> "" then  Ob_RS("CARdProcedimientos")=UCASE(request("CARdProcedimientos")) end if
        if request("Id_CARcTipoProcedimiento")  <> "" then  Ob_RS("Id_CARcTipoProcedimiento")=request("Id_CARcTipoProcedimiento") end if
        if request("Imputacion")  <> "" then  Ob_RS("Imputacion")=UCASE(request("Imputacion")) end if
        if request("NumeroProcedimiento")  <> "" then  Ob_RS("NumeroProcedimiento")=UCASE(request("NumeroProcedimiento")) end if
        if request("AutoridadInstuctora")  <> "" then  Ob_RS("AutoridadInstuctora")=UCASE(request("AutoridadInstuctora")) end if
        if request("FechaProcedimiento")  <> "" then  Ob_RS("FechaProcedimiento")=request("FechaProcedimiento") end if
        if request("Id_CARcEstatusProcedimiento")  <> "" then  Ob_RS("Id_CARcEstatusProcedimiento")=request("Id_CARcEstatusProcedimiento") end if
        if request("Resolucion")  <> "" then  Ob_RS("Resolucion")=UCASE(request("Resolucion")) end if
        if request("FechaResolucion")  <> "" then  Ob_RS("FechaResolucion")=request("FechaResolucion") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("FechaCaptura")  <> "" then  Ob_RS("FechaCaptura")=request("FechaCaptura") end if
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

     PERFIL = TRIM(SESSION("PERFIL"))
   IF  PERFIL =  "PERFIL 4" THEN       %>
     
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTIPOPROCEDIMIENTO WHERE Id_CARcTipoProcedimiento in (0,3,4,5,6)" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de procedimiento</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoProcedimiento' readonly="TRUE" SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 
	  <% ELSE%>
	 
	      <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTIPOPROCEDIMIENTO " %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de procedimiento</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoProcedimiento' readonly="TRUE" SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoProcedimiento")= CINT(Id_CARcTipoProcedimiento) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoProcedimiento")%>'> <%= Ob_RS2("CARcTipoProcedimiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 
	 	  <% END IF%>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
     <TR>
      <TD>
        <B>Imputación<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Imputacion' readonly="TRUE" SIZE=50 MAXLENGTH=50 VALUE='<%= Imputacion%>'>
      </TD > 
     <TR>
      <TD>
        <B>No. de procedimiento<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='NumeroProcedimiento' readonly="TRUE" SIZE=30 MAXLENGTH=30 VALUE='<%= NumeroProcedimiento%>'>
      </TD > 
     <TR>
      <TD>
        <B>Autoridad que instruye<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='AutoridadInstuctora' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=AutoridadInstuctora%></TEXTAREA>
  	<BR><BR>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de inicio<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaProcedimiento' readonly="TRUE" SIZE=10  MAXLENGTH=16  VALUE=<%= FechaProcedimiento%> >
       <IMG ONCLICK="window_open('FormEdita','FechaProcedimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
  	<BR><BR> 
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCESTATUSPROCEDIMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Estatus</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcEstatusProcedimiento' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusProcedimiento")= CINT(Id_CARcEstatusProcedimiento) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= UCASE(Ob_RS2("CARcEstatusProcedimiento"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusProcedimiento")%>'> <%= UCASE(Ob_RS2("CARcEstatusProcedimiento"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Resolución<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Resolucion' SIZE=50 MAXLENGTH=50 VALUE='<%= Resolucion%>'>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de resolución<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaResolucion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaResolucion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaResolucion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > </TR>
	  <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdProcedimientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdProcedimientos%></TEXTAREA>
      </TD > </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdProcedimientos >
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

  
  if (FormEdita.Id_CARcTipoProcedimiento.value  == 0)
  {
       alert("EL CAMPO: Tipo de procedimiento, no puede estar vacio");
       return false;
  }
  
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		
    	var jvi_textoynumeronodocumento_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\@]/


        if(jvi_textoynumero_correcto.test(FormEdita.Imputacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Imputación, verifique por favor.');
	  	 FormEdita.Imputacion.focus();
      	 return false;    
        }	
         if(jvi_textoynumeronodocumento_correcto.test(FormEdita.NumeroProcedimiento.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de procedimiento, verifique por favor.');
	  	 FormEdita.NumeroProcedimiento.focus();
      	 return false;    
        }
		 if(jvi_textoynumero_correcto.test(FormEdita.AutoridadInstuctora.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Autoridad que instruye, verifique por favor.');
	  	 FormEdita.AutoridadInstuctora.focus();
      	 return false;    
        }
		
		
		
	if (FormEdita.FechaProcedimiento.value != "")
	  {
		  if (!esFecha(FormEdita.FechaProcedimiento.value,'E'))
		  {
			alert("El campo - Fecha de Inicio de procedimiento- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaProcedimiento.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaProcedimiento = FormEdita.FechaProcedimiento.value
			  
			/*Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaProcedimiento = Date.parse(FechaProcedimiento)
		
			if (FechaProcedimiento < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de Inicio de procedimiento no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaProcedimiento.focus();
			return false;
		  }*/
			
			if (!comparaFechas(Fecha_Ingreso_PGR,'menor_igual',FechaProcedimiento,0))
		 {
			alert("La fecha de ingreso a la PGR de esta persona no puede ser mayor a la fecha de inicio del procedimiento .");
			
			return false;
		  }
		
		
		
		
		
		
		
		
		if(jvi_textoynumero_correcto.test(FormEdita.Resolucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Resolución, verifique por favor.');
	  	 FormEdita.Resolucion.focus();
      	 return false;    
        }
		
		
		
	if (FormEdita.FechaResolucion.value != "")
	  {
		  if (!esFecha(FormEdita.FechaResolucion.value,'E'))
		  {
			alert("El campo - Fecha de resolución- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaResolucion.focus();
			return false;
		  }	
	  
		
		    
			 var FechaResolucion = FormEdita.FechaResolucion.value
			/* FechaResolucion = Date.parse(FechaResolucion)
		
			if (FechaResolucion < FechaProcedimiento)
		 {
			alert("La fecha de resolución  de procedimiento no puede ser menor a la fecha de Inicio de procedimiento.");
			FormEdita.FechaProcedimiento.focus();
			return false;
		  }*/
		
		if (!comparaFechas(FechaProcedimiento,'menor_igual',FechaResolucion,0))
		 {
			alert("La fecha de resolución  de procedimiento no puede ser menor a la fecha de Inicio de procedimiento.");
			
			return false;
		  }
		
		}
		
		
		
		
		
		
		if(jvi_textoynumero_correcto.test(FormEdita.CARdProcedimientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdProcedimientos.focus();
      	 return false;    
        }
			




  
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}
</script>