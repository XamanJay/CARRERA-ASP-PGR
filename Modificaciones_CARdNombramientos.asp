<%' On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- Include File = "Seguridad/Perfil.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_AUX  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdNombramientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)
  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

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


   consulta = "SELECT * FROM CARdNombramientos WHERE Id_CARdNombramientos ="+CSTR(ParID) 
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
   CARdNombramientos= OB_RS("CARdNombramientos")
   Id_CARcTipoNombramiento= OB_RS("Id_CARcTipoNombramiento")
  Id_CARcNombramiento= OB_RS("Id_CARcNombramiento")
   Id_CARcCategoria= OB_RS("Id_CARcCategoria")

   Id_CARcSINO= OB_RS("Id_CARcSINO")
   Id_CARcNivel= OB_RS("Id_CARcNivel")
   Id_CARcEspecialidad= OB_RS("Id_CARcEspecialidad")
   Adscripcion = OB_RS("Adscripcion")
   NumeroGafete= OB_RS("NumeroGafete")
   Clavepago   = OB_RS("Clavepago")
'   Cargo   = OB_RS("Cargo")
'   Id_CARcNombramientoMotivo= OB_RS("Id_CARcNombramientoMotivo")
'   Id_CARcTipo_Designacion= OB_RS("Id_CARcTipo_Designacion")
   Id_CARcTipo_ingreso= OB_RS("Id_CARcTipo_ingreso")
   Fecha_ingreso= OB_RS("Fecha_ingreso")
   Fecha_nombramiento= OB_RS("Fecha_nombramiento")
'   Nombramiento_historico= OB_RS("Nombramiento_historico")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")

    Fecha_ingreso= OB_RS("Fecha_ingreso")
   Fecha_nombramiento= OB_RS("Fecha_nombramiento")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
		Oficio_Peticion=OB_RS("Oficio_Peticion") 
		Fecha_OF_Peticion=OB_RS("Fecha_OF_Peticion")
		AreaSolicitante=OB_RS("AreaSolicitante")
		NombreSolicitante=OB_RS("NombreSolicitante")
		Noacuerdo=OB_RS("Noacuerdo")  
		FechaAcuerdo=OB_RS("FechaAcuerdo") 
		FechaInicio=OB_RS("FechaInicio")  
		FechaTermino=OB_RS("FechaTermino") 
		NoSesion=OB_RS("NoSesion")  
		FechaSesion=OB_RS("FechaSesion")  

XTipoNom = Id_CARcNombramiento
'response.write ">>>"
'response.write XTipoNom
'========= No tiene combos ========= %>


<% '========== Inicia HTML %>
<style type="text/css" id="oStyle">
.styletest {
     background-color: white;
     color: blue;
	 disabled:disabled;
}
</style>

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdNombramientos.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Nombramientos  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Nombramientos  </FONT></h2>
     <p ALIGN="center"> &nbsp;
  <!--INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"--> &nbsp;&nbsp;&nbsp;

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
        consulta = "SELECT * FROM CARdNombramientos WHERE Id_CARdNombramientos ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdNombramientos")=ucase(request("CARdNombramientos")) 
        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
        if request("Id_CARcNombramiento")  <> "" then  Ob_RS("Id_CARcNombramiento")=request("Id_CARcNombramiento") end if
        if request("Id_CARcCategoria")  <> "" then  Ob_RS("Id_CARcCategoria")=request("Id_CARcCategoria") end if
        if request("Id_CARcNivel")  <> "" then  Ob_RS("Id_CARcNivel")=request("Id_CARcNivel") end if
'        if request("Id_CARcNombramientoMotivo")  <> "" then  Ob_RS("Id_CARcNombramientoMotivo")=request("Id_CARcNombramientoMotivo") end if
        if request("Id_CARcEspecialidad")  <> "" then  Ob_RS("Id_CARcEspecialidad")=request("Id_CARcEspecialidad") end if
        Ob_RS("Adscripcion")=ucase(request("Adscripcion")) 
        Ob_RS("NumeroGafete")=ucase(request("NumeroGafete")) 
        Ob_RS("Clavepago")=request("Clavepago") 
        if request("Id_CARcSINO")  <> "" then  Ob_RS("Id_CARcSINO")=request("Id_CARcSINO") end if

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
		if request("Id_CARcTipo_ingreso")  <> "" then  Ob_RS("Id_CARcTipo_ingreso")=request("Id_CARcTipo_ingreso") end if
       ' if request("Fecha_ingreso")  <> "" then  Ob_RS("Fecha_ingreso")=request("Fecha_ingreso") end if
		
