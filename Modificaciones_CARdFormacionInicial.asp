<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->



<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<%' @LCID = 1034%>
<%
'response.write "1"
%>

<!-- Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdFormacionInicial"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdFormacionInicial WHERE Id_CARdFormacionInicial ="+CSTR(ParID) 
   
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
         CARdFormacionInicial = Ob_RS("CARdFormacionInicial")
         Curso = Ob_RS("Curso")
         Id_CARcInstituto = Ob_RS("Id_CARcInstituto")
         Generacion = Ob_RS("Generacion")
         FechaExamen = Ob_RS("FechaExamen")
         Id_CARcResultado = Ob_RS("Id_CARcResultado")
         FechaIngresoInstituto = Ob_RS("FechaIngresoInstituto")
         FechaEgresoInstituto = Ob_RS("FechaEgresoInstituto")
         DetalleEstatus = Ob_RS("DetalleEstatus")
         FechaExamenConocimientos = Ob_RS("FechaExamenConocimientos")


'   Fecha_Captura= OB_RS("Fecha_Captura")
'   IdLogin= OB_RS("IdLogin")
'   IP_user= OB_RS("IP_user")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdFormacionInicial.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Formacion Inicial  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Formacion Inicial  </FONT></h2>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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
        consulta = "SELECT * FROM CARdFormacionInicial WHERE Id_CARdFormacionInicial ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 

        Ob_RS("CARdFormacionInicial")=ucase(request("CARdFormacionInicial")) 
        Ob_RS("Curso")=ucase(request("Curso")) 
        if request("Id_CARcInstituto")  <> "" then  Ob_RS("Id_CARcInstituto")=request("Id_CARcInstituto") end if
        Ob_RS("Generacion")=request("Generacion") 
        
'		if request("FechaExamen")  <> "" then  Ob_RS("FechaExamen")=request("FechaExamen") end if
		
 IF request ("FechaExamen") = "" then 
    Ob_RS("FechaExamen")= NULL 
 ELSE
    Ob_RS("FechaExamen")= request("FechaExamen") 
 END IF 
		
		
		
        if request("Id_CARcResultado")  <> "" then  Ob_RS("Id_CARcResultado")=request("Id_CARcResultado") end if
        'if request("FechaIngresoInstituto")  <> "" then  Ob_RS("FechaIngresoInstituto")=request("FechaIngresoInstituto") end if
		
IF request ("FechaIngresoInstituto") = "" then 
    Ob_RS("FechaIngresoInstituto")= NULL 
 ELSE
    Ob_RS("FechaIngresoInstituto")= request("FechaIngresoInstituto") 
 END IF		
		
		
		
		
       ' if request("FechaEgresoInstituto")  <> "" then  Ob_RS("FechaEgresoInstituto")=request("FechaEgresoInstituto") end if
		
  IF request ("FechaEgresoInstituto") = "" then 
    Ob_RS("FechaEgresoInstituto")= NULL 
 ELSE
    Ob_RS("FechaEgresoInstituto")= request("FechaEgresoInstituto") 
 END IF 
		
       ' if request("FechaExamenConocimientos")  <> "" then  Ob_RS("FechaExamenConocimientos")=request("FechaExamenConocimientos") end if
		
		
 IF request ("FechaExamenConocimientos") = "" then 
    Ob_RS("FechaExamenConocimientos")= NULL 
 ELSE
    Ob_RS("FechaExamenConocimientos")= request("FechaExamenConocimientos") 
 END IF 
		
		
		
        Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
'        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
'        if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
        Ob_RS("IdLogin") = session("IdLogin")
        if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
		
	      %>
		 		<!--INCLUDE File="errror.inc" -->
				<!-- INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Curso' SIZE=50 MAXLENGTH=50  VALUE="<%= Curso%>">
      </TD > 
     </TR>
	 
	 
	 
	 
	  <%	

