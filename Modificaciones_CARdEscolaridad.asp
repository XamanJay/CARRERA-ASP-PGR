<% 'On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEscolaridad"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdEscolaridad WHERE Id_CARdEscolaridad ="+CSTR(ParID) 
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
   CARdEscolaridad= OB_RS("CARdEscolaridad")
   Id_CARcNivelEstudios= OB_RS("Id_CARcNivelEstudios")
   NombreInstitucion= OB_RS("NombreInstitucion")
   
      AnioInicio= OB_RS("AnioInicio")
	     AnioTermino= OB_RS("AnioTermino")
		 
   IF AnioInicio <> "" THEN
   AnioInicio= OB_RS("AnioInicio")
   ELSE
   AnioInicio= ""
   END IF




   IF AnioTermino <> "" THEN
   AnioTermino= OB_RS("AnioTermino")
   ELSE
   AnioTermino= ""
   END IF
   
   
   
   Id_CARcEstatus= OB_RS("Id_CARcEstatus")
   Id_CARcDocumentoObtenido= OB_RS("Id_CARcDocumentoObtenido")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   NumeroCedula= OB_RS("NumeroCedula")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdEscolaridad.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Historial Académico </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Historial Académico </FONT></h2>
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
        consulta = "SELECT * FROM CARdEscolaridad WHERE Id_CARdEscolaridad ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdEscolaridad")=ucase(request("CARdEscolaridad")) 
        if request("Id_CARcNivelEstudios")  <> "" then  Ob_RS("Id_CARcNivelEstudios")=request("Id_CARcNivelEstudios") end if
        Ob_RS("NombreInstitucion")=ucase(request("NombreInstitucion"))
       
	    if request("AnioInicio")  <> "" then 
		 Ob_RS("AnioInicio")=request("AnioInicio")
		else
		Ob_RS("AnioInicio")= NULL
		end if
		
		
        if request("AnioTermino")  <> "" then  
		   Ob_RS("AnioTermino")=request("AnioTermino") 
		else
		   Ob_RS("AnioTermino")= null
		end if
		
