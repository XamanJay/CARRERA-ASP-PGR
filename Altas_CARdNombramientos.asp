<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->

<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_AUX  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdNombramientos"
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


  SQLNOM = "select * from CARdNombramientos WHERE Id_CARdDatosPersonales ="+CSTR(idPersona)
  Ob_AUX.OPEN SQLNOM, Ob_Conn,2, 3, 1
  IF Ob_AUX.EOF THEN
      CeroReg = TRUE
  END IF
  Ob_AUX.CLOSE
 
   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   XTipoNom= REQUEST("Id_CARcNombramiento_P")
  Id_CARcNombramiento= REQUEST("Id_CARcNombramiento_P")
  Id_CARcNombramiento_P= REQUEST("Id_CARcNombramiento_P")
'========== Combos
%>

<%'========= No tiene combos========= %>


<% '========== Inicia HTML %>

<style type="text/css" id="oStyle">
.styletest {
     background-color: white;
     color: blue;
	 disabled:disabled;
}
</style>
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
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">

<% IF XTipoNom = "" THEN %>  
   <% xNom_Disabled = "enabled" %>  
<% ELSE %>  
   <% xNom_Disabled = "disabled class='styletest'" %>  
        <input type="hidden" name="Agregar" value="S">
<% END IF %>  
      <INPUT TYPE="submit" VALUE="Enviar" NAME="B1"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 


  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Nombramientos</FONT>
    </H2>
  </CENTER>
<% 'usu = Session("UserLogin")
  'response.Write(session("UserLogin")&"p")
 ' IP_user = request.servervariables("remote_addr")
  ' response.Write(IP_user)
 '  response.end
   %>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
' response.write request.Form
'response.end	
	
   	   Ob_RS.Addnew 
        if request("CARdNombramientos")  <> "" then  Ob_RS("CARdNombramientos")=UCASE(request("CARdNombramientos")) end if
        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
        if request("Id_CARcTipoNombramiento")  = "" OR request("Id_CARcTipoNombramiento") = NULL then  Ob_RS("Id_CARcTipoNombramiento")= 0 end if
        if request("Id_CARcNombramiento")  <> "" then  Ob_RS("Id_CARcNombramiento")=request("Id_CARcNombramiento") end if
        if request("Id_CARcNombramiento")  = "" OR request("Id_CARcNombramiento") = NULL then  Ob_RS("Id_CARcNombramiento")= 0 end if
        if request("Id_CARcCategoria")  <> "" then  Ob_RS("Id_CARcCategoria")=request("Id_CARcCategoria") end if
        if request("Id_CARcCategoria")  = "" OR request("Id_CARcCategoria") = NULL then  Ob_RS("Id_CARcCategoria")= 0 end if
        if request("Id_CARcEspecialidad")  <> "" then  Ob_RS("Id_CARcEspecialidad")=request("Id_CARcEspecialidad") end if
        if request("Id_CARcEspecialidad")  = "" OR request("Id_CARcEspecialidad") = NULL then  Ob_RS("Id_CARcEspecialidad")= 0 end if
        if request("Adscripcion")  <> "" then  Ob_RS("Adscripcion")=UCASE(request("Adscripcion")) end if
        if request("NumeroGafete")  <> "" then  Ob_RS("NumeroGafete")=UCASE(request("NumeroGafete")) end if
        if request("Clavepago")  <> "" then  Ob_RS("Clavepago")=UCASE(request("Clavepago")) end if
        if request("Id_CARcNivel")  <> "" then  Ob_RS("Id_CARcNivel")=request("Id_CARcNivel") end if
        if request("Id_CARcNivel")  = "" OR request("Id_CARcNivel") = NULL then  Ob_RS("Id_CARcNivel")= 0 end if
        if request("Id_CARcSINO")  <> "" then  Ob_RS("Id_CARcSINO")=request("Id_CARcSINO") end if
        if request("Id_CARcSINO")  = "" OR request("Id_CARcSINO") = NULL then  Ob_RS("Id_CARcSINO")= 0 end if
