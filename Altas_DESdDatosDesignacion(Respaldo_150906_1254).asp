<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "DESdDatosDesignacion"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

    idPersona = request("Id_CARdDatosPersonales")
     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Tipo Nombramiento y Categoria
consulta = "SELECT * FROM CARcCategoria " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = OB_rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Categoria y Nivel
consulta = "SELECT * FROM CARcNivel" 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo3 = OB_rs.getrows
Campos_Combo3 = UBound(tbl_Combo3,1) 
regs_Combo3 = UBound(tbl_Combo3,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo


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
  <FORM METHOD="post" ACTION= "Altas_DESdDatosDesignacion.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Datos Designación   </FONT>
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
        if request("DESdDatosDesignacion")  <> "" then  Ob_RS("DESdDatosDesignacion")=request("DESdDatosDesignacion") end if
        if request("NumAcuerdo")  <> "" then  Ob_RS("NumAcuerdo")=request("NumAcuerdo") end if
        if request("NumExpediente")  <> "" then  Ob_RS("NumExpediente")=request("NumExpediente") end if
		            Id_CARcTipoNombramiento
        if request("Id_DEScTipoNombramiento")  <> "" then  Ob_RS("Id_DEScTipoNombramiento")=request("Id_DEScTipoNombramiento") end if
        if request("Id_DEScCategoria")  <> "" then  Ob_RS("Id_DEScCategoria")=request("Id_DEScCategoria") end if
        if request("Id_DEScNivel")  <> "" then  Ob_RS("Id_DEScNivel")=request("Id_DEScNivel") end if
        if request("Id_DEScTipoPersonal")  <> "" then  Ob_RS("Id_DEScTipoPersonal")=request("Id_DEScTipoPersonal") end if
        if request("NumOficioLicencia")  <> "" then  Ob_RS("NumOficioLicencia")=request("NumOficioLicencia") end if
        if request("PeriodoLicenciaINI")  <> "" then  Ob_RS("PeriodoLicenciaINI")=request("PeriodoLicenciaINI") end if
        if request("PeriodoLicenciaFIN")  <> "" then  Ob_RS("PeriodoLicenciaFIN")=request("PeriodoLicenciaFIN") end if
        if request("Id_DEScNuevaoProrroga")  <> "" then  Ob_RS("Id_DEScNuevaoProrroga")=request("Id_DEScNuevaoProrroga") end if
        if request("NoSesion")  <> "" then  Ob_RS("NoSesion")=request("NoSesion") end if
        if request("AnioSesion")  <> "" then  Ob_RS("AnioSesion")=request("AnioSesion") end if
        if request("Id_DEScAdscripciones")  <> "" then  Ob_RS("Id_DEScAdscripciones")=request("Id_DEScAdscripciones") end if
        if request("Autoridad")  <> "" then  Ob_RS("Autoridad")=request("Autoridad") end if
        if request("Id_DEScTipoAcuerdo")  <> "" then  Ob_RS("Id_DEScTipoAcuerdo")=request("Id_DEScTipoAcuerdo") end if
        if request("ClavePresupuestal")  <> "" then  Ob_RS("ClavePresupuestal")=request("ClavePresupuestal") end if
        if request("VigenciaInicio")  <> "" then  Ob_RS("VigenciaInicio")=request("VigenciaInicio") end if
        if request("VigenciaTermino")  <> "" then  Ob_RS("VigenciaTermino")=request("VigenciaTermino") end if
        if request("OcupacionRealInicio")  <> "" then  Ob_RS("OcupacionRealInicio")=request("OcupacionRealInicio") end if
        if request("OcupacionRealTermino")  <> "" then  Ob_RS("OcupacionRealTermino")=request("OcupacionRealTermino") end if
        if request("NumVolanta")  <> "" then  Ob_RS("NumVolanta")=request("NumVolanta") end if
        if request("TitularPlaza")  <> "" then  Ob_RS("TitularPlaza")=request("TitularPlaza") end if

        Ob_RS("Id_DEScTipoNombramientoNva")= 0
        Ob_RS("Id_DEScCategoriaNva")= 0
        Ob_RS("Id_DEScNivelNva")= 0
        Ob_RS("Id_DEScEstatusExpediente")= 0
        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		Ob_RS("IdLogin") = session("IdLogin")
		Ob_RS("IP_user")=request.servervariables("remote_addr")

        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'  CELLPADDING='5' CELLSPACING='5'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Número de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumAcuerdo' SIZE=10 MAXLENGTH=10 VALUE=<%= NumAcuerdo%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de Expediente (DGSC)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumExpediente' SIZE=10 MAXLENGTH=10 VALUE=<%= NumExpediente%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de Volanta:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumVolanta' SIZE=50 MAXLENGTH=50 VALUE=<%= NumVolanta%>>
      </TD > 
     <TR>
      <TD> 
         <B>Cargo</B></TD>
      <TD>
          <%Sql ="SELECT * FROM DESCTIPONOMBRAMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScTipoNombramiento' SIZE=1 onchange='SeleCombo2("C")'>
          <% IF Id_DEScTipoNombramiento = "" OR Id_DEScTipoNombramiento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScTipoNombramiento")= CINT(Id_DEScTipoNombramiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScTipoNombramiento")%>'> <%= Ob_RS2("DEScTipoNombramiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScTipoNombramiento")%>'> <%= Ob_RS2("DEScTipoNombramiento")%>
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
         <B>Categoría</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCCATEGORIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScCategoria' SIZE=1 onchange='SeleCombo3("C")'>
          <% IF Id_DEScCategoria = "" OR Id_DEScCategoria = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScCategoria")= CINT(Id_DEScCategoria) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScCategoria")%>'> <%= Ob_RS2("DEScCategoria")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScCategoria")%>'> <%= Ob_RS2("DEScCategoria")%>
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
         <B>Nivel</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCNIVEL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScNivel' SIZE=1 >
          <% IF Id_DEScNivel = "" OR Id_DEScNivel = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScNivel")= CINT(Id_DEScNivel) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScNivel")%>'> <%= Ob_RS2("DEScNivel")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScNivel")%>'> <%= Ob_RS2("DEScNivel")%>
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
         <B>Tipo Personal</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCTIPOPERSONAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScTipoPersonal' SIZE=1 >
          <% IF Id_DEScTipoPersonal = "" OR Id_DEScTipoPersonal = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScTipoPersonal")= CINT(Id_DEScTipoPersonal) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScTipoPersonal")%>'> <%= Ob_RS2("DEScTipoPersonal")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScTipoPersonal")%>'> <%= Ob_RS2("DEScTipoPersonal")%>
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
        <B>Número de Oficio Otorga Licencia</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumOficioLicencia' SIZE=30 MAXLENGTH=30 VALUE=<%= NumOficioLicencia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Período de Autorización de Licencia</font>	</B>
      </TD>
      <TD> DE
 	     <SELECT NAME='PeriodoLicenciaINI' SIZE=1 >
	            <OPTION VALUE='MES'>Seleccione registro </OPTION>
              <OPTION VALUE='ENE'>ENE</OPTION>
              <OPTION VALUE='FEB'>FEB</OPTION>
              <OPTION VALUE='MAR'>MAR</OPTION>
              <OPTION VALUE='ABR'>ABR</OPTION>
              <OPTION VALUE='MAY'>MAY</OPTION>
              <OPTION VALUE='JUN'>JUN</OPTION>
              <OPTION VALUE='JUL'>JUL</OPTION>
              <OPTION VALUE='AGO'>AGO</OPTION>
              <OPTION VALUE='SEP'>SEP</OPTION>
              <OPTION VALUE='OCT'>OCT</OPTION>
              <OPTION VALUE='NOV'>NOV</OPTION>
              <OPTION VALUE='DIC'>DIC</OPTION>
       </SELECT>
        <B> A </B>
 	     <SELECT NAME='PeriodoLicenciaFIN' SIZE=1 >
	            <OPTION VALUE='MES'>Seleccione registro </OPTION>
              <OPTION VALUE='ENE'>ENE</OPTION>
              <OPTION VALUE='FEB'>FEB</OPTION>
              <OPTION VALUE='MAR'>MAR</OPTION>
              <OPTION VALUE='ABR'>ABR</OPTION>
              <OPTION VALUE='MAY'>MAY</OPTION>
              <OPTION VALUE='JUN'>JUN</OPTION>
              <OPTION VALUE='JUL'>JUL</OPTION>
              <OPTION VALUE='AGO'>AGO</OPTION>
              <OPTION VALUE='SEP'>SEP</OPTION>
              <OPTION VALUE='OCT'>OCT</OPTION>
              <OPTION VALUE='NOV'>NOV</OPTION>
              <OPTION VALUE='DIC'>DIC</OPTION>
       </SELECT>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Nueva o Prorroga</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCNUEVAOPRORROGA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScNuevaoProrroga' SIZE=1 >
          <% IF Id_DEScNuevaoProrroga = "" OR Id_DEScNuevaoProrroga = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScNuevaoProrroga")= CINT(Id_DEScNuevaoProrroga) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScNuevaoProrroga")%>'> <%= Ob_RS2("DEScNuevaoProrroga")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScNuevaoProrroga")%>'> <%= Ob_RS2("DEScNuevaoProrroga")%>
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
        <B>Número de Sesión en la cual se otorgó</font>	</B>
      </TD>
      <TD>
       <INPUT TYPE='TEXT' NAME='NoSesion' SIZE=5 MAXLENGTH=5 VALUE=<%= NoSesion%>>
        <B>  Año </font>	</B>       
       <INPUT TYPE='TEXT' NAME='AnioSesion' SIZE=5 MAXLENGTH=5 VALUE=<%= AnioSesion%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Adscripción</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCADSCRIPCIONES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScAdscripciones' SIZE=1 >
          <% IF Id_DEScAdscripciones = "" OR Id_DEScAdscripciones = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScAdscripciones")= CINT(Id_DEScAdscripciones) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScAdscripciones")%>'> <%= Ob_RS2("DEScAdscripciones_Corta")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScAdscripciones")%>'> <%= Ob_RS2("DEScAdscripciones_Corta")%>
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
        <B>Autoridad que Propone al Candidato</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Autoridad' SIZE=10 ROWS=5 COLS=35><%=Autoridad%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Tipo de Acuerdo</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM DESCTIPOACUERDO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_DEScTipoAcuerdo' SIZE=1 >
          <% IF Id_DEScTipoAcuerdo = "" OR Id_DEScTipoAcuerdo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_DEScTipoAcuerdo")= CINT(Id_DEScTipoAcuerdo) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_DEScTipoAcuerdo")%>'> <%= Ob_RS2("DEScTipoAcuerdo")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_DEScTipoAcuerdo")%>'> <%= Ob_RS2("DEScTipoAcuerdo")%>
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
        <B>Titular de la Plaza a ocupar</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TitularPlaza' SIZE=50 MAXLENGTH=50 VALUE='<%= TitularPlaza%>''>
      </TD> 
     </TR>
     <TR>
     <TR>
      <TD>
        <B>Clave Presupuestal</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ClavePresupuestal' SIZE=20 MAXLENGTH=20 VALUE=<%= ClavePresupuestal%>>
      </TD> 
     </TR>
     <TR>
      <TD>
        <B>Vigencia Inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='VigenciaInicio' SIZE=16 MAXLENGTH=16 VALUE=<%= VigenciaInicio%> >
       <IMG ONCLICK="window_open('FormAltas','VigenciaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD> 
     </TR>
     <TR>
      <TD>
        <B>Vigencia Término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='VigenciaTermino' SIZE=16 MAXLENGTH=16  VALUE=<%= VigenciaTermino%> >
       <IMG ONCLICK="window_open('FormAltas','VigenciaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD> 
     </TR>
     <TR>
      <TD>
        <B>Ocupación Real Inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='OcupacionRealInicio' SIZE=16 MAXLENGTH=16  VALUE=<%= OcupacionRealInicio%> >
       <IMG ONCLICK="window_open('FormAltas','OcupacionRealInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD> 
     </TR>
     <TR>
      <TD>
        <B>Ocupación Real Término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='OcupacionRealTermino' SIZE=16 MAXLENGTH=16  VALUE=<%= OcupacionRealTermino%> >
       <IMG ONCLICK="window_open('FormAltas','OcupacionRealTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD> 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='DESdDatosDesignacion' SIZE=10 ROWS=5 COLS=35><%=DESdDatosDesignacion%></TEXTAREA>
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
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%= idPersona%> >

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

  if (FormAltas.NumAcuerdo.value  == "")
  {
       alert("EL CAMPO: Numero de Acuerdo, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.NumExpediente.value  == "")
  {
       alert("EL CAMPO: Numero de Expediente (DGSC), no puede estar vacio");
       return false;
  }
  
    if (FormAltas.Id_DEScTipoNombramiento.value  == 0)
  {
       alert("EL CAMPO: Tipo de Nombramiento, no puede estar vacio");
       return false;
  }

      if (FormAltas.Id_DEScCategoria.value  == 0)
  {
       alert("EL CAMPO: Categoria, no puede estar vacio");
       return false;
  }
    if (FormAltas.Id_DEScNivel.value  == 0)
  {
       alert("EL CAMPO: Nivel, no puede estar vacio");
       return false;
  }
    if (FormAltas.Id_DEScTipoPersonal.value  == 0)
  {
       alert("EL CAMPO: Tipo Personal, no puede estar vacio");
       return false;
  }

}

function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    document.FormAltas.Id_DEScNivel.length= 1; // resetea automaticamente el Tercer Combo 

   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormAltas.Id_DEScTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_DEScCategoria.length= xcont;
          document.FormAltas.Id_CARcCategoria.options[0].text= 'Seleccionar';
          document.FormAltas.Id_CARcCategoria.options[0].value= '0';
          document.FormAltas.Id_CARcNivel.options[0].text= 'Seleccionar';
          document.FormAltas.Id_CARcNivel.options[0].value= '0';
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormAltas.Id_DEScTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_DEScCategoria.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormAltas.Id_DEScCategoria.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_DEScCategoria.options[0].selected=true // Esta linea se agrega solo en Modificaciones

}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormAltas.Id_DEScCategoria.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_DEScNivel.length= xcont;
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormAltas.Id_DEScCategoria.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_DEScNivel.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormAltas.Id_DEScNivel.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_DEScNivel.options[0].selected=true 

}


</script>