'        if request("AnioInicio")  = "" then  Ob_RS("AnioInicio")= "" end if
'        if request("AnioTermino")  = "" then  Ob_RS("AnioTermino")= "" end if

		
		
		
        if request("Id_CARcEstatus")  <> "" then  Ob_RS("Id_CARcEstatus")=request("Id_CARcEstatus") end if
        if request("Id_CARcDocumentoObtenido")  <> "" then  Ob_RS("Id_CARcDocumentoObtenido")=request("Id_CARcDocumentoObtenido") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS("NumeroCedula")=ucase(request("NumeroCedula")) 
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
          <%Sql ="SELECT * FROM CARCNIVELESTUDIOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Nivel escolar</B><BR>
      </TD>
      <TD><select name='Id_CARcNivelEstudios' size=1 >
        <%DO UNTIL Ob_RS2.Eof%>
        <%IF Ob_RS2("Id_CARcNivelEstudios")= CINT(Id_CARcNivelEstudios) THEN %>
        <option selected value='<%=Ob_RS2("Id_CARcNivelEstudios")%>'> <%=UCASE(Ob_RS2("CARcNivelEstudios"))%> </option>
        <% ELSE  %>
        <option value='<%=Ob_RS2("Id_CARcNivelEstudios")%>'> <%=UCASE(Ob_RS2("CARcNivelEstudios"))%> </option>
        <%END IF  %>
        <%Ob_RS2.MOVENEXT %>
        <%LOOP%>
      </select></TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Nombre de la institución<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NombreInstitucion' style="text-transform: uppercase" SIZE=50 MAXLENGTH=80 VALUE='<%= NombreInstitucion%>'>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD>
        <B>Peri&oacute;do (año de inicio y t&eacute;rmino)<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'> de 
       <INPUT TYPE='TEXT' NAME='AnioInicio' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioInicio%> >  a  
       <INPUT TYPE='TEXT' NAME='AnioTermino' SIZE=4  MAXLENGTH=4  VALUE=<%= AnioTermino%> >
  	<BR><BR> 
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCESTATUS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Estatus</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcEstatus' SIZE=1 onchange='SeleMenu1("C")'>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatus")= CINT(Id_CARcEstatus) THEN %>                 
				  <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatus")%>'> <%=UCASE(Ob_RS2("CARcEstatus"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatus")%>'> <%=UCASE(Ob_RS2("CARcEstatus"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCDOCUMENTOOBTENIDO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Documento obtenido</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcDocumentoObtenido' SIZE=1 onchange='SeleMenu("C")'>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDocumentoObtenido")= CINT(Id_CARcDocumentoObtenido) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDocumentoObtenido")%>'> <%=UCASE(Ob_RS2("CARcDocumentoObtenido"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDocumentoObtenido")%>'> <%=UCASE(Ob_RS2("CARcDocumentoObtenido"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>N&uacute;mero de c&eacute;dula<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NumeroCedula' style="text-transform: uppercase" SIZE=20 ID='IDCED' MAXLENGTH=20 VALUE='<%= NumeroCedula%>'>
		 <BR> <BR>
      </TD > 
    </TR>
	  <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEscolaridad' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEscolaridad%></TEXTAREA>
  	<BR><BR>
      </TD > 
	  </TR>
</TABLE>


 <%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdEscolaridad >
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
'Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
'
'pri = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 1"
'	  Ob_RS2.OPEN pri, Ob_Conn, 3, 1 
'		pri_AnioInicio = Ob_RS2("AnioInicio")
'		pri_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE
'sec = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 2"
'	  Ob_RS2.OPEN sec, Ob_Conn, 3, 1 
'		sec_AnioInicio = Ob_RS2("AnioInicio")
'		sec_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE
'bac = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 3"
'	  Ob_RS2.OPEN bac, Ob_Conn, 3, 1 
'		bac_AnioInicio = Ob_RS2("AnioInicio")
'		bac_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE
'lic = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 5"	  	  	  
'	  Ob_RS2.OPEN lic, Ob_Conn, 3, 1 
'		lic_AnioInicio = Ob_RS2("AnioInicio")
'		lic_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE
'mae = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 6"
'	  Ob_RS2.OPEN mae, Ob_Conn, 3, 1 
'		mae_AnioInicio = Ob_RS2("AnioInicio")
'		mae_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE
'doc = "SELECT AnioInicio, AnioTermino FROM CARdEscolaridad  " & _
'      "WHERE  Id_CARdDatosPersonales = "&idPersona&" AND Id_CARcNivelEstudios = 7"	  	  
'     Ob_RS2.OPEN doc, Ob_Conn, 3, 1 
'		doc_AnioInicio = Ob_RS2("AnioInicio")
'		doc_AnioTermino = Ob_RS2("AnioTermino")
'	 Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1 onClick="return ValidaCampos()">
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

if (FormEdita.Id_CARcNivelEstudios.value  == 0)
  {
       alert("EL CAMPO: Nivel Escolar, no puede estar vacio");
       return false;
  }
  



/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormEdita.NombreInstitucion.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Nombre de la institución, verifique por favor.');
	  	 FormEdita.NombreInstitucion.focus();
      	 return false;    
        }*/	
		
		

		var Id_CARcNivelEstudios = FormEdita.Id_CARcNivelEstudios.value
		var anio_inicio = FormEdita.AnioInicio.value
 		var anio_termino = FormEdita.AnioTermino.value
		var myDate=new Date()
		
		
       //alert(myDate.getFullYear())

if (FormEdita.AnioInicio.value != "")
{		
		  if ( (FormEdita.AnioInicio.value < 1900) || (FormEdita.AnioInicio.value > myDate.getFullYear()) ) 
  {
       alert(" Año de Inicio Invalido");
       return false;
  }
}



if (FormEdita.AnioTermino.value != "")
{
  
  
        if ( (FormEdita.AnioTermino.value < 1900) || (FormEdita.AnioTermino.value > myDate.getFullYear()) ) 
  {
       alert(" Año de Término Invalido");
       return false;
  }
  
}  
		
       /*if (anio_termino < anio_inicio)
		 {
			alert("El año de termino no debe ser menor al año de inicio del nivel escolar seleccionado, verifique por favor.");
			FormEdita.FechaAdscripcion.focus();
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
		
      /*var Id_CARcNivelEstudios = FormEdita.Id_CARcNivelEstudios.value
		var anio_inicio = FormEdita.AnioInicio.value
 		var anio_termino = FormEdita.AnioTermino.value*/
	
	/*alert(pri_AnioTermino)
	alert(anio_inicio)*/
	
	//Secundaria
/*	  if (Id_CARcNivelEstudios == 2)
	    {
			 if (anio_inicio < pri_AnioTermino)
			 {
			 alert("El periodo de Secundaria no puede ser menor al periodo de Primaria, verifique por favor ");
			 FormEdita.AnioInicio.focus();
			 return false;
			 }
		}
	//Bachillerato
		if (Id_CARcNivelEstudios == 3)
	    {
			 if (anio_inicio < sec_AnioTermino)
			 {
			 alert("El periodo de Bachillerato no puede ser menor al periodo de Secundaria, verifique por favor ");
			 FormEdita.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Licenciatura
		if (Id_CARcNivelEstudios == 5)
	    {
			 if (anio_inicio < bac_AnioTermino)
			 {
			 alert("El periodo de Licenciatura no puede ser menor al periodo de Bachillerato, verifique por favor ");
			 FormEdita.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Maestria
		if (Id_CARcNivelEstudios == 6)
	    {
			 if (anio_inicio < lic_AnioTermino)
			 {
			 alert("El periodo de la Maestria no puede ser menor al periodo de Licenciatura, verifique por favor ");
			 FormEdita.AnioInicio.focus();
			 return false;
			 }
		}
		
		//Doctorado
		if (Id_CARcNivelEstudios == 7)
	    {
			 if (anio_inicio < mae_AnioTermino)
			 {
			 alert("El periodo del Doctorado no puede ser menor al periodo de la Maestria, verifique por favor ");
			 FormEdita.AnioInicio.focus();
			 return false;
			 }
		}
	  
	*/  
	  
	  
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
				
        
		 if(jvi_numero_correcto.test(FormEdita.AnioInicio.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año de inicio, verifique por favor.');
	  	 FormEdita.AnioInicio.focus();
      	 return false;    
        }
		
		if(jvi_numero_correcto.test(FormEdita.AnioTermino.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Año de termino, verifique por favor.');
	  	 FormEdita.AnioTermino.focus();
      	 return false;    
        }
		/*if(jvi_textoynumero_correcto.test(FormEdita.NumeroCedula.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Número de cedula, verifique por favor.');
	  	 FormEdita.NumeroCedula.focus();
      	 return false;    
        }*/
		
		 /*if(jvi_textoynumero_correcto.test(FormEdita.CARdEscolaridad.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdEscolaridad.focus();
      	 return false;    
        }*/





     FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	 

}

function SeleMenu1(pas)
{
//	alert(FormAltas.Id_CARcDocumentoObtenido.value)
	  if (FormEdita.Id_CARcDocumentoObtenido.value == 1 && FormEdita.Id_CARcEstatus.value == 1 ) 
        {
		//deja capturar
	     document.getElementById("NumeroCedula").disabled=false;	
        }
	  else
        {
	      document.getElementById("NumeroCedula").disabled=true;	
       	  document.FormEdita.NumeroCedula.value=''
       }


}












function SeleMenu(pas)
{
//	alert(FormAltas.Id_CARcDocumentoObtenido.value)
	  if (FormEdita.Id_CARcDocumentoObtenido.value == 1 && FormEdita.Id_CARcEstatus.value == 1 ) 
        {
	     document.getElementById("NumeroCedula").disabled=false;	
        }
	  else
        {
	      document.getElementById("NumeroCedula").disabled=true;	
       	  document.FormEdita.NumeroCedula.value=''
       }


}




</script>