 <% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="Utilerias.vbs" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->


<%
''response.write SESSION("PERFIL")
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS3  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdDatosPersonales"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)
'   ParID = Request.QueryString("ParID")

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales ="+CSTR(ParID) 
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
   CARdDatosPersonales= OB_RS("CARdDatosPersonales")
   RFC= OB_RS("RFC")
   ApellidoPaterno= OB_RS("ApellidoPaterno")
   ApellidoMaterno= OB_RS("ApellidoMaterno")
   Nombre= OB_RS("Nombre")
   Id_CARcEntidadFederativa= OB_RS("Id_CARcEntidadFederativa")
   FechaNacimiento= OB_RS("FechaNacimiento")
   Id_CarcEdoCivil= OB_RS("Id_CarcEdoCivil")
   Id_CARcGenero= OB_RS("Id_CARcGenero")
   CURP= OB_RS("CURP")
   CartillaSMN= OB_RS("CartillaSMN")
   ClaveElector= OB_RS("ClaveElector")
   Foto= OB_RS("Foto")
   NoFiliacion= OB_RS("NoFiliacion")
   CUIP= OB_RS("CUIP")
   
   DependenciaFiliacion= OB_RS("DependenciaFiliacion")
   Autorizador= OB_RS("Autorizador")
   
   FechaFiliacion= OB_RS("FechaFiliacion")
   Fecha_IngresoPGR= OB_RS("Fecha_IngresoPGR")
   'RESPONSE.WRITE FechaFiliacion & "<----"
   'RESPONSE.END 

   PaisNacimiento  =  Ob_RS("PaisNacimiento")
   MunicipiooDel   = Ob_RS("MunicipiooDel")
   Ciudad  = Ob_RS("Ciudad")
   Nacionalidad = Ob_RS("Nacionalidad")
   Licencia = Ob_RS("Licencia")
   
   Edad = year(date)- year(OB_RS("FechaNacimiento"))

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
xDis = "enabled"
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
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
<FORM METHOD='post'  ENCTYPE="multipart/form-data" ACTION="sendfile4.asp" NAME="FormEdita">
        <input type="hidden" name="Agregar" value="S">

  

 <!--- insertar resulstado de  LOOP ----------------------------------------------------------------------------------------------- --->
<%
IF SESSION("PERFIL") = "PERFIL 1" THEN
   bDisRFC = "enabled"
ELSE
   bDisRFC = "Disabled"
END IF


IF REQUEST("vRFC") = "N" THEN  '' modificaron RFC  y es invalido%>
	  <script>
//	  alert('vRFC')
//      document.FormEdita.Boton11.disabled=true;  
 //     document.FormEdita.Boton12.disabled=true;  
	//  FormEdita.RFC.focus();
	  </script>
<%
 xDis = "Disabled"
MyRFC= ucase(REQUEST("pRFC"))
RFC  = MyRFC
END IF
IF REQUEST("vRFC") = "S" THEN  '' modificaron RFC
   MyRFC= ucase(REQUEST("pRFC"))
   RFC  = MyRFC
   IF not Valida_RFC(MyRFC) THEN  'RFC no valido%>
	  <script>
	  alert("RFC: Invalido: <%=MyRFC%>")
      document.location="Modificaciones_CARdDatosPersonales.asp?ParamId=<%=ParId%>&TOper=<%=TOper%>&vRFC=N&pRFC=<%=MyRFC%>" 
 //     document.FormEdita.Boton11.disabled=true;  
 //     document.FormEdita.Boton12.disabled=true;  
	  </script>
  <%   ' response.write xSQL
      'response.end
	ELSE
       xSQL = "Select * from CARdDatosPersonales where RFC='"+MyRFC+"'" 
'response.write xSQL
'response.end
       Ob_RS2.OPEN xSQL, Ob_Conn,2, 3, 1
       IF not Ob_RS2.EOF THEN %>
	    <script>
	     alert("ya existe persona con ese RFC :<%=OB_RS2("nombre")+" "+OB_RS2("APELLIDOPATERNO")+" "+OB_RS2("APELLIDOMATERNO")%>")
        // document.location="Modificaciones_CARdDatosPersonales.asp?ParamId=<%=ParId%>&TOper=<%=TOper%>&vRFC=N" 
	    </script>
