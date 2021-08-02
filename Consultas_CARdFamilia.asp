<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>
<!-- #Include File = "Seguridad/Perfil.inc" -->




<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdFamilia"
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
     <FONT COLOR= #3366CC>Consultas de  Referencias</FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">

  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     
        <TR>
      <TD> 
         <B>Referencia</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCREFERENCIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcReferencia' SIZE=1 onchange='SeleMenu()'>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcReferencia")= CINT(Id_CARcReferencia) THEN%>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= Ob_RS2("CARcReferencia")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcReferencia")%>'> <%= Ob_RS2("CARcReferencia")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
  
     
     <TR>
      <TD> 
         <B>Parentesco</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPARENTESCO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcParentesco' SIZE=1 disabled>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcParentesco")= CINT(Id_CARcParentesco) THEN%>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= Ob_RS2("CARcParentesco")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcParentesco")%>'> <%= Ob_RS2("CARcParentesco")%>
                </OPTION>
             <%END IF%>
            <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>			 			 
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Nombre</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Nombre%>>
      </TD > 
     <TR>
      <TD> 
         <B>Género</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCGENERO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcGenero' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcGenero")= CINT(Id_CARcGenero) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
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
        <B>Ocupación	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ocupacion' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ocupacion%>>
      </TD > 
     <TR>
      <TD>
        <B>Calle</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calle' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Calle%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <p><B>Número exterior </B></p>
       </TD>
      <TD>
       <p><INPUT TYPE='TEXT' NAME='Numero' SIZE=10 MAXLENGTH=10 style="text-transform: uppercase" VALUE=<%= Numero%>>
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <B>Número interior </B>
        <INPUT TYPE='TEXT' NAME='NumeroInt' SIZE=10 MAXLENGTH=10 style="text-transform: uppercase" VALUE=<%= NumeroInt%>>
      </p></TD > 
     </TR>
     <TR>
      <TD>
        <B>Colonia</font></B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Colonia' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Colonia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Código postal</B></TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CodigoPostal' SIZE=5 MAXLENGTH=5 style="text-transform: uppercase" VALUE=<%= CodigoPostal%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Municipio' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Municipio%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado </B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY Id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
               <%IF Ob_RS2("Id_CARcEntidadFederativa")= CINT(Id_CARcEntidadFederativa) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                   </OPTION>
               <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEntidadFederativa")%>'> <%= Ob_RS2("CARcEntidadFederativa")%>
                </OPTION>
               <%END IF%>
	         <%Ob_RS2.MOVENEXT%>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Ciudad</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Teléfono</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Telefono' SIZE=20 MAXLENGTH=20 style="text-transform: uppercase" VALUE=<%= Telefono%>>
      </TD > 
     </TR>
      <TR>
      <TD>
        <B>Registro validado</font></B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
          <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcValidado' SIZE=1 >
          <%IF Ob_RS2.EOF  THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcValidado")= CINT(Id_CARcValidado) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                   </OPTION>
               <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                </OPTION>
               <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
   </TR>
	 <TR>
      <TD>
        <B>Observaciones</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFamilia' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=CARdFamilia%></TEXTAREA>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<%TITU = "Referencias"%>
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
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
<!-- #INCLUDE File="errores.inc" -->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function SeleMenu()
{
        if  (document.FormConsultas.Id_CARcReferencia.value == 1 )
		 {
             document.FormConsultas.Id_CARcParentesco.disabled =false
		  }
		  else
		  {
             document.FormConsultas.Id_CARcParentesco.disabled =true
		  }

}
</script> 

