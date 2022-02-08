<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->


<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
'Id_CARcInstituto = SESSION("Delegacion")

   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdFormacionInicial"
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
  <FORM METHOD="post" ACTION= "Altas_CARdFormacionInicial.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Formacion Inicial</FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdFormacionInicial")  <> "" then  Ob_RS("CARdFormacionInicial")=ucase(request("CARdFormacionInicial")) end if
        if request("Curso")  <> "" then  Ob_RS("Curso")=ucase(request("Curso")) end if
        if request("Id_CARcInstituto")  <> "" then  Ob_RS("Id_CARcInstituto")=request("Id_CARcInstituto") end if
        if request("Generacion")  <> "" then  Ob_RS("Generacion")=request("Generacion") end if
        if request("FechaExamen")  <> "" then  Ob_RS("FechaExamen")=request("FechaExamen") end if
        if request("Id_CARcResultado")  <> "" then  Ob_RS("Id_CARcResultado")=request("Id_CARcResultado") end if
        if request("FechaIngresoInstituto")  <> "" then  Ob_RS("FechaIngresoInstituto")=request("FechaIngresoInstituto") end if
        if request("FechaEgresoInstituto")  <> "" then  Ob_RS("FechaEgresoInstituto")=request("FechaEgresoInstituto") end if
        if request("FechaExamenConocimientos")  <> "" then  Ob_RS("FechaExamenConocimientos")=request("FechaExamenConocimientos") end if

'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
'        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
       Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)

		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		Ob_RS("IdLogin") = session("IdLogin")
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
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Curso' SIZE=50 MAXLENGTH=50 VALUE=<%= Curso%>>
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
       <INPUT TYPE='TEXT' NAME='FechaExamen' SIZE=10 MAXLENGTH=16  VALUE=<%= FechaExamen%> >
       <IMG ONCLICK="window_open('FormAltas','FechaExamen')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%=UCASE(Ob_RS2("CARcResultado"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcResultado")%>'> <%=UCASE(Ob_RS2("CARcResultado"))%>
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
       <IMG ONCLICK="window_open('FormAltas','FechaIngresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de egreso del instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaEgresoInstituto' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEgresoInstituto%> >
       <IMG ONCLICK="window_open('FormAltas','FechaEgresoInstituto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
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

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >


<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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

  if (FormAltas.Curso.value  == "")
  {
       alert("EL CAMPO: Curso, no puede estar vacio");
       return false;
  }
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormAltas.Curso.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Curso, verifique por favor.');
	  	 FormAltas.Curso.focus();
      	 return false;    
        }*/
		/*if(jvi_numero_correcto.test(FormAltas.Generacion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Generación, verifique por favor.');
	  	 FormAltas.Generacion.focus();
      	 return false;    
        }*/	
		
 
  if (FormAltas.FechaExamen.value != "")
	  {
		  if (!esFecha(FormAltas.FechaExamen.value,'E'))
		  {
			alert("El campo - Fecha de Examen- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaExamen.focus();
			return false;
		  }	
	  }




  if (FormAltas.FechaIngresoInstituto.value != "")
	  {
		  if (!esFecha(FormAltas.FechaIngresoInstituto.value,'E'))
		  {
			alert("El campo - Fecha de Ingreso al instituto- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaIngresoInstituto.focus();
			return false;
		  }	
	  }
	  
	  
	  if (FormAltas.FechaEgresoInstituto.value != "")
	  {
		  if (!esFecha(FormAltas.FechaEgresoInstituto.value,'E'))
		  {
			alert("El campo - Fecha de Egreso al instituto- debe ser de tipo: DD/MM/AAAA");
			FormAltas.FechaEgresoInstituto.focus();
			return false;
		  }	
	  }
	  
	  
	  
	  
	  
  
	  
	  
	  
  			 var FechaIngresoInstituto = FormAltas.FechaIngresoInstituto.value
			 var FechaEgresoInstituto = FormAltas.FechaEgresoInstituto.value
			  
			FechaIngresoInstituto = Date.parse(FechaIngresoInstituto)
			FechaEgresoInstituto = Date.parse(FechaEgresoInstituto)
		
			if (FechaEgresoInstituto <= FechaIngresoInstituto)
		 {
			alert("La Fecha de egreso del instituo no puede ser menor o igual a la Fecha de ingreso al instituto, verifique por favor");
			FormAltas.FechaEgresoInstituto.focus();
			return false;
		  }
		
  
  
  
  
  
  /*if(jvi_textoynumero_correcto.test(FormAltas.CARdFormacionInicial.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdFormacionInicial.focus();
      	 return false;    
        }*/
  
  
  
  

 FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}
</script> 