<%	   END IF 
       OB_RS2.close
    END IF
END IF   '// REQUEST("vRFC") = "S"
%>
    <% 
     vModi = request("Modi") 
     if vModi = "S" then  
        Ob_RS.Close 
        consulta = "SELECT * FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARdDatosPersonales")  <> "" then  Ob_RS("CARdDatosPersonales")=Replace(UCASE(request("CARdDatosPersonales")),"'","") end if
        if request("RFC")  <> "" then  Ob_RS("RFC")=Replace(UCASE(request("RFC")),"'","") end if
        if request("ApellidoPaterno")  <> "" then  Ob_RS("ApellidoPaterno")=Replace(UCASE(request("ApellidoPaterno")),"'","") end if
        if request("ApellidoMaterno")  <> "" then  Ob_RS("ApellidoMaterno")=Replace(UCASE(request("ApellidoMaterno")),"'","") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=Replace(UCASE(request("Nombre")),"'","") end if
        if request("Id_CARcEntidadFederativa")  <> "" then  Ob_RS("Id_CARcEntidadFederativa")=Replace(UCASE(request("Id_CARcEntidadFederativa")),"'","") end if
        if request("FechaNacimiento")  <> "" then  Ob_RS("FechaNacimiento")=Replace(request("FechaNacimiento"),"'","")  end if
        if request("Id_CarcEdoCivil")  <> "" then  Ob_RS("Id_CarcEdoCivil")=Replace(request("Id_CarcEdoCivil"),"'","")  end if
        if request("Id_CARcGenero")  <> "" then  Ob_RS("Id_CARcGenero")=Replace(request("Id_CARcGenero"),"'","")  end if
        if request("CURP")  <> "" then  Ob_RS("CURP")=Replace(UCASE(request("CURP")),"'","")  end if
        if request("CartillaSMN")  <> "" then  Ob_RS("CartillaSMN")=Replace(UCASE(request("CartillaSMN")),"'","")  end if
        if request("ClaveElector")  <> "" then  Ob_RS("ClaveElector")=Replace(UCASE(request("ClaveElector")),"'","")  end if
        if request("Foto")  <> "" then  Ob_RS("Foto")=Replace(request("Foto"),"'","")  end if
        if request("NoFiliacion")  <> "" then  Ob_RS("NoFiliacion")=Replace(UCASE(request("NoFiliacion")),"'","")  end if
        'if request("FechaFiliacion")  <> "" then 
'          Ob_RS("FechaFiliacion")=Replace(request("FechaFiliacion"),"'","")  
'        else 
'          Ob_RS("FechaFiliacion")=null
'      end if 
        if request("DependenciaFiliacion")  <> "" then  Ob_RS("DependenciaFiliacion")=Replace(UCASE(request("DependenciaFiliacion")),"'","") end if
        if request("Autorizador")  <> "" then  Ob_RS("Autorizador")=Replace(request("Autorizador"),"'","") end if
		
