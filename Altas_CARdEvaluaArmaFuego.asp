<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEvaluaArmaFuego"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

   idMaestro = "Id_CARdDatosPersonales"
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
  <FORM METHOD="post" ACTION= "Altas_CARdEvaluaArmaFuego.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Portación de Arma de Fuego  </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
'response.write request.Form
'response.end
    	   Ob_RS.Addnew 
        if request("CARdEvaluaArmaFuego")  <> "" then  Ob_RS("CARdEvaluaArmaFuego")=ucase(request("CARdEvaluaArmaFuego")) end if
        if request("Id_CARcDesempeno")  <> "" then  Ob_RS("Id_CARcDesempeno")=request("Id_CARcDesempeno") end if
        if request("Cartilla")  <> "" then  Ob_RS("Cartilla")=ucase(request("Cartilla")) end if
        if request("Id_CARcMedico")  <> "" then  Ob_RS("Id_CARcMedico")=request("Id_CARcMedico") end if
        if request("Id_CARcToxicologico")  <> "" then  Ob_RS("Id_CARcToxicologico")=request("Id_CARcToxicologico") end if
        if request("Id_CARcDatosregistrales")  <> "" then  Ob_RS("Id_CARcDatosregistrales")=request("Id_CARcDatosregistrales") end if
        if request("Id_CARcPsicologico")  <> "" then  Ob_RS("Id_CARcPsicologico")=request("Id_CARcPsicologico") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
		
		Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
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
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
         <B>Desempeńo</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESEMPENO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesempeno' SIZE=1 >
         
          
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDesempeno")= CINT(Id_CARcDesempeno) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesempeno")%>'> <%= Ob_RS2("CARcDesempeno")%>
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
        <B>Cartilla</font>	</B>
      </TD>
      <TD>
	  <%
    cartilla = "Select cartillaSMN FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN cartilla, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Cartilla = Ob_RS2("cartillaSMN")
		
   Ob_RS2.CLOSE	
     %>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style="text-transform: uppercase" NAME='Cartilla' SIZE=50 MAXLENGTH=50 VALUE=<%= Cartilla%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Medico</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMEDICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMedico' SIZE=1 >
          
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMedico")= CINT(Id_CARcMedico) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMedico")%>'> <%= Ob_RS2("CARcMedico")%>
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
         <B>Toxicolígco</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTOXICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcToxicologico' SIZE=1 >
          
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcToxicologico")= CINT(Id_CARcToxicologico) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcToxicologico")%>'> <%= Ob_RS2("CARcToxicologico")%>
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
         <B>Datos Registrales</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDATOSREGISTRALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDatosregistrales' SIZE=1 >
         
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDatosregistrales")= CINT(Id_CARcDatosregistrales) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDatosregistrales")%>'> <%= Ob_RS2("CARcDatosregistrales")%>
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
         <B>Psicológico</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCPSICOLOGICO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPsicologico' SIZE=1 >
          
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPsicologico")= CINT(Id_CARcPsicologico) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPsicologico")%>'> <%= Ob_RS2("CARcPsicologico")%>
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEvaluaArmaFuego' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEvaluaArmaFuego%></TEXTAREA>
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
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
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

  if (FormAltas.Id_CARcDesempeno.value  == 0 )
  {
       alert("EL CAMPO: Desempeńo, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Cartilla.value  == "")
  {
       alert("EL CAMPO: Cartilla, no puede estar vacio");
       return false;
  }
  
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\ż\ˇ\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\ż\ˇ\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\ż\ˇ\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormAltas.Cartilla.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Cartilla, verifique por favor.');
	  	 FormAltas.Cartilla.focus();
      	 return false;    
        }	
		
		if(jvi_textoynumero_correcto.test(FormAltas.CARdEvaluaArmaFuego.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdEvaluaArmaFuego.focus();
      	 return false;    
        }	*/

	
 FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	

}
</script> 