'        if request("Id_CARcNombramientoMotivo")  <> "" then  Ob_RS("Id_CARcNombramientoMotivo")=request("Id_CARcNombramientoMotivo") end if
'====
       if request("Oficio_Peticion")  <> "" then  Ob_RS("Oficio_Peticion") = ucase(request("Oficio_Peticion")) end if
        if request("Fecha_OF_Peticion")  <> "" then Ob_RS("Fecha_OF_Peticion") =ucase(request("Fecha_OF_Peticion")) end if
        if request("AreaSolicitante")  <> "" then Ob_RS("AreaSolicitante") =ucase(request("AreaSolicitante")) end if
        if request("NombreSolicitante")  <> "" then Ob_RS("NombreSolicitante") =ucase(request("NombreSolicitante")) end if
        if request("Noacuerdo")  <> "" then Ob_RS("Noacuerdo") =ucase(request("Noacuerdo")) end if
        if request("FechaAcuerdo")  <> "" then Ob_RS("FechaAcuerdo") =ucase(request("FechaAcuerdo")) end if
        if request("FechaInicio")  <> "" then Ob_RS("FechaInicio") =ucase(request("FechaInicio")) end if
        if request("FechaTermino")  <> "" then Ob_RS("FechaTermino") =ucase(request("FechaTermino")) end if
        if request("NoSesion")  <> "" then Ob_RS("NoSesion") =ucase(request("NoSesion")) end if
        if request("FechaSesion")  <> "" then Ob_RS("FechaSesion") =ucase(request("FechaSesion")) end if 
'====		
		if request("Id_CARcTipo_ingreso") <> "" then Ob_RS("Id_CARcTipo_ingreso")=request("Id_CARcTipo_ingreso") end if
         if request("Id_CARcTipo_ingreso")  = "" OR request("Id_CARcTipo_ingreso") = NULL then  Ob_RS("Id_CARcTipo_ingreso")= 0 end if
       if REQUEST("Fecha_ingreso") <> "" then Ob_RS("Fecha_ingreso")=request("Fecha_ingreso") end if
		if REQUEST("Fecha_nombramiento") <> "" then Ob_RS("Fecha_nombramiento")=REQUEST("Fecha_nombramiento") end if
'		if REQUEST("Cargo") <> "" then Ob_RS("Cargo")=UCASE(REQUEST("Cargo")) end if
'		IF REQUEST("Nombramiento_historico") <> " " then Ob_RS("Nombramiento_historico")=REQUEST("Nombramiento_historico") end if
'		IF REQUEST("Id_CARcTipo_Designacion") <> " " THEN Ob_RS("Id_CARcTipo_Designacion")=REQUEST("Id_CARcTipo_Designacion") end if

		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		
'        Ob_RS("FechaCaptura")= date()
'        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
'response.write "idPersona"
'response.write idPersona
'response.end
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
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
  <%IF XTipoNom = "" THEN ' "EN BLANCO" %>
      <BR><BR>
       <% CALL sNombramiento %>
      <BR><BR>
  <%END IF%>
  <%IF XTipoNom = 1 THEN ' "ASPIRANTE" %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES%>
  <%END IF%>
  <%IF XTipoNom = 2  THEN '"CARRERA" %>
      <% CALL sNombramiento %>
      <% CALL sFECHA_NOMBRAMIENTO %>
      <% CALL sTIPO_INGRESO %>
      <% CALL sFECHA_INGRESO %>
      <% CALL SADSCRIPCION %>
      <% CALL sNO_GAFETE %>
      <% CALL sCLAVE_PAGO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
      <% CALL sCATEGORIA %>
      <% CALL sESPECIALIDAD %>
      <% CALL sNIVEL %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
      <% CALL sOBSERVACIONES %>
  <%END IF%>
  <%IF XTipoNom = 3 THEN ' "D ESPECIAL" %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
       <% CALL sCATEGORIA %>
       <% CALL sOficioPeticion %>
       <% CALL sFechaOfPeticion %>
       <% CALL sAreaSolicitante %>
       <% CALL sNombreSolicitante %>
       <% CALL sNoAcuerdo %>
       <% CALL sFechaAcuerdo %>
       <% CALL sFechaInicio %>
       <% CALL sFechaTermino %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES%>
  <%END IF%>
  <%IF XTipoNom = 4 OR  XTipoNom =5 THEN '"DELEGADO"  O SUBDELEGADO %>
       <% CALL sNombramiento %>
       <% CALL sFECHA_NOMBRAMIENTO %>
       <% CALL sTIPO_NOMBRAMIENTO %>
       <% CALL sNumeroSesion %>
       <% CALL sFechaSesion %>
       <% CALL sOficioPeticion %>
       <% CALL sFechaOfPeticion %>
       <% CALL sAreaSolicitante %>
       <% CALL sNombreSolicitante %>
       <% CALL sNoAcuerdo %>
       <% CALL sFechaAcuerdo %>
      <% CALL sNOMBRAMIENTO_ACTUAL %>
       <% CALL sOBSERVACIONES %>
  <%END IF%>
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
<INPUT TYPE="Hidden" NAME=Id_CARcNombramiento Value = <%= Id_CARcNombramiento%> >