'		if request("Fecha_IngresoPGR")  <> "" then  Ob_RS("Fecha_IngresoPGR")=Replace(UCASE(request("Fecha_IngresoPGR")),"'","") end if
		if request("PaisNacimiento")  <> "" then  Ob_RS("PaisNacimiento")=Replace(UCASE(request("PaisNacimiento")),"'","") end if
        if request("MunicipiooDel")  <> "" then  Ob_RS("MunicipiooDel")=Replace(UCASE(request("MunicipiooDel")),"'","") end if
        if request("Ciudad")  <> "" then  Ob_RS("Ciudad")=Replace(UCASE(request("Ciudad")),"'","")  end if
        if request("Nacionalidad")  <> "" then  Ob_RS("Nacionalidad")=Replace(UCASE(request("Nacionalidad")),"'","") end if
        if request("Licencia")  <> "" then  Ob_RS("Licencia")=Replace(UCASE(request("Licencia")),"'","") end if
        Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
		
	      response.write("<CENTER><H2>EL REGISTRO HA SIDO AGREGADO</H2></CENTER>")%>
		  <CENTER><a href="CARR_S_4.asp?">Finalizar</a></CENTER>
		   
		<Script language=JavaScript>
		function right(e) {
			if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)){
			alert("Acceso Denegado");
			return false;
			}
			else if (navigator.appName == 'Microsoft Internet Explorer' &&
				(event.button == 2 || event.button == 3)) {
				alert("Acceso Denegado");
				return false;
			}
			return true;
			}
			document.onmousedown=right;
			if (document.layers) window.captureEvents(Event.MOUSEDOWN);
			window.onmousedown=right;
			</script>
    <%response.end
	end if%>
	 	   
   <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Datos Personales </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Datos Personales  </FONT></h2>
     <p ALIGN="center"> &nbsp;
 <INPUT TYPE="button" VALUE="Enviar"  NAME="Boton12" <%=xDis%>  onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
<%END IF %> 
   </H2>

  </CENTER>
<TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>RFC</font></B>
      </TD>
      <TD> <P ALIGN='left'> 
          <input type='TEXT' name='RFC'   <%=bDisRFC%>  style="text-transform: uppercase" onBlur="Ena_Btn()" onFocus="Dis_Btn()" onChange="Cons_RFC()" size=15 maxlength=15 value=<%= RFC%>>
          <INPUT TYPE='HIDDEN' NAME='RFC1'  style="text-transform: uppercase" VALUE=<%= RFC%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Apellido paterno</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoPaterno'  style="text-transform: uppercase" <%=xDis%> SIZE=50 MAXLENGTH=100 VALUE='<%= ApellidoPaterno%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Apellido materno</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ApellidoMaterno'  style="text-transform: uppercase"  <%=xDis%> SIZE=50 MAXLENGTH=100 VALUE='<%= ApellidoMaterno%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nombre(s)</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nombre'  style="text-transform: uppercase"  <%=xDis%> SIZE=50 MAXLENGTH=150 VALUE='<%= Nombre%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Pa&iacute;s de nacimiento</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='PaisNacimiento'  style="text-transform: uppercase"  <%=xDis%> SIZE=30 MAXLENGTH=30 VALUE='<%= PaisNacimiento%>'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Entidad de nacimiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCENTIDADFEDERATIVA ORDER BY Id_CARcEntidadFederativa" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEntidadFederativa' style="text-transform: uppercase"  <%=xDis%> SIZE=1>
          <% 'IF Id_CARcEntidadFederativa = "" OR Id_CARcEntidadFederativa = "0" THEN %>
	            <!--OPTION VALUE='0'>
                   Seleccionar
              </OPTION-->
           <%' END IF  %>
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
       <INPUT TYPE='TEXT' NAME='Ciudad'  style="text-transform: uppercase"  <%=xDis%> SIZE=30 MAXLENGTH=50 VALUE='<%= Ciudad%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Municipio o Delegación</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='MunicipiooDel'  style="text-transform: uppercase"  <%=xDis%> SIZE=50 MAXLENGTH=150 VALUE='<%= MunicipioODel%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nacionalidad</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Nacionalidad'  style="text-transform: uppercase"  <%=xDis%> SIZE=30 MAXLENGTH=30 VALUE='<%= Nacionalidad%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de nacimiento</font></B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaNacimiento'  <%=xDis%> SIZE=10  MAXLENGTH=16  VALUE=<%= FechaNacimiento%> >
       <IMG ONCLICK="window_open('FormEdita','FechaNacimiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
 	     &nbsp;&nbsp;&nbsp;Edad 
      <INPUT TYPE='TEXT' NAME='Edad' SIZE=3  MAXLENGTH=3  READONLY VALUE=<%= Edad%> > Años
	  </P>
      </TD > 
     </TR>
     <TR>
      <TD> 
       <B>Estado civil</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCEDOCIVIL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CarcEdoCivil'  <%=xDis%> SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
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
		<%END IF  %>			 
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Género</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCGENERO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcGenero'  <%=xDis%> SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
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
		<%END IF  %>			 
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
       <INPUT TYPE='TEXT' NAME='CURP'  style="text-transform: uppercase"  <%=xDis%> SIZE=40 MAXLENGTH=30 VALUE='<%= CURP%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Número de cartilla del SMN</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CartillaSMN'  style="text-transform: uppercase"  <%=xDis%> SIZE=30 MAXLENGTH=30 VALUE='<%= CartillaSMN%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Clave de elector</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='ClaveElector'  style="text-transform: uppercase"  <%=xDis%> SIZE=40 MAXLENGTH=30 VALUE='<%= ClaveElector%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Licencia de conducir</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Licencia'  style="text-transform: uppercase"  <%=xDis%> SIZE=40 MAXLENGTH=50 VALUE='<%= Licencia%>'>
      </TD > 
       <TR>
      <TD>
        <B>Fecha ingreso PGR</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_IngresoPGR'  <%=xDis%> SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_IngresoPGR%> >
       <IMG ONCLICK="window_open('FormEdita','Fecha_IngresoPGR')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>CUIP</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CUIP' SIZE=40 style="text-transform: uppercase" MAXLENGTH=50 VALUE=<%= CUIP%>>
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
        <B>Número de filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoFiliacion'  style="text-transform: uppercase"  <%=xDis%> SIZE=20 MAXLENGTH=20 VALUE='<%= NoFiliacion%>'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaFiliacion'  <%=xDis%> SIZE=10  MAXLENGTH=16  VALUE=<%= FechaFiliacion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaFiliacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Dependencia federal que realiza filiación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='DependenciaFiliacion'   style="text-transform: uppercase"  <%=xDis%> SIZE=10 ROWS=5 COLS=35><%=DependenciaFiliacion%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdDatosPersonales'  style="text-transform: uppercase"  <%=xDis%> SIZE=10 ROWS=5 COLS=35><%=CARdDatosPersonales%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>

