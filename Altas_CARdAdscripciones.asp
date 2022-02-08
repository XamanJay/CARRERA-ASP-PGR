<%On Error Resume Next%>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdAdscripciones"
	
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
	
'''	RESPONSE.WRITE V_ODBC
'''	RESPONSE.END 
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
  ''' RESPONSE.WRITE session("IP_DATOS")
  ''' RESPONSE.WRITE V_ODBC
   'RESPONSE.END 
   
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
  <FORM METHOD="post" ACTION= "Altas_CARdAdscripciones.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Adscripciones   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
	 
    ''' response.end	
	 
     if vAgregar = "S" then  
        xCampos = " INSERT INTO CARdAdscripciones ("
        xCampos = xCampos + "CARdAdscripciones, "
        xCampos = xCampos + "FechaAdscripcion, "
        xCampos = xCampos + "Id_CARcTipoNombramiento, "
        xCampos = xCampos + "Ciudad, "
        xCampos = xCampos + "Id_CARcEntidadFederativa, "
        xCampos = xCampos + "Id_CARcActual, "
        xCampos = xCampos + "Id_CARcValidado, "
        xCampos = xCampos + "Id_CARcMotivoAdscripcion, "
        xCampos = xCampos + "IdAdscripcion, "
        xCampos = xCampos + "Id_CARdDatosPersonales, "
        xCampos = xCampos + "Fecha_Captura, "
        xCampos = xCampos + "Id_CARcSubprocuradurias, "
        xCampos = xCampos + "Id_CARcDG_o_Delegaciones, "
        xCampos = xCampos + "Id_CARcDir_o_subsede, "
        xCampos = xCampos + "IdLogin, "
        xCampos = xCampos + "IP_user"
        xValues = ") VALUES ('"
        xValues = xValues + UCASE(REQUEST("CARdAdscripciones"))+"','"
        xValues = xValues + UCASE(REQUEST("FechaAdscripcion"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcTipoNombramiento"))+"','"
        xValues = xValues + UCASE(REQUEST("Ciudad"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcEntidadFederativa"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcActual"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcValidado"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcMotivoAdscripcion"))+"','"
        xValues = xValues + UCASE(REQUEST("IdAdscripcion"))+"','"
        xValues = xValues + CSTR(idPersona)+"','"
        xValues = xValues + UCASE(REQUEST("Fecha_Captura"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcSubprocuradurias"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcDG_o_Delegaciones"))+"','"
        xValues = xValues + UCASE(REQUEST("Id_CARcDir_o_subsede"))+"','"
        xValues = xValues + UCASE(REQUEST("IdLogin"))+"','"
        xValues = xValues + UCASE(REQUEST("IP_user"))+"')"
        QueryAlta = xCampos +xValues
        Ob_Conn.EXECUTE(QueryAlta)
''  response.write QueryAlta
''  RESPONSE.END
''   	   Ob_RS.Addnew 
'''        if request("CARdAdscripciones")  <> "" then  Ob_RS("CARdAdscripciones")=UCASE(request("CARdAdscripciones")) end if
'''        if request("FechaAdscripcion")  <> "" then  Ob_RS("FechaAdscripcion")=request("FechaAdscripcion") end if

'''        if request("Id_CARcSubprocuradurias")  <> "" then  Ob_RS("Id_CARcSubprocuradurias")=request("Id_CARcSubprocuradurias") end if
' ''       if request("Id_CARcDG_o_Delegaciones")  <> "" then  Ob_RS("Id_CARcDG_o_Delegaciones")=request("Id_CARcDG_o_Delegaciones") end if