IF request ("Fecha_ingreso") = "" then 
    Ob_RS("Fecha_ingreso")= NULL 
 ELSE
    Ob_RS("Fecha_ingreso")= request("Fecha_ingreso") 
 END IF 
'        if request("Fecha_nombramiento")  <> "" then  Ob_RS("Fecha_nombramiento")=request("Fecha_nombramiento") end if

IF request ("Fecha_nombramiento") = "" then 
    Ob_RS("Fecha_nombramiento")= NULL 
 ELSE
    Ob_RS("Fecha_nombramiento")= request("Fecha_nombramiento") 
 END IF 

'		if REQUEST("Cargo") <> "" then Ob_RS("Cargo")=ucase(REQUEST("Cargo")) end if
'        if request("Nombramiento_historico")  <> "" then  Ob_RS("Nombramiento_historico")=request("Nombramiento_historico") end if
'		IF REQUEST("Id_CARcTipo_Designacion") <> " " THEN Ob_RS("Id_CARcTipo_Designacion")=REQUEST("Id_CARcTipo_Designacion") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if


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
			  <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0' width="807">
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdNombramientos >
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
 
 
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
   <% IF XTipoNom = 1 then  'aSPIRANTES%>
      <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos_ASP()"> &nbsp;&nbsp;&nbsp;
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
   <% END IF %> 
   <% IF XTipoNom = 2 then 'sERVICIO DE Carrera%>
      <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
   <% END IF %> 
   <% IF XTipoNom = 3 then %>
      <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos_DEsp()"> &nbsp;&nbsp;&nbsp;
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
   <% END IF %> 
   <% IF XTipoNom = 4  OR  XTipoNom = 5 then%>
      <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos_DelSub()"> &nbsp;&nbsp;&nbsp;
      <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
   <% END IF %> 
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
<% SUB sNombramiento %>
      <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNombramiento" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNombramiento' SIZE=1 disabled class='styletest'>
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
     <%If CINT(Id_CARcTipoNombramiento) = 1 or CINT(Id_CARcTipoNombramiento) = 2 Then%>
     	<script>
     		document.FormEdita.Id_CARcEspecialidad.disabled =true
     	</script>
     <%End If%>
<%END SUB%>

<% SUB sFECHA_NOMBRAMIENTO %>

     <TR> 
      <TD> <B>Fecha de nombramiento<BR></font>
        </B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Fecha_nombramiento' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento%> >
          <IMG ONCLICK="window_open('FormEdita','Fecha_nombramiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
          <BR>
          <BR>
      </TD >
    </TR>
<%END SUB %>
<% SUB sTIPO_INGRESO %>

    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCTIPO_INGRESO" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Tipo de ingreso</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcTipo_ingreso' SIZE=1 >
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcTipo_ingreso")= CINT(Id_CARcTipo_ingreso) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= UCASE(Ob_RS2("CARcTipo_ingreso"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= UCASE(Ob_RS2("CARcTipo_ingreso"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sFECHA_INGRESO %>
    <TR> 
      <TD> <B>Fecha de ingreso al servicio de carrera</B></TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Fecha_ingreso' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso%> >
          <IMG ONCLICK="window_open('FormEdita','Fecha_ingreso')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'> 
          <BR>
          <BR>
      </TD >
    </TR>
<%END SUB %>

<% SUB SADSCRIPCION %>
    <TR> 
      <TD> <B>Adscripción</font></B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Adscripcion' style="text-transform: uppercase"  SIZE=80 MAXLENGTH=120 VALUE='<%= Adscripcion%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sNO_GAFETE %>
    <TR> 
      <TD> <B>Número de gafete</B></TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='NumeroGafete' style="text-transform: uppercase"  SIZE=20 MAXLENGTH=20 VALUE='<%= Trim(NumeroGafete)%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sCLAVE_PAGO %>
    <TR> 
      <TD> <B>Clave de pago</font> </B> </TD>
      <TD> <P ALIGN='left'> 
          <INPUT TYPE='TEXT' NAME='Clavepago' style="text-transform: uppercase" SIZE=50 MAXLENGTH=50 VALUE='<%= Trim(Clavepago)%>'>
      </TD >
    </TR>