<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdDatosPersonales >
<INPUT TYPE="Hidden" NAME=varRFC Value = "" >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
<INPUT TYPE="Hidden" NAME=TOper Value = <%=TOper%>>

  <% Ob_Rs.CLOSE %>

 
<% IF TOper = "VER" then%>
  <p ALIGN="center"> &nbsp;
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
   <BR>

    <INPUT TYPE="button" VALUE="Enviar" NAME="Boton11" <%=xDis%> onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="button" VALUE="Restablecer" onClick="f_Ree()" NAME="B2"> &nbsp;&nbsp;&nbsp; 

<% END IF %> 

  </p>

   </CENTER>
  </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{
document.FormEdita.RFC.disabled = false;

  if (FormEdita.RFC.value  == "")
  {
       alert("EL CAMPO: RFC, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.ApellidoPaterno.value  == "")
  {
       alert("EL CAMPO: Apellido paterno, no puede estar vacio");
       return false;
  }

  if (FormEdita.ApellidoMaterno.value  == "")
  {
       alert("EL CAMPO: Apellido materno, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Nombre.value  == "")
  {
       alert("EL CAMPO: Nombre(s), no puede estar vacio");
       return false;
  }
  
	   
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        if(jvi_texto_correcto.test(FormEdita.ApellidoPaterno.value)) {
       alert('Ha escrito un caracter no valido en el campo Apellido paterno, verifique por favor.');
	   FormEdita.ApellidoPaterno.focus();
       return false;    
    }
	
	 if(jvi_texto_correcto.test(FormEdita.ApellidoMaterno.value)) {
       alert('Ha escrito un caracter no valido en el campo Apellido materno, verifique por favor.');
	   FormEdita.ApellidoMaterno.focus();
       return false;    
    }
	
	
	 if(jvi_texto_correcto.test(FormEdita.Nombre.value)) {
       alert('Ha escrito un caracter no valido en el campo Nombre, verifique por favor.');
	    FormEdita.Nombre.focus();
       return false;   
    }

   
   
   
   
   
   if(jvi_texto_correcto.test(FormEdita.PaisNacimiento.value)) {
       alert('Ha escrito un caracter no valido en el campo Pais de nacimiento, verifique por favor.');
	    FormEdita.PaisNacimiento.focus();
       return false;   
    }
   
   
   
    /*if(jvi_texto_correcto.test(FormEdita.Ciudad.value)) {
       alert('Ha escrito un caracter no valido en el campo Ciudad, verifique por favor.');
	    FormEdita.Ciudad.focus();
       return false;   
    }*/
	
	 /*if(jvi_texto_correcto.test(FormEdita.MunicipiooDel.value)) {
       alert('Ha escrito un caracter no valido en el campo Municipio o Del., verifique por favor.');
	    FormEdita.MunicipiooDel.focus();
       return false;   
    }*/
   
    /*if(jvi_texto_correcto.test(FormEdita.Nacionalidad.value)) {
       alert('Ha escrito un caracter no valido en el campo Nacionalidad, verifique por favor.');
	    FormEdita.Nacionalidad.focus();
       return false;   
    }*/
   
    if (FormEdita.FechaNacimiento.value == '')
		   {alert("El campo Fecha de Nacimiento no debe estar vacío ");
		   return false;}
	
	/*if(jvi_textoynumero_correcto.test(FormEdita.CURP.value)) {
       alert('Ha escrito un caracter no valido en el campo CURP, verifique por favor.');
	    FormEdita.CURP.focus();
       return false;   
    }*/
   
   /*if(jvi_numero_correcto.test(FormEdita.CartillaSMN.value)) {
       alert('Ha escrito un caracter no valido en el campo Número de cartilla del SMN, verifique por favor.');
	    FormEdita.CartillaSMN.focus();
       return false;   
    }*/
  
   
   /*
    if(jvi_textoynumero_correcto.test(FormEdita.ClaveElector.value)) {
       alert('Ha escrito un caracter no valido en el campo Clave de elector , verifique por favor.');
	    FormEdita.ClaveElector.focus();
       return false;   
    }*/

   /*if(jvi_textoynumero_correcto.test(FormEdita.Licencia.value)) {
       alert('Ha escrito un caracter no valido en el campo Licencia, verifique por favor.');
	    FormEdita.Licencia.focus();
       return false;   
    }*/

   /*if(jvi_textoynumero_correcto.test(FormEdita.NoFiliacion.value)) {
       alert('Ha escrito un caracter no valido en el campo No. de filiacion, verifique por favor.');
	    FormEdita.NoFiliacion.focus();
       return false;   
    }*/

    /*if(jvi_texto_correcto.test(FormEdita.DependenciaFiliacion.value)) {
       alert('Ha escrito un caracter no valido en el campo Dependencia, verifique por favor.');
	    FormEdita.DependenciaFiliacion.focus();
       return false;   
    }*/

   
   /*if(jvi_textoynumero_correcto.test(FormEdita.CARdDatosPersonales.value)) {
       alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	    FormEdita.CARdDatosPersonales.focus();
       return false;   
    }*/
   
   
   
   
   
   
   
   
   
 
   
   
  if (FormEdita.Fecha_IngresoPGR.value != "")
  {
	  if (!esFecha(FormEdita.Fecha_IngresoPGR.value,'E'))
	  {
		alert("El campo -Fecha de ingreso PGR- debe ser de tipo: DD/MM/AAAA");
		FormEdita.Fecha_IngresoPGR.focus();
		return false;
	  }	
  }
 
 
  if (FormEdita.FechaFiliacion.value != "")
  {
	  if (!esFecha(FormEdita.FechaFiliacion.value,'E'))
	  {
		alert("El campo - Fecha de filiación- debe ser de tipo: DD/MM/AAAA");
		FormEdita.FechaFiliacion.focus();
		return false;
	  }	
  }
  
  
  var FechaNacimiento = FormEdita.FechaNacimiento.value
  var Fecha_IngresoPGR = FormEdita.Fecha_IngresoPGR.value
  var FechaFiliacion = FormEdita.FechaFiliacion.value
    aFechaNacimiento = FechaNacimiento.substr(6,4)
    //alert(aFechaNacimiento)
   FechaNacimiento = Date.parse(FechaNacimiento)
   Fecha_IngresoPGR = Date.parse(Fecha_IngresoPGR)
   FechaFiliacion = Date.parse(FechaFiliacion)
   
   if (Fecha_IngresoPGR<=FechaNacimiento)
     {
		alert("La fecha de ingreso a la PGR no puede ser menor o igual a la fecha de nacimiento");
		FormEdita.Fecha_IngresoPGR.focus();
		return false;
	  }	
	  
	  
	if (FechaFiliacion<=FechaNacimiento)
     {
		alert("La fecha de filiación no puede ser menor o igual  a la fecha de nacimiento");
		FormEdita.Fecha_IngresoPGR.focus();
		return false;
	  }	
    
	   /*alert(FechaNacimiento)
		alert(Fecha_IngresoPGR)
		alert(FechaFiliacion)
		return false;*/
		
  
  
  	 
document.FormEdita.Boton11.disabled=true;  
document.FormEdita.Boton12.disabled=true;  
//FormEdita.Boton1.disabled = true;  
document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

	
}
<!--
	function Cons_RFC()
 {
	var xParamID = document.FormEdita.ParamID.value
	var xTOper = document.FormEdita.TOper.value
	var xRFC = document.FormEdita.RFC.value
	document.FormEdita.Modi.value = 'N'
	document.location="Modificaciones_CARdDatosPersonales.asp?ParamId=" + xParamID + "&TOper=" + xTOper +"&vRFC=S" +"&pRFC=" +xRFC
}
function Dis_Btn()
{
document.FormEdita.Boton11.disabled=true;  
document.FormEdita.Boton12.disabled=true;  
//alert()
}
function Ena_Btn()
{
if (document.FormEdita.RFC.value == document.FormEdita.RFC1.value)
{
//alert('2')
document.FormEdita.Boton11.disabled=false;  
document.FormEdita.Boton12.disabled=false;  
}
}

function f_Ree()
 {
	var xParamID = document.FormEdita.ParamID.value
	var xTOper = document.FormEdita.TOper.value
//	var xRFC = document.FormEdita.RFC.value
	document.FormEdita.Modi.value = 'N'
	document.location="Modificaciones_CARdDatosPersonales.asp?ParamId=" + xParamID + "&TOper=" + xTOper +"&vRFC=" 
}

-->

</script>
<%
function Valida_RFC(RFC)
'response.write RFC
'response.end
   xLetras=MID(RFC,1,4)
   xNumeros=MID(RFC,5,6)
 Error=0
 IF LEN(RFC) < 10 THEN
    Error=1
 END IF 
 IF ERROR = O THEN
    For Z=1 to 4
       If InStr("ABCDEFGHIJKLMNOÑPQRSTUVWXYZ",MID(xLetras,Z,1))=0 Then
	      Z=9
	      Error=1
	   End IF
    Next
 END IF 
 IF ERROR = O THEN
    For Z=1 to 6
       If InStr("1234567890",MID(xNumeros,Z,1))=0 Then
     	   Z=9
   	       Error=1
	   End IF
    Next
 end if 
 IF ERROR = O THEN
    If CINT(MID(RFC,7,2)) > 12 OR  CINT(MID(RFC,7,2)) = 0 Then
	    Error=1
    End IF
    If CINT(MID(RFC,9,2)) > 31 OR CINT(MID(RFC,9,2)) = 0 Then
	    Error=1
    End IF
 end if 
 IF Error = 1 THEN
    RFCValido = False
 ELSE
    RFCValido = TRUE
 END IF
 Valida_RFC = RFCValido
END FUNCTION

%>