USUARIO = Session("UserLogin")
IF  USUARIO =  "INACIPE39" THEN       %>



     <TR>
      <TD> 
         <B>Instituto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCINSTITUTO WHERE Id_CARCINSTITUTO = 1" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcInstituto' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcInstituto")= CINT(Id_CARcInstituto) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= UCASE(Ob_RS2("CARcInstituto"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= UCASE(Ob_RS2("CARcInstituto"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	  <% ELSEIF USUARIO = "COPLADII36ICAP"  THEN %> 
	 
	 <TR>
      <TD> 
         <B>Instituto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCINSTITUTO WHERE Id_CARCINSTITUTO = 2" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcInstituto' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcInstituto")= CINT(Id_CARcInstituto) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= UCASE(Ob_RS2("CARcInstituto"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= UCASE(Ob_RS2("CARcInstituto"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <% ELSEIF USUARIO = "P1"  THEN %> 
	 
	 
	   <TR>
      <TD> 
         <B>Instituto</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCINSTITUTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcInstituto' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcInstituto")= CINT(Id_CARcInstituto) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= Ob_RS2("CARcInstituto")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcInstituto")%>'> <%= Ob_RS2("CARcInstituto")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	
	 
	   <%END IF %>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
     <TR>
      <TD>
        <B>Generación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=9 MAXLENGTH=9 style="text-transform: uppercase" VALUE=<%= Generacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de examen de oposición</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaExamen' SIZE=10 MAXLENGTH=16 VALUE=<%= FechaExamen%> >
       <IMG ONCLICK="window_open('FormEdita','FechaExamen')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Resultado examen</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCRESULTADO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcResultado' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcResultado")= CINT(Id_CARcResultado) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%= UCASE(Ob_RS2("CARcResultado"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%= UCASE(Ob_RS2("CARcResultado"))%>
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
        <B>Fecha de ingreso al instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaIngresoInstituto' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaIngresoInstituto%> >
       <IMG ONCLICK="window_open('FormEdita','FechaIngresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de egreso del instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaEgresoInstituto' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEgresoInstituto%> >
       <IMG ONCLICK="window_open('FormEdita','FechaEgresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFormacionInicial' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdFormacionInicial%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>

  <%
'=====FIN LOOP ===================================================================================
%>
  <!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
  <INPUT TYPE="Hidden" NAME=tabla_original Value = CARdFormacionInicial >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >


		
		<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>

 
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
 <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
  

  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
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
<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{


  if (FormEdita.Curso.value  == "")
  {
       alert("EL CAMPO: Curso, no puede estar vacio");
       return false;
  }
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormEdita.Curso.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Curso, verifique por favor.');
	  	 FormEdita.Curso.focus();
      	 return false;    
        }*/
		/*if(jvi_numero_correcto.test(FormEdita.Generacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Generación, verifique por favor.');
	  	 FormEdita.Generacion.focus();
      	 return false;    
        }*/	
		
 
  


  if (FormEdita.FechaExamen.value != "")
	  {
		  if (!esFecha(FormEdita.FechaExamen.value,'E'))
		  {
			alert("El campo - Fecha de Examen- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaExamen.focus();
			return false;
		  }	
	  }
	  
	  
	  

  if (FormEdita.FechaIngresoInstituto.value != "")
	  {
		  if (!esFecha(FormEdita.FechaIngresoInstituto.value,'E'))
		  {
			alert("El campo - Fecha de Ingreso al instituto- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaIngresoInstituto.focus();
			return false;
		  }	
	  }
	  
	  
	  if (FormEdita.FechaEgresoInstituto.value != "")
	  {
		  if (!esFecha(FormEdita.FechaEgresoInstituto.value,'E'))
		  {
			alert("El campo - Fecha de Egreso al instituto- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaEgresoInstituto.focus();
			return false;
		  }	
	  }
	  
	  
	  
	  
	  
  
	  
	  
	  
  			 var FechaIngresoInstituto = FormEdita.FechaIngresoInstituto.value
			 var FechaEgresoInstituto = FormEdita.FechaEgresoInstituto.value
			  
			FechaIngresoInstituto = Date.parse(FechaIngresoInstituto)
			FechaEgresoInstituto = Date.parse(FechaEgresoInstituto)
		
			if (FechaEgresoInstituto <= FechaIngresoInstituto)
		 {
			alert("La Fecha de egreso del instituo no puede ser menor o igual a la Fecha de ingreso al instituto, verifique por favor");
			FormEdita.FechaEgresoInstituto.focus();
			return false;
		  }
		
  
  
  
  
  
  /*if(jvi_textoynumero_correcto.test(FormEdita.CARdFormacionInicial.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdFormacionInicial.focus();
      	 return false;    
        }*/
  
  
  
  

 FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/



}
</script>