<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
  <% Ob_Rs.CLOSE %>
  <%
    evita_duplicidad_ing = "Select Id_CARdNombramientos FROM CARdNombramientos WHERE Id_CARdDatosPersonales = "& idPersona &" AND Id_CARcTipo_ingreso = 1 "
     Ob_RS2.OPEN evita_duplicidad_ing, Ob_Conn, 3, 1 
		totderegistros_ing = Ob_RS2.RECORDCOUNT
	'	RESPONSE.WRITE totderegistros_m & "<--------"
   'RESPONSE.END 
   Ob_RS2.CLOSE	
  %>
  <%
fecha_nacimiento = "Select FechaNacimiento FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN fecha_nacimiento, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		FechaNacimiento = Ob_RS2("FechaNacimiento")
		anio = YEAR(FechaNacimiento)
		'RESPONSE.WRITE anio & "<--------"
        'RESPONSE.END 
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>
  <p ALIGN="center"> &nbsp; 
    <% IF XTipoNom = "" then  'en blanco %>
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" > &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp; 
    <% END IF %>
    <% IF XTipoNom = 1 then  'aSPIRANTES%>
    <input type="button" value="Guardar Registro" name="B12" onClick="ValidaCampos_ASP()">
    &nbsp;&nbsp;&nbsp; 
    <% END IF %>
    <% IF XTipoNom = 2 then 'sERVICIO DE Carrera%>
    <INPUT TYPE="button" VALUE="Guardar Registro" NAME="B1" onClick="ValidaCampos()">
    &nbsp;&nbsp;&nbsp; 
    <% END IF %>
    <% IF XTipoNom = 3 then %>
    <INPUT TYPE="button" VALUE="Guardar Registro" NAME="B1" onClick="ValidaCampos_DEsp()">
    &nbsp;&nbsp;&nbsp; 
    <% END IF %>
    <% IF XTipoNom = 4  OR  XTipoNom = 5 then%>
    <INPUT TYPE="button" VALUE="Guardar Registro" NAME="B1" onClick="ValidaCampos_DelSub()">
    &nbsp;&nbsp;&nbsp; 
    <% END IF %>
    <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2">
    &nbsp;&nbsp;&nbsp; </p>

   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>


<% SUB sNombramiento %>
   	 <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNombramiento_P' SIZE=1 <%=xNom_Disabled%> >
          <%IF Ob_RS2.EOF  THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN </OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcNombramiento")= CINT(Id_CARcNombramiento) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNombramiento")%>'> <%= Ob_RS2("CARcNombramiento")%>
                </OPTION>
             <%ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNombramiento")%>'> <%= Ob_RS2("CARcNombramiento")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%END SUB%>

<% SUB sFECHA_NOMBRAMIENTO %>
     <TR>
      <TD>
        <B>Fecha de nombramiento</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_nombramiento' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_nombramiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD> 
     </TR>
<%END SUB %>
<% SUB sTIPO_INGRESO %>
 	      <TR>
      <TD> 
	 <% IF CeroReg = TRUE THEN %>
         <B>Tipo de ingreso</B>
      <% ELSE %>
         <B>Motivo de ingreso</B>
     <% END IF 'CeroReg  %>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPO_INGRESO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipo_ingreso' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipo_ingreso")= CINT(Id_CARcTipo_ingreso) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>
				   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>                
				</OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
<%END SUB %>
<% SUB sFECHA_INGRESO %>
     <TR>
      <TD>
        <B>Fecha de ingreso</font> al servicio de carrera </B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_ingreso' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_ingreso')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>      </TD> 
     </TR>
<%END SUB %>

