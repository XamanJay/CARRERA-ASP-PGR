<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdBienesInmuebles"
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

'========== Combos
%>

<%'=======No tiene combos===========%>


<% '========== Inicia HTML %>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "ConsultasFiltro.asp" NAME= "FormConsultas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Consultas de  BienesInmuebles   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdBienesInmuebles' SIZE=10 ROWS=1 COLS=35><%=CARdBienesInmuebles%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Tipo del bien</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_TipoBien"))%>
	     <SELECT NAME='CT_TipoBien' SIZE=1>
          <% IF CT_TipoBien = "" OR CT_TipoBien = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_TipoBien") (w)= CINT(CT_TipoBien) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_TipoBien") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_TipoBien") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de adquisición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Mayor o igual a :      <INPUT TYPE='TEXT' NAME='FechaAdquisicion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdquisicion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdquisicion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
<table><tr><td>Menor o igual a :       <INPUT TYPE='TEXT' NAME='FechaAdquisicion_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAdquisicion_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaAdquisicion_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> </tr></table>
      </TD > 
     <TR>
      <TD>
        <B>Valor de compra</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ValorCompra' SIZE=8 MAXLENGTH=8 VALUE=<%= ValorCompra%>>
      </TD > 
     <TR>
      <TD>
        <B>Modo de adquisición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_ModoAdquisicion"))%>
	     <SELECT NAME='CT_ModoAdquisicion' SIZE=1>
          <% IF CT_ModoAdquisicion = "" OR CT_ModoAdquisicion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_ModoAdquisicion") (w)= CINT(CT_ModoAdquisicion) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_ModoAdquisicion") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_ModoAdquisicion") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Extensión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Extension' SIZE=4 MAXLENGTH=4 VALUE=<%= Extension%>>
      </TD > 
     <TR>
      <TD>
        <B>Superficie construida</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='SuperficieConstruida' SIZE=8 MAXLENGTH=8 VALUE=<%= SuperficieConstruida%>>
      </TD > 
     <TR>
      <TD>
        <B>Título de propiedad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TituloPropiedad' SIZE=2 MAXLENGTH=2 VALUE=<%= TituloPropiedad%>>
      </TD > 
     <TR>
      <TD>
        <B>Valor catastral</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ValorCatastral' SIZE=8 MAXLENGTH=8 VALUE=<%= ValorCatastral%>>
      </TD > 
     <TR>
      <TD>
        <B>Dirección</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Direccion' SIZE=50 MAXLENGTH=50 VALUE=<%= Direccion%>>
      </TD > 
     <TR>
      <TD> 
         <B>Datos de la persona</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARDDATOSPERSONALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARdDatosPersonales' SIZE=1>
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
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

VAR_JS

}
</script> 

