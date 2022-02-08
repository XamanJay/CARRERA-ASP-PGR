<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdDatosPersonales_cap"
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
     <FONT COLOR= #3366CC>Consultas de  DatosPersonales_cap   </FONT>
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
       <TEXTAREA NAME='CARdDatosPersonales' SIZE=10 ROWS=1 COLS=35><%=CARdDatosPersonales%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>RFC</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='RFC' SIZE=15 MAXLENGTH=15 VALUE=<%= RFC%>>
      </TD > 
     <TR>
      <TD>
        <B>Apellido paterno</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoPaterno' SIZE=25 MAXLENGTH=25 VALUE=<%= ApellidoPaterno%>>
      </TD > 
     <TR>
      <TD>
        <B>Apellido materno</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoMaterno' SIZE=25 MAXLENGTH=25 VALUE=<%= ApellidoMaterno%>>
      </TD > 
     <TR>
      <TD>
        <B>Nombre(s)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' SIZE=25 MAXLENGTH=25 VALUE=<%= Nombre%>>
      </TD > 
     <TR>
      <TD>
        <B>Domicilio (calle y número)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle_y_numero' SIZE=50 MAXLENGTH=50 VALUE=<%= Calle_y_numero%>>
      </TD > 
     <TR>
      <TD>
        <B>Colonia en la que reside</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' SIZE=30 MAXLENGTH=30 VALUE=<%= Colonia%>>
      </TD > 
     <TR>
      <TD>
        <B>Código postal</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=4 MAXLENGTH=4 VALUE=<%= CodigoPostal%>>
      </TD > 
     <TR>
      <TD>
        <B>Dirección de correo electrónico</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Email' SIZE=50 MAXLENGTH=50 VALUE=<%= Email%>>
      </TD > 
     <TR>
      <TD>
        <B>Ciudad en la que reside</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 VALUE=<%= Ciudad%>>
      </TD > 
     <TR>
      <TD>
        <B>Lugar de nacimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_Estado"))%>
	     <SELECT NAME='CT_Estado' SIZE=1>
          <% IF CT_Estado = "" OR CT_Estado = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_Estado") (w)= CINT(CT_Estado) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_Estado") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_Estado") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Teléfono</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=30 MAXLENGTH=30 VALUE=<%= Telefono%>>
      </TD > 
     <TR>
      <TD>
        <B>LugarNacimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='LugarNacimiento' SIZE=50 MAXLENGTH=50 VALUE=<%= LugarNacimiento%>>
      </TD > 
     <TR>
      <TD>
        <B>Fecha de nacimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
Mayor o igual a :      <INPUT TYPE='TEXT' NAME='FechaNacimiento' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaNacimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaNacimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
<table><tr><td>Menor o igual a :       <INPUT TYPE='TEXT' NAME='FechaNacimiento_N' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaNacimiento_N%> >
       <IMG ONCLICK="window_open('FormConsultas','FechaNacimiento_N')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> </tr></table>
      </TD > 
     <TR>
      <TD>
        <B>Estado civil</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_EstadoCivil"))%>
	     <SELECT NAME='CT_EstadoCivil' SIZE=1>
          <% IF CT_EstadoCivil = "" OR CT_EstadoCivil = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_EstadoCivil") (w)= CINT(CT_EstadoCivil) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_EstadoCivil") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_EstadoCivil") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Género</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_Genero"))%>
	     <SELECT NAME='CT_Genero' SIZE=1>
          <% IF CT_Genero = "" OR CT_Genero = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_Genero") (w)= CINT(CT_Genero) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_Genero") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_Genero") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>CURP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CURP' SIZE=20 MAXLENGTH=20 VALUE=<%= CURP%>>
      </TD > 
     <TR>
      <TD>
        <B>Grado máximo de estudios</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	            <%tot_elems_arreglo = Ubound(Session("CT_GradoMaximoEstudios"))%>
	     <SELECT NAME='CT_GradoMaximoEstudios' SIZE=1>
          <% IF CT_GradoMaximoEstudios = "" OR CT_GradoMaximoEstudios = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
           <% FOR w = 0 TO tot_elems_arreglo %>
             <% IF Session("CT_GradoMaximoEstudios") (w)= CINT(CT_GradoMaximoEstudios) THEN %>
                <OPTION SELECTED VALUE='<%=W %>'>	           <%= Session("CT_GradoMaximoEstudios") (w) %>
                </OPTION>
             <% ELSE  %>
		   		<OPTION VALUE=<%= W %> >
	           <%= Session("CT_GradoMaximoEstudios") (w) %>
          		</OPTION>           			
             <%END IF  %>
           <% NEXT %>
      </TD > 
     <TR>
      <TD>
        <B>Foto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Foto' SIZE=10 ROWS=1 COLS=35><%=Foto%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Esta facultado para autorizar cursos?</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Autorizador' SIZE=2 MAXLENGTH=2 VALUE=<%= Autorizador%>>
      </TD > 
     <TR>
      <TD> 
         <B>CARdEncargoActual</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARDENCARGOACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARdEncargoActual' SIZE=1>
          <% IF Id_CARdEncargoActual = "" OR Id_CARdEncargoActual = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARdEncargoActual")= CINT(Id_CARdEncargoActual) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdEncargoActual")%>'> <%= Ob_RS2("CARdEncargoActual")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdEncargoActual")%>'> <%= Ob_RS2("CARdEncargoActual")%>
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
        <B>Login</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Login' SIZE=10 ROWS=1 COLS=35><%=Login%></TEXTAREA>
      </TD > 
     <TR>
      <TD>
        <B>Password</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Passsword' SIZE=10 ROWS=1 COLS=35><%=Passsword%></TEXTAREA>
      </TD > 
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