<%END SUB %>
<% SUB sTIPO_NOMBRAMIENTO %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Rama</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 onchange='SeleCombo2("C")' disabled class='styletest'>
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
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
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sCATEGORIA %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCCATEGORIA WHERE Id_CARcTipoNombramiento = " +CSTR(Id_CARcTipoNombramiento) %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Categor&iacute;a</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcCategoria' SIZE=1 onchange='SeleCombo3("C")' disabled class='styletest'>
          <OPTION VALUE='0'>SELECCIONAR</OPTION>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcCategoria")= CINT(Id_CARcCategoria) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= UCASE(Ob_RS2("CARcCategoria"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= UCASE(Ob_RS2("CARcCategoria"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>
<% SUB sESPECIALIDAD %>
    <TR> 
      <TD> <B>Especialidad</B></TD>
      <TD> 
        <%Sql ="SELECT * FROM CARcEspecialidad" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <SELECT NAME='Id_CARcEspecialidad' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <% IF Ob_RS2("Id_CARcEspecialidad")= CINT(Id_CARcEspecialidad) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEspecialidad")%>'> <%= UCASE(Ob_RS2("CARcEspecialidad"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcEspecialidad")%>'> <%= UCASE(Ob_RS2("CARcEspecialidad"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </SELECT> 
        <% Ob_RS2.CLOSE%>
      </TD>
    </TR>