<% SUB SADSCRIPCION %>
	 <TR>
      <TD>
        <B>Adscripción</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Adscripcion' style="text-transform: uppercase" SIZE=80 MAXLENGTH=120 VALUE=<%= Adscripcion%>>
      </TD> </TR>
<%END SUB %>
<% SUB sNO_GAFETE %>
	 <TR>
      <TD>
        <B>Numero de Gafete</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumeroGafete' style="text-transform: uppercase" SIZE=20 MAXLENGTH=20 VALUE=<%= NumeroGafete%>>
      </TD> 
	  </TR>
<%END SUB %>
<% SUB sCLAVE_PAGO %>
	 <TR>
      <TD>
        <B>Clave de pago</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Clavepago' style="text-transform: uppercase"  SIZE=50 MAXLENGTH=50 VALUE=<%= Clavepago%>>
      </TD> 
	  </TR>
<%END SUB %>
<% SUB sTIPO_NOMBRAMIENTO %>
      <TR>
      <TD> 
         <B>Rama</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcTipoNombramiento' size=1 onChange='SeleCombo2("<%=XTipoNom%>")'>
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>
          <% Ob_RS2.CLOSE%>      </TD>
     </TR>
<%END SUB %>
<% SUB sCATEGORIA %>
     <TR>
      <TD> 
         <B>Categor&iacute;a</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCATEGORIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCategoria' SIZE=1 onchange='SeleCombo3("C")'>
	            <OPTION VALUE='0'>SELECCIONE</OPTION>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
<%END SUB %>
<% SUB sESPECIALIDAD %>
     <TR>
      <TD> 
         <B>Especialidad</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcEspecialidad" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEspecialidad' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcEspecialidad")= CINT(Id_CARcEspecialidad) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEspecialidad")%>'> <%= Ob_RS2("CARcEspecialidad")%>                
				</OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEspecialidad")%>'> <%= Ob_RS2("CARcEspecialidad")%>                
				</OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
<%END SUB %>
<% SUB sNIVEL %>
     <TR>
      <TD> 
         <B>Nivel</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNIVEL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNivel' SIZE=1 >
	            <OPTION VALUE='0'>SELECCIONE</OPTION>
        </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
      </TR>
<%END SUB %>

<% SUB sNOMBRAMIENTO_ACTUAL %>
    <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCSINO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>¿Nombramiento actual?</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcSINO' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcSINO")= CINT(Id_CARcSINO) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSINO")%>'> <%=UCASE(Ob_RS2("CARcSINO"))%>                   
				</OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcSINO")%>'> <%=UCASE(Ob_RS2("CARcSINO"))%>                
				</OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
<%END SUB %>

 <% SUB sOBSERVACIONES %>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdNombramientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdNombramientos%></TEXTAREA>
     </TD> </TR>
<%END SUB %>


 <% SUB sOficioPeticion %>
<TR>
      <TD>
        <B>Oficio de Petición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Oficio_Peticion' SIZE=50 MAXLENGTH=50 VALUE=<%= Oficio_Peticion%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaOfPeticion %>
     <TR>
      <TD>
        <B>Fecha Oficio Petición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_OF_Peticion' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= Fecha_OF_Peticion%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_OF_Peticion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sAreaSolicitante %>
     <TR>
      <TD>
        <B>Area Solicitante</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='AreaSolicitante' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaSolicitante%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNombreSolicitante %>
     <TR>
      <TD>
        <B>Nombre del Solicitante</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='NombreSolicitante' SIZE=50 MAXLENGTH=50 VALUE=<%= NombreSolicitante%>>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNoAcuerdo %>
     <TR>
      <TD>
        <B>Número de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Noacuerdo' SIZE=30 MAXLENGTH=30 VALUE=<%= Noacuerdo%>>
      </TD > 
     </TR>
<%END SUB %>

 <% SUB sFechaAcuerdo %>
     <TR>
      <TD>
        <B>Fecha de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAcuerdo' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaAcuerdo%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAcuerdo')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaInicio %>
     <TR>
      <TD>
        <B>Fecha de Inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormAltas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sFechaTermino %>
     <TR>
      <TD>
        <B>Fecha de Término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormAltas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>
 <% SUB sNumeroSesion %>
     <TR>
      <TD>
        <B>Número de Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='NoSesion' SIZE=30 MAXLENGTH=30 VALUE=<%= NoSesion%>>
      </TD > 
     </TR>
