<% On Error Resume Next %>
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdEncargoActual"
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
  <FORM METHOD="post" ACTION= "Altas_CARdEncargoActual.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  EncargoActual   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdEncargoActual")  <> "" then  Ob_RS("CARdEncargoActual")=request("CARdEncargoActual") end if
        if request("ClavePresupuestal")  <> "" then  Ob_RS("ClavePresupuestal")=request("ClavePresupuestal") end if
        if request("Id_SFPcPuestos")  <> "" then  Ob_RS("Id_SFPcPuestos")=request("Id_SFPcPuestos") end if
        if request("FechaIngresoPGR")  <> "" then  Ob_RS("FechaIngresoPGR")=request("FechaIngresoPGR") end if
        if request("UnidadAdscripcion")  <> "" then  Ob_RS("UnidadAdscripcion")=request("UnidadAdscripcion") end if
        if request("FechaAdscripcionActual")  <> "" then  Ob_RS("FechaAdscripcionActual")=request("FechaAdscripcionActual") end if
        if request("Calle_y_numero")  <> "" then  Ob_RS("Calle_y_numero")=request("Calle_y_numero") end if
        if request("Colonia")  <> "" then  Ob_RS("Colonia")=request("Colonia") end if
        if request("Delegacion_municipio")  <> "" then  Ob_RS("Delegacion_municipio")=request("Delegacion_municipio") end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=request("Ciudad") end if
        if request("Estado")  <> "" then  Ob_RS("Estado")=request("Estado") end if
        if request("Telefono")  <> "" then  Ob_RS("Telefono")=request("Telefono") end if
        if request("Micro")  <> "" then  Ob_RS("Micro")=request("Micro") end if
        if request("Fax")  <> "" then  Ob_RS("Fax")=request("Fax") end if
        if request("EMail")  <> "" then  Ob_RS("EMail")=request("EMail") end if
        if request("CT_SituacionLaboral")  <> "" then  Ob_RS("CT_SituacionLaboral")=request("CT_SituacionLaboral") end if
        if request("UltimaEvaluacionCeDH")  <> "" then  Ob_RS("UltimaEvaluacionCeDH")=request("UltimaEvaluacionCeDH") end if
        if request("CT_PortacionArma")  <> "" then  Ob_RS("CT_PortacionArma")=request("CT_PortacionArma") end if
        if request("CUIP")  <> "" then  Ob_RS("CUIP")=request("CUIP") end if
        if request("TipoNombramiento")  <> "" then  Ob_RS("TipoNombramiento")=request("TipoNombramiento") end if
        if request("NoOficio")  <> "" then  Ob_RS("NoOficio")=request("NoOficio") end if
        if request("Generacion")  <> "" then  Ob_RS("Generacion")=request("Generacion") end if
        if request("FechaExamen")  <> "" then  Ob_RS("FechaExamen")=request("FechaExamen") end if
        if request("Foto")  <> "" then  Ob_RS("Foto")=request("Foto") end if
        if request("Id_CAPcAreas")  <> "" then  Ob_RS("Id_CAPcAreas")=request("Id_CAPcAreas") end if
