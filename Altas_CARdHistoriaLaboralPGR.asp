<% On Error Resume Next %>
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdHistoriaLaboralPGR"
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
  <FORM METHOD="post" ACTION= "Altas_CARdHistoriaLaboralPGR.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  HistoriaLaboralPGR   </FONT>
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
        if request("CARdHistoriaLaboralPGR")  <> "" then  Ob_RS("CARdHistoriaLaboralPGR")=request("CARdHistoriaLaboralPGR") end if
        if request("ClavePresupuestal")  <> "" then  Ob_RS("ClavePresupuestal")=request("ClavePresupuestal") end if
        if request("Id_SFPcPuestos")  <> "" then  Ob_RS("Id_SFPcPuestos")=request("Id_SFPcPuestos") end if
        if request("UnidadAdscripcion")  <> "" then  Ob_RS("UnidadAdscripcion")=request("UnidadAdscripcion") end if
        if request("Id_CARcAgencias")  <> "" then  Ob_RS("Id_CARcAgencias")=request("Id_CARcAgencias") end if
        if request("TipoMovimiento")  <> "" then  Ob_RS("TipoMovimiento")=request("TipoMovimiento") end if
        if request("FechaAdscripcionActual")  <> "" then  Ob_RS("FechaAdscripcionActual")=request("FechaAdscripcionActual") end if
        if request("TipoNombramiento")  <> "" then  Ob_RS("TipoNombramiento")=request("TipoNombramiento") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdHistoriaLaboralPGR' SIZE=10 ROWS=5 COLS=35><%=CARdHistoriaLaboralPGR%></TEXTAREA>
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
        <B>Unidad de adscripción</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='UnidadAdscripcion' SIZE=50 MAXLENGTH=50 VALUE=<%= UnidadAdscripcion%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Agencia</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCAGENCIAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAgencias' SIZE=1 >
          <% IF Id_CARcAgencias = "" OR Id_CARcAgencias = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcAgencias")= CINT(Id_CARcAgencias) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAgencias")%>'> <%= Ob_RS2("CARcAgencias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAgencias")%>'> <%= Ob_RS2("CARcAgencias")%>
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
        <B>Tipo de movimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoMovimiento' SIZE=20 MAXLENGTH=20 VALUE=<%= TipoMovimiento%>>
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
        <B>Tipo de nombramiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoNombramiento' SIZE=20 MAXLENGTH=20 VALUE=<%= TipoNombramiento%>>
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

  if (FormAltas.FechaAdscripcionActual.value  == "")
  {
       alert("EL CAMPO: Fecha de adscripción actual, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdDatosPersonales.value  == "")
  {
       alert("EL CAMPO: Id_Datos de la persona, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdHistoriaLaboralPGR.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Historial laboral PGR.");
       return false;
  }
  
  if (FormAltas.Id_SFPcPuestos.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Puesto.");
       return false;
  }
  
  if (FormAltas.Id_CARcAgencias.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Agencia.");
       return false;
  }
  


}
</script> 

