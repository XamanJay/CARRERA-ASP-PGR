<%' On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->

<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdAdscripciones"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
   
   
     
''''<>}}}}}}*>
consulta = "SELECT * FROM CARcDG_o_Delegaciones " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = OB_rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
OB_RS.CLOSE 

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Categoria y Nivel
consulta = "SELECT * FROM CARcDir_o_subsede" 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo3 = OB_rs.getrows
Campos_Combo3 = UBound(tbl_Combo3,1) 
regs_Combo3 = UBound(tbl_Combo3,2)
OB_RS.CLOSE 

   consulta = "SELECT * FROM CARdAdscripciones WHERE Id_CARdAdscripciones ="+CSTR(ParID) 
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
   CARdAdscripciones= OB_RS("CARdAdscripciones")
   FechaAdscripcion= OB_RS("FechaAdscripcion")
   'Id_CARcAdscripciones= OB_RS("Id_CARcAdscripciones")
   Id_CARcTipoNombramiento= OB_RS("Id_CARcTipoNombramiento")
   Id_CARcSubprocuradurias=OB_RS("Id_CARcSubprocuradurias")
   Id_CARcDG_o_Delegaciones=OB_RS("Id_CARcDG_o_Delegaciones")
    Id_CARcDG_o_Delegaciones=OB_RS("Id_CARcDG_o_Delegaciones")
   Ciudad= OB_RS("Ciudad")

 '  Area= OB_RS("Area")
 '  SubArea= OB_RS("SubArea")
   Id_CARcDir_o_subsede= OB_RS("Id_CARcDir_o_subsede")
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   Id_CARcMotivoAdscripcion= OB_RS("Id_CARcMotivoAdscripcion")
   Id_CARcActual= OB_RS("Id_CARcActual")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   IdAdscripcion= OB_RS("IdAdscripcion")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdAdscripciones.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Adscripciones  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Adscripciones </FONT></h2>
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
        consulta = "SELECT * FROM CARdAdscripciones WHERE Id_CARdAdscripciones ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdAdscripciones")=UCASE(request("CARdAdscripciones")) 
'        if request("FechaAdscripcion")  <> "" then  Ob_RS("FechaAdscripcion")=request("FechaAdscripcion") end if
		
 IF request ("FechaAdscripcion") = "" then 
    Ob_RS("FechaAdscripcion")= NULL 
 ELSE
    Ob_RS("FechaAdscripcion")= request("FechaAdscripcion") 
 END IF 
       ' if request("Id_CARcAdscripciones")  <> "" then  Ob_RS("Id_CARcAdscripciones")=request("Id_CARcAdscripciones") end if
	   
        if request("Id_CARcSubprocuradurias")  <> "" then  Ob_RS("Id_CARcSubprocuradurias")=request("Id_CARcSubprocuradurias") end if
        if request("Id_CARcDG_o_Delegaciones")  <> "" then  Ob_RS("Id_CARcDG_o_Delegaciones")=request("Id_CARcDG_o_Delegaciones") end if
		
		
        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
        if request("Area")  <> "" then  Ob_RS("Area")=UCASE(request("Area")) end if
        if request("SubArea")  <> "" then  Ob_RS("SubArea")=UCASE(request("SubArea")) end if
        Ob_RS("Ciudad")=UCASE(request("Ciudad")) 
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
        if request("Id_CARcMotivoAdscripcion")  <> "" then  Ob_RS("Id_CARcMotivoAdscripcion")=request("Id_CARcMotivoAdscripcion") end if
        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
		'''estos no deberan poder modificarsw.        atte. Jaissiel
		'''' JVI   Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		'''' JVI   Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		''' JVI    Ob_RS("Id_CARcDir_o_subsede") = Id_CARcDir_o_subsede 
		if request("Id_CARcDir_o_subsede")  <> "" then  Ob_RS("Id_CARcDir_o_subsede")=request("Id_CARcDir_o_subsede") end if
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
		
	      %>
		 		<!-- INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Fecha de adscripción<BR>  </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAdscripcion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaAdscripcion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      
    <%
   ' RESPONSE.WRITE("     Tiempo :")
   '  'RESPONSE.WRITE(DATEDIFF("YYYY",DATE,FechaAdscripcion)*(-1))
   ' RESPONSE.WRITE(" Años, ")
   '  RESPONSE.WRITE(DATEDIFF("M",DATE,FechaAdscripcion)*(-1)) mod 12 
   ' RESPONSE.WRITE(" Meses ")
     %>
   </TD > 
     <TR>
      <TD height="26"> <B>Adscripción</B> </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY Id_CARcSubprocuradurias, CARcSubprocuradurias ASC" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='IdAdscripcion' SIZE=1>
	         <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcSubprocuradurias")= CINT(IdAdscripcion) THEN %>  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
 	     <TR>
     <TD colspan="2">
      <FONT class="SL"><b>UNIDAD ADMINISTRATIVA RESPONSABLE </b></FONT>
       </TD>
 	     <TR>
     <TD>
	 <p align="right">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><font size="-2"> Subprocuraduría</font> </B> </p>
     </TD>
     <TD>
        <%Sql ="SELECT * FROM CARcSubprocuradurias WHERE Id_CARcSubprocuradurias = "& Id_CARcSubprocuradurias  &" ORDER BY CARcSubprocuradurias ASC" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
		<%= Ob_RS2("CARcSubprocuradurias")%>



<!--        <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")' >
          <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
               <%IF Ob_RS2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT>
        <% Ob_RS2.CLOSE%>
-->      




</TD>
     </TR>
 	     <TR>
     <TD>
	 <p align="right">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><font size="-2"> Delegación o Dirección General</font> </B> </p>
       </TD>
     <TD>
         <%Sql ="SELECT * FROM CARcDG_o_Delegaciones WHERE  Id_CARcDG_o_Delegaciones = " & Id_CARcDG_o_Delegaciones %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
		  
		  <%= Ob_RS2("CARcDG_o_Delegaciones")%>
		  
		  
<!--		    <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1 onChange='SeleCombo3("C")'>
            <option SELECTED value='0'>SIN INFORMACIÓN</option>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDG_o_Delegaciones")= CINT(Id_CARcDG_o_Delegaciones) THEN %>  
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_RS2("CARcDG_o_Delegaciones")%>
                   </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
-->             <% Ob_RS2.CLOSE%>
<!--       </SELECT>
-->
        </TD>
     </TR>
      <BR>
 	     <TR>
     <TD>
	 <p align="right">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><font size="-2"> Direcci&oacute;n / Subsede</font> </B> </p>
		
        </TD>
     <TD>
          <%Sql ="SELECT * FROM CARcDir_o_subsede WHERE Id_CARcDir_o_subsede = " & Id_CARcDir_o_subsede %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
		  <%= Ob_RS2("CARcDir_o_subsede")%>
<!--		    <SELECT NAME='Id_CARcDir_o_subsede' SIZE=1 >
	         <OPTION VALUE='0'>SELECCIONAR</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDir_o_subsede")= CINT(Id_CARcDir_o_subsede) THEN %>  
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDir_o_subsede")%>'> <%= Ob_RS2("CARcDir_o_subsede")%>
                   </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
            <% Ob_RS2.CLOSE%>
       </SELECT>
