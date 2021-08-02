<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEvaluaArmaFuego"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdEvaluaArmaFuego WHERE Id_CARdEvaluaArmaFuego ="+CSTR(ParID) 
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
   CARdEvaluaArmaFuego= OB_RS("CARdEvaluaArmaFuego")
   Id_CARcDesempeno= OB_RS("Id_CARcDesempeno")
   Cartilla= OB_RS("Cartilla")
   Id_CARcMedico= OB_RS("Id_CARcMedico")
   Id_CARcToxicologico= OB_RS("Id_CARcToxicologico")
   Id_CARcDatosregistrales= OB_RS("Id_CARcDatosregistrales")
   Id_CARcPsicologico= OB_RS("Id_CARcPsicologico")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   Fecha_Captura= OB_RS("Fecha_Captura")
   Id_CARcSubprocuradurias= OB_RS("Id_CARcSubprocuradurias")
   Id_CARcDG_o_Delegaciones= OB_RS("Id_CARcDG_o_Delegaciones")
   Id_CARcDir_o_subsede= OB_RS("Id_CARcDir_o_subsede")
   IdLogin= OB_RS("IdLogin")
   IP_user= OB_RS("IP_user")

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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdEvaluaArmaFuego.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Portación de Arma de Fuego  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Portación de Arma de Fuego  </FONT></h2>
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
        consulta = "SELECT * FROM CARdEvaluaArmaFuego WHERE Id_CARdEvaluaArmaFuego ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdEvaluaArmaFuego")=ucase(request("CARdEvaluaArmaFuego")) 
        if request("Id_CARcDesempeno")  <> "" then  Ob_RS("Id_CARcDesempeno")=request("Id_CARcDesempeno") end if
        Ob_RS("Cartilla")=ucase(request("Cartilla")) 
        if request("Id_CARcMedico")  <> "" then  Ob_RS("Id_CARcMedico")=request("Id_CARcMedico") end if
        if request("Id_CARcToxicologico")  <> "" then  Ob_RS("Id_CARcToxicologico")=request("Id_CARcToxicologico") end if
        if request("Id_CARcDatosregistrales")  <> "" then  Ob_RS("Id_CARcDatosregistrales")=request("Id_CARcDatosregistrales") end if
        if request("Id_CARcPsicologico")  <> "" then  Ob_RS("Id_CARcPsicologico")=request("Id_CARcPsicologico") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
'        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
      Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
		
	       %>
		 		<!-- #INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
      <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCDESEMPENO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Desempeño</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcDesempeno' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDesempeno")= CINT(Id_CARcDesempeno) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Cartilla<BR>  
       </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Cartilla' SIZE=50 MAXLENGTH=50 VALUE='<%= Cartilla%>'>
 	   </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCMEDICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>M&eacute;dico</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcMedico' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMedico")= CINT(Id_CARcMedico) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCTOXICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Toxicol&oacute;gico</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcToxicologico' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcToxicologico")= CINT(Id_CARcToxicologico) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCDATOSREGISTRALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Datos registrales</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcDatosregistrales' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDatosregistrales")= CINT(Id_CARcDatosregistrales) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCPSICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Psicológico</B><BR>      </TD>
      <TD>
	     <SELECT NAME='Id_CARcPsicologico' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPsicologico")= CINT(Id_CARcPsicologico) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	     <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
 	     <textarea name='CARdEvaluaArmaFuego' style="text-transform: uppercase" size=10 rows=5 cols=35><%=CARdEvaluaArmaFuego%></textarea>
 	     <BR>
 	     <BR>
      </TD > 
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdEvaluaArmaFuego >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>


  <% Ob_Rs.CLOSE %>

 
<% IF TOper = "MOD" then%>
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

  
  if (FormEdita.Id_CARcDesempeno.value  == 0 )
  {
       alert("EL CAMPO: Desempeño, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Cartilla.value  == "")
  {
       alert("EL CAMPO: Cartilla, no puede estar vacio");
       return false;
  }
  
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormEdita.Cartilla.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Cartilla, verifique por favor.');
	  	 FormEdita.Cartilla.focus();
      	 return false;    
        }	
		
		if(jvi_textoynumero_correcto.test(FormEdita.CARdEvaluaArmaFuego.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdEvaluaArmaFuego.focus();
      	 return false;    
        }	*/

	
 FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	

  


}
</script> 