<%END SUB %>
<% SUB sNIVEL %>
   <%If CINT(Id_CARcTipoNombramiento) = 1 or CINT(Id_CARcTipoNombramiento) = 2 Then%>
    <script>
     		document.FormEdita.Id_CARcEspecialidad.disabled =true
     	</script>
    <%End If%>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCNIVEL where Id_CARcCategoria="+CSTR(Id_CARcCategoria) %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>Nivel</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcNivel' SIZE=1 >
          <%IF Ob_RS2.Eof THEN %>
          <OPTION VALUE='0'>SELECCIONAR</OPTION>
          <%ELSE%>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcNivel")= CINT(Id_CARcNivel) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= UCASE(Ob_RS2("CARcNivel"))%> 
          </OPTION>
          <%ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= UCASE(Ob_RS2("CARcNivel"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
          <%END IF%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>

<% SUB sNOMBRAMIENTO_ACTUAL %>
    <TR> 
      <TD> 
        <%Sql ="SELECT * FROM CARCSINO "%>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <B>&iquest;Nombramiento actual?</B><BR> </TD>
      <TD> <SELECT NAME='Id_CARcSINO' SIZE=1 >
          <%IF Ob_RS2.Eof THEN %>
          <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcSINO")= CINT(Id_CARcSINO) THEN %>
          <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSINO")%>'> <%= UCASE(Ob_RS2("CARcSINO"))%> 
          </OPTION>
          <% ELSE  %>
          <OPTION VALUE='<%=Ob_RS2("Id_CARcSINO")%>'> <%= UCASE(Ob_RS2("CARcSINO"))%> 
          </OPTION>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
          <%END IF%>
        </SELECT> </TD>
      <% Ob_RS2.CLOSE%>
    </TR>
<%END SUB %>

 <% SUB sOBSERVACIONES %>
   <TR> 
      <TD> <B>Observaciones<BR></font>
        </B> </TD>
      <TD> <P ALIGN='left'> 
          <TEXTAREA NAME='CARdNombramientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdNombramientos%></TEXTAREA>
      </TD >
    </TR>
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
       <IMG ONCLICK="window_open('FormEdita','Fecha_OF_Peticion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
       <IMG ONCLICK="window_open('FormEdita','FechaAcuerdo')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
       <IMG ONCLICK="window_open('FormEdita','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
       <IMG ONCLICK="window_open('FormEdita','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
       <IMG ONCLICK="window_open('FormEdita','FechaSesion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%END SUB %>

<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->


<script Language="JavaScript"> 
function ValidaCampos()
{
	if (FormEdita.Id_CARcNombramiento.value == 0)
	  {
		alert("El campo - Tipo de nombramiento no debe estar vacio");
		FormEdita.Id_CARcNombramiento.focus();
		return false;
	  }	

if (FormEdita.Fecha_ingreso.value != "")
  {
	  if (!esFecha(FormEdita.Fecha_ingreso.value,'E'))
	  {
		alert("El campo - Fecha_ingreso- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_ingreso.focus();
		return false;
	  }	
  }
		
		var  totderegistros_ing = '<%= totderegistros_ing %>'


  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	if (FormEdita.Fecha_nombramiento.value != "")
      {
	  if (!esFecha(FormEdita.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_nombramiento.focus();
		return false;
	  }	
      }
	 else
	  {
		alert("El campo - Fecha de nombramiento no debe estar vacio");
		FormEdita.Fecha_nombramiento.focus();
		return false;
	  }

  	   
  var FechaNacimiento = '<%= FechaNacimiento %>'
  var Fecha_nombramiento = FormEdita.Fecha_nombramiento.value
  
  
   FechaNacimiento = Date.parse(FechaNacimiento)
   Fecha_nombramiento = Date.parse(Fecha_nombramiento)
   if (Fecha_nombramiento<=FechaNacimiento)
     {
		alert("La fecha de nombramiento no puede ser menor a la fecha de nacimiento de la persona");
		FormEdita.Fecha_nombramiento.focus();
		return false;
	  }	
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  
  if (FormEdita.Id_CARcSINO.value == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_texto_correcto.test(FormEdita.Adscripcion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Adscripción, verifique por favor.');
	  	 FormEdita.Adscripcion.focus();
      	 return false;    
        }*/
		
		 if(jvi_numero_correcto.test(FormEdita.NumeroGafete.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de gafete, verifique por favor.');
	  	 FormEdita.NumeroGafete.focus();
      	 return false;    
        }
		
		 if(jvi_textoynumero_correcto.test(FormEdita.Clavepago.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Clave de pago, verifique por favor.');
	  	 FormEdita.Clavepago.focus();
      	 return false;    
        }
		
		/*if(jvi_textoynumero_correcto.test(FormEdita.CARdNombramientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdNombramientos.focus();
      	 return false;    
        }*/
  
     FormEdita.B1.disabled = true;  
     document.FormEdita.Id_CARcEspecialidad.disabled =false
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}

function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    document.FormEdita.Id_CARcNivel.length= 1; // resetea automaticamente el Tercer Combo 
	// El siguiente IF Desabilita el campo Especialidad cuando es Agente del MP o AFI
//    if  (FormEdita.Id_CARcTipoNombramiento.value == 1 || FormEdita.Id_CARcTipoNombramiento.value == 2)
//	{ 
//	   document.FormEdita.Id_CARcEspecialidad.disabled =true;
//	   }
//	else
//	{
//	   document.FormEdita.Id_CARcEspecialidad.disabled =false;
//	}
		if  (document.FormEdita.Id_CARcTipoNombramiento.value == 3 || document.FormEdita.Id_CARcTipoNombramiento.value == 4)
		 {
           document.FormEdita.Id_CARcEspecialidad.disabled =false
		  }
		  else
		  {		  
	        document.FormEdita.Id_CARcEspecialidad.options[0].selected =true
			document.FormEdita.Id_CARcEspecialidad.disabled =true
		  }

   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormEdita.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormEdita.Id_CARcCategoria.length= xcont;
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormEdita.Id_CARcTipoNombramiento.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormEdita.Id_CARcCategoria.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormEdita.Id_CARcCategoria.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  document.FormEdita.Id_CARcCategoria.options[0].selected=true // Esta linea se agrega solo en Modificaciones


}

function SeleCombo3(pas)
{
//  alert("2")
var xcont = 1 
var ycont = 0 
  
   <% FOR I = 0 to regs_Combo3 %>
	    if  (document.FormEdita.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormEdita.Id_CARcNivel.length= xcont;
    <% FOR I = 0 to regs_Combo3 %>
        if  (document.FormEdita.Id_CARcCategoria.value == <%= tbl_Combo3(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormEdita.Id_CARcNivel.options[ycont].text='<%= tbl_Combo3(1,I) %>'
          document.FormEdita.Id_CARcNivel.options[ycont].value='<%= tbl_Combo3(0,I) %>'
		  }
   <%  next    %>   
  document.FormEdita.Id_CARcNivel.options[0].selected=true 

}

  /*=-=-=-=-=-=-=-=-=-==-=-=-=-=<>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
function ValidaCampos_ASP()
{

	if (FormEdita.Id_CARcNombramiento.value == 0)
	  {
		alert("El campo - Tipo de nombramiento no debe estar vacio");
		FormEdita.Id_CARcNombramiento.focus();
		return false;
	  }	

	if (FormEdita.Fecha_nombramiento.value != "")
      {
	  if (!esFecha(FormEdita.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_nombramiento.focus();
		return false;
	  }	
      }
	  else
	  {
		alert("El campo - Fecha de nombramiento no debe estar vacio");
		FormEdita.Fecha_nombramiento.focus();
		return false;
	  }
  	   
  
  if (FormEdita.Id_CARcSINO.value == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }

  
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  /*=-=-=-=-=-=-=-=-=-==-=-=-=-=<>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  }
function ValidaCampos_DEsp()
{
  if (FormEdita.Id_CARcNombramiento.value == 0)
  {
       alert("EL CAMPO: Tipo Nombramiento  , no puede estar vacio");
       return false;
  }


	if (FormEdita.Fecha_nombramiento.value != "")
  {
	  if (!esFecha(FormEdita.Fecha_nombramiento.value,'E'))
	  {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaFiliacion.focus();
		return false;
	  }	
  }

	if (FormEdita.Fecha_OF_Peticion.value != "")
  {
	  if (!esFecha(FormEdita.Fecha_OF_Peticion.value,'E'))
	  {
		alert("El campo - Fecha de Oficio Peticion- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_OF_Peticion.focus();
		return false;
	  }	
  }
	if (FormEdita.FechaAcuerdo.value != "")
  {
	  if (!esFecha(FormEdita.FechaAcuerdo.value,'E'))
	  {
		alert("El campo - Fecha de Acuerdo- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaAcuerdo.focus();
		return false;
	  }	
  }
	if (FormEdita.FechaInicio.value != "")
  {
	  if (!esFecha(FormEdita.FechaInicio.value,'E'))
	  {
		alert("El campo - Fecha de Inicio- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaInicio.focus();
		return false;
	  }	
  }
	if (FormEdita.FechaTermino.value != "")
  {
	  if (!esFecha(FormEdita.FechaTermino.value,'E'))
	  {
		alert("El campo - Fecha de Término- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaTermino.focus();
		return false;
	  }	
  }
  
  if (FormEdita.Id_CARcSINO.value == 0)
  {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
  }

  
     FormEdita.B1.disabled = true;  
     document.FormEdita.Id_CARcEspecialidad.disabled =false
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}

function ValidaCampos_DelSub()
{
  if (FormEdita.Id_CARcNombramiento.value == 0)
    {
       alert("EL CAMPO: Tipo Nombramiento  , no puede estar vacio");
       return false;
    }

	if (FormEdita.Fecha_nombramiento.value != "")
      {
	     if (!esFecha(FormEdita.Fecha_nombramiento.value,'E'))
	      {
		alert("El campo - Fecha de nombramiento- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaFiliacion.focus();
		return false;
	      }	
      }

	if (FormEdita.Fecha_OF_Peticion.value != "")
     {
	  if (!esFecha(FormEdita.Fecha_OF_Peticion.value,'E'))
	  {
		alert("El campo - Fecha de Oficio Peticion- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_OF_Peticion.focus();
		return false;
	  }	
     }
	if (FormEdita.FechaSesion.value != "")
     {
	  if (!esFecha(FormEdita.FechaSesion.value,'E'))
	  {
		alert("El campo - Fecha de Sesion- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaSesion.focus();
		return false;
	  }	
     }
  
	if (FormEdita.FechaAcuerdo.value != "")
     {
	  if (!esFecha(FormEdita.FechaAcuerdo.value,'E'))
	  {
		alert("El campo - Fecha de Acuerdo- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaAcuerdo.focus();
		return false;
	  }	
     }
  
  if (FormEdita.Id_CARcSINO.value == 0)
     {
       alert("EL CAMPO: Actual ? , no puede estar vacio");
       return false;
     }

  
     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}

</script>