'        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
     </TR>
     <TR>
      <TD>
        <B>OBSERVACIONES</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEncargoActual' SIZE=10 ROWS=5 COLS=35><%=CARdEncargoActual%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Clave presupuestal</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ClavePresupuestal' SIZE=20 MAXLENGTH=20 VALUE=<%= ClavePresupuestal%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Puesto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM SFPCPUESTOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_SFPcPuestos' SIZE=1 >
          <% IF Id_SFPcPuestos = "" OR Id_SFPcPuestos = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_SFPcPuestos")= CINT(Id_SFPcPuestos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_SFPcPuestos")%>'> <%= Ob_RS2("SFPcPuestos")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_SFPcPuestos")%>'> <%= Ob_RS2("SFPcPuestos")%>
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
        <B>Fecha de ingreso a la PGR</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaIngresoPGR' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaIngresoPGR%> >
       <IMG ONCLICK="window_open('FormAltas','FechaIngresoPGR')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Unidad de adscripción</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='UnidadAdscripcion' SIZE=50 MAXLENGTH=50 VALUE=<%= UnidadAdscripcion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de adscripción actual</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAdscripcionActual' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdscripcionActual%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAdscripcionActual')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Domicilio de oficina (calle y número)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle_y_numero' SIZE=50 MAXLENGTH=50 VALUE=<%= Calle_y_numero%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' SIZE=30 MAXLENGTH=30 VALUE=<%= Colonia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Delegación o municipio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Delegacion_municipio' SIZE=30 MAXLENGTH=30 VALUE=<%= Delegacion_municipio%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=30 MAXLENGTH=30 VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Estado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estado' SIZE=30 MAXLENGTH=30 VALUE=<%= Estado%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Teléfono oficina</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=30 MAXLENGTH=30 VALUE=<%= Telefono%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Micro</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Micro' SIZE=15 MAXLENGTH=15 VALUE=<%= Micro%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fax oficina</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fax' SIZE=30 MAXLENGTH=30 VALUE=<%= Fax%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Correo Electrónico</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='EMail' SIZE=25 MAXLENGTH=25 VALUE=<%= EMail%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Situación laboral</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_SituacionLaboral"))%>
	     <SELECT NAME='CT_SituacionLaboral' SIZE=1>
          <% IF CT_SituacionLaboral = "" OR CT_SituacionLaboral = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_SituacionLaboral") (w)= CINT(CT_SituacionLaboral) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_SituacionLaboral") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_SituacionLaboral") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
       </SELECT>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Última evaluación CeDH</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='UltimaEvaluacionCeDH' SIZE=10  MAXLENGTH=16  VALUE=<%= UltimaEvaluacionCeDH%> >
       <IMG ONCLICK="window_open('FormAltas','UltimaEvaluacionCeDH')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Portación de arma?</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_PortacionArma"))%>
	     <SELECT NAME='CT_PortacionArma' SIZE=1>
          <% IF CT_PortacionArma = "" OR CT_PortacionArma = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_PortacionArma") (w)= CINT(CT_PortacionArma) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_PortacionArma") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_PortacionArma") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
       </SELECT>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CUIP' SIZE=15 MAXLENGTH=15 VALUE=<%= CUIP%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Tipo de nombramiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoNombramiento' SIZE=20 MAXLENGTH=20 VALUE=<%= TipoNombramiento%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Designación especial (No. Oficio)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficio' SIZE=30 MAXLENGTH=30 VALUE=<%= NoOficio%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Curso (Generación)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=8 MAXLENGTH=8 VALUE=<%= Generacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Concurso (Fecha de examen)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaExamen' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaExamen%> >
       <IMG ONCLICK="window_open('FormAltas','FechaExamen')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Foto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Foto' SIZE=10 ROWS=5 COLS=35><%=Foto%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Área</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPCAREAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPcAreas' SIZE=1 >
          <% IF Id_CAPcAreas = "" OR Id_CAPcAreas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CAPcAreas")= CINT(Id_CAPcAreas) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPcAreas")%>'> <%= Ob_RS2("CAPcAreas")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPcAreas")%>'> <%= Ob_RS2("CAPcAreas")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
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
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
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

  if (FormAltas.Id_SFPcPuestos.value  == "")
  {
       alert("EL CAMPO: Id_Puesto, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CAPcAreas.value  == "")
  {
       alert("EL CAMPO: Id_Área, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdDatosPersonales.value  == "")
  {
       alert("EL CAMPO: Id_Datos de la persona, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdEncargoActual.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Encargo actual.");
       return false;
  }
  
  if (FormAltas.Id_SFPcPuestos.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Puesto.");
       return false;
  }
  
  if (FormAltas.CT_SituacionLaboral.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Situación laboral, Solo Acepta Numeros");
       return false;
  }
  
  if (FormAltas.CT_PortacionArma.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Portación de arma?, Solo Acepta Numeros");
       return false;
  }
  
  if (FormAltas.Id_CAPcAreas.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Área.");
       return false;
  }
  
  


}
</script> 

