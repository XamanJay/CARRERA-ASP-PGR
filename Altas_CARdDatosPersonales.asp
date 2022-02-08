<%' On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!--#INCLUDE FILE="ADOVBS.INC"-->
<!--#include file="DSUpload.inc"-->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")
   Carpeta = "IMAGENES"
   Session("CarreraDocs")= "FotosCarrera"
   v_Tabla = "CARdDatosPersonales"
   v_Tabla = UCase(TRIM(v_TABLA))
   v_ODBC  = SESSION("ODBC")
   ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
   pos = InStrRev(ruta, "\") +1 
   Nombre_Archivo_Original = MID(ruta, pos)

  if (Session("Contador")<>0) then
	 b= Session("Elementos")(Session("Contador"))
  end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT
   
   ruta_img_calendario="Calendario.gif"
   ruta_btn_Altas="btn_Altas.gif"
   ruta_btn_Bajas="btn_Bajas.gif"
   ruta_btn_Consultas="btn_Consultas.gif"
   ruta_btn_Modificaciones="btn_Modificaciones.gif" 
'========== Combos
%>

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
  <FORM METHOD="post" ACTION= "AltasOPR_CARdDatosPersonales.asp" NAME= "FormAltas" encType="multipart/form-data">
  <input type="hidden" name="Agregar" value="S">  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Datos Personales</FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()">&nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then
'==============================
''on error resume next

'check if there is an error, if so then inform user of error. 
''private sub CheckErr
''	if Err <> 0 then
		' Display error message
''		Response.Write "<P style='BACKGROUND-COLOR: #a52a2a'><FONT color=#ffffff>"
''		Response.Write "&nbsp;&nbsp;" & "ERROR:  " & Err.description & "</FONT></P>"
''		' Clear error
''		Err.Clear
''	end if
''end sub
'create upload component instance
''set objUpload = Server.CreateObject("Dundas.Upload")

	'initialize the root & temp folders names
	'Direc = Request.ServerVariables("APPL_PHYSICAL_PATH")

	'RootFolderName = Request.ServerVariables("APPL_PHYSICAL_PATH") + "ArchivosAcuerdos\"
	'RootFolderName = Direc + "_PRUEBA_Documentacion\"

''	RootFolderName = "D:\AppsDesa\COPLADII\CarreraPGR\Desarrollo\Datos\"
'	RootFolderName = "D:\AppsDesa\COPLADII\"+ session("odbc") +"\Desarrollo\Datos\"
''	TempFolderName = RootFolderName & objUpload.GetUniqueName
'	response.write TempFolderName

	'don't use unique file names in the beginning
''	objUpload.UseUniqueNames = false

	'upload data till first uploaded file is encountered
''	set NextFile = objUpload.GetNextFile	
''	call CheckErr
'response.write "hola3"
'response.end

	'set the various properties specified by the user
''	if IsEmpty(objUpload.Form("UniqueNames")) then
''		objUpload.UseUniqueNames = false
''	else
		'if "unique file names" are selected set the flag
''		objUpload.UseUniqueNames = true

		'change the NextFile object's name to be unique 
''		if not(NextFile is nothing) then	
''			NextFile.FileName = objUpload.GetUniqueName & "_" &	NextFile.FileName			
''		end if
''	end if 

'-------------------------------------------------------------------------------------------------------------------------
''Nombre_Archivo_Original = NextFile.FileName
'pos = InStrRev(Nombre_Archivo_Original, ".") +1
'Ext = MID(Nombre_Archivo_Original, pos)
'Nombre_Archivo = MID(Nombre_Archivo_Original, 1, pos-2) 
'&"_"&DAY(DATE)&"_"&MONTH(DATE)&"_"&YEAR(DATE)&"_"&HOUR(TIME)&"_"&MINUTE(TIME)&"_"&SECOND(TIME)&"."&Ext


''NextFile.FileName = Nombre_Archivo_Original
'-------------------------------------------------------------------------------------------------------------------------


	'set the temp. folder name
''	if not(IsEmpty(objUpload.Form("FolderName"))) then
''		TempFolderName = RootFolderName & objUpload.Form.Item("FolderName")
''	end if 
	'create temp folder
'	RESPONSE.WRITE TempFolderName
''	objUpload.DirectoryCreate TempFolderName
''	call CheckErr
	
	'upload the rest of the files one by one
''	do until NextFile is nothing
		'save file into the temp. folder
''		NextFile.Save TempFolderName
	
		'get Nextfile object
''		set NextFile = nothing
''		set NextFile = objUpload.GetNextFile

		'exit the loop in case of error	
''		if Err <> 0 then
''			call CheckErr
''''			exit do
''		end if
''	loop
	
''	var_pstabla = "CARDDATOSPERSONALES"
''	var_psODBC = "CarreraPGR"
''	var_pagina_catalogo = objUpload.Form("catalogo")


' Ob_Rs.Open Sql, Ob_Conn

''idArea = objUpload.Form("Par_idArea")

''Path = "https://"+SESSION("IP_SERVER")+"/"+session("CarreraDocs")+"/" + Nombre_Archivo_Original

''Set objUpload = nothing

'=============================	   
    	Ob_RS.Addnew 
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("RFC")  <> "" then  Ob_RS("RFC")=request("RFC") end if
        if request("ApellidoPaterno")  <> "" then  Ob_RS("ApellidoPaterno")=request("ApellidoPaterno") end if
        if request("ApellidoMaterno")  <> "" then  Ob_RS("ApellidoMaterno")=request("ApellidoMaterno") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=request("Nombre") end if
        if request("Id_CARcEntidadFederativa")  <> "" then  
			Ob_RS("Id_CARcEntidadFederativa")=request("Id_CARcEntidadFederativa") 		
		end if
        if request("FechaNacimiento")  <> "" then  Ob_RS("FechaNacimiento")=request("FechaNacimiento") end if
        if request("Id_CarcEdoCivil")  <> "" then  Ob_RS("Id_CarcEdoCivil")=request("Id_CarcEdoCivil") end if
        if request("Id_CARcGenero")  <> "" then  Ob_RS("Id_CARcGenero")=request("Id_CARcGenero") end if
        if request("CURP")  <> "" then  Ob_RS("CURP")=request("CURP") end if
        if request("CartillaSMN")  <> "" then  Ob_RS("CartillaSMN")=request("CartillaSMN") end if
        if request("ClaveElector")  <> "" then  Ob_RS("ClaveElector")=request("ClaveElector") end if
        if request("Foto")  <> "" then  Ob_RS("Foto")=path end if
        if request("NoFiliacion")  <> "" then  Ob_RS("NoFiliacion")=request("NoFiliacion") end if
        if request("FechaFiliacion")  <> "" then  Ob_RS("FechaFiliacion")=request("FechaFiliacion") end if
        if request("DependenciaFiliacion")  <> "" then  Ob_RS("DependenciaFiliacion")=request("DependenciaFiliacion") end if
        if request("Autorizador")  <> "" then  Ob_RS("Autorizador")=request("Autorizador") end if
        if request("Fecha_IngresoPGR")  <> "" then  Ob_RS("Fecha_IngresoPGR")=request("Fecha_IngresoPGR") end if		
        if request("PaisNacimiento")  <> "" then  Ob_RS("PaisNacimiento")=request("PaisNacimiento") end if
        if request("MunicipiooDel")  <> "" then  Ob_RS("MunicipiooDel")=request("MunicipiooDel") end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=request("Ciudad") end if
        if request("Nacionalidad")  <> "" then  Ob_RS("Nacionalidad")=request("Nacionalidad") end if
        if request("Licencia")  <> "" then  Ob_RS("Licencia")=request("Licencia") end if
        if request("CARdDatosPersonales")  <> "" then  Ob_RS("CARdDatosPersonales")=request("CARdDatosPersonales") end if
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
		%>
		<!-- #INCLUDE File="errror.inc" -->
	     <%  response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
 '       response.end
     end if
	 
	 RFC = REQUEST("RFC")
	 
    %>
	
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>RFC</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='RFC' SIZE=15 MAXLENGTH=15 disabled VALUE=<%= RFC%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Apellido paterno</font>	</B>
      </TD>
      <TD>
	   <%   ApellidoPaterno = MID(RFC,1,2) %>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoPaterno' style="text-transform: uppercase" SIZE=50 MAXLENGTH=100 onChange="return ValCaracteres()"  VALUE=<%= ApellidoPaterno%>>
      </TD > 
     </TR>
     <TR>
      <TD>
	  <%  ApellidoMaterno = MID(RFC,3,1) %>
        <B>Apellido materno</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoMaterno' style="text-transform: uppercase" SIZE=50 MAXLENGTH=100 VALUE=<%= ApellidoMaterno%>>
      </TD > 
     </TR>
     <TR>
      <TD>
	    <%   Nombre = MID(RFC,4,1) %>
        <B>Nombre(s)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre' SIZE=50 style="text-transform: uppercase" MAXLENGTH=150 VALUE=<%= Nombre%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Pa&iacute;s de nacimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='PaisNacimiento' SIZE=30 style="text-transform: uppercase" MAXLENGTH=30 VALUE=<%= PaisNacimiento%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Entidad de nacimiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY Id_CARcEntidadFederativa" %>
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
        <B>Ciudad	</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Ciudad' SIZE=50 style="text-transform: uppercase" MAXLENGTH=50 VALUE=<%= Ciudad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='MunicipiooDel' SIZE=50 style="text-transform: uppercase" MAXLENGTH=150 VALUE=<%= MunicipioODel%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nacionalidad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nacionalidad' SIZE=30 style="text-transform: uppercase" MAXLENGTH=30 VALUE=<%= Nacionalidad%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de nacimiento</font>	</B>
      </TD>
      <TD>
	  
	  <%  
	  DIM RFC, ANIO, MES, DIA
	  DIM FECHA_DE_NACIMIENTO
	  R_F_C = REQUEST.FORM("RFC")
	 ' RESPONSE.WRITE R_F_C & "<----> "
	  
	  'FECHA_DE_NACIMIENTO = RIGHT(R_F_C,6)
	  ANIO = MID(R_F_C,5,2)
	  MES = MID(R_F_C,7,2)
	  DIA = MID(R_F_C,9,2)
	  
	  FECHA_DE_NACIMIENTO = DIA&"/"&MES&"/19"&ANIO
	  FECHA_DE_NACIMIENTO = TRIM(FECHA_DE_NACIMIENTO)
	  
	  
 
	 'FECHA_DE_NACIMIENTO = FECHA_DE_NACIMIENTO
	' RESPONSE.WRITE FECHA_DE_NACIMIENTO & "<----"
	 'RESPONSE
	  %>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaNacimiento' SIZE=10  MAXLENGTH=16 readonly="true"  VALUE=<%= FECHA_DE_NACIMIENTO%> >
<!--       <IMG ONCLICK="window_open('FormAltas','FechaNacimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
-->      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estado civil</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCEDOCIVIL ORDER BY Id_CARcEdoCivil" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CarcEdoCivil' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CarcEdoCivil")= CINT(Id_CarcEdoCivil) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CarcEdoCivil")%>'> <%= Ob_RS2("CarcEdoCivil")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CarcEdoCivil")%>'> <%= Ob_RS2("CarcEdoCivil")%>
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
         <B>Género</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCGENERO ORDER BY Id_CARcGenero" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcGenero' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcGenero")= CINT(Id_CARcGenero) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcGenero")%>'> <%= Ob_RS2("CARcGenero")%>
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
        <B>CURP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
	   <%CURP = REQUEST.FORM("RFC")  %>
       <INPUT TYPE='TEXT' NAME='CURP' SIZE=40 style="text-transform: uppercase" MAXLENGTH=30 VALUE=<%= CURP%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de cartilla del SMN</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CartillaSMN' SIZE=30 style="text-transform: uppercase" MAXLENGTH=30 VALUE=<%= CartillaSMN%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Clave de elector</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ClaveElector' SIZE=40 style="text-transform: uppercase" MAXLENGTH=30 VALUE=<%= ClaveElector%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Licencia de conducir</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Licencia' SIZE=40 style="text-transform: uppercase" MAXLENGTH=50 VALUE=<%= Licencia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CUIP' SIZE=40 style="text-transform: uppercase" MAXLENGTH=50 VALUE=<%= Licencia%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Foto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <!--INPUT TYPE="TEXT" NAME='Foto' SIZE=50 VALUE=<%= Foto%>-->
        <INPUT TYPE = "Hidden" Name ="FolderName" Value = "<%=Carpeta%>">
        <input NAME="File1" TYPE="file" size="20">
     </TD > 
     </TR>
       <TR>
      <TD>
        <B>Fecha ingreso PGR</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_IngresoPGR' style="text-transform: uppercase" SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_IngresoPGR%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_IngresoPGR')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
   <TR>
      <TD>
        <B>Número de filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoFiliacion' SIZE=20 MAXLENGTH=20 VALUE=<%= NoFiliacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaFiliacion' style="text-transform: uppercase" SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFiliacion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaFiliacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Dependencia federal que realizo la filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='DependenciaFiliacion' SIZE=10 style="text-transform: uppercase" ROWS=5 COLS=35><%=DependenciaFiliacion%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdDatosPersonales' SIZE=10  style="text-transform: uppercase" ROWS=5 COLS=35><%=CARdDatosPersonales%></TEXTAREA>
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
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%= idMaestro%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
<INPUT TYPE="Hidden" NAME=Carrera Value = 1 >


  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE='Hidden' NAME='RFC' VALUE=<%= RFC%>>
 </p>

   </CENTER>
  </FORM>



  <% Ob_Rs.CLOSE %>
  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{
 if (FormAltas.RFC.value  == "")
  {
       alert("EL CAMPO: RFC, no puede estar vacio");
	   return false;
  }  
  if (FormAltas.ApellidoPaterno.value  == "")
  {
       alert("EL CAMPO: Apellido paterno, no puede estar vacio");
	   FormAltas.ApellidoPaterno.focus();
       return false;
  }
   if (FormAltas.ApellidoMaterno.value  == "")
  {
       alert("EL CAMPO: Apellido materno, no puede estar vacio");
	   FormAltas.ApellidoMaterno.focus();
       return false;
  } 
  if (FormAltas.Nombre.value  == "")
  {
       alert("EL CAMPO: Nombre(s), no puede estar vacio");
	    FormAltas.Nombre.focus();
       return false;
  }
  
  
  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        if(jvi_texto_correcto.test(FormAltas.ApellidoPaterno.value)) {
       alert('Ha escrito un caracter no valido en el campo Apellido paterno, verifique por favor.');
	   FormAltas.ApellidoPaterno.focus();
       return false;    
    }
	
	 if(jvi_texto_correcto.test(FormAltas.ApellidoMaterno.value)) {
       alert('Ha escrito un caracter no valido en el campo Apellido materno, verifique por favor.');
	   FormAltas.ApellidoMaterno.focus();
       return false;    
    }
	
	
	 if(jvi_texto_correcto.test(FormAltas.Nombre.value)) {
       alert('Ha escrito un caracter no valido en el campo Nombre, verifique por favor.');
	    FormAltas.Nombre.focus();
       return false;   
    }

   
   
   
   
   
   if(jvi_texto_correcto.test(FormAltas.PaisNacimiento.value)) {
       alert('Ha escrito un caracter no valido en el campo Pais de nacimiento, verifique por favor.');
	    FormAltas.PaisNacimiento.focus();
       return false;   
    }
   
   
   
    /*if(jvi_texto_correcto.test(FormAltas.Ciudad.value)) {
       alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	    FormAltas.Ciudad.focus();
       return false;   
    }*/
	
	 /*if(jvi_texto_correcto.test(FormAltas.MunicipiooDel.value)) {
       alert('Ha escrito un caracter no valido en el campo Municipio o Del., verifique por favor.');
	    FormAltas.MunicipiooDel.focus();
       return false;   
    }*/
   
    /*if(jvi_texto_correcto.test(FormAltas.Nacionalidad.value)) {
       alert('Ha escrito un caracter no valido en el campo Nacionalidad, verifique por favor.');
	    FormAltas.Nacionalidad.focus();
       return false;   
    }*/
   
    
	
	/*if(jvi_textoynumero_correcto.test(FormAltas.CURP.value)) {
       alert('Ha escrito un caracter no valido en el campo CURP, verifique por favor.');
	    FormAltas.CURP.focus();
       return false;   
    }*/
   
   /*if(jvi_numero_correcto.test(FormAltas.CartillaSMN.value)) {
       alert('Ha escrito un caracter no valido en el campo Número de cartilla del SMN, verifique por favor.');
	    FormAltas.CartillaSMN.focus();
       return false;   
    }*/
  
   
   
    /*if(jvi_textoynumero_correcto.test(FormAltas.ClaveElector.value)) {
       alert('Ha escrito un caracter no valido en el campo Clave de elector , verifique por favor.');
	    FormAltas.ClaveElector.focus();
       return false;   
    }*/

   /*if(jvi_textoynumero_correcto.test(FormAltas.Licencia.value)) {
       alert('Ha escrito un caracter no valido en el campo Licencia, verifique por favor.');
	    FormAltas.Licencia.focus();
       return false;   
    }*/

   /*if(jvi_textoynumero_correcto.test(FormAltas.NoFiliacion.value)) {
       alert('Ha escrito un caracter no valido en el campo No. de filiacion, verifique por favor.');
	    FormAltas.NoFiliacion.focus();
       return false;   
    }*/

    /*if(jvi_texto_correcto.test(FormAltas.DependenciaFiliacion.value)) {
       alert('Ha escrito un caracter no valido en el campo Dependencia, verifique por favor.');
	    FormAltas.DependenciaFiliacion.focus();
       return false;   
    }*/

   
   /*if(jvi_textoynumero_correcto.test(FormAltas.CARdDatosPersonales.value)) {
       alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	    FormAltas.CARdDatosPersonales.focus();
       return false;   
    }*/
   
   
   
   
   
   
   
   
   
 
   
   
  if (FormAltas.Fecha_IngresoPGR.value != "")
  {
	  if (!esFecha(FormAltas.Fecha_IngresoPGR.value,'E'))
	  {
		alert("El campo -Fecha de ingreso PGR- debe ser de tipo: DD/MM/AAAA");
		FormAltas.Fecha_IngresoPGR.focus();
		return false;
	  }	
  }
 
 
  if (FormAltas.FechaFiliacion.value != "")
  {
	  if (!esFecha(FormAltas.FechaFiliacion.value,'E'))
	  {
		alert("El campo - Fecha de filiación- debe ser de tipo: DD/MM/AAAA");
		FormAltas.FechaFiliacion.focus();
		return false;
	  }	
  }
  
  
  var FechaNacimiento = FormAltas.FechaNacimiento.value
  var Fecha_IngresoPGR = FormAltas.Fecha_IngresoPGR.value
  var FechaFiliacion = FormAltas.FechaFiliacion.value
    aFechaNacimiento = FechaNacimiento.substr(6,4)
    //alert(aFechaNacimiento)
   FechaNacimiento = Date.parse(FechaNacimiento)
   Fecha_IngresoPGR = Date.parse(Fecha_IngresoPGR)
   FechaFiliacion = Date.parse(FechaFiliacion)
   
   if (Fecha_IngresoPGR<=FechaNacimiento)
     {
		alert("La fecha de ingreso a la PGR no puede ser menor o igual a la fecha de nacimiento");
		FormAltas.Fecha_IngresoPGR.focus();
		return false;
	  }	
	  
	  
	if (FechaFiliacion<=FechaNacimiento)
     {
		alert("La fecha de filiación no puede ser menor o igual  a la fecha de nacimiento");
		FormAltas.Fecha_IngresoPGR.focus();
		return false;
	  }	
    
	   /*alert(FechaNacimiento)
		alert(Fecha_IngresoPGR)
		alert(FechaFiliacion)
		return false;*/
		
	
   
  
  
  
  
  
  	 
FormAltas.B1.disabled = true;  
document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

}

</script>