''        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
''        if request("Area")  <> "" then  Ob_RS("Area")=UCASE(request("Area")) end if
''        if request("SubArea")  <> "" then  Ob_RS("SubArea")=UCASE(request("SubArea")) end if
''        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=UCASE(request("Ciudad")) end if
''        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") end if
''        if request("Id_CARcMotivoAdscripcion")  <> "" then  Ob_RS("Id_CARcMotivoAdscripcion")=request("Id_CARcMotivoAdscripcion") end if
''        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
''        if request("Id_CARcValidado")  <> "" then  Ob_RS("Id_CARcValidado")=request("Id_CARcValidado") end if
''        if request("IdAdscripcion")  <> "" then  Ob_RS("IdAdscripcion")=request("IdAdscripcion") end if
''		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		
''		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
''		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
' response.write idPersona
'response.end
''       Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
 ''       Ob_RS.update
 ''       response.clear
		%>
		 
		 		<!-- #INCLUDE File="errror.inc" -->

				<%
				response.Clear
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 
	     %>
  
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     
     
     <TR>
      <TD>
        <B>Fecha de adscripción</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAdscripcion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAdscripcion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD height="26"> <B>Adscripción</B> </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY CARcSubprocuradurias ASC" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='IdAdscripcion' SIZE=1>
	         <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
	         <%DO UNTIL Ob_RS2.Eof%>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
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
     </TR>
     <TR>
     <TD>
	 <p align="right">
        <B><font size="-2"> Subprocuraduría</font> </B> </p>
      </TD>
     <TD>
        <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY CARcSubprocuradurias ASC" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")'>
          <OPTION SELECTED VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%> </OPTION>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT>
        <% Ob_RS2.CLOSE%>
       </TD>
      </TR>
 	    <TR>
       <TD>
	 <p align="right">
       <B><font size="-2"> Delegación o Dirección General</font> </B> </p>
      </TD>
        <TD>
       <select name='Id_CARcDG_o_Delegaciones' size=1  onChange='SeleCombo3("C")'>
          <option value='0'>SELECCIONE</option>
        </select>
        <BR>
       </TD>
 	     </TR>
 	     <TR>
     <TD>
	 <p align="right">
        <B><font size="-2"> Direcci&oacute;n / Subsede</font> </B> </p>
      </TD>
       <TD>
         <select name='Id_CARcDir_o_subsede' size=1 >
          <option value='0'>SELECCIONE</option>
        </select>

	   </TD> 
	   
	   </TR>
     <TR>
      <TD> 
         <B>Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipoNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
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
         <B>Estado</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY ID_CARCENTIDADFEDERATIVA" %>
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
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Motivo de adscripción</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOADSCRIPCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoAdscripcion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoAdscripcion")= CINT(Id_CARcMotivoAdscripcion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoAdscripcion")%>'> <%= Ob_RS2("CARcMotivoAdscripcion")%>
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
        <B>&iquest;Actual?</font>	</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
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
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value ='<%=request("Id_CARdDatosPersonales")%>' >
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

  if (FormAltas.IdAdscripcion.value  == 0)
  {
       alert("EL CAMPO: Adscripción, no puede estar vacio");
       return false;
  }


  if (FormAltas.Id_CARcSubprocuradurias.value  == 0)
  {
       alert("EL CAMPO: CARcSubprocuradurias, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARcActual.value  == 0)
  {
       alert("EL CAMPO: ¿Actual?, no puede estar vacio");
       return false;
  }
  
  
  	if (FormAltas.FechaAdscripcion.value != "")
	  {
		  if (!esFecha(FormAltas.FechaAdscripcion.value,'E'))
		  {
			alert("El campo - Fecha de Adscripción- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaAdscripcion.focus();
			return false;
		  }	
	 
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaAdscripcion = FormAltas.FechaAdscripcion.value
			  
			/*Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaAdscripcion = Date.parse(FechaAdscripcion)
		
			if (FechaAdscripcion < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de Adscripción no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.FechaAdscripcion.focus();
			return false;
		  }*/
		  
		  if (!comparaFechas(Fecha_Ingreso_PGR,'menor_igual',FechaAdscripcion,0))
		 {
			alert("La fecha de ingreso a la PGR de esta persona no puede ser mayor a la fecha de Adscripción .");
			
			return false;
		  }
		
		
	}
	/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_texto_correcto.test(FormAltas.Ciudad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	  	 FormAltas.Ciudad.focus();
      	 return false;    
        }	*/
		
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdAdscripciones.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdAdscripciones.focus();
      	 return false;    
        }	*/
		
		
		
	
 FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	
		
		
		
}
				
function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    
   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormAltas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_CARcDG_o_Delegaciones.length= xcont;
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormAltas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcDG_o_Delegaciones.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormAltas.Id_CARcDG_o_Delegaciones.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  //document.FormAltas.Id_CARcDG_o_Delegaciones.options[0].selected=true // Esta linea se agrega solo en Modificaciones
}


function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormAltas.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
     document.FormAltas.Id_CARcDir_o_subsede.length= xcont;
     document.FormAltas.Id_CARcDir_o_subsede.options[0].text='Seleccionar'
     document.FormAltas.Id_CARcDir_o_subsede.options[0].value='0'
   <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormAltas.Id_CARcDG_o_Delegaciones.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcDir_o_subsede.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormAltas.Id_CARcDir_o_subsede.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_CARcDir_o_subsede.options[0].selected=true 
}

</script> 