<%END SUB %>
<% SUB sFechaSesion %>
     <TR>
      <TD>
        <B>Fecha de Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaSesion' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaSesion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaSesion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>

<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{
<% IF CEROREG THEN %>
if (FormAltas.Fecha_ingreso.value != "" && !esFecha(FormAltas.Fecha_ingreso.value,'E'))
		{
		alert("El formato del campo -Fecha de Ingreso- debe ser de tipo: DD/MM/AAAA");
		return false;
		}

<%END IF%>



  var  totderegistros_ing = '<%= totderegistros_ing %>'


  if (FormAltas.Id_CARcTipo_ingreso.value  == 1)
  {	  
	 if (totderegistros_ing >= 1)
	  {
	  alert ("Para esta persona ya existe un registro de tipo de Ingreso, verifique por favor.");
	  return false;
	  }
  }  
		
		
		
/*if (FormAltas.Fecha_nombramiento.value != "" && !esFecha(FormAltas.Fecha_nombramiento.value,'E'))
		   {alert("El formato del campo -Fecha de Nombramiento- debe ser de tipo: DD/MM/AAAA ");
		   return false;}*/
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	if (FormAltas.Fecha_nombramiento.value != "")
  {
	  if (!esFecha(FormAltas.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaFiliacion.focus();
		return false;
	  }	
  }
  	   
  var FechaNacimiento = '<%= FechaNacimiento %>'
  var Fecha_nombramiento = FormAltas.Fecha_nombramiento.value
  
  
   FechaNacimiento = Date.parse(FechaNacimiento)
   Fecha_nombramiento = Date.parse(Fecha_nombramiento)
   
   if (Fecha_nombramiento<=FechaNacimiento)
     {
		alert("La fecha de nombramiento no puede ser menor a la fecha de nacimiento de la persona");
		FormAltas.Fecha_nombramiento.focus();
		return false;
	  }	
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/


		   
  if (FormAltas.Id_CARcTipoNombramiento.value  == 0)
  {
       alert("EL CAMPO: Rama , no puede estar vacio");
       return false;
  }
    
  if (FormAltas.Id_CARcSINO.value  == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_texto_correcto.test(FormAltas.Adscripcion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Adscripción, verifique por favor.');
	  	 FormAltas.Adscripcion.focus();
      	 return false;    
        }*/
		
		 if(jvi_numero_correcto.test(FormAltas.NumeroGafete.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de gafete, verifique por favor.');
	  	 FormAltas.NumeroGafete.focus();
      	 return false;    
        }
		
		 if(jvi_textoynumero_correcto.test(FormAltas.Clavepago.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Clave de pago, verifique por favor.');
	  	 FormAltas.Clavepago.focus();
      	 return false;    
        }
  
		/*if(jvi_textoynumero_correcto.test(FormAltas.CARdNombramientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdNombramientos.focus();
      	 return false;    
        }*/
		
     FormAltas.B1.disabled = true;  
     document.FormAltas.Id_CARcEspecialidad.disabled =false
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

  
}

function SeleCombo2(pTipoNom)
{
var xcont = 1 
var ycont = 0 

if (pTipoNom != 3) 
{
    document.FormAltas.Id_CARcNivel.length= 1; // resetea automaticamente el Tercer Combo 
}	// El siguiente Desabilita el campo Especialidad cuando es Agente del MP o AFI
//    if  (FormAltas.Id_CARcTipoNombramiento.value == 1 || FormAltas.Id_CARcTipoNombramiento.value == 2)
//	{ 
//	   document.FormAltas.Id_CARcEspecialidad.disabled =true;
//	   }
//	else
//	{
//	   document.FormAltas.Id_CARcEspecialidad.disabled =false;
//	}
if (pTipoNom != 3) 
{
		if  (document.FormAltas.Id_CARcTipoNombramiento.value == 3 || document.FormAltas.Id_CARcTipoNombramiento.value == 4)
		 {
           document.FormAltas.Id_CARcEspecialidad.disabled =false
		  }
		  else
		  {		  
	        document.FormAltas.Id_CARcEspecialidad.options[0].selected =true
			document.FormAltas.Id_CARcEspecialidad.disabled =true
		  }
}		  
//alert(pas)
		  
   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormAltas.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_CARcCategoria.length= xcont;
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormAltas.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcCategoria.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormAltas.Id_CARcCategoria.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_CARcCategoria.options[0].selected=true // Esta linea se agrega solo en Modificaciones



}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormAltas.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_CARcNivel.length= xcont;
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormAltas.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcNivel.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormAltas.Id_CARcNivel.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_CARcNivel.options[0].selected=true 

}

  /*=-=-=-=-=-=-=-=-=-==-=-=-=-=<>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
function ValidaCampos_ASP()
{

	if (FormAltas.Id_CARcNombramiento.value == 0)
	  {
		alert("El campo - Tipo de nombramiento no debe estar vacio");
		FormAltas.Id_CARcNombramiento.focus();
		return false;
	  }	

	if (FormAltas.Fecha_nombramiento.value != "")
      {
	  if (!esFecha(FormAltas.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormAltas.Fecha_nombramiento.focus();
		return false;
	  }	
      }
	  else
	  {
		alert("El campo - Fecha de nombramiento no debe estar vacio");
		FormAltas.Fecha_nombramiento.focus();
		return false;
	  }
  	   
  
  if (FormAltas.Id_CARcSINO.value == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }

  
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  /*=-=-=-=-=-=-=-=-=-==-=-=-=-=<>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  }
function ValidaCampos_DEsp()
{
  if (FormAltas.Id_CARcNombramiento.value == 0)
  {
       alert("EL CAMPO: Tipo Nombramiento  , no puede estar vacio");
       return false;
  }


	if (FormAltas.Fecha_nombramiento.value != "")
  {
	  if (!esFecha(FormAltas.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaFiliacion.focus();
		return false;
	  }	
  }

	if (FormAltas.Fecha_OF_Peticion.value != "")
  {
	  if (!esFecha(FormAltas.Fecha_OF_Peticion.value,'E'))
	  {
		alert("El campo - Fecha de Oficio Peticion- debe ser de tipo: DD/MM/AAAA");
		FormAltas.Fecha_OF_Peticion.focus();
		return false;
	  }	
  }
	if (FormAltas.FechaAcuerdo.value != "")
  {
	  if (!esFecha(FormAltas.FechaAcuerdo.value,'E'))
	  {
		alert("El campo - Fecha de Acuerdo- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaAcuerdo.focus();
		return false;
	  }	
  }
	if (FormAltas.FechaInicio.value != "")
  {
	  if (!esFecha(FormAltas.FechaInicio.value,'E'))
	  {
		alert("El campo - Fecha de Inicio- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaInicio.focus();
		return false;
	  }	
  }
	if (FormAltas.FechaTermino.value != "")
  {
	  if (!esFecha(FormAltas.FechaTermino.value,'E'))
	  {
		alert("El campo - Fecha de Término- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaTermino.focus();
		return false;
	  }	
  }
  
  if (FormAltas.Id_CARcSINO.value == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }

  
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}

function ValidaCampos_DelSub()
{
  if (FormAltas.Id_CARcNombramiento.value == 0)
    {
       alert("EL CAMPO: Tipo Nombramiento  , no puede estar vacio");
       return false;
    }

	if (FormAltas.Fecha_nombramiento.value != "")
      {
	     if (!esFecha(FormAltas.Fecha_nombramiento.value,'E'))
	      {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaFiliacion.focus();
		return false;
	      }	
      }

	if (FormAltas.Fecha_OF_Peticion.value != "")
     {
	  if (!esFecha(FormAltas.Fecha_OF_Peticion.value,'E'))
	  {
		alert("El campo - Fecha de Oficio Peticion- debe ser de tipo: DD/MM/AAAA");
		FormAltas.Fecha_OF_Peticion.focus();
		return false;
	  }	
     }
	if (FormAltas.FechaSesion.value != "")
     {
	  if (!esFecha(FormAltas.FechaSesion.value,'E'))
	  {
		alert("El campo - Fecha de Sesion- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaSesion.focus();
		return false;
	  }	
     }
  
	if (FormAltas.FechaAcuerdo.value != "")
     {
	  if (!esFecha(FormAltas.FechaAcuerdo.value,'E'))
	  {
		alert("El campo - Fecha de Acuerdo- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaAcuerdo.focus();
		return false;
	  }	
     }
  
  if (FormAltas.Id_CARcSINO.value == 0)
     {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
     }

  
     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}


</script>