-->
	   </TD> 
	   
	   </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcTipoNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Nombramiento</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <% ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= UCASE(Ob_RS2("CARcTipoNombramiento"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= UCASE(Ob_RS2("CARcTipoNombramiento"))%>                
				</OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
           <%END IF%>			 
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     
     <!--TR>
      <TD>
        <B>Area</font> / Subsede	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='Area' SIZE=10 ROWS=2 COLS=35><%=Area%></TEXTAREA>
      </TD > 
     </TR>
    <TR>
      <TD>
        <B>SubArea</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='SubArea' SIZE=10 ROWS=2 COLS=35><%=SubArea%></TEXTAREA>
      </TD > 
     </TR-->
      
     <TR>
      <TD>
        <B>Ciudad<BR>  
       </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT style="text-transform: uppercase" TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 VALUE='<%= Ciudad%>'>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY Id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Estado</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
              <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= UCASE(Ob_RS2("CARcEntidadFederativa"))%>
                 </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= UCASE(Ob_RS2("CARcEntidadFederativa"))%>                
				</OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCMOTIVOADSCRIPCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Motivo de adscripción</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcMotivoAdscripcion' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoAdscripcion")= CINT(Id_CARcMotivoAdscripcion) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= UCASE(Ob_RS2("CARcMotivoAdscripcion"))%>
                   </OPTION>
                <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= UCASE(Ob_RS2("CARcMotivoAdscripcion"))%>                
				</OPTION>
                <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
        <B>&iquest;Actual?</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcActual' size=1  <% IF Id_CARcActual <> 5 THEN RESPONSE.WRITE "DISABLED"%>>
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcActual")= CINT(Id_CARcActual) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>
          <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 <tr>
         <TD>
        <B>Observaciones	</B>      </TD>
         <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='CARdAdscripciones' SIZE=10 ROWS=5 COLS=35><%=CARdAdscripciones%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdAdscripciones >
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

 if (FormEdita.IdAdscripcion.value  == 0)
  {
       alert("EL CAMPO: Adscripción, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcActual.value  == 0)
  {
       alert("EL CAMPO: ¿Actual?, no puede estar vacio");
       return false;
  }
  
  
  	if (FormEdita.FechaAdscripcion.value != "")
	  {
		  if (!esFecha(FormEdita.FechaAdscripcion.value,'E'))
		  {
			alert("El campo - Fecha de oficio documento- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaAdscripcion.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaAdscripcion = FormEdita.FechaAdscripcion.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaAdscripcion = Date.parse(FechaAdscripcion)
		
			if (FechaAdscripcion < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de Adscripción no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaAdscripcion.focus();
			return false;
		  }
		
		
		
	/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_texto_correcto.test(FormEdita.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormEdita.Ciudad.focus();
      	 return false;    
        }*/	
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdAdscripciones.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdAdscripciones.focus();
      	 return false;    
        }*/	
		
		
		
	
 FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	
}



function SeleCombo2(pas)
{
 
//document.FormEdita.Id_CARcNivel.length= 1;

document.FormEdita.Id_CARcDG_o_Delegaciones.length= 0; // resetea automaticamente el Tercer Combo 
var xcont = 1 
var ycont = 0 
	
   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormEdita.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
      document.FormEdita.Id_CARcDG_o_Delegaciones.length= xcont;
      document.FormEdita.Id_CARcDG_o_Delegaciones.options[0].text='Seleccionar'
      document.FormEdita.Id_CARcDG_o_Delegaciones.options[0].value='0'
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormEdita.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormEdita.Id_CARcDG_o_Delegaciones.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormEdita.Id_CARcDG_o_Delegaciones.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  
		  }
   <%  next    %>  
     
 document.FormEdita.Id_CARcDG_o_Delegaciones.options[0].selected=true // Esta linea se agrega solo en Modificaciones

}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormEdita.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
      document.FormEdita.Id_CARcDir_o_subsede.length= xcont;
      document.FormEdita.Id_CARcDir_o_subsede.options[0].text='Seleccionar'
      document.FormEdita.Id_CARcDir_o_subsede.options[0].value='0'
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormEdita.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormEdita.Id_CARcDir_o_subsede.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormEdita.Id_CARcDir_o_subsede.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormEdita.Id_CARcDir_o_subsede.options[0].selected=true 
}

</script> 
