<% On Error Resume Next %>
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdEscolaridad"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

xDisable = "no"
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
  <FORM METHOD="post" ACTION= "Altas_CARdEscolaridad.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> <FONT COLOR= #3366CC>Altas de Historial Acad&eacute;mico</FONT> </H2>
  </CENTER>
<% 'response.Write(session("UserLogin")&"p") %>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdEscolaridad")  <> "" then  Ob_RS("CARdEscolaridad")=UCASE(request("CARdEscolaridad")) end if
        if request("Id_CARcNivelEstudios")  <> "" then  Ob_RS("Id_CARcNivelEstudios")=request("Id_CARcNivelEstudios") end if
        if request("NombreInstitucion")  <> "" then  Ob_RS("NombreInstitucion")=UCASE(request("NombreInstitucion")) end if
        if request("AnioInicio")  <> "" then  Ob_RS("AnioInicio")=request("AnioInicio") end if
        if request("AnioTermino")  <> "" then  Ob_RS("AnioTermino")=request("AnioTermino") end if
        if request("Id_CARcEstatus")  <> "" then  Ob_RS("Id_CARcEstatus")=request("Id_CARcEstatus") end if
        if request("Id_CARcDocumentoObtenido")  <> "" then  Ob_RS("Id_CARcDocumentoObtenido")=request("Id_CARcDocumentoObtenido") end if
        Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("NumeroCedula")  <> "" then  Ob_RS("NumeroCedula")=UCASE(request("NumeroCedula")) end if
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
         <B>Nivel escolar</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNIVELESTUDIOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNivelEstudios' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNivelEstudios")= CINT(Id_CARcNivelEstudios) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNivelEstudios")%>'> <%=UCASE(Ob_RS2("CARcNivelEstudios"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNivelEstudios")%>'> <%=UCASE(Ob_RS2("CARcNivelEstudios"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>Nombre de la institución</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NombreInstitucion' SIZE=50 MAXLENGTH=80 style="text-transform: uppercase"  VALUE=<%= NombreInstitucion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <strong>Peri&oacute;do (año de inicio y t&eacute;rmino)</strong>      </TD>
      <TD> 
 	   <P ALIGN='left'>de 
       <INPUT TYPE='TEXT' NAME='AnioInicio' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioInicio%> >  a   
       <INPUT TYPE='TEXT' NAME='AnioTermino' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioTermino%> >
      </TD > 
      <TD>
 	   <P ALIGN='left'>      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estatus</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCESTATUS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcEstatus' size=1 onchange='SeleMenu1("C")'>
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcEstatus")= CINT(Id_CARcEstatus) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcEstatus")%>'> <%=UCASE(Ob_RS2("CARcEstatus"))%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcEstatus")%>'> <%=UCASE(Ob_RS2("CARcEstatus"))%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>    
        <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Documento obtenido</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDOCUMENTOOBTENIDO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDocumentoObtenido' SIZE=1 ID='IDSEL' onchange='SeleMenu("C")'>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDocumentoObtenido")= CINT(Id_CARcDocumentoObtenido) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDocumentoObtenido")%>'> <%=UCASE(Ob_RS2("CARcDocumentoObtenido"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDocumentoObtenido")%>'> <%=UCASE(Ob_RS2("CARcDocumentoObtenido"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     <TR>
      <TD>
        <B>N&uacute;mero de c&eacute;dula</font>	</B>      </TD>
      <TD>
 	    <P ALIGN='left'> <!--name='IDCED'-->
 	      <input type='TEXT'  name='NumeroCedula' size=20 style="text-transform: uppercase" maxlength=20  value=<%= NumeroCedula%>  >
       </TD > 
     </TR>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEscolaridad' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEscolaridad%></TEXTAREA>
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
  
  
   <%
   
	
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 

pri = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 1"
	  Ob_RS2.OPEN pri, Ob_Conn, 3, 1 
		pri_AnioInicio = Ob_RS2("AnioInicio")
		pri_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE
sec = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 2"
	  Ob_RS2.OPEN sec, Ob_Conn, 3, 1 
		sec_AnioInicio = Ob_RS2("AnioInicio")
		sec_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE
bac = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 3"
	  Ob_RS2.OPEN bac, Ob_Conn, 3, 1 
		bac_AnioInicio = Ob_RS2("AnioInicio")
		bac_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE
lic = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 5"	  	  	  
	  Ob_RS2.OPEN lic, Ob_Conn, 3, 1 
		lic_AnioInicio = Ob_RS2("AnioInicio")
		lic_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE
mae = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 6"
	  Ob_RS2.OPEN mae, Ob_Conn, 3, 1 
		mae_AnioInicio = Ob_RS2("AnioInicio")
		mae_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE
doc = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 7"	  	  
     Ob_RS2.OPEN doc, Ob_Conn, 3, 1 
		doc_AnioInicio = Ob_RS2("AnioInicio")
		doc_AnioTermino = Ob_RS2("AnioTermino")
	 Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>

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


  if (FormAltas.Id_CARcNivelEstudios.value  == 0)
  {
       alert("EL CAMPO: Nivel Escolar, no puede estar vacio");
       return false;
  }
  



/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

/*        if(jvi_textoynumero_correcto.test(FormAltas.NombreInstitucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la institución, verifique por favor.');
	  	 FormAltas.NombreInstitucion.focus();
      	 return false;    
        }	
*/		
		

		var Id_CARcNivelEstudios = FormAltas.Id_CARcNivelEstudios.value
		var anio_inicio = FormAltas.AnioInicio.value
 		var anio_termino = FormAltas.AnioTermino.value
		var myDate=new Date()
		
		
       //alert(myDate.getFullYear())
if (FormAltas.AnioInicio.value != "")
{
		
		  if ( (FormAltas.AnioInicio.value < 1900) || (FormAltas.AnioInicio.value > myDate.getFullYear()) ) 
  {
       alert(" Año de Inicio Invalido");
       return false;
  }
}
  
  
  if (FormAltas.AnioTermino.value != "")
{
  
  
        if ( (FormAltas.AnioTermino.value < 1900) || (FormAltas.AnioTermino.value > myDate.getFullYear()) ) 
  {
       alert(" Año de Término Invalido");
       return false;
  }
}
		
		
		
		
      /* if (anio_termino < anio_inicio)
		 {
			alert("El año de termino no debe ser menor al año de inicio del nivel escolar seleccionado, verifique por favor.");
			FormAltas.FechaAdscripcion.focus();
			return false;
		  }*/
		
		var pri_AnioInicio = '<%=pri_AnioInicio%>'
		var pri_AnioTermino = '<%=pri_AnioTermino%>'
		
		
	 
	 	var sec_AnioInicio = '<%=sec_AnioInicio%>'
		var sec_AnioTermino = '<%=sec_AnioTermino%>'
	  
		var bac_AnioInicio = '<%=bac_AnioInicio%>'
		var bac_AnioTermino = '<%=bac_AnioTermino%>'
	 
		var lic_AnioInicio = '<%=lic_AnioInicio%>'
		var lic_AnioTermino = '<%=lic_AnioTermino%>'
	 
		var mae_AnioInicio = '<%=mae_AnioInicio%>'
		var mae_AnioTermino = '<%=mae_AnioTermino%>'
	
		var doc_AnioInicio = '<%=doc_AnioInicio%>'
		var doc_AnioTermino = '<%=doc_AnioTermino%>'
		
      /*var Id_CARcNivelEstudios = FormAltas.Id_CARcNivelEstudios.value
		var anio_inicio = FormAltas.AnioInicio.value
 		var anio_termino = FormAltas.AnioTermino.value*/
	
	/*alert(pri_AnioTermino)
	alert(anio_inicio)*/
	
	//Secundaria
/*	  if (Id_CARcNivelEstudios == 2)
	    {
			 if (anio_inicio < pri_AnioTermino)
			 {
			 alert("El periodo de Secundaria no puede ser menor al periodo de Primaria, verifique por favor ");
			 FormAltas.AnioInicio.focus();
			 return false;
			 }
		}
	//Bachillerato
		if (Id_CARcNivelEstudios == 3)
	    {
			 if (anio_inicio < sec_AnioTermino)
			 {
			 alert("El periodo de Bachillerato no puede ser menor al periodo de Secundaria, verifique por favor ");
			 FormAltas.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Licenciatura
		if (Id_CARcNivelEstudios == 5)
	    {
			 if (anio_inicio < bac_AnioTermino)
			 {
			 alert("El periodo de Licenciatura no puede ser menor al periodo de Bachillerato, verifique por favor ");
			 FormAltas.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Maestria
		if (Id_CARcNivelEstudios == 6)
	    {
			 if (anio_inicio < lic_AnioTermino)
			 {
			 alert("El periodo de la Maestria no puede ser menor al periodo de Licenciatura, verifique por favor ");
			 FormAltas.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Doctorado
		if (Id_CARcNivelEstudios == 7)
	    {
			 if (anio_inicio < mae_AnioTermino)
			 {
			 alert("El periodo del Doctorado no puede ser menor al periodo de la Maestria, verifique por favor ");
			 FormAltas.AnioInicio.focus();
			 return false;
			 }
		}
	  
	  
	  
	  
	
	*/	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
				
        
		 if(jvi_numero_correcto.test(FormAltas.AnioInicio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año de inicio, verifique por favor.');
	  	 FormAltas.AnioInicio.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormAltas.AnioTermino.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año de termino, verifique por favor.');
	  	 FormAltas.AnioTermino.focus();
      	 return false;    
        }
		/*if(jvi_textoynumero_correcto.test(FormAltas.NumeroCedula.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de cedula, verifique por favor.');
	  	 FormAltas.NumeroCedula.focus();
      	 return false;    
        }*/
		
		 /*if(jvi_textoynumero_correcto.test(FormAltas.CARdEscolaridad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdEscolaridad.focus();
      	 return false;    
        }*/





     FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}








function SeleMenu1(pas)
{
//	alert(FormAltas.Id_CARcDocumentoObtenido.value)
	  if (FormAltas.Id_CARcDocumentoObtenido.value == 1 && FormAltas.Id_CARcEstatus.value == 1 ) 
        {
		//deja capturar
	     document.getElementById("NumeroCedula").disabled=false;	
        }
	  else
        {
	      document.getElementById("NumeroCedula").disabled=true;	
       	  document.FormAltas.NumeroCedula.value=''
       }


}


function SeleMenu(pas)
{
//	alert(FormAltas.Id_CARcDocumentoObtenido.value)
	  if (FormAltas.Id_CARcDocumentoObtenido.value == 1 && FormAltas.Id_CARcEstatus.value == 1 ) 
        {
	     document.getElementById("NumeroCedula").disabled=false;	
        }
	  else
        {
	      document.getElementById("NumeroCedula").disabled=true;	
       	  document.FormAltas.NumeroCedula.value=''
       }


}









